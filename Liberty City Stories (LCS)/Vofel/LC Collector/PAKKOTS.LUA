--==================================================================--
--==== Name: PAKKOTS.LUA === Author: Vofel === Date: 2023-03-18 ====--
--========== Version: 1.5 === Replaces: DEATHMATCH.LUA.LC ==========--
--==================================================================--
--==== Collect as many hidden packages as possible. Different   ====--
--==== locations are worth different number of points.          ====--
--==================================================================--

-- For v1.0:
-- • basic logic (done: 2023-03-20)
-- • one player check per frame (done: 2023-03-21)
-- • time limit (done: 2023-03-21)
-- • proper locations (done: 2023-03-22)
-- • proper scoresheet (done: 2023-03-23)
-- For v1.1:
-- • teams (done: 2023-03-31)
-- • pickups (done: 2023-03-31)
-- For v1.2:
-- • random packages from the list (done: 2023-11-28)
-- • team-only packages (done: 2023-11-28)
-- • similar packages (done: 2023-11-28)
-- • short blip range (done: 2023-11-29)
-- For v1.3:
-- • check SI and SSV locations (done: 2024-01-13)
-- • 2 package models (done: 2024-01-13)
-- For v1.4:
-- • fixed the instant draw bug (done: 2024-08-06)
-- • game password to restore sessions (without scores) (done: 2024-09-01)
-- For v1.5:
-- • game password to restore sessions (with scores) (done: 2025-02-10)
-- • enterable password (done: 2025-02-22)
-- • base256 (done: 2025-03-05)
-- • proper UI (done: 2025-03-16)
-- For ???:
-- • reset key if you're stuck (must have cooldown)
-- • powerups (burst tyres, set on fire, disable controls, adrenaline, opponent visibility, arrow, district with most packages left, number of packages in a district provided by player)
-- • move players/camera while the host is choosing options. Fading for when done
-- • change vehicle banks (binary)
-- • custom cutscene

require "gta"
require "mainloop"
require "Pickups"
require "spawn"

--==================================================================--
--========================= Game Settings  =========================--
--==================================================================--
NUM_PACKAGES = nil  -- Number of packages to spawn. If set, the "Kill Limit" setting will be ignored. Default: nil
--====== End of Game Settings. Do not change anything below!  ======--

local PORTLAND  = 0
local STAUNTON  = 1
local SHORESIDE = 2

local TEAM1 = 0
local TEAM2 = 1

local PACKAGE_MODEL_LCS_ID = 4073
local PACKAGE_MODEL_III_ID = 520

local EVENTMASK_NONE = 16777215
local EVENTMASK_TYPE = 255 * 256 * 256
local EVENTMASK_PARAM1 = 255 * 256
local EVENTMASK_PARAM2 = 255
local EVENTSHIFT_TYPE = 16
local EVENTSHIFT_PARAM1 = 8
local EVENTSHIFT_PARAM2 = 0
local EVENT_GAME_STARTED = 1
local EVENT_PACKAGE_COLLECTED = 2
local EVENT_GAME_FINISHED = 3

local state_saver = nil
local menu = nil
if IsServer() then
    menu = require "menu"
end

Pakkots = StateMachine{"StateInit"}

function Pakkots:StateInit()
    -- variables
    self.mypickups = PickupMgr()
    self.mypickups:CreatePickups()
    self.packages = {}
    self.points_left = 0
    self.packages_collected = {}
    self.team_packages_collected = {}
    self.scores = {}
    self.team_scores = {}
    self.current_player = 1
    self.end_of_game = false
    GenerateAmbients(false)

    -- waiting for players to load
    while not IsServer() and PlayerId() == 0 do
        Wait(100)
    end

    local players = AllPlayers()
    local connected_players = table.getn(players)
    local iterations = 0
    local expected = GetExpectedNumberOfPlayers()
    while connected_players ~= expected and (iterations < 20) do
        players = AllPlayers()
        connected_players = table.getn(players)
        Wait(500)
        iterations = iterations + 1
    end

    DoSpawn(InitialSpawnPoint(PlayerId()))
    PlayerControl(Player(), false)
    main.scores:Hide(true)
    Wait(1000)

    -- loading package model if it's the GTA III package
    if NoFuckingCutscene() then
        LoadModel(PACKAGE_MODEL_III_ID)
    end

    ClearSplashScreen()
    GenerateAmbients(true)
    TeamGameEveryoneIn()
    UpdateGameTime(true)

    if IsServer() then
        self:ProcessSettings()
    end
    return "StateFinishInit"
end

local function HideOpponents()
    local opponents = nil
    if IsTeamGame() then
        opponents = Player():TeamId() == TEAM1 and TeamPlayers(TEAM2) or TeamPlayers(TEAM1)
    else
        opponents = AllPlayersExceptMe()
    end
    for _, opponent in pairs(opponents) do
        opponent:SetRadarBlipShortRange(true)
    end
end

function Pakkots:ProcessSettings()
    local header_sprite = AddText{x = 240, y = 7, align = 1, scale = 0.5, style = 1, colour = GameColour(10)}
    local footer_sprite = AddText{
        x = 110, y = 228, align = 0, scale = 0.3, style = 1, colour = GameColour(10), wrapX = 365,
    }

    -- hiding opponents
    header_sprite:Text("^S^Hide opponents:")
    footer_sprite:Text("^S^Hidden opponents are visible on the map only when they are close to you.")
    local hide_opponents_menu = menu.Menu{options = {"Yes", "No"}, y = 30, vertical = false}
    if hide_opponents_menu:process() == "Yes" then
        self.hide_opponents = true
    end

    -- password
    header_sprite:Text("^S^Compute password:")
    footer_sprite:Pos(110, 220)
    footer_sprite:Text(
        "^S^Passwords can be used to save the current game state and restore it at a later time. " ..
        "Useful when you need to pause the game or somebody loses connection."
    )
    local compute_password_menu = menu.Menu{options = {"Yes", "No"}, y = 30, vertical = false}
    if compute_password_menu:process() == "Yes" then
        self.compute_password = true
        state_saver = require "statesaver"
        self.password_sprite = AddText{x = 469, y = 60, align = 2, scale = 0.4048, style = 1, colour = GameColour(10)}
        header_sprite:Text("^S^Start a new game or enter the password:")
        footer_sprite:Text("")
        self:ProcessPasswordAndSpawnPackages()
    else
        self.compute_password = false
        local points_left = self:SpawnPackages()
        self:DoSendEvent(EVENT_GAME_STARTED, points_left, 0)
    end

    header_sprite:Remove()
    footer_sprite:Remove()
end

function Pakkots:ProcessPasswordAndSpawnPackages()
    -- initialize scores
    local players = AllPlayers()
    local scores = {}
    local num_players = table.getn(players)
    for i, player in ipairs(players) do
        scores[i] = 0
        self.scores[player] = 0
    end
    local points_left = 0

    -- wait for a password from the host
    local password_menu = menu.Password{alphabet = state_saver.base256_ALPHABET, y = 30}
    local password = password_menu:process()
    if not password then
        -- new game: self.save_state is already created in SpawnPackagesNew, just extend with empty scores
        points_left = self:SpawnPackages()
        scores[num_players] = math.floor(self.potential_max_score / 2)
        self.rg_k = state_saver.rg_calculate_k(scores)
        scores[num_players] = 0
        self.save_state:extend(state_saver.rg_compress(scores, self.rg_k))
        self.password_sprite:Text("^S^" .. state_saver.base256_encode(self.save_state))
    else
        local input_state = state_saver.base256_decode(password)
        points_left = self:SpawnPackages(input_state)
        self.save_state = input_state

        scores[num_players] = math.floor(self.potential_max_score / 2)
        self.rg_k = state_saver.rg_calculate_k(scores)

        local points_sprite = AddText{x = 240, y = 7, align = 1, scale = 0.5, style = 1, colour = GameColour(10)}
        local scores_state = input_state:subarray(self.packages_total + 1)
        local scores = state_saver.rg_decompress(scores_state, self.rg_k, num_players)
        for i = 1, table.getn(scores) do
            points_sprite:Text("^S^Assign " .. scores[i] .. " point(s) to player:")
            local points_menu = menu.Menu{
                options = players, y = 30, vertical = false,
                toStr = function(player) return player:Name() end,
                colour = function(player) return player:Colour() end,
            }
            local player, player_idx = points_menu:process()
            table.remove(players, player_idx)
            self:DoSendEvent(EVENT_PACKAGE_COLLECTED, player:PlayerNum(), scores[i])
        end
        points_sprite:Remove()
    end
    self:ProcessNetworkEvents()
    Wait(300)  -- to make sure PACKAGE_COLLECTED events are received by now
    self:DoSendEvent(EVENT_GAME_STARTED, points_left, 0)
end

function Pakkots:StateFinishInit()
    self:ProcessNetworkEvents()
    if not self.settings_processed then
        return
    end

    local time_limit = GameTimeLimit()
    if time_limit > 0 then
        SetGameTime(3 * time_limit)
        self.time_sprite = AddText{x = 77, y = 148, align = 2, scale = 0.4048, style = 1, colour = GameColour(10)}
    end
    
    if self.hide_opponents then
        HideOpponents()
        self.hide_opponents = nil
    end

    PlayerControl(Player(), true)
    main.scores:Hide(false)
    return "StateRunning"
end

function Pakkots:SpawnPackages(state)
    local packages = nil
    local island = GameLocation()

    if island == PORTLAND then
        packages = {
        --  { id, { x, y, z}, points, is_team, similar_to}
            { 1, { 1443.69, -1146.26,  12.43}, 1, false,   {3, 5}},
            { 2, {  890.72, -1139.12,  13.17}, 1, false,      nil},
            { 3, { 1607.97, -1114.12,  22.6 }, 2,  true,   {1, 5}},
            { 4, { 1278.78, -1109.33,  16.21}, 1, false,      nil},
            { 5, { 1433.19, -1096.81,  22.5 }, 1, false,   {1, 3}},
            { 6, { 1020.67, -1025.01,  20.69}, 1, false,      nil},
            { 7, { 1121.08, -1019.19,  25.20}, 1, false,      nil},
            { 8, { 1297.76, -1006.2 ,  21.9 }, 2, false,      nil},
            { 9, {  890.88, -1002.89,  18.67}, 2, false,      nil},
            {10, {  757.65,  -965.96,  16.11}, 1, false,     {16}},
            {11, { 1182.65,  -947.69,  22.12}, 2, false,     {12}},
            {12, { 1246.73,  -935.6 ,  20.42}, 2, false,     {11}},
            {13, { 1388.29,  -928.92,  17.23}, 1, false,      nil},
            {14, { 1525.79,  -924.96,  17.65}, 3,  true,      nil},
            {15, { 1302.28,  -898.38,  22.73}, 1, false,      nil},
            {16, {  757.63,  -895.56,  15.19}, 1, false,     {10}},
            {17, { 1513.9 ,  -856.55,  27.39}, 1, false,      nil},
            {18, {  856.2 ,  -855.38,  26.4 }, 1, false,      nil},
            {19, { 1306.8 ,  -835.8 ,  15.1 }, 1, false,      nil},
            {20, { 1036.13,  -805.1 ,  23.7 }, 1, false,     {21}},
            {21, { 1019.9 ,  -803.2 ,  21   }, 2, false,     {20}},
            {22, { 1244.61,  -799.45,  20.27}, 1, false,      nil},
            {23, {  877.18,  -792.48,  30   }, 1, false,      nil},
            {24, { 1275.65,  -729.44,  15.2 }, 1, false,      nil},
            {25, { 1438.48,  -631.5 ,  11.8 }, 2, false,      nil},
            {26, { 1151.57,  -630.23,  27.32}, 1, false,      nil},
            {27, { 1451.7 ,  -613.5 ,   1.6 }, 1, false,      nil},
            {28, { 1251.5 ,  -591.58,  28.54}, 1, false,      nil},
            {29, { 1137.13,  -591.34,  23.79}, 2, false,      nil},
            {30, { 1079.46,  -584   ,  18.5 }, 2,  true,      nil},
            {31, { 1380   ,  -578.8 ,  13.3 }, 1, false,      nil},
            {32, {  905.75,  -539.18,  20.98}, 2, false,      nil},
            {33, { 1066.96,  -516.08,  15.24}, 1, false,      nil},
            {34, { 1207.64,  -445.79,  30.53}, 3,  true,     {36}},
            {35, {  985.76,  -441.78,  19.34}, 1, false,      nil},
            {36, { 1341.51,  -430.69,  47.12}, 3,  true,     {34}},
            {37, { 1036   ,  -410   ,  20.5 }, 1, false,      nil},
            {38, {  921.43,  -399.22,  29.13}, 1, false,      nil},
            {39, { 1117.74,  -392.66,  26.39}, 2, false,      nil},
            {40, { 1160.19,  -366.12,  22.53}, 1, false,      nil},
            {41, { 1320.21,  -340.58,  15.28}, 1, false,      nil},
            {42, { 1206.16,  -323.73,  33.64}, 1, false,      nil},
            {43, { 1387.7 ,  -323.7 ,  50   }, 1, false,      nil},
            {44, {  856.03,  -311.27,  14.27}, 3,  true,      nil},
            {45, {  952   ,  -297.92,  31.6 }, 3,  true,      nil},
            {46, {  953.30,  -293.08,  27.55}, 1, false,      nil},
            {47, { 1166.13,  -271.24,  24.53}, 2,  true, {48, 49}},
            {48, { 1155.6 ,  -269.98,  21.96}, 2,  true, {47, 49}},
            {49, { 1164.53,  -248.91,  24.53}, 2,  true, {47, 48}},
            {50, { 1094.95,  -236.15,   9.17}, 1, false,      nil},
            {51, { 1435.56,  -174.52,  52.33}, 1, false,      nil},
            {52, { 1451.06,  -174.27,  72.16}, 3,  true,      nil},
            {53, {  881.55,  -172.87,   3.5 }, 1, false,      nil},
            {54, { 1078.98,  -159.5 ,  13.82}, 2,  true,      nil},
            {55, { 1465.78,  -149.91,  27.1} , 1, false,      nil},
            {56, { 1236.9 ,  -124.69,  20.11}, 3, false,      nil},
            {57, { 1148.2 ,  -101.3 ,   7.5 }, 1, false,      nil},
            {58, {  924.2 ,   -67   ,   8.2 }, 1, false,      nil},
            {59, { 1034.69,    25.96,  19.16}, 2,  true,      nil},
            {60, { 1036.4 ,   121.7 ,   4   }, 1, false,      nil},
            {61, {  781   ,   210.57,  18.23}, 2, false,      nil},  -- shouldn't be there if no PCJs
        }
    elseif island == STAUNTON then
        packages = {
        --  { id, { x, y, z}, points, is_team, similar_to}
            { 1, {     -80,    -1608,      2}, 3, false,            nil},
            { 2, {    2.48, -1549.91,  30.41}, 2, false, {5, 8, 11, 12}},
            { 3, {   312.7, -1544.17,  37.97}, 1, false,            nil},
            { 4, {  101.43, -1535.08,  28.28}, 1, false,            {6}},
            { 5, {   -41.7, -1531.38,   26.1}, 2, false, {2, 8, 11, 12}},
            { 6, {  117.98, -1501.07,   27.9}, 1, false,            {4}},
            { 7, {      22,    -1504,  29.43}, 2,  true,            nil},
            { 8, {  -31.32, -1454.12,  26.13}, 2, false, {2, 5, 11, 12}},
            { 9, {   444.7, -1446.36,  44.31}, 1, false,           {15}},
            {10, {  102.47, -1396.09,  26.48}, 1, false,            nil},
            {11, {    -113,  -1395.8,     33}, 2, false,  {2, 5, 8, 12}},
            {12, {  -71.49,    -1394,     28}, 1, false,  {2, 5, 8, 11}},
            {13, { -124.52, -1381.19,  34.03}, 3, false,            nil},
            {14, {  -237.8,  -1336.1,    5.9}, 1, false,           {17}},
            {15, {  440.97, -1328.99,     55}, 2, false,            {9}},
            {16, {   -1.95, -1327.35,  29.02}, 1, false,            nil},
            {17, { -222.12, -1313.22,   2.36}, 2, false,           {14}},
            {18, {  -93.35,  -1299.6,  29.02}, 1, false,           {21}},
            {19, {     106,    -1278,   26.2}, 1, false,            nil},
            {20, {     204, -1245.26,  60.17}, 1, false,           {24}},
            {21, { -108.71, -1237.82,  26.19}, 1, false,           {18}},
            {22, {   -7.92, -1230.81,  27.83}, 1, false,            nil},
            {23, {  338.07, -1230.41,  34.21}, 1, false,            nil},
            {24, {  253.76, -1205.56,   32.3}, 2, false,           {20}},
            {25, {   240.5, -1187.94,  22.53}, 1, false,            nil},
            {26, {  342.03, -1177.05,  16.01}, 1, false,       {28, 31}},
            {27, {   61.61, -1114.38,  26.41}, 1, false,           {28}},
            {28, {  323.66, -1112.83,  25.99}, 1, false,       {26, 31}},
            {29, {  205.67, -1107.15,   22.4}, 1, false,            nil},
            {30, {   11.77, -1106.09,  26.33}, 1, false,            nil},
            {31, {   328.3, -1088.71,  25.98}, 1, false,       {26, 28}},
            {32, {  160.33,  -997.83,  30.92}, 1, false,            nil},
            {33, {   97.44,  -977.64,  45.38}, 2, false,           {34}},
            {34, {   94.97,  -963.18,  34.17}, 3, false,           {33}},
            {35, {  372.99,  -951.57,  33.18}, 2, false,            nil},
            {36, {  -55.80,  -872.35,  15.93}, 1, false,           {37}},
            {37, {   -61.2,   -851.5,   20.3}, 1, false,           {36}},
            {38, {   265.1,  -839.01,     23}, 1, false,           {40}},
            {39, {  -95.69,  -815.99,     27}, 1, false,            nil},
            {40, {   274.3,  -804.77,   31.8}, 1, false,           {38}},
            {41, {  393.79,  -783.71,  26.26}, 1, false,            nil},
            {42, {  143.67,  -773.18,  27.14}, 1, false,            nil},
            {43, {   344.2,  -735.75,  25.95}, 1, false,       {45, 46}},
            {44, {  377.36,  -729.51,  32.98}, 2, false,            nil},
            {45, {  322.87,  -717.71,  26.20}, 1, false,       {43, 46}},
            {46, {  335.13,  -711.07,  34.03}, 2, false,       {43, 45}},
            {47, {  512.09,  -680.44,  20.38}, 1, false,            nil},
            {48, {   -20.3,  -665.91,  33.66}, 1, false,            nil},
            {49, { -207.76,  -657.87,  40.09}, 1, false,   {52, 53, 56}},
            {50, {   49.27,  -639.92,  28.95}, 1, false,            nil},
            {51, {  511.69,  -620.53,  21.51}, 2,  true,            nil},
            {52, {  -52.37,  -608.12,  70.56}, 3,  true,   {49, 53, 56}},
            {53, { -207.55,  -604.74,   40.1}, 1, false,   {49, 52, 56}},
            {54, {  305.22,  -603.36,  31.47}, 1, false,            nil},
            {55, {      74,   -601.2,   34.5}, 2, false,            nil},
            {56, {  -24.65,  -595.05,   35.3}, 2, false,   {49, 52, 53}},
            {57, { -126.17,  -568.09,   9.71}, 1, false,       {60, 61}},
            {58, {     383,     -515,   26.2}, 1, false,            nil},
            {59, {  406.78,  -481.78,  16.10}, 1, false,            nil},
            {60, {   -74.9,     -476,   28.8}, 2, false,       {57, 61}},
            {61, {   -80.1,  -450.15,  20.55}, 2,  true,       {57, 60}},
            {62, {   22.82,  -365.76,  16.17}, 1, false,            nil},
            {63, {  231.98,  -319.86,  31.73}, 1, false,            nil},
            {64, {  653.84,  -323.19,    8.8}, 2, false,            nil},
            {65, {  309.03,  -242.12,  26.75}, 2,  true,            nil},
            {66, {  277.48,  -231.25,  26.84}, 3, false,       {67, 69}},
            {67, {  228.79,  -223.58,  23.67}, 1, false,       {66, 69}},
            {68, {    21.3,  -222.43,  29.82}, 1, false,            nil},
            {69, {  276.36,   -153.3,  25.97}, 1, false,       {66, 67}},
            {70, {  128.18,   -32.88,     21}, 2, false,           {71}},
            {71, {  162.51,    -30.1,  20.98}, 2, false,           {70}},
            {72, {  303.94,     44.7,  20.49}, 2, false,           {73}},
            {73, {   249.8,     49.6,     16}, 1, false,           {72}},
            {74, { -101.25,   136.73,   2.96}, 1, false,            nil},
            {75, {  115.11,   258.19,  10.52}, 1, false,           {76}},
            {76, {   155.2,      281,   11.5}, 1, false,           {75}},
        }
    elseif island == SHORESIDE then
        packages = {
        --  { id, { x, y, z}, points, is_team, similar_to}
            { 1, {-1095.61, -1027.48,    3.5}, 1, false,            nil},
            { 2, { -684.93,   -892.9,  10.85}, 1, false,            nil},
            { 3, {-1165.95,  -773.07,  24.54}, 2, false,            {4}},
            { 4, {-1195.74,  -771.39,  22.35}, 2, false,            {3}},
            { 5, {  -935.5,     -759,   20.8}, 2, false,            nil},
            { 6, { -646.91,   -750.3,  24.19}, 2, false,            {8}},
            { 7, {-1019.48,  -735.79,  23.65}, 2,  true,            {9}},
            { 8, { -630.03,  -722.72,   23.7}, 2, false,            {6}},
            { 9, { -835.42,  -724.12,  10.82}, 1, false,            {7}},
            {10, { -533.68,  -660.29,  38.62}, 1, false,            nil},
            {11, {-1402.67,  -623.71,  24.78}, 2, false,       {12, 17}},
            {12, {-1367.38,  -602.83,   11.2}, 1, false,       {11, 17}},
            {13, {-1043.28,  -583.33,   18.8}, 1, false,           {14}},
            {14, {-1028.55,     -595,   24.1}, 1, false,           {13}},
            {15, { -1268.5,  -534.53,  17.42}, 2,  true,       {16, 20}},
            {16, {-1129.97,  -518.13,  19.15}, 1, false,       {15, 20}},
            {17, { -634.73,  -519.82,  18.74}, 1, false,            nil},
            {18, {-1456.67,   -482.9,   2.36}, 2, false,       {11, 12}},
            {19, { -854.22,  -474.91,  11.12}, 1, false,            nil},
            {20, {-1050.97,  -455.72,  15.65}, 1, false,       {15, 16}},
            {21, { -747.08,  -420.46,  18.99}, 1, false,            nil},
            {22, { -598.17,  -311.11,   5.47}, 1, false,           {24}},
            {23, {-1270   ,  -303.58,  66.17}, 1, false,            nil},
            {24, {  -439.8,   -247.2,      2}, 1, false,           {22}},
            {25, { -820.23,  -217.26,  37.45}, 1, false,       {26, 27}},
            {26, { -825.12,  -211.17,  49.73}, 2, false,       {25, 27}},
            {27, {  -896.8,   -207.2,     34}, 1, false,       {25, 26}},
            {28, {-1215.05,  -165.57,  59.11}, 1, false,            nil},
            {29, {-1119.97,  -138.95,  49.44}, 2,  true,            nil},
            {30, {-1035.56,  -115.85,   41.8}, 1, false,            nil},
            {31, { -881.62,   -75.20,  23.86}, 1, false,            nil},
            {32, { -666.06,   -38.43,  24.36}, 3,  true,            nil},
            {33, {-1246.14,   -32.43,  75.89}, 2, false,   {36, 42, 45}},
            {34, { -586.46,     0.36,  13.91}, 1, false,            nil},
            {35, { -1035.6,      0.4,   48.9}, 1, false,            nil},
            {36, {-1211.18,     22.9,  72.36}, 1, false,   {33, 42, 45}},
            {37, { -730.45,    41.91,  20.16}, 1, false,            nil},
            {38, { -1076.3,    42.45,  62.18}, 2,  true,            nil},
            {39, {-1084.98,    58.33,  59.88}, 1, false,            nil},
            {40, {  -499.3,    100.4,    9.2}, 2, false,            nil},
            {41, {-1007.42,   110.82,  32.08}, 1, false,            nil},
            {42, {-1151.83,   137.13,  72.35}, 1, false,   {33, 36, 45}},
            {43, { -911.29,   143.64,    4.4}, 2, false,            nil},
            {44, { -796.48,   154.98,  29.32}, 1, false,            nil},
            {45, {-1180.09,    160.4,  68.77}, 1, false,   {33, 36, 42}},
            {46, { -305.45,   179.38,    6.6}, 1, false,           {48}},
            {47, {-1243.22,   200.67,  70.05}, 1, false,            nil},
            {48, { -305.83,   217.06,    9.8}, 1, false,           {46}},
            {49, {-1107.94,   232.71,   10.3}, 1, false,            nil},
            {50, {  -426.6,    285.7,     63}, 1, false,            nil},
            {51, { -829.52,   291.85,  47.95}, 1, false,            nil},
            {52, { -992.35,   293.81,   2.45}, 2, false,            nil},
            {53, { -583.21,   312.03,  74.94}, 1, false,            nil},
            {54, { -410.54,   344.65,  88.26}, 1, false,            nil},
            {55, {-1144.50,   363.97,  20.68}, 2, false,            nil},
            {56, { -393.88,   425.84, 138.56}, 1, false,   {57, 58, 61}},
            {57, {  -280.9,   432.87, 104.46}, 1, false,   {56, 58, 61}},
            {58, { -345.61,   451.55, 110.35}, 1, false,   {56, 57, 61}},
            {59, {-1024.42,   501.42,  69.13}, 2, false,           {60}},
            {60, {-1104.16,   531.22,  65.07}, 2, false,           {59}},
            {61, {  -473.8,   571.36,  159.8}, 2, false,   {56, 57, 58}},
            {62, {  -93.32,   688.99,  90.65}, 1, false,           {64}},
            {63, { -945.45,   697.51,  71.07}, 1, false,            nil},
            {64, {  -34.91,   726.54,  31.89}, 1, false,           {62}},
        }
    end
    -- sort packages in the ascending order
    table.sort(packages, function(package1, package2) return package1[1] < package2[1] end)
    -- calculate parameters for computing passwords
    if self.compute_password then
        self.packages_total = table.getn(packages)
        self.potential_max_score = 0
        for _, package in ipairs(packages) do
            self.potential_max_score = self.potential_max_score + package[3]
        end
    end
    -- spawn packages and return points left
    return self.compute_password and state and self:SpawnPackagesFromState(packages, state)
                                            or self:SpawnPackagesNew(packages)
end

function Pakkots:SpawnPackagesFromState(packages, state)
    local package_model_id = NoFuckingCutscene() and PACKAGE_MODEL_III_ID or PACKAGE_MODEL_LCS_ID
    local points_left = 0
    for pos = 1, self.packages_total do
        if state:has_bit(pos) then
            local package = packages[pos]
            table.insert(self.packages, {CreatePickup(package_model_id, package[2]), package[3], package[1]})
            points_left = points_left + package[3]
        end
    end

    return points_left
end

function Pakkots:SpawnPackagesNew(packages)
    local package_model_id = NoFuckingCutscene() and PACKAGE_MODEL_III_ID or PACKAGE_MODEL_LCS_ID
    local packages_to_spawn = NUM_PACKAGES or GameScoreLimit()
    if packages_to_spawn == 0 then
        packages_to_spawn = nil
    end
    local max_score = 0

    if self.compute_password then
        self.save_state = state_saver.BitArray(self.packages_total)
    end
    repeat
        local size = table.getn(packages)
        if size == 0 then
            break
        end
        local package = table.remove(packages, math.random(size))
        if IsTeamGame() or not package[4] then
            -- removing similar packages
            if package[5] then
                local current_position = size - 1  -- one package was already removed
                -- sort similar_to ids in the descending order and loop through them
                table.sort(package[5], function(id1, id2) return id1 > id2 end)
                for _, similar_id in pairs(package[5]) do
                    for id = current_position, 1, -1 do
                        if packages[id][1] == similar_id then
                            table.remove(packages, id)
                            current_position = id - 1  -- start from the next element
                            break
                        end
                    end
                end
            end
            if packages_to_spawn then
                packages_to_spawn = packages_to_spawn - 1
            end
            table.insert(self.packages, {CreatePickup(package_model_id, package[2]), package[3], package[1]})
            if self.compute_password then
                self.save_state:set_bit(package[1])
            end
            max_score = max_score + package[3]
        end
    until packages_to_spawn == 0

    return max_score
end

function Pakkots:CleanUp()
    if self.password_sprite then
        self.password_sprite:Remove()
        self.password_sprite = nil
    end
    if self.time_sprite then
        self.time_sprite:Remove()
        self.time_sprite = nil
    end
    for _, package in pairs(self.packages) do
        package[1]:Remove()
    end
    self.mypickups:Cleanup()
    collectgarbage()
end

function Pakkots:StateRunning()
    if self.end_of_game then
        return "StateGameWon"
    end

    if not Player():IsPlaying() then
        DoWasted()
    end

    self:CheckPackages()
    self:CheckTime()
    self:ProcessNetworkEvents()

    collectgarbage()
end

function Pakkots:CheckPackages()
    if not IsServer() then
        return
    end

    -- check only 1 player per frame
    local players = AllPlayers()
    self.current_player = math.mod(self.current_player, table.getn(players))
    local player = players[self.current_player + 1]
    if not PlayerCar(player) then
        local player_position = player:Position()
        for index, package in ipairs(self.packages) do
            if Distance(player_position, package[1]:Position()) <= 2 then
                self:DoSendEvent(EVENT_PACKAGE_COLLECTED, player:PlayerNum(), package[2])
                table.remove(self.packages, index)
                package[1]:Remove()
                if self.compute_password then
                    self.save_state:clear_bit(package[3])
                    -- the rest of the password is calculated in the event handler
                end

                -- no need to check more packages for this player
                break
            end
        end
    end
    self.current_player = self.current_player + 1

    -- all packages are collected
    if table.getn(self.packages) == 0 then
        self:DoSendEvent(EVENT_GAME_FINISHED, 0, 0)
    end
end

function Pakkots:DoSendEvent(ev_type, ev_param1, ev_param2)
    local event = MaskEventNumber(ev_type  , EVENTMASK_NONE, EVENTSHIFT_TYPE  ) +
                  MaskEventNumber(ev_param1, EVENTMASK_NONE, EVENTSHIFT_PARAM1) +
                  MaskEventNumber(ev_param2, EVENTMASK_NONE, EVENTSHIFT_PARAM2)
    SendEvent(event)
end

function Pakkots:CheckTime()
    if GameTimeLimit() <= 0 then
        return
    end

    if GameTimeUp() then
        if IsServer() then
            self:DoSendEvent(EVENT_GAME_FINISHED, 0, 0)
        end
        return
    end

    if self.time_sprite then
        local time_as_str = string.format("%02d:%02d", GameTimeMinutes(), GameTimeSeconds())
        self.time_sprite:Text("^S^" .. time_as_str)
    end
end

function Pakkots:ProcessNetworkEvents()
    while not IsEventStackEmpty() do
        local event_code = GetEvent()
        local ev_type   = MaskEventNumber(event_code, EVENTMASK_TYPE  , -EVENTSHIFT_TYPE  )
        local ev_param1 = MaskEventNumber(event_code, EVENTMASK_PARAM1, -EVENTSHIFT_PARAM1)
        local ev_param2 = MaskEventNumber(event_code, EVENTMASK_PARAM2, -EVENTSHIFT_PARAM2)

        if ev_type == EVENT_GAME_STARTED then
            -- ev_param1 is max_score
            self.points_left = ev_param1
            self.settings_processed = true
        elseif ev_type == EVENT_PACKAGE_COLLECTED then
            -- ev_param1 is player_id
            -- ev_param2 is points
            local player = Player(ev_param1)
            self:Commentate(
                "^S^" .. player:Name() .. " collected a package worth of " ..
                ev_param2 .. " point(s)"
            )
            self.packages_collected[player] = self:Packages(player) + 1
            self.scores[player] = self:Score(player) + ev_param2
            if IsTeamGame() then
                self.team_packages_collected[player:TeamId()] = self:TeamPackages(player:TeamId()) + 1
                self.team_scores[player:TeamId()] = self:TeamScore(player:TeamId()) + ev_param2
            end
            self.points_left = self.points_left - ev_param2

            -- the game might be over if there are not enough packages left
            if IsServer() and self.points_left > 0 then
                local scores = nil
                if IsTeamGame() then
                    scores = table.values(self.team_scores)
                else
                    scores = table.values(self.scores)
                end
                table.sort(scores, function(score1, score2)
                    return score1 > score2
                end)
                if scores[1] - self.points_left > (scores[2] or 0) then
                    -- not enough points to catch up to the leader
                    self:DoSendEvent(EVENT_GAME_FINISHED, 0, 0)
                end
            end

            if self.compute_password and IsServer() then
                local scores = table.values(self.scores)
                table.sort(scores)
                local points_hashed = state_saver.rg_compress(scores, self.rg_k)
                self.save_state:resize(self.packages_total)
                self.save_state:extend(points_hashed)
                self.password_sprite:Text("^S^" .. state_saver.base256_encode(self.save_state))
            end
        elseif ev_type == EVENT_GAME_FINISHED then
            self.end_of_game = true
        end
    end
end

function Pakkots:StateGameWon()
    UpdateGameTime(false)
    local player = Player()
    local players = AllPlayers()
    local match_result = nil

    if IsTeamGame() then
        if self:TeamScore(TEAM1) == self:TeamScore(TEAM2) then
            match_result = 0  -- Tie
        elseif self:TeamScore(TEAM1) > self:TeamScore(TEAM2) then
            if player:TeamId() == TEAM1 then
                match_result = 1  -- Win
            else
                match_result = 2  -- Lose
            end
        else
            if player:TeamId() == TEAM1 then
                match_result = 2  -- Lose
            else
                match_result = 1  -- Win
            end
        end
    else
        table.sort(players, function (player1, player2)
            return self:Score(player1) > self:Score(player2)
        end)

        if self:Score(player) < self:Score(players[1]) then
            match_result = 2  -- Lose
        elseif self:Score(players[1]) > self:Score(players[2]) then
            match_result = 1  -- Win
        else
            match_result = 0  -- Tie
        end
    end

    DisplayFinalWinLoseMessage(match_result)
    main.scores:ToggleUpdate(false)
    main.scores:Show(true)
    Wait(12000)
    main.scores:Hide()
    main:EndGame()
end

function Pakkots:Commentate(msg)
    main.commentary:Print(msg)
end

function Pakkots:Packages(player)
    return self.packages_collected[player] or 0
end

function Pakkots:TeamPackages(team)
    return self.team_packages_collected[team] or 0
end

function Pakkots:Score(player)
    return self.scores[player] or 0
end

function Pakkots:TeamScore(team)
    return self.team_scores[team] or 0
end

function Pakkots:RegisterPlayerKill(killed, killer)
    if killed == killer then
        self:Commentate("^S^" .. killed:Name() .. "^S^ ^T^MPKSELF")
    else
        self:Commentate("^S^" .. killer:Name() .. "^S^ ^T^MPK^S^ " .. killed:Name())
    end
end

function printD(msg)
    main.commentary:Print("^S^FUCK! " .. msg)
end

function Main()
    main = MainLoop{}
    main.commentary = Commentary{}:Start()
    main.scores = ScoreSheetScript{}:Start()
    InitSpawnPoints()
    local spawn_index = math.random(1, table.getn(main.vSpawnPoints))
    CreatePlayer(unpack(main.vSpawnPoints[spawn_index][1]))
    PlayerName(HostName())
    main.game = Pakkots{}:Start()
    main:Start()
end

--==================================================================--
--======================= Scoresheet patches =======================--
--==================================================================--
function ScoreSheet:DrawTitles()
    self:HideTitles()
    local base = AddText:With{player=Player(), y=70, style=0, scale=0.4}
    local DrawTitle = function (params)
        local sprite = base(params)  -- merges base params with new ones
        sprite:Order(-1)
        table.insert(self.title_sprites, sprite)
        return sprite
    end

    -- Displays gamemode name above the table
    if self.screen == 1 then
        DrawTitle{x=240, y=20, align=1, scale=0.6, text="MPQG", colour=GameColour(3)}
    else
        DrawTitle{x=240, y=20, align=1, scale=0.6, text="^S^LIBERTY CITY COLLECTOR", colour=GameColour(3)}
    end

    -- Displays column names in the table
    if self.screen and self.screen < 2 then
        if not IsTeamGame() then
            DrawTitle{x=110, y=50, align=0, scale=0.45, text="MPNAME"}
        else
            DrawTitle{x=110, y=50, align=0, scale=0.45, text="MPTEAM"}
        end
        DrawTitle{x=240, y=50, align=1, scale=0.45, text="^S^PACKAGES"}
        DrawTitle{x=361, y=50, align=2, scale=0.45, text="MPSCORE"}
    end
end

function ScoreSheet:DrawScores()
    self:HideScores()
    local base = AddText:With{player=Player(), y=70, style=1, scale=0.4}
    local DrawScore = function (params)
        local sprite = base(params)
        sprite:Order(-1)
        table.insert(self.score_sprites, sprite)
        return sprite
    end

    -- footer
    DrawScore{x=110, y=198, style=0, scale=0.35, text="^S^POINTS LEFT:", colour=GameColour(10)}
    DrawScore{x=361, y=198, style=0, scale=0.35, text="^S^" .. main.game.points_left, colour=GameColour(10), align=2}

    if IsTeamGame() then
        self.players = self:SortedPlayers()
        self.teams = self:SortedTeams()
        self.rows = {}
        local row = 0
        local team_position = 0
        for _, team in pairs(self.teams) do
            row = row + 1
            team_position = team_position + 1
            base.y = (60 + row * 13) + team_position * 8

            self.rows[row] = {
                name=DrawScore{x=110, scale=0.35, text="^S^" .. TeamName(team), colour=TeamColour(team)},
                packages=DrawScore{
                    x=285, align=2, text="^S^" .. main.game:TeamPackages(team), colour=TeamColour(team)
                },
                score=DrawScore{
                    x=361, text="^S^" .. main.game:TeamScore(team), colour=TeamColour(team), align=2
                }
            }

            for _, player in pairs(self.players) do
                if player:TeamId() == team then
                    row = row + 1
                    base.y = (60 + row * 13) + team_position * 8
                    self.rows[row] = {
                        name=DrawScore{
                            x=122, scale=0.35, text="^S^" .. PlayerName(player), colour=TeamColour(team)
                        },
                        packages=DrawScore{
                            x=285, scale=0.33, align=2, colour=TeamColour(player:TeamId()),
                            text="^S^" .. main.game:Packages(player)
                        },
                        score=DrawScore{
                            x=361, scale=0.33, align=2, colour=TeamColour(player:TeamId()),
                            text="^S^" .. main.game:Score(player)
                        }
                    }
                end
            end
        end
    else
        self.players = self:SortedPlayers()
        self.rows = {}
        for player_index, player in ipairs(self.players) do
            base.y = 60 + player_index * 15
            self.rows[player] = {
                num=DrawScore{x=110, text="^S^" .. player_index .. ".", colour=player:Colour()},
                name=DrawScore{x=133, text="^S^" .. player:Name(), colour=player:Colour()},
                packages=DrawScore{x=285, align=2, text="^S^" .. main.game:Packages(player), colour=player:Colour()},
                score=DrawScore{x=361, align=2, text="^S^" .. main.game:Score(player), colour=player:Colour()}
            }
        end
    end
end

function ScoreSheet:DrawHelp()
    self:HideHelp()
    ShowHelp(true)
    local base = AddText:With{player=Player(), y=70, style=1, scale=0.4, wrapX=365}
    local DrawHelp = function (params)
        local sprite = base(params)
        sprite:Order(-1)
        table.insert(self.help_sprites, sprite)
        return sprite
    end

    local objective = "^S^Find and collect as many packages as possible. The harder the location is the more " ..
                      "points you get! Do everything to prevent others from collecting more than you."
    DrawHelp{x=110, y=50, style=0, align=0, scale=0.45, text="MPOBJ", colour=GameColour(3)}
    DrawHelp{x=116, y=69, align=0, scale=0.37, text=objective, colour={255, 255, 255, 255}}
    DrawHelp{x=110, y=126, style=0, align=0, scale=0.45, text="MPLEG", colour=GameColour(3)}
end

--==================================================================--
--========================= Pickups patches ========================--
--==================================================================--
function PickupMgr:CreatePickups()
    self.pickups = {}
    if IsServer() then
        local pickups = {}
        if GameLocation() == PORTLAND then
            pickups = {
                {pickup.armour, {1319.3462, -1007.6297, 14.8094}},
                {pickup.health, {1153.5819, -1077.5167, 13.5928}},
                {pickup.health, {1553.7484, -890.5146, 11.7833}},
                {pickup.armour, {1329.7201, -1155.3195, 11.8202}},
                {pickup.health, {878.6973, -1010.762, 4.8675}},
                {pickup.health, {774.2908, -854.0803, 14.7246}},
                {pickup.health, {1031.0684, -933.0208, 14.9334}},
                {pickup.armour, {795.2945, -1004.9326, 4.8487}},
                {pickup.armour, {1048.9757, -1154.1892, 13.1295}},
                {pickup.armour, {852.28, -795.73, 27.5}},
                {pickup.health, {1325.2334, -682.5991, 13.3427}},
                {pickup.health, {1145.59, -591.48, 14.9}},
                {pickup.armour, {1179.9272, -751.6107, 14.9483}},
                {pickup.armour, {1483.7257, -623.2601, 15.8246}},
                {pickup.armour, {1400.5881, -837.1541, 11.7845}},
                {pickup.health, {927.1153, -681.6978, 14.9329}},
                {pickup.health, {1068.5796, -694.7872, 14.9333}},
                {pickup.health, {883.1231, -547.7568, 14.9327}},
                {pickup.armour, {922.2511, -793.7344, 15.1297}},
                {pickup.armour, {978.47, -423.68, 14.96}},
                {pickup.armour, {789.83, -575.4, 19.8}},
                {pickup.health, {1355.7018, -318.2846, 49.9307}},
                {pickup.health, {1180.3762, -463.2792, 24.2913}},
                {pickup.health, {1274.5616, -196.3914, 33.3328}},
                {pickup.armour, {1246.5503, -388.611, 29.079}},
                {pickup.armour, {1410.1499, -314.3487, 49.3908}},
                {pickup.armour, {1301.93, -315.13, 41.5}},
                {pickup.health, {825.6195, -348.5254, 10.4039}},
                {pickup.health, {1086.7998, -228.3988, 9.3846}},
                {pickup.armour, {1072.2, -411.73, 15.2532}},
                {pickup.armour, {848.4544, -241.4469, 5.2577}},
                {pickup.armour, {989.61, -350.96, 11.57}},
                {pickup.health, {1282.435, -80.1266, 14.419}},
                {pickup.health, {1139.4219, 108.4135, 1.2472}},
                {pickup.armour, {1459.4512, -178.3427, 55.7397}},
                {pickup.armour, {1251.3943, 18.1692, 9.2759}},
                {pickup.health, {1215.89, -248.16, 24.9}},
                {pickup.armour, {1079, 40.5, 8.9}},
                {pickup.health, {946.9291, -30.3201, 7.433}},
                {pickup.health, {803.0809, -174.5709, -3.919}},
                {pickup.health, {917.6138, 194.484, 4.4738}},
                {pickup.armour, {709.4316, 175.718, 4.6584}},
                {pickup.armour, {889.9774, 13.2502, 24.0152}},
                {pickup.armour, {1497.51, -1118.4, 18.9}}
            }
        elseif GameLocation() == STAUNTON then
            pickups = {
                {pickup.health, {131.2948, -246.9034, 16.1303}},
                {pickup.armour, {32.6114, -214.3139, 29.7703}},
                {pickup.armour, {-302.8382,-106.0074, 1.3235}},
                {pickup.health, {6.01, -278.63, 16.17}},
                {pickup.health, {348.1933, -252.6339, 16.5619}},
                {pickup.health, {182.74, -16.43, 16.22}},
                {pickup.armour, {265.8773, -40.4615, 16.178}},
                {pickup.armour, {269.21, -87.96, 22.57}},
                {pickup.armour, {-44.06, -493.72, 16.9}},
                {pickup.health, {140.1274, -646.1885, 26.1259}},
                {pickup.health, {-221.2036, -315.1253, 1.416}},
                {pickup.armour, {66.9742, -341.7166, 16.1315}},
                {pickup.health, {523.7003, -671.5518, 16.6312}},
                {pickup.armour, {581.2285, -441.465, 19.0677}},
                {pickup.health, {371.2046, -435.1332, 21.0766}},
                {pickup.armour, {379.851, -517.2027, 26.1213}},
                {pickup.armour, {234.35, -470.09, 26.17}},
                {pickup.health, {38.6209, -724.2225, 22.7164}},
                {pickup.health, {-10.873, -1091.0701, 27.051}},
                {pickup.armour, {83.3542, -991.6765, 26.6281}},
                {pickup.armour, {166.9951, -1040.8634, 26.1339}},
                {pickup.armour, {68.8317, -773.5626, 22.8922}},
                {pickup.armour, {333.1736, -952.1639, 33.1412}},
                {pickup.health, {240.8735, -1063.1118, 29.6225}},
                {pickup.health, {338.674, -734.5394, 25.6823}},
                {pickup.armour, {340.351, -1121.101, 25.9564}},
                {pickup.armour, {233.7513, -809.9095, 28.3393}},
                {pickup.health, {3.7249, -1320.5448, 28.9841}},
                {pickup.health, {111.5237, -1232.6802, 26.1281}},
                {pickup.health, {-240.4522, -1400.8868, 10.9768}},
                {pickup.armour, {74.5476, -1595.2391, 28.341}},
                {pickup.armour, {19.4366, -1240.2572, 27.7909}},
                {pickup.armour, {-184.7864, -1230.4316, 17.9272}},
                {pickup.health, {218.4009, -1507.7183, 27.3755}},
                {pickup.armour, {244.7295, -1207.948, 20.4144}},
                {pickup.armour, {359.8225, -1317.5646, 26.2112}},
                {pickup.health, {401.3023, -1605.9877, 25.974}},
                {pickup.health, {507.8522, -1365.5096, 25.9269}},
                {pickup.armour, {419.1234, -1464.9121, 26.1729}}
            }
        else
            pickups = {
                {pickup.health, {-982.9041, 489.1714, 69.2396}},
                {pickup.health, {-683.0677, 623.7474, 78.2548}},
                {pickup.health, {-952.3976, 270.6275, 33.7117}},
                {pickup.health, {-1138.702, 244.8181, 3.3991}},
                {pickup.health, {-1246.8558, 131.4639, 68.5468}},
                {pickup.armour, {-1315.8434, 294.3044, 70.0519}},
                {pickup.armour, {-864.2217, 259.6947, 41.0782}},
                {pickup.armour, {-983.3112, 164.9747, 3.7639}},
                {pickup.health, {-1308.2848, 67.2151, 69.9911}},
                {pickup.health, {-847.5316, -156.4884, 33.8156}},
                {pickup.health, {-785.8389, -178.2265, 27.0342}},
                {pickup.health, {-669.4155, -249.6792, 22.4053}},
                {pickup.health, {-1277.0243, -204.3907, 59.6565}},
                {pickup.health, {-1088.289, -30.9559, 48.8236}},
                {pickup.armour, {-961.0096, -183.9636, 48.8083}},
                {pickup.armour, {-1170.2101, -41.2273, 63.1324}},
                {pickup.health, {-677.3319, 205.5225, 53.8198}},
                {pickup.health, {-402.7343, 366.9131, 90.2975}},
                {pickup.health, {-231.1376, 191.1937, 12.2247}},
                {pickup.health, {-465.5269, 54.4311, 3.8213}},
                {pickup.health, {-667.3107, 104.6015, 18.9694}},
                {pickup.health, {-495.2516, -188.3703, 1.6884}},
                {pickup.health, {-634.9911, -120.1295, 6.2981}},
                {pickup.armour, {-294.3105, 266.0922, 67.1938}},
                {pickup.armour, {-411.1188, 20.8521, 3.8725}},
                {pickup.armour, {-732.6067, 47.5126, 3.607}},
                {pickup.health, {-1111.723, -505.8408, 10.8749}},
                {pickup.health, {-1353.478, -523.0536, 11.0766}},
                {pickup.health, {-1269.3074, -713.2909, 14.3733}},
                {pickup.health, {-1495.0115, -1063.3479, 3.4429}},
                {pickup.health, {-1012.8546, -1224.5356, 10.8095}},
                {pickup.health, {-1008.8545, -949.3159, 11.1549}},
                {pickup.health, {-1282.8481, -901.1232, 11.0779}},
                {pickup.armour, {-1127.4115, -766.7277, 11.0766}},
                {pickup.armour, {-1554.5155, -908.9347, 14.4785}},
                {pickup.health, {-955.2161, -752.0958, 11.0751}},
                {pickup.health, {-763.9592, -879.5562, 11.0759}},
                {pickup.health, {-852.4181, -715.1934, 10.8059}},
                {pickup.health, {-840.6257, -470.193, 11.0744}},
                {pickup.health, {-679.5853, -776.7424, 18.8586}},
                {pickup.health, {-655.3177, -524.1627, 22.8663}},
                {pickup.armour, {-758.7523, -1054.6404, 7.3285}},
                {pickup.armour, {-965.5682, -456.2681, 11.0766}},
                {pickup.armour, {-539.5904, -629.7623, 13.5276}}
            }
        end

        for _, pickup in pairs(pickups) do
            table.insert(self.pickups, CreatePickup(unpack(pickup)))
        end
    end
end
