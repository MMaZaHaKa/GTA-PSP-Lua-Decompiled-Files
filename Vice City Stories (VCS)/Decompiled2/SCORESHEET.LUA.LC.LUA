local L0_1, L1_1, L2_1
L0_1 = require
L1_1 = "spawn"
L0_1(L1_1)
L0_1 = Script
L1_1 = {}
L2_1 = {}
L1_1.title_sprites = L2_1
L2_1 = {}
L1_1.score_sprites = L2_1
L2_1 = {}
L1_1.option_sprites = L2_1
L2_1 = {}
L1_1.help_sprites = L2_1
L1_1.screen = 0
L1_1.option = 0
L0_1 = L0_1(L1_1)
ScoreSheet = L0_1
L0_1 = 4
SPANISH = L0_1
L0_1 = ScoreSheet
function L1_1(A0_2)
  local L1_2
end
L0_1.Run = L1_1
L0_1 = ScoreSheet
function L1_1(A0_2)
  local L1_2
end
L0_1.CleanUp = L1_1
L0_1 = ScoreSheet
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = AllPlayers
  L1_2 = L1_2()
  L2_2 = table
  L2_2 = L2_2.sort
  L3_2 = L1_2
  function L4_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3
    L2_3 = main
    L2_3 = L2_3.game
    L3_3 = L2_3
    L2_3 = L2_3.Score
    L4_3 = A0_3
    L2_3 = L2_3(L3_3, L4_3)
    if L2_3 then
      L2_3 = main
      L2_3 = L2_3.game
      L3_3 = L2_3
      L2_3 = L2_3.Score
      L4_3 = A1_3
      L2_3 = L2_3(L3_3, L4_3)
      if L2_3 then
        goto lbl_17
      end
    end
    L2_3 = false
    do return L2_3 end
    ::lbl_17::
    L2_3 = main
    L2_3 = L2_3.game
    L3_3 = L2_3
    L2_3 = L2_3.Score
    L4_3 = A0_3
    L2_3 = L2_3(L3_3, L4_3)
    L3_3 = main
    L3_3 = L3_3.game
    L4_3 = L3_3
    L3_3 = L3_3.Score
    L5_3 = A1_3
    L3_3 = L3_3(L4_3, L5_3)
    L2_3 = L2_3 > L3_3
    return L2_3
  end
  L2_2(L3_2, L4_2)
  return L1_2
end
L0_1.SortedPlayers = L1_1
L0_1 = ScoreSheet
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = AllPlayers
  L1_2 = L1_2()
  L2_2 = {}
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = 0
  L3_2(L4_2, L5_2)
  L3_2 = table
  L3_2 = L3_2.insert
  L4_2 = L2_2
  L5_2 = 1
  L3_2(L4_2, L5_2)
  L3_2 = table
  L3_2 = L3_2.sort
  L4_2 = L2_2
  function L5_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3
    L2_3 = main
    L2_3 = L2_3.game
    L3_3 = L2_3
    L2_3 = L2_3.TeamScore
    L4_3 = A0_3
    L2_3 = L2_3(L3_3, L4_3)
    if L2_3 then
      L2_3 = main
      L2_3 = L2_3.game
      L3_3 = L2_3
      L2_3 = L2_3.TeamScore
      L4_3 = A1_3
      L2_3 = L2_3(L3_3, L4_3)
      if L2_3 then
        goto lbl_17
      end
    end
    L2_3 = false
    do return L2_3 end
    ::lbl_17::
    L2_3 = main
    L2_3 = L2_3.game
    L3_3 = L2_3
    L2_3 = L2_3.TeamScore
    L4_3 = A0_3
    L2_3 = L2_3(L3_3, L4_3)
    L3_3 = main
    L3_3 = L3_3.game
    L4_3 = L3_3
    L3_3 = L3_3.TeamScore
    L5_3 = A1_3
    L3_3 = L3_3(L4_3, L5_3)
    L2_3 = L2_3 > L3_3
    return L2_3
  end
  L3_2(L4_2, L5_2)
  return L2_2
end
L0_1.SortedTeams = L1_1
L0_1 = ScoreSheet
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = A0_2
  L1_2 = A0_2.HideTitles
  L1_2(L2_2)
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = AddText
  L3_2 = L2_2
  L2_2 = L2_2.With
  L4_2 = {}
  L4_2.player = L1_2
  L4_2.y = 70
  L4_2.style = 0
  L4_2.scale = 0.75
  L2_2 = L2_2(L3_2, L4_2)
  function L3_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = L2_2
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    L3_3 = L1_3
    L2_3 = L1_3.Order
    L4_3 = -1
    L2_3(L3_3, L4_3)
    L2_3 = table
    L2_3 = L2_3.insert
    L3_3 = A0_2
    L3_3 = L3_3.title_sprites
    L4_3 = L1_3
    L2_3(L3_3, L4_3)
    return L1_3
  end
  L4_2 = A0_2.screen
  if L4_2 == 1 then
    L4_2 = L3_2
    L5_2 = {}
    L5_2.x = 240
    L5_2.y = 20
    L5_2.align = 1
    L5_2.scale = 1.304
    L5_2.text = "MPQG"
    L6_2 = GameColour
    L7_2 = 3
    L6_2 = L6_2(L7_2)
    L5_2.colour = L6_2
    L4_2(L5_2)
  else
    L4_2 = GameType
    L4_2 = L4_2()
    if L4_2 == 0 then
      L4_2 = L3_2
      L5_2 = {}
      L5_2.x = 240
      L5_2.y = 20
      L5_2.align = 1
      L5_2.scale = 1.304
      L5_2.text = "GS_G1"
      L6_2 = GameColour
      L7_2 = 3
      L6_2 = L6_2(L7_2)
      L5_2.colour = L6_2
      L4_2(L5_2)
    else
      L4_2 = GameType
      L4_2 = L4_2()
      if L4_2 == 1 then
        L4_2 = L3_2
        L5_2 = {}
        L5_2.x = 240
        L5_2.y = 20
        L5_2.align = 1
        L5_2.scale = 1.304
        L5_2.text = "GS_G2"
        L6_2 = GameColour
        L7_2 = 3
        L6_2 = L6_2(L7_2)
        L5_2.colour = L6_2
        L4_2(L5_2)
      else
        L4_2 = GameType
        L4_2 = L4_2()
        if L4_2 == 2 then
          L4_2 = L3_2
          L5_2 = {}
          L5_2.x = 240
          L5_2.y = 20
          L5_2.align = 1
          L5_2.scale = 1.304
          L5_2.text = "GS_G3"
          L6_2 = GameColour
          L7_2 = 3
          L6_2 = L6_2(L7_2)
          L5_2.colour = L6_2
          L4_2(L5_2)
        else
          L4_2 = GameType
          L4_2 = L4_2()
          if L4_2 == 3 then
            L4_2 = L3_2
            L5_2 = {}
            L5_2.x = 240
            L5_2.y = 20
            L5_2.align = 1
            L5_2.scale = 1.304
            L5_2.text = "GS_G4"
            L6_2 = GameColour
            L7_2 = 3
            L6_2 = L6_2(L7_2)
            L5_2.colour = L6_2
            L4_2(L5_2)
          else
            L4_2 = GameType
            L4_2 = L4_2()
            if L4_2 == 4 then
              L4_2 = L3_2
              L5_2 = {}
              L5_2.x = 240
              L5_2.y = 20
              L5_2.align = 1
              L5_2.scale = 1.304
              L5_2.text = "GS_G5"
              L6_2 = GameColour
              L7_2 = 3
              L6_2 = L6_2(L7_2)
              L5_2.colour = L6_2
              L4_2(L5_2)
            else
              L4_2 = GameType
              L4_2 = L4_2()
              if L4_2 == 5 then
                L4_2 = L3_2
                L5_2 = {}
                L5_2.x = 240
                L5_2.y = 20
                L5_2.align = 1
                L5_2.scale = 1.304
                L5_2.text = "GS_G6"
                L6_2 = GameColour
                L7_2 = 3
                L6_2 = L6_2(L7_2)
                L5_2.colour = L6_2
                L4_2(L5_2)
              else
                L4_2 = GameType
                L4_2 = L4_2()
                if L4_2 == 6 then
                  L4_2 = L3_2
                  L5_2 = {}
                  L5_2.x = 240
                  L5_2.y = 20
                  L5_2.align = 1
                  L5_2.scale = 1.304
                  L5_2.text = "GS_G7"
                  L6_2 = GameColour
                  L7_2 = 3
                  L6_2 = L6_2(L7_2)
                  L5_2.colour = L6_2
                  L4_2(L5_2)
                else
                  L4_2 = GameType
                  L4_2 = L4_2()
                  if L4_2 == 7 then
                    L4_2 = L3_2
                    L5_2 = {}
                    L5_2.x = 240
                    L5_2.y = 20
                    L5_2.align = 1
                    L5_2.scale = 1.304
                    L5_2.text = "GS_G8"
                    L6_2 = GameColour
                    L7_2 = 3
                    L6_2 = L6_2(L7_2)
                    L5_2.colour = L6_2
                    L4_2(L5_2)
                  else
                    L4_2 = GameType
                    L4_2 = L4_2()
                    if L4_2 == 8 then
                      L4_2 = L3_2
                      L5_2 = {}
                      L5_2.x = 240
                      L5_2.y = 20
                      L5_2.align = 1
                      L5_2.scale = 1.304
                      L5_2.text = "GS_G9"
                      L6_2 = GameColour
                      L7_2 = 3
                      L6_2 = L6_2(L7_2)
                      L5_2.colour = L6_2
                      L4_2(L5_2)
                    else
                      L4_2 = GameType
                      L4_2 = L4_2()
                      if L4_2 == 9 then
                        L4_2 = L3_2
                        L5_2 = {}
                        L5_2.x = 240
                        L5_2.y = 20
                        L5_2.align = 1
                        L5_2.scale = 1.304
                        L5_2.text = "GS_G10"
                        L6_2 = GameColour
                        L7_2 = 3
                        L6_2 = L6_2(L7_2)
                        L5_2.colour = L6_2
                        L4_2(L5_2)
                      else
                        L4_2 = GameType
                        L4_2 = L4_2()
                        if L4_2 == 10 then
                          L4_2 = L3_2
                          L5_2 = {}
                          L5_2.x = 240
                          L5_2.y = 20
                          L5_2.align = 1
                          L5_2.scale = 1.304
                          L5_2.text = "GS_G11"
                          L6_2 = GameColour
                          L7_2 = 3
                          L6_2 = L6_2(L7_2)
                          L5_2.colour = L6_2
                          L4_2(L5_2)
                        else
                          L4_2 = GameType
                          L4_2 = L4_2()
                          if L4_2 == 11 then
                            L4_2 = L3_2
                            L5_2 = {}
                            L5_2.x = 240
                            L5_2.y = 20
                            L5_2.align = 1
                            L5_2.scale = 1.304
                            L5_2.text = "GS_G12"
                            L6_2 = GameColour
                            L7_2 = 3
                            L6_2 = L6_2(L7_2)
                            L5_2.colour = L6_2
                            L4_2(L5_2)
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L4_2 = A0_2.screen
  if L4_2 then
    L4_2 = A0_2.screen
    if L4_2 < 2 then
      L4_2 = GameType
      L4_2 = L4_2()
      if L4_2 == 0 then
        L4_2 = IsTeamGame
        L4_2 = L4_2()
        if not L4_2 then
          L4_2 = L3_2
          L5_2 = {}
          L5_2.x = 110
          L5_2.y = 50
          L5_2.align = 0
          L5_2.scale = 0.978
          L5_2.text = "MPNAME"
          L4_2(L5_2)
        else
          L4_2 = L3_2
          L5_2 = {}
          L5_2.x = 110
          L5_2.y = 50
          L5_2.align = 0
          L5_2.scale = 0.978
          L5_2.text = "MPTEAM"
          L4_2(L5_2)
        end
        L4_2 = L3_2
        L5_2 = {}
        L5_2.x = 361
        L5_2.y = 50
        L5_2.align = 2
        L5_2.scale = 0.978
        L5_2.text = "MPSCORE"
        L4_2(L5_2)
      else
        L4_2 = GameType
        L4_2 = L4_2()
        if L4_2 == 1 then
          L4_2 = L3_2
          L5_2 = {}
          L5_2.x = 110
          L5_2.y = 50
          L5_2.align = 0
          L5_2.scale = 0.978
          L5_2.text = "MPNAME"
          L4_2(L5_2)
          L4_2 = L3_2
          L5_2 = {}
          L5_2.x = 361
          L5_2.y = 50
          L5_2.align = 2
          L5_2.scale = 0.978
          L5_2.text = "MRACELA"
          L4_2(L5_2)
        else
          L4_2 = GameType
          L4_2 = L4_2()
          if L4_2 == 2 then
            L4_2 = L3_2
            L5_2 = {}
            L5_2.x = 110
            L5_2.y = 50
            L5_2.align = 0
            L5_2.scale = 0.978
            L5_2.text = "MPTEAM"
            L4_2(L5_2)
            L4_2 = L3_2
            L5_2 = {}
            L5_2.x = 361
            L5_2.y = 50
            L5_2.align = 2
            L5_2.scale = 0.978
            L5_2.text = "MPTIME"
            L4_2(L5_2)
          else
            L4_2 = GameType
            L4_2 = L4_2()
            if L4_2 == 3 then
              L4_2 = L3_2
              L5_2 = {}
              L5_2.x = 110
              L5_2.y = 50
              L5_2.align = 0
              L5_2.scale = 0.978
              L5_2.text = "MPTEAM"
              L4_2(L5_2)
              L4_2 = L3_2
              L5_2 = {}
              L5_2.x = 361
              L5_2.y = 50
              L5_2.align = 2
              L5_2.scale = 0.978
              L5_2.text = "MPSCORE"
              L4_2(L5_2)
            else
              L4_2 = GameType
              L4_2 = L4_2()
              if L4_2 == 4 then
                L4_2 = L3_2
                L5_2 = {}
                L5_2.x = 110
                L5_2.y = 50
                L5_2.align = 0
                L5_2.scale = 0.978
                L5_2.text = "MPNAME"
                L4_2(L5_2)
                L4_2 = L3_2
                L5_2 = {}
                L5_2.x = 361
                L5_2.y = 50
                L5_2.align = 2
                L5_2.scale = 0.978
                L5_2.text = "MPTIME"
                L4_2(L5_2)
              else
                L4_2 = GameType
                L4_2 = L4_2()
                if L4_2 == 5 then
                  L4_2 = L3_2
                  L5_2 = {}
                  L5_2.x = 110
                  L5_2.y = 50
                  L5_2.align = 0
                  L5_2.scale = 0.978
                  L5_2.text = "MPNAME"
                  L4_2(L5_2)
                  L4_2 = L3_2
                  L5_2 = {}
                  L5_2.x = 361
                  L5_2.y = 50
                  L5_2.align = 2
                  L5_2.scale = 0.978
                  L5_2.text = "MPTOTAL"
                  L4_2(L5_2)
                else
                  L4_2 = GameType
                  L4_2 = L4_2()
                  if L4_2 == 6 then
                    L4_2 = L3_2
                    L5_2 = {}
                    L5_2.x = 110
                    L5_2.y = 50
                    L5_2.align = 0
                    L5_2.scale = 0.978
                    L5_2.text = "MPNAME"
                    L4_2(L5_2)
                    L4_2 = L3_2
                    L5_2 = {}
                    L5_2.x = 306
                    L5_2.y = 50
                    L5_2.align = 2
                    L5_2.scale = 0.978
                    L5_2.text = "MPCASH"
                    L4_2(L5_2)
                    L4_2 = L3_2
                    L5_2 = {}
                    L5_2.x = 361
                    L5_2.y = 50
                    L5_2.align = 2
                    L5_2.scale = 0.978
                    L5_2.text = "MPCARS"
                    L4_2(L5_2)
                  else
                    L4_2 = GameType
                    L4_2 = L4_2()
                    if L4_2 == 7 then
                      L4_2 = L3_2
                      L5_2 = {}
                      L5_2.x = 110
                      L5_2.y = 50
                      L5_2.align = 0
                      L5_2.scale = 0.978
                      L5_2.text = "MPNAME"
                      L4_2(L5_2)
                      L4_2 = L3_2
                      L5_2 = {}
                      L5_2.x = 361
                      L5_2.y = 50
                      L5_2.align = 2
                      L5_2.scale = 0.978
                      L5_2.text = "MPSCORE"
                      L4_2(L5_2)
                    else
                      L4_2 = GameType
                      L4_2 = L4_2()
                      if L4_2 == 8 then
                        L4_2 = L3_2
                        L5_2 = {}
                        L5_2.x = 110
                        L5_2.y = 50
                        L5_2.align = 0
                        L5_2.scale = 0.978
                        L5_2.text = "MPNAME"
                        L4_2(L5_2)
                      else
                        L4_2 = GameType
                        L4_2 = L4_2()
                        if L4_2 == 10 then
                          L4_2 = L3_2
                          L5_2 = {}
                          L5_2.x = 110
                          L5_2.y = 50
                          L5_2.align = 0
                          L5_2.scale = 0.978
                          L5_2.text = "MPNAME"
                          L4_2(L5_2)
                        else
                          L4_2 = GameType
                          L4_2 = L4_2()
                          if L4_2 == 11 then
                            L4_2 = L3_2
                            L5_2 = {}
                            L5_2.x = 110
                            L5_2.y = 50
                            L5_2.align = 0
                            L5_2.scale = 0.978
                            L5_2.text = "MPNAME"
                            L4_2(L5_2)
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
L0_1.DrawTitles = L1_1
L0_1 = ScoreSheet
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2
  L1_2 = GameType
  L1_2 = L1_2()
  if L1_2 == 9 then
    L1_2 = main
    L1_2 = L1_2.game
    L1_2 = L1_2.state
    if L1_2 ~= "StateGameWon" then
      L2_2 = A0_2
      L1_2 = A0_2.DrawHelp
      L1_2(L2_2)
    else
      L1_2 = DisablePauseScreenBackgroundBoxOnly
      L2_2 = true
      L1_2(L2_2)
    end
  else
    L2_2 = A0_2
    L1_2 = A0_2.HideScores
    L1_2(L2_2)
    L1_2 = Player
    L1_2 = L1_2()
    L2_2 = AddText
    L3_2 = L2_2
    L2_2 = L2_2.With
    L4_2 = {}
    L4_2.player = L1_2
    L4_2.y = 70
    L4_2.style = 1
    L4_2.scale = 0.75
    L2_2 = L2_2(L3_2, L4_2)
    function L3_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3
      L1_3 = L2_2
      L2_3 = A0_3
      L1_3 = L1_3(L2_3)
      L3_3 = L1_3
      L2_3 = L1_3.Order
      L4_3 = -1
      L2_3(L3_3, L4_3)
      L2_3 = table
      L2_3 = L2_3.insert
      L3_3 = A0_2
      L3_3 = L3_3.score_sprites
      L4_3 = L1_3
      L2_3(L3_3, L4_3)
      return L1_3
    end
    L4_2 = GameScoreLimit
    L4_2 = L4_2()
    if 0 < L4_2 then
      L4_2 = GameType
      L4_2 = L4_2()
      if L4_2 == 0 then
        L4_2 = L3_2
        L5_2 = {}
        L5_2.x = 110
        L5_2.y = 196
        L5_2.style = 0
        L5_2.text = "MPKLMTL"
        L6_2 = GameColour
        L7_2 = 10
        L6_2 = L6_2(L7_2)
        L5_2.colour = L6_2
        L4_2(L5_2)
        L4_2 = L3_2
        L5_2 = {}
        L5_2.x = 361
        L5_2.y = 196
        L5_2.style = 0
        L6_2 = "^S^"
        L7_2 = GameScoreLimit
        L7_2 = L7_2()
        L6_2 = L6_2 .. L7_2
        L5_2.text = L6_2
        L6_2 = GameColour
        L7_2 = 10
        L6_2 = L6_2(L7_2)
        L5_2.colour = L6_2
        L5_2.align = 2
        L4_2(L5_2)
      end
    end
    L4_2 = IsTeamGame
    L4_2 = L4_2()
    if L4_2 then
      L5_2 = A0_2
      L4_2 = A0_2.SortedTeams
      L4_2 = L4_2(L5_2)
      A0_2.teams = L4_2
      L4_2 = {}
      A0_2.rows = L4_2
      L4_2 = GameType
      L4_2 = L4_2()
      if L4_2 == 0 then
        L4_2 = AllPlayers
        L4_2 = L4_2()
        A0_2.players = L4_2
        L4_2 = 0
        L5_2 = 0
        L6_2 = ipairs
        L7_2 = A0_2.teams
        L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
        for L8_2, L9_2 in L6_2, L7_2 do
          L4_2 = L4_2 + 1
          L5_2 = L5_2 + 1
          L10_2 = L4_2 * 13
          L10_2 = 60 + L10_2
          L11_2 = L5_2 * 8
          L10_2 = L10_2 + L11_2
          L2_2.y = L10_2
          L10_2 = A0_2.rows
          L11_2 = {}
          L12_2 = L3_2
          L13_2 = {}
          L13_2.x = 110
          L14_2 = "^S^"
          L15_2 = TeamName
          L16_2 = L9_2
          L15_2 = L15_2(L16_2)
          L14_2 = L14_2 .. L15_2
          L13_2.text = L14_2
          L14_2 = TeamColour
          L15_2 = L9_2
          L14_2 = L14_2(L15_2)
          L13_2.colour = L14_2
          L12_2 = L12_2(L13_2)
          L11_2.name = L12_2
          L12_2 = L3_2
          L13_2 = {}
          L13_2.x = 361
          L14_2 = "^S^"
          L15_2 = main
          L15_2 = L15_2.game
          L16_2 = L15_2
          L15_2 = L15_2.TeamScore
          L17_2 = L9_2
          L15_2 = L15_2(L16_2, L17_2)
          L14_2 = L14_2 .. L15_2
          L13_2.text = L14_2
          L14_2 = TeamColour
          L15_2 = L9_2
          L14_2 = L14_2(L15_2)
          L13_2.colour = L14_2
          L13_2.align = 2
          L12_2 = L12_2(L13_2)
          L11_2.score = L12_2
          L10_2[L4_2] = L11_2
          L10_2 = ipairs
          L11_2 = A0_2.players
          L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
          for L12_2, L13_2 in L10_2, L11_2 do
            L15_2 = L13_2
            L14_2 = L13_2.TeamId
            L14_2 = L14_2(L15_2)
            if L14_2 == L9_2 then
              L4_2 = L4_2 + 1
              L14_2 = L4_2 * 13
              L14_2 = 60 + L14_2
              L15_2 = L5_2 * 8
              L14_2 = L14_2 + L15_2
              L2_2.y = L14_2
              L14_2 = A0_2.rows
              L15_2 = {}
              L16_2 = L3_2
              L17_2 = {}
              L17_2.x = 122
              L18_2 = "^S^"
              L19_2 = PlayerName
              L20_2 = L13_2
              L19_2 = L19_2(L20_2)
              L18_2 = L18_2 .. L19_2
              L17_2.text = L18_2
              L18_2 = TeamColour
              L19_2 = L9_2
              L18_2 = L18_2(L19_2)
              L17_2.colour = L18_2
              L16_2 = L16_2(L17_2)
              L15_2.name = L16_2
              L14_2[L4_2] = L15_2
            end
          end
        end
      else
        L4_2 = GameType
        L4_2 = L4_2()
        if L4_2 == 2 then
          L4_2 = AllPlayers
          L4_2 = L4_2()
          A0_2.players = L4_2
          L4_2 = 0
          L5_2 = 0
          L6_2 = ipairs
          L7_2 = A0_2.teams
          L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
          for L8_2, L9_2 in L6_2, L7_2 do
            L4_2 = L4_2 + 1
            L5_2 = L5_2 + 1
            L10_2 = L4_2 * 13
            L10_2 = 60 + L10_2
            L11_2 = L5_2 * 8
            L10_2 = L10_2 + L11_2
            L2_2.y = L10_2
            L10_2 = main
            L10_2 = L10_2.game
            L11_2 = L10_2
            L10_2 = L10_2.TeamScore
            L12_2 = L9_2
            L10_2 = L10_2(L11_2, L12_2)
            L11_2 = math
            L11_2 = L11_2.floor
            L12_2 = L10_2 / 1000
            L12_2 = L12_2 / 60
            L11_2 = L11_2(L12_2)
            L12_2 = 1000 * 60
            L12_2 = L11_2 * L12_2
            L10_2 = L10_2 - L12_2
            L12_2 = L10_2 / 1000
            L13_2 = string
            L13_2 = L13_2.format
            L14_2 = "^S^%d:%02d"
            L15_2 = L11_2
            L16_2 = L12_2
            L13_2 = L13_2(L14_2, L15_2, L16_2)
            L14_2 = main
            L14_2 = L14_2.game
            L15_2 = L14_2
            L14_2 = L14_2.DidWinBecauseTimeRanOut
            L14_2 = L14_2(L15_2)
            L15_2 = true
            if L14_2 == L15_2 and L8_2 and 1 < L8_2 then
              L14_2 = string
              L14_2 = L14_2.format
              L15_2 = "^T^MPFAIL"
              L14_2 = L14_2(L15_2)
              L13_2 = L14_2
            end
            L14_2 = A0_2.rows
            L15_2 = {}
            L16_2 = L3_2
            L17_2 = {}
            L17_2.x = 110
            L18_2 = "^S^"
            L19_2 = TeamName
            L20_2 = L9_2
            L19_2 = L19_2(L20_2)
            L18_2 = L18_2 .. L19_2
            L17_2.text = L18_2
            L18_2 = TeamColour
            L19_2 = L9_2
            L18_2 = L18_2(L19_2)
            L17_2.colour = L18_2
            L16_2 = L16_2(L17_2)
            L15_2.name = L16_2
            L16_2 = L3_2
            L17_2 = {}
            L17_2.x = 361
            L17_2.text = L13_2
            L17_2.align = 2
            L16_2 = L16_2(L17_2)
            L15_2.score = L16_2
            L14_2[L4_2] = L15_2
            L14_2 = ipairs
            L15_2 = A0_2.players
            L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2)
            for L16_2, L17_2 in L14_2, L15_2 do
              L19_2 = L17_2
              L18_2 = L17_2.TeamId
              L18_2 = L18_2(L19_2)
              if L18_2 == L9_2 then
                L4_2 = L4_2 + 1
                L18_2 = L4_2 * 13
                L18_2 = 60 + L18_2
                L19_2 = L5_2 * 8
                L18_2 = L18_2 + L19_2
                L2_2.y = L18_2
                L18_2 = A0_2.rows
                L19_2 = {}
                L20_2 = L3_2
                L21_2 = {}
                L21_2.x = 122
                L22_2 = "^S^"
                L23_2 = PlayerName
                L24_2 = L17_2
                L23_2 = L23_2(L24_2)
                L22_2 = L22_2 .. L23_2
                L21_2.text = L22_2
                L22_2 = TeamColour
                L23_2 = L9_2
                L22_2 = L22_2(L23_2)
                L21_2.colour = L22_2
                L20_2 = L20_2(L21_2)
                L19_2.name = L20_2
                L18_2[L4_2] = L19_2
              end
            end
          end
        else
          L4_2 = GameType
          L4_2 = L4_2()
          if L4_2 == 3 then
            L4_2 = AllPlayers
            L4_2 = L4_2()
            A0_2.players = L4_2
            L4_2 = 0
            L5_2 = 0
            L6_2 = ipairs
            L7_2 = A0_2.teams
            L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
            for L8_2, L9_2 in L6_2, L7_2 do
              L4_2 = L4_2 + 1
              L5_2 = L5_2 + 1
              L10_2 = L4_2 * 13
              L10_2 = 60 + L10_2
              L11_2 = L5_2 * 8
              L10_2 = L10_2 + L11_2
              L2_2.y = L10_2
              L10_2 = A0_2.rows
              L11_2 = {}
              L12_2 = L3_2
              L13_2 = {}
              L13_2.x = 110
              L14_2 = "^S^"
              L15_2 = TeamName
              L16_2 = L9_2
              L15_2 = L15_2(L16_2)
              L14_2 = L14_2 .. L15_2
              L13_2.text = L14_2
              L14_2 = TeamColour
              L15_2 = L9_2
              L14_2 = L14_2(L15_2)
              L13_2.colour = L14_2
              L12_2 = L12_2(L13_2)
              L11_2.name = L12_2
              L12_2 = L3_2
              L13_2 = {}
              L13_2.x = 361
              L14_2 = "^S^"
              L15_2 = main
              L15_2 = L15_2.game
              L16_2 = L15_2
              L15_2 = L15_2.TeamScore
              L17_2 = L9_2
              L15_2 = L15_2(L16_2, L17_2)
              L14_2 = L14_2 .. L15_2
              L13_2.text = L14_2
              L13_2.align = 2
              L12_2 = L12_2(L13_2)
              L11_2.score = L12_2
              L10_2[L4_2] = L11_2
              L10_2 = ipairs
              L11_2 = A0_2.players
              L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
              for L12_2, L13_2 in L10_2, L11_2 do
                L15_2 = L13_2
                L14_2 = L13_2.TeamId
                L14_2 = L14_2(L15_2)
                if L14_2 == L9_2 then
                  L4_2 = L4_2 + 1
                  L14_2 = L4_2 * 13
                  L14_2 = 60 + L14_2
                  L15_2 = L5_2 * 8
                  L14_2 = L14_2 + L15_2
                  L2_2.y = L14_2
                  L14_2 = A0_2.rows
                  L15_2 = {}
                  L16_2 = L3_2
                  L17_2 = {}
                  L17_2.x = 122
                  L18_2 = "^S^"
                  L19_2 = PlayerName
                  L20_2 = L13_2
                  L19_2 = L19_2(L20_2)
                  L18_2 = L18_2 .. L19_2
                  L17_2.text = L18_2
                  L18_2 = TeamColour
                  L19_2 = L9_2
                  L18_2 = L18_2(L19_2)
                  L17_2.colour = L18_2
                  L16_2 = L16_2(L17_2)
                  L15_2.name = L16_2
                  L14_2[L4_2] = L15_2
                end
              end
            end
          else
            L4_2 = GameType
            L4_2 = L4_2()
            if L4_2 == 8 then
              L4_2 = AllPlayers
              L4_2 = L4_2()
              A0_2.players = L4_2
              L4_2 = 0
              L5_2 = 0
              L6_2 = ipairs
              L7_2 = A0_2.teams
              L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
              for L8_2, L9_2 in L6_2, L7_2 do
                L4_2 = L4_2 + 1
                L5_2 = L5_2 + 1
                L10_2 = L4_2 * 13
                L10_2 = 60 + L10_2
                L11_2 = L5_2 * 8
                L10_2 = L10_2 + L11_2
                L2_2.y = L10_2
                L10_2 = main
                L10_2 = L10_2.game
                L11_2 = L10_2
                L10_2 = L10_2.TeamScore
                L12_2 = L9_2
                L10_2 = L10_2(L11_2, L12_2)
                L11_2 = math
                L11_2 = L11_2.floor
                L12_2 = L10_2 / 1000
                L12_2 = L12_2 / 60
                L11_2 = L11_2(L12_2)
                L12_2 = 1000 * 60
                L12_2 = L11_2 * L12_2
                L10_2 = L10_2 - L12_2
                L12_2 = L10_2 / 1000
                L13_2 = string
                L13_2 = L13_2.format
                L14_2 = "^S^%d:%02d"
                L15_2 = L11_2
                L16_2 = L12_2
                L13_2 = L13_2(L14_2, L15_2, L16_2)
                L14_2 = A0_2.rows
                L15_2 = {}
                L16_2 = L3_2
                L17_2 = {}
                L17_2.x = 110
                L17_2.scale = 0.7609
                L18_2 = "^S^"
                L19_2 = TeamName
                L20_2 = L9_2
                L19_2 = L19_2(L20_2)
                L18_2 = L18_2 .. L19_2
                L17_2.text = L18_2
                L18_2 = TeamColour
                L19_2 = L9_2
                L18_2 = L18_2(L19_2)
                L17_2.colour = L18_2
                L16_2 = L16_2(L17_2)
                L15_2.name = L16_2
                L16_2 = L3_2
                L17_2 = {}
                L17_2.x = 361
                L17_2.scale = 0.7609
                L17_2.text = L13_2
                L17_2.align = 2
                L16_2 = L16_2(L17_2)
                L15_2.score = L16_2
                L14_2[L4_2] = L15_2
                L14_2 = ipairs
                L15_2 = A0_2.players
                L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2)
                for L16_2, L17_2 in L14_2, L15_2 do
                  L19_2 = L17_2
                  L18_2 = L17_2.TeamId
                  L18_2 = L18_2(L19_2)
                  if L18_2 == L9_2 then
                    L4_2 = L4_2 + 1
                    L18_2 = L4_2 * 13
                    L18_2 = 60 + L18_2
                    L19_2 = L5_2 * 8
                    L18_2 = L18_2 + L19_2
                    L2_2.y = L18_2
                    L18_2 = A0_2.rows
                    L19_2 = {}
                    L20_2 = L3_2
                    L21_2 = {}
                    L21_2.x = 122
                    L21_2.scale = 0.7609
                    L22_2 = "^S^"
                    L23_2 = PlayerName
                    L24_2 = L17_2
                    L23_2 = L23_2(L24_2)
                    L22_2 = L22_2 .. L23_2
                    L21_2.text = L22_2
                    L22_2 = TeamColour
                    L23_2 = L9_2
                    L22_2 = L22_2(L23_2)
                    L21_2.colour = L22_2
                    L20_2 = L20_2(L21_2)
                    L19_2.name = L20_2
                    L18_2[L4_2] = L19_2
                  end
                end
              end
            else
              L4_2 = {}
              A0_2.rows = L4_2
              L4_2 = ipairs
              L5_2 = A0_2.teams
              L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
              for L6_2, L7_2 in L4_2, L5_2 do
                L8_2 = L6_2 * 13
                L8_2 = 60 + L8_2
                L2_2.y = L8_2
                L8_2 = A0_2.rows
                L9_2 = {}
                L10_2 = L3_2
                L11_2 = {}
                L11_2.x = 110
                L12_2 = "^S^"
                L13_2 = TeamName
                L14_2 = L7_2
                L13_2 = L13_2(L14_2)
                L12_2 = L12_2 .. L13_2
                L11_2.text = L12_2
                L12_2 = TeamColour
                L13_2 = L7_2
                L12_2 = L12_2(L13_2)
                L11_2.colour = L12_2
                L10_2 = L10_2(L11_2)
                L9_2.name = L10_2
                L10_2 = L3_2
                L11_2 = {}
                L11_2.x = 361
                L12_2 = "^S^"
                L13_2 = main
                L13_2 = L13_2.game
                L14_2 = L13_2
                L13_2 = L13_2.TeamScore
                L15_2 = L7_2
                L13_2 = L13_2(L14_2, L15_2)
                L12_2 = L12_2 .. L13_2
                L11_2.text = L12_2
                L11_2.align = 2
                L10_2 = L10_2(L11_2)
                L9_2.score = L10_2
                L8_2[L7_2] = L9_2
              end
            end
          end
        end
      end
    else
      L5_2 = A0_2
      L4_2 = A0_2.SortedPlayers
      L4_2 = L4_2(L5_2)
      A0_2.players = L4_2
      L4_2 = {}
      A0_2.rows = L4_2
      L4_2 = GameType
      L4_2 = L4_2()
      if L4_2 == 0 then
        L4_2 = ipairs
        L5_2 = A0_2.players
        L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
        for L6_2, L7_2 in L4_2, L5_2 do
          L8_2 = L6_2 * 15
          L8_2 = 60 + L8_2
          L2_2.y = L8_2
          L8_2 = A0_2.rows
          L9_2 = {}
          L10_2 = L3_2
          L11_2 = {}
          L11_2.x = 110
          L12_2 = "^S^"
          L13_2 = L6_2
          L14_2 = "."
          L12_2 = L12_2 .. L13_2 .. L14_2
          L11_2.text = L12_2
          L13_2 = L7_2
          L12_2 = L7_2.Colour
          L12_2 = L12_2(L13_2)
          L11_2.colour = L12_2
          L10_2 = L10_2(L11_2)
          L9_2.num = L10_2
          L10_2 = L3_2
          L11_2 = {}
          L11_2.x = 133
          L12_2 = "^S^"
          L14_2 = L7_2
          L13_2 = L7_2.Name
          L13_2 = L13_2(L14_2)
          L12_2 = L12_2 .. L13_2
          L11_2.text = L12_2
          L13_2 = L7_2
          L12_2 = L7_2.Colour
          L12_2 = L12_2(L13_2)
          L11_2.colour = L12_2
          L10_2 = L10_2(L11_2)
          L9_2.name = L10_2
          L10_2 = L3_2
          L11_2 = {}
          L11_2.x = 361
          L11_2.align = 2
          L12_2 = "^S^"
          L13_2 = main
          L13_2 = L13_2.game
          L14_2 = L13_2
          L13_2 = L13_2.Score
          L15_2 = L7_2
          L13_2 = L13_2(L14_2, L15_2)
          L12_2 = L12_2 .. L13_2
          L11_2.text = L12_2
          L13_2 = L7_2
          L12_2 = L7_2.Colour
          L12_2 = L12_2(L13_2)
          L11_2.colour = L12_2
          L10_2 = L10_2(L11_2)
          L9_2.score = L10_2
          L8_2[L7_2] = L9_2
        end
      else
        L4_2 = GameType
        L4_2 = L4_2()
        if L4_2 == 1 then
          L4_2 = ipairs
          L5_2 = A0_2.players
          L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
          for L6_2, L7_2 in L4_2, L5_2 do
            L8_2 = main
            L8_2 = L8_2.game
            L9_2 = L8_2
            L8_2 = L8_2.ShowHUD
            L10_2 = false
            L8_2(L9_2, L10_2)
            L8_2 = main
            L8_2 = L8_2.game
            L9_2 = L8_2
            L8_2 = L8_2.GetCurrentLapNumber
            L11_2 = L7_2
            L10_2 = L7_2.PlayerNum
            L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L10_2(L11_2)
            L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
            L9_2 = main
            L9_2 = L9_2.game
            L10_2 = L9_2
            L9_2 = L9_2.GetCheckpointsCompletedThisLap
            L12_2 = L7_2
            L11_2 = L7_2.PlayerNum
            L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L11_2(L12_2)
            L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
            L10_2 = main
            L10_2 = L10_2.game
            L11_2 = L10_2
            L10_2 = L10_2.GetNumberOfCheckpointsInLap
            L10_2 = L10_2(L11_2)
            L10_2 = L10_2 - 1
            L11_2 = GameScoreLimit
            L11_2 = L11_2()
            if L8_2 > L11_2 then
              L11_2 = GameScoreLimit
              L11_2 = L11_2()
              L8_2 = L11_2
              L9_2 = L10_2
            end
            L11_2 = nil
            L12_2 = IsIronManRace
            L12_2 = L12_2()
            if L12_2 then
              L12_2 = "^S^"
              L13_2 = L9_2
              L14_2 = "/"
              L15_2 = L10_2
              L11_2 = L12_2 .. L13_2 .. L14_2 .. L15_2
            else
              L12_2 = "^T^MRACELA^S^ "
              L13_2 = L8_2
              L14_2 = "^S^, "
              L15_2 = L9_2
              L16_2 = "/"
              L17_2 = L10_2
              L11_2 = L12_2 .. L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2
            end
            L12_2 = L6_2 * 15
            L12_2 = 60 + L12_2
            L2_2.y = L12_2
            L12_2 = A0_2.rows
            L13_2 = {}
            L14_2 = L3_2
            L15_2 = {}
            L15_2.x = 110
            L16_2 = "^S^"
            L17_2 = L6_2
            L18_2 = "."
            L16_2 = L16_2 .. L17_2 .. L18_2
            L15_2.text = L16_2
            L17_2 = L7_2
            L16_2 = L7_2.Colour
            L16_2 = L16_2(L17_2)
            L15_2.colour = L16_2
            L14_2 = L14_2(L15_2)
            L13_2.num = L14_2
            L14_2 = L3_2
            L15_2 = {}
            L15_2.x = 133
            L16_2 = "^S^"
            L18_2 = L7_2
            L17_2 = L7_2.Name
            L17_2 = L17_2(L18_2)
            L16_2 = L16_2 .. L17_2
            L15_2.text = L16_2
            L17_2 = L7_2
            L16_2 = L7_2.Colour
            L16_2 = L16_2(L17_2)
            L15_2.colour = L16_2
            L14_2 = L14_2(L15_2)
            L13_2.name = L14_2
            L14_2 = L3_2
            L15_2 = {}
            L15_2.x = 355
            L15_2.text = L11_2
            L15_2.align = 2
            L14_2 = L14_2(L15_2)
            L13_2.ping = L14_2
            L12_2[L7_2] = L13_2
          end
        else
          L4_2 = GameType
          L4_2 = L4_2()
          if L4_2 == 3 then
            L4_2 = ipairs
            L5_2 = A0_2.players
            L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
            for L6_2, L7_2 in L4_2, L5_2 do
              L8_2 = L6_2 * 15
              L8_2 = 60 + L8_2
              L2_2.y = L8_2
              L8_2 = A0_2.rows
              L9_2 = {}
              L10_2 = L3_2
              L11_2 = {}
              L11_2.x = 110
              L12_2 = "^S^"
              L13_2 = L6_2
              L14_2 = "."
              L12_2 = L12_2 .. L13_2 .. L14_2
              L11_2.text = L12_2
              L13_2 = L7_2
              L12_2 = L7_2.Colour
              L12_2 = L12_2(L13_2)
              L11_2.colour = L12_2
              L10_2 = L10_2(L11_2)
              L9_2.num = L10_2
              L10_2 = L3_2
              L11_2 = {}
              L11_2.x = 133
              L12_2 = "^S^"
              L14_2 = L7_2
              L13_2 = L7_2.Name
              L13_2 = L13_2(L14_2)
              L12_2 = L12_2 .. L13_2
              L11_2.text = L12_2
              L13_2 = L7_2
              L12_2 = L7_2.Colour
              L12_2 = L12_2(L13_2)
              L11_2.colour = L12_2
              L10_2 = L10_2(L11_2)
              L9_2.name = L10_2
              L8_2[L7_2] = L9_2
            end
          else
            L4_2 = GameType
            L4_2 = L4_2()
            if L4_2 == 4 then
              L4_2 = ipairs
              L5_2 = A0_2.players
              L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
              for L6_2, L7_2 in L4_2, L5_2 do
                L8_2 = nil
                L9_2 = nil
                L10_2 = GameScoreLimit
                L10_2 = L10_2()
                L10_2 = L10_2 * 60000
                L11_2 = main
                L11_2 = L11_2.game
                L12_2 = L11_2
                L11_2 = L11_2.GetTimeMinutes
                L14_2 = L7_2
                L13_2 = L7_2.PlayerNum
                L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L13_2(L14_2)
                L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
                L11_2 = L11_2 * 60000
                L10_2 = L10_2 - L11_2
                L11_2 = main
                L11_2 = L11_2.game
                L12_2 = L11_2
                L11_2 = L11_2.GetTimeSeconds
                L14_2 = L7_2
                L13_2 = L7_2.PlayerNum
                L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L13_2(L14_2)
                L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
                L11_2 = L11_2 * 1000
                L10_2 = L10_2 - L11_2
                L11_2 = math
                L11_2 = L11_2.floor
                L12_2 = L10_2 / 1000
                L12_2 = L12_2 / 60
                L11_2 = L11_2(L12_2)
                L8_2 = L11_2
                L11_2 = math
                L11_2 = L11_2.floor
                L12_2 = 1000 * 60
                L12_2 = L8_2 * L12_2
                L12_2 = L10_2 - L12_2
                L11_2 = L11_2(L12_2)
                L10_2 = L11_2
                L11_2 = math
                L11_2 = L11_2.floor
                L12_2 = L10_2 / 1000
                L11_2 = L11_2(L12_2)
                L9_2 = L11_2
                L11_2 = string
                L11_2 = L11_2.format
                L12_2 = "%d:%02d"
                L13_2 = L8_2
                L14_2 = L9_2
                L11_2 = L11_2(L12_2, L13_2, L14_2)
                L12_2 = L6_2 * 15
                L12_2 = 60 + L12_2
                L2_2.y = L12_2
                L12_2 = A0_2.rows
                L13_2 = {}
                L14_2 = L3_2
                L15_2 = {}
                L15_2.x = 110
                L16_2 = "^S^"
                L17_2 = L6_2
                L18_2 = "."
                L16_2 = L16_2 .. L17_2 .. L18_2
                L15_2.text = L16_2
                L17_2 = L7_2
                L16_2 = L7_2.Colour
                L16_2 = L16_2(L17_2)
                L15_2.colour = L16_2
                L14_2 = L14_2(L15_2)
                L13_2.num = L14_2
                L14_2 = L3_2
                L15_2 = {}
                L15_2.x = 133
                L16_2 = "^S^"
                L18_2 = L7_2
                L17_2 = L7_2.Name
                L17_2 = L17_2(L18_2)
                L16_2 = L16_2 .. L17_2
                L15_2.text = L16_2
                L17_2 = L7_2
                L16_2 = L7_2.Colour
                L16_2 = L16_2(L17_2)
                L15_2.colour = L16_2
                L14_2 = L14_2(L15_2)
                L13_2.name = L14_2
                L14_2 = L3_2
                L15_2 = {}
                L15_2.x = 361
                L16_2 = "^S^"
                L17_2 = L11_2
                L16_2 = L16_2 .. L17_2
                L15_2.text = L16_2
                L15_2.align = 2
                L14_2 = L14_2(L15_2)
                L13_2.time = L14_2
                L12_2[L7_2] = L13_2
              end
            else
              L4_2 = GameType
              L4_2 = L4_2()
              if L4_2 == 5 then
                L4_2 = ipairs
                L5_2 = A0_2.players
                L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
                for L6_2, L7_2 in L4_2, L5_2 do
                  L8_2 = string
                  L8_2 = L8_2.format
                  L9_2 = "%d:%02d"
                  L10_2 = main
                  L10_2 = L10_2.game
                  L11_2 = L10_2
                  L10_2 = L10_2.TimeMinutes
                  L12_2 = L7_2
                  L10_2 = L10_2(L11_2, L12_2)
                  L11_2 = main
                  L11_2 = L11_2.game
                  L12_2 = L11_2
                  L11_2 = L11_2.TimeSeconds
                  L13_2 = L7_2
                  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L11_2(L12_2, L13_2)
                  L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
                  L9_2 = string
                  L9_2 = L9_2.format
                  L10_2 = "%d:%02d"
                  L11_2 = main
                  L11_2 = L11_2.game
                  L12_2 = L11_2
                  L11_2 = L11_2.BonusTimeMinutes
                  L13_2 = L7_2
                  L11_2 = L11_2(L12_2, L13_2)
                  L12_2 = main
                  L12_2 = L12_2.game
                  L13_2 = L12_2
                  L12_2 = L12_2.BonusTimeSeconds
                  L14_2 = L7_2
                  L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2 = L12_2(L13_2, L14_2)
                  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2)
                  L10_2 = main
                  L10_2 = L10_2.game
                  L11_2 = L10_2
                  L10_2 = L10_2.TimeMinutes
                  L12_2 = L7_2
                  L10_2 = L10_2(L11_2, L12_2)
                  L11_2 = main
                  L11_2 = L11_2.game
                  L12_2 = L11_2
                  L11_2 = L11_2.BonusTimeMinutes
                  L13_2 = L7_2
                  L11_2 = L11_2(L12_2, L13_2)
                  L10_2 = L10_2 + L11_2
                  L11_2 = main
                  L11_2 = L11_2.game
                  L12_2 = L11_2
                  L11_2 = L11_2.TimeSeconds
                  L13_2 = L7_2
                  L11_2 = L11_2(L12_2, L13_2)
                  L12_2 = main
                  L12_2 = L12_2.game
                  L13_2 = L12_2
                  L12_2 = L12_2.BonusTimeSeconds
                  L14_2 = L7_2
                  L12_2 = L12_2(L13_2, L14_2)
                  L11_2 = L11_2 + L12_2
                  if not L11_2 then
                    L11_2 = 0
                  end
                  while 59 < L11_2 do
                    L10_2 = L10_2 + 1
                    L11_2 = L11_2 - 60
                  end
                  L12_2 = string
                  L12_2 = L12_2.format
                  L13_2 = "%d:%02d"
                  L14_2 = L10_2
                  L15_2 = L11_2
                  L12_2 = L12_2(L13_2, L14_2, L15_2)
                  L13_2 = L6_2 * 15
                  L13_2 = 60 + L13_2
                  L2_2.y = L13_2
                  L13_2 = A0_2.rows
                  L14_2 = {}
                  L15_2 = L3_2
                  L16_2 = {}
                  L16_2.x = 110
                  L17_2 = "^S^"
                  L18_2 = L6_2
                  L19_2 = "."
                  L17_2 = L17_2 .. L18_2 .. L19_2
                  L16_2.text = L17_2
                  L18_2 = L7_2
                  L17_2 = L7_2.Colour
                  L17_2 = L17_2(L18_2)
                  L16_2.colour = L17_2
                  L15_2 = L15_2(L16_2)
                  L14_2.num = L15_2
                  L15_2 = L3_2
                  L16_2 = {}
                  L16_2.x = 133
                  L17_2 = "^S^"
                  L19_2 = L7_2
                  L18_2 = L7_2.Name
                  L18_2 = L18_2(L19_2)
                  L17_2 = L17_2 .. L18_2
                  L16_2.text = L17_2
                  L18_2 = L7_2
                  L17_2 = L7_2.Colour
                  L17_2 = L17_2(L18_2)
                  L16_2.colour = L17_2
                  L15_2 = L15_2(L16_2)
                  L14_2.name = L15_2
                  L15_2 = L3_2
                  L16_2 = {}
                  L16_2.x = 361
                  L17_2 = "^S^"
                  L18_2 = L12_2
                  L17_2 = L17_2 .. L18_2
                  L16_2.text = L17_2
                  L16_2.align = 2
                  L18_2 = L7_2
                  L17_2 = L7_2.Colour
                  L17_2 = L17_2(L18_2)
                  L16_2.colour = L17_2
                  L15_2 = L15_2(L16_2)
                  L14_2.total = L15_2
                  L13_2[L7_2] = L14_2
                end
              else
                L4_2 = GameType
                L4_2 = L4_2()
                if L4_2 == 6 then
                  L4_2 = ipairs
                  L5_2 = A0_2.players
                  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
                  for L6_2, L7_2 in L4_2, L5_2 do
                    L8_2 = L6_2 * 15
                    L8_2 = 60 + L8_2
                    L2_2.y = L8_2
                    L8_2 = GetLanguage
                    L8_2 = L8_2()
                    L9_2 = SPANISH
                    if L8_2 == L9_2 then
                      L8_2 = A0_2.rows
                      L9_2 = {}
                      L10_2 = L3_2
                      L11_2 = {}
                      L11_2.x = 110
                      L12_2 = "^S^"
                      L13_2 = L6_2
                      L14_2 = "."
                      L12_2 = L12_2 .. L13_2 .. L14_2
                      L11_2.text = L12_2
                      L13_2 = L7_2
                      L12_2 = L7_2.Colour
                      L12_2 = L12_2(L13_2)
                      L11_2.colour = L12_2
                      L10_2 = L10_2(L11_2)
                      L9_2.num = L10_2
                      L10_2 = L3_2
                      L11_2 = {}
                      L11_2.x = 133
                      L12_2 = "^S^"
                      L14_2 = L7_2
                      L13_2 = L7_2.Name
                      L13_2 = L13_2(L14_2)
                      L12_2 = L12_2 .. L13_2
                      L11_2.text = L12_2
                      L13_2 = L7_2
                      L12_2 = L7_2.Colour
                      L12_2 = L12_2(L13_2)
                      L11_2.colour = L12_2
                      L10_2 = L10_2(L11_2)
                      L9_2.name = L10_2
                      L10_2 = L3_2
                      L11_2 = {}
                      L11_2.x = 306
                      L12_2 = "^S^"
                      L13_2 = main
                      L13_2 = L13_2.game
                      L14_2 = L13_2
                      L13_2 = L13_2.Cash
                      L15_2 = L7_2
                      L13_2 = L13_2(L14_2, L15_2)
                      L14_2 = "$"
                      L12_2 = L12_2 .. L13_2 .. L14_2
                      L11_2.text = L12_2
                      L11_2.align = 2
                      L13_2 = L7_2
                      L12_2 = L7_2.Colour
                      L12_2 = L12_2(L13_2)
                      L11_2.colour = L12_2
                      L10_2 = L10_2(L11_2)
                      L9_2.cash = L10_2
                      L10_2 = L3_2
                      L11_2 = {}
                      L11_2.x = 361
                      L12_2 = "^S^"
                      L13_2 = main
                      L13_2 = L13_2.game
                      L14_2 = L13_2
                      L13_2 = L13_2.Cars
                      L15_2 = L7_2
                      L13_2 = L13_2(L14_2, L15_2)
                      L12_2 = L12_2 .. L13_2
                      L11_2.text = L12_2
                      L11_2.align = 2
                      L13_2 = L7_2
                      L12_2 = L7_2.Colour
                      L12_2 = L12_2(L13_2)
                      L11_2.colour = L12_2
                      L10_2 = L10_2(L11_2)
                      L9_2.cars = L10_2
                      L8_2[L7_2] = L9_2
                    else
                      L8_2 = A0_2.rows
                      L9_2 = {}
                      L10_2 = L3_2
                      L11_2 = {}
                      L11_2.x = 110
                      L12_2 = "^S^"
                      L13_2 = L6_2
                      L14_2 = "."
                      L12_2 = L12_2 .. L13_2 .. L14_2
                      L11_2.text = L12_2
                      L13_2 = L7_2
                      L12_2 = L7_2.Colour
                      L12_2 = L12_2(L13_2)
                      L11_2.colour = L12_2
                      L10_2 = L10_2(L11_2)
                      L9_2.num = L10_2
                      L10_2 = L3_2
                      L11_2 = {}
                      L11_2.x = 133
                      L12_2 = "^S^"
                      L14_2 = L7_2
                      L13_2 = L7_2.Name
                      L13_2 = L13_2(L14_2)
                      L12_2 = L12_2 .. L13_2
                      L11_2.text = L12_2
                      L13_2 = L7_2
                      L12_2 = L7_2.Colour
                      L12_2 = L12_2(L13_2)
                      L11_2.colour = L12_2
                      L10_2 = L10_2(L11_2)
                      L9_2.name = L10_2
                      L10_2 = L3_2
                      L11_2 = {}
                      L11_2.x = 306
                      L12_2 = "^S^$"
                      L13_2 = main
                      L13_2 = L13_2.game
                      L14_2 = L13_2
                      L13_2 = L13_2.Cash
                      L15_2 = L7_2
                      L13_2 = L13_2(L14_2, L15_2)
                      L12_2 = L12_2 .. L13_2
                      L11_2.text = L12_2
                      L11_2.align = 2
                      L13_2 = L7_2
                      L12_2 = L7_2.Colour
                      L12_2 = L12_2(L13_2)
                      L11_2.colour = L12_2
                      L10_2 = L10_2(L11_2)
                      L9_2.cash = L10_2
                      L10_2 = L3_2
                      L11_2 = {}
                      L11_2.x = 361
                      L12_2 = "^S^"
                      L13_2 = main
                      L13_2 = L13_2.game
                      L14_2 = L13_2
                      L13_2 = L13_2.Cars
                      L15_2 = L7_2
                      L13_2 = L13_2(L14_2, L15_2)
                      L12_2 = L12_2 .. L13_2
                      L11_2.text = L12_2
                      L11_2.align = 2
                      L13_2 = L7_2
                      L12_2 = L7_2.Colour
                      L12_2 = L12_2(L13_2)
                      L11_2.colour = L12_2
                      L10_2 = L10_2(L11_2)
                      L9_2.cars = L10_2
                      L8_2[L7_2] = L9_2
                    end
                  end
                else
                  L4_2 = GameType
                  L4_2 = L4_2()
                  if L4_2 == 7 then
                    L4_2 = ipairs
                    L5_2 = A0_2.players
                    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
                    for L6_2, L7_2 in L4_2, L5_2 do
                      L8_2 = L6_2 * 15
                      L8_2 = 60 + L8_2
                      L2_2.y = L8_2
                      L8_2 = A0_2.rows
                      L9_2 = {}
                      L10_2 = L3_2
                      L11_2 = {}
                      L11_2.x = 110
                      L12_2 = "^S^"
                      L13_2 = L6_2
                      L14_2 = "."
                      L12_2 = L12_2 .. L13_2 .. L14_2
                      L11_2.text = L12_2
                      L13_2 = L7_2
                      L12_2 = L7_2.Colour
                      L12_2 = L12_2(L13_2)
                      L11_2.colour = L12_2
                      L10_2 = L10_2(L11_2)
                      L9_2.num = L10_2
                      L10_2 = L3_2
                      L11_2 = {}
                      L11_2.x = 133
                      L12_2 = "^S^"
                      L14_2 = L7_2
                      L13_2 = L7_2.Name
                      L13_2 = L13_2(L14_2)
                      L12_2 = L12_2 .. L13_2
                      L11_2.text = L12_2
                      L13_2 = L7_2
                      L12_2 = L7_2.Colour
                      L12_2 = L12_2(L13_2)
                      L11_2.colour = L12_2
                      L10_2 = L10_2(L11_2)
                      L9_2.name = L10_2
                      L10_2 = L3_2
                      L11_2 = {}
                      L11_2.x = 361
                      L11_2.align = 2
                      L12_2 = "^S^"
                      L13_2 = main
                      L13_2 = L13_2.game
                      L14_2 = L13_2
                      L13_2 = L13_2.Score
                      L15_2 = L7_2
                      L13_2 = L13_2(L14_2, L15_2)
                      L12_2 = L12_2 .. L13_2
                      L11_2.text = L12_2
                      L13_2 = L7_2
                      L12_2 = L7_2.Colour
                      L12_2 = L12_2(L13_2)
                      L11_2.colour = L12_2
                      L10_2 = L10_2(L11_2)
                      L9_2.score = L10_2
                      L8_2[L7_2] = L9_2
                    end
                  else
                    L4_2 = GameType
                    L4_2 = L4_2()
                    if L4_2 == 8 then
                      L4_2 = ipairs
                      L5_2 = A0_2.players
                      L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
                      for L6_2, L7_2 in L4_2, L5_2 do
                        L8_2 = L6_2 * 15
                        L8_2 = 60 + L8_2
                        L2_2.y = L8_2
                        L8_2 = A0_2.rows
                        L9_2 = {}
                        L10_2 = L3_2
                        L11_2 = {}
                        L11_2.x = 110
                        L12_2 = "^S^"
                        L13_2 = L6_2
                        L14_2 = "."
                        L12_2 = L12_2 .. L13_2 .. L14_2
                        L11_2.text = L12_2
                        L13_2 = L7_2
                        L12_2 = L7_2.Colour
                        L12_2 = L12_2(L13_2)
                        L11_2.colour = L12_2
                        L10_2 = L10_2(L11_2)
                        L9_2.num = L10_2
                        L10_2 = L3_2
                        L11_2 = {}
                        L11_2.x = 133
                        L12_2 = "^S^"
                        L14_2 = L7_2
                        L13_2 = L7_2.Name
                        L13_2 = L13_2(L14_2)
                        L12_2 = L12_2 .. L13_2
                        L11_2.text = L12_2
                        L13_2 = L7_2
                        L12_2 = L7_2.Colour
                        L12_2 = L12_2(L13_2)
                        L11_2.colour = L12_2
                        L10_2 = L10_2(L11_2)
                        L9_2.name = L10_2
                        L8_2[L7_2] = L9_2
                      end
                    else
                      L4_2 = GameType
                      L4_2 = L4_2()
                      if L4_2 == 9 then
                        L4_2 = ipairs
                        L5_2 = A0_2.players
                        L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
                        for L6_2, L7_2 in L4_2, L5_2 do
                          L8_2 = L6_2 * 15
                          L8_2 = 60 + L8_2
                          L2_2.y = L8_2
                          L8_2 = A0_2.rows
                          L9_2 = {}
                          L10_2 = L3_2
                          L11_2 = {}
                          L11_2.x = 110
                          L12_2 = "^S^"
                          L13_2 = L6_2
                          L14_2 = "."
                          L12_2 = L12_2 .. L13_2 .. L14_2
                          L11_2.text = L12_2
                          L13_2 = L7_2
                          L12_2 = L7_2.Colour
                          L12_2 = L12_2(L13_2)
                          L11_2.colour = L12_2
                          L10_2 = L10_2(L11_2)
                          L9_2.num = L10_2
                          L10_2 = L3_2
                          L11_2 = {}
                          L11_2.x = 133
                          L12_2 = "^S^"
                          L14_2 = L7_2
                          L13_2 = L7_2.Name
                          L13_2 = L13_2(L14_2)
                          L12_2 = L12_2 .. L13_2
                          L11_2.text = L12_2
                          L13_2 = L7_2
                          L12_2 = L7_2.Colour
                          L12_2 = L12_2(L13_2)
                          L11_2.colour = L12_2
                          L10_2 = L10_2(L11_2)
                          L9_2.name = L10_2
                          L8_2[L7_2] = L9_2
                        end
                      else
                        L4_2 = GameType
                        L4_2 = L4_2()
                        if L4_2 == 10 then
                          L4_2 = ipairs
                          L5_2 = A0_2.players
                          L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
                          for L6_2, L7_2 in L4_2, L5_2 do
                            L8_2 = L6_2 * 15
                            L8_2 = 60 + L8_2
                            L2_2.y = L8_2
                            L8_2 = A0_2.rows
                            L9_2 = {}
                            L10_2 = L3_2
                            L11_2 = {}
                            L11_2.x = 110
                            L12_2 = "^S^"
                            L13_2 = L6_2
                            L14_2 = "."
                            L12_2 = L12_2 .. L13_2 .. L14_2
                            L11_2.text = L12_2
                            L13_2 = L7_2
                            L12_2 = L7_2.Colour
                            L12_2 = L12_2(L13_2)
                            L11_2.colour = L12_2
                            L10_2 = L10_2(L11_2)
                            L9_2.num = L10_2
                            L10_2 = L3_2
                            L11_2 = {}
                            L11_2.x = 133
                            L12_2 = "^S^"
                            L14_2 = L7_2
                            L13_2 = L7_2.Name
                            L13_2 = L13_2(L14_2)
                            L12_2 = L12_2 .. L13_2
                            L11_2.text = L12_2
                            L13_2 = L7_2
                            L12_2 = L7_2.Colour
                            L12_2 = L12_2(L13_2)
                            L11_2.colour = L12_2
                            L10_2 = L10_2(L11_2)
                            L9_2.name = L10_2
                            L8_2[L7_2] = L9_2
                          end
                        else
                          L4_2 = GameType
                          L4_2 = L4_2()
                          if L4_2 == 11 then
                            L4_2 = ipairs
                            L5_2 = A0_2.players
                            L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
                            for L6_2, L7_2 in L4_2, L5_2 do
                              L8_2 = L6_2 * 15
                              L8_2 = 60 + L8_2
                              L2_2.y = L8_2
                              L8_2 = A0_2.rows
                              L9_2 = {}
                              L10_2 = L3_2
                              L11_2 = {}
                              L11_2.x = 110
                              L12_2 = "^S^"
                              L13_2 = L6_2
                              L14_2 = "."
                              L12_2 = L12_2 .. L13_2 .. L14_2
                              L11_2.text = L12_2
                              L13_2 = L7_2
                              L12_2 = L7_2.Colour
                              L12_2 = L12_2(L13_2)
                              L11_2.colour = L12_2
                              L10_2 = L10_2(L11_2)
                              L9_2.num = L10_2
                              L10_2 = L3_2
                              L11_2 = {}
                              L11_2.x = 133
                              L12_2 = "^S^"
                              L14_2 = L7_2
                              L13_2 = L7_2.Name
                              L13_2 = L13_2(L14_2)
                              L12_2 = L12_2 .. L13_2
                              L11_2.text = L12_2
                              L13_2 = L7_2
                              L12_2 = L7_2.Colour
                              L12_2 = L12_2(L13_2)
                              L11_2.colour = L12_2
                              L10_2 = L10_2(L11_2)
                              L9_2.name = L10_2
                              L8_2[L7_2] = L9_2
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
L0_1.DrawScores = L1_1
L0_1 = ScoreSheet
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = A0_2
  L1_2 = A0_2.HideOptions
  L1_2(L2_2)
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = PlayerHealth
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = PlayerHealth
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 <= 0 then
      return
    end
  end
  L2_2 = AddText
  L3_2 = L2_2
  L2_2 = L2_2.With
  L4_2 = {}
  L4_2.player = L1_2
  L4_2.y = 70
  L4_2.style = 0
  L4_2.scale = 0.75
  L2_2 = L2_2(L3_2, L4_2)
  function L3_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = L2_2
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    L3_3 = L1_3
    L2_3 = L1_3.Order
    L4_3 = -1
    L2_3(L3_3, L4_3)
    L2_3 = table
    L2_3 = L2_3.insert
    L3_3 = A0_2
    L3_3 = L3_3.option_sprites
    L4_3 = L1_3
    L2_3(L3_3, L4_3)
    return L1_3
  end
  L4_2 = IsPlayerRespawning
  L4_2 = L4_2()
  L5_2 = true
  if L4_2 == L5_2 then
    A0_2.screen = 3
  end
  L4_2 = A0_2.screen
  if L4_2 == 0 then
    L4_2 = main
    L4_2 = L4_2.game
    L4_2 = L4_2.state
    if L4_2 == "StateGameWon" then
      A0_2.option = 1
      L4_2 = SetPauseScreenSelection
      L5_2 = -1
      L4_2(L5_2)
    end
    L4_2 = A0_2.option
    if L4_2 == 0 then
      L4_2 = L3_2
      L5_2 = {}
      L5_2.x = 240
      L5_2.y = 220
      L5_2.align = 1
      L5_2.text = "MPCONT"
      L6_2 = Colour
      L7_2 = 10
      L6_2 = L6_2(L7_2)
      L5_2.colour = L6_2
      L4_2(L5_2)
      L4_2 = L3_2
      L5_2 = {}
      L5_2.x = 240
      L5_2.y = 235
      L5_2.align = 1
      L5_2.text = "MPQUIT"
      L6_2 = Colour
      L7_2 = 11
      L6_2 = L6_2(L7_2)
      L5_2.colour = L6_2
      L4_2(L5_2)
      L4_2 = GameType
      L4_2 = L4_2()
      if L4_2 ~= 9 then
        L4_2 = L3_2
        L5_2 = {}
        L5_2.x = 240
        L5_2.y = 250
        L5_2.align = 1
        L5_2.text = "MPHELP"
        L6_2 = Colour
        L7_2 = 11
        L6_2 = L6_2(L7_2)
        L5_2.colour = L6_2
        L4_2(L5_2)
      end
      L4_2 = SetPauseScreenSelection
      L5_2 = 0
      L4_2(L5_2)
    else
      L4_2 = A0_2.option
      if L4_2 == 1 then
        L4_2 = main
        L4_2 = L4_2.game
        L4_2 = L4_2.state
        if L4_2 ~= "StateGameWon" then
          L4_2 = L3_2
          L5_2 = {}
          L5_2.x = 240
          L5_2.y = 220
          L5_2.align = 1
          L5_2.text = "MPCONT"
          L6_2 = Colour
          L7_2 = 11
          L6_2 = L6_2(L7_2)
          L5_2.colour = L6_2
          L4_2(L5_2)
          L4_2 = L3_2
          L5_2 = {}
          L5_2.x = 240
          L5_2.y = 235
          L5_2.align = 1
          L5_2.text = "MPQUIT"
          L6_2 = Colour
          L7_2 = 10
          L6_2 = L6_2(L7_2)
          L5_2.colour = L6_2
          L4_2(L5_2)
          L4_2 = GameType
          L4_2 = L4_2()
          if L4_2 ~= 9 then
            L4_2 = L3_2
            L5_2 = {}
            L5_2.x = 240
            L5_2.y = 250
            L5_2.align = 1
            L5_2.text = "MPHELP"
            L6_2 = Colour
            L7_2 = 11
            L6_2 = L6_2(L7_2)
            L5_2.colour = L6_2
            L4_2(L5_2)
          end
          L4_2 = SetPauseScreenSelection
          L5_2 = 1
          L4_2(L5_2)
        else
          L4_2 = SetPauseScreenSelection
          L5_2 = -1
          L4_2(L5_2)
        end
      else
        L4_2 = L3_2
        L5_2 = {}
        L5_2.x = 240
        L5_2.y = 220
        L5_2.align = 1
        L5_2.text = "MPCONT"
        L6_2 = Colour
        L7_2 = 11
        L6_2 = L6_2(L7_2)
        L5_2.colour = L6_2
        L4_2(L5_2)
        L4_2 = L3_2
        L5_2 = {}
        L5_2.x = 240
        L5_2.y = 235
        L5_2.align = 1
        L5_2.text = "MPQUIT"
        L6_2 = Colour
        L7_2 = 11
        L6_2 = L6_2(L7_2)
        L5_2.colour = L6_2
        L4_2(L5_2)
        L4_2 = GameType
        L4_2 = L4_2()
        if L4_2 ~= 9 then
          L4_2 = L3_2
          L5_2 = {}
          L5_2.x = 240
          L5_2.y = 250
          L5_2.align = 1
          L5_2.text = "MPHELP"
          L6_2 = Colour
          L7_2 = 10
          L6_2 = L6_2(L7_2)
          L5_2.colour = L6_2
          L4_2(L5_2)
        end
        L4_2 = SetPauseScreenSelection
        L5_2 = 2
        L4_2(L5_2)
      end
    end
  else
    L4_2 = A0_2.screen
    if L4_2 == 1 then
      L4_2 = A0_2.option
      if L4_2 == 0 then
        L4_2 = L3_2
        L5_2 = {}
        L5_2.x = 240
        L5_2.y = 220
        L5_2.align = 1
        L5_2.text = "FEU_NO"
        L6_2 = Colour
        L7_2 = 10
        L6_2 = L6_2(L7_2)
        L5_2.colour = L6_2
        L4_2(L5_2)
        L4_2 = L3_2
        L5_2 = {}
        L5_2.x = 240
        L5_2.y = 235
        L5_2.align = 1
        L5_2.text = "FEU_YES"
        L6_2 = Colour
        L7_2 = 11
        L6_2 = L6_2(L7_2)
        L5_2.colour = L6_2
        L4_2(L5_2)
        L4_2 = SetPauseScreenSelection
        L5_2 = 0
        L4_2(L5_2)
      else
        L4_2 = L3_2
        L5_2 = {}
        L5_2.x = 240
        L5_2.y = 220
        L5_2.align = 1
        L5_2.text = "FEU_NO"
        L6_2 = Colour
        L7_2 = 11
        L6_2 = L6_2(L7_2)
        L5_2.colour = L6_2
        L4_2(L5_2)
        L4_2 = L3_2
        L5_2 = {}
        L5_2.x = 240
        L5_2.y = 235
        L5_2.align = 1
        L5_2.text = "FEU_YES"
        L6_2 = Colour
        L7_2 = 10
        L6_2 = L6_2(L7_2)
        L5_2.colour = L6_2
        L4_2(L5_2)
        L4_2 = SetPauseScreenSelection
        L5_2 = 1
        L4_2(L5_2)
      end
    else
      L4_2 = A0_2.screen
      if L4_2 == 2 then
        L4_2 = L3_2
        L5_2 = {}
        L5_2.x = 240
        L5_2.y = 235
        L5_2.align = 1
        L5_2.text = "GS_OK"
        L6_2 = Colour
        L7_2 = 10
        L6_2 = L6_2(L7_2)
        L5_2.colour = L6_2
        L4_2(L5_2)
        L4_2 = SetPauseScreenSelection
        L5_2 = 1
        L4_2(L5_2)
      else
        L4_2 = A0_2.screen
        if L4_2 == 3 then
          L4_2 = SetPauseScreenSelection
          L5_2 = -1
          L4_2(L5_2)
        end
      end
    end
  end
end
L0_1.DrawOptions = L1_1
L0_1 = ScoreSheet
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = A0_2
  L1_2 = A0_2.HideHelp
  L1_2(L2_2)
  L1_2 = ShowHelp
  L2_2 = true
  L1_2(L2_2)
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = AddText
  L3_2 = L2_2
  L2_2 = L2_2.With
  L4_2 = {}
  L4_2.player = L1_2
  L4_2.y = 70
  L4_2.style = 1
  L4_2.scale = 0.75
  L4_2.wrapX = 365
  L2_2 = L2_2(L3_2, L4_2)
  function L3_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3
    L1_3 = L2_2
    L2_3 = A0_3
    L1_3 = L1_3(L2_3)
    L3_3 = L1_3
    L2_3 = L1_3.Order
    L4_3 = -1
    L2_3(L3_3, L4_3)
    L2_3 = table
    L2_3 = L2_3.insert
    L3_3 = A0_2
    L3_3 = L3_3.help_sprites
    L4_3 = L1_3
    L2_3(L3_3, L4_3)
    return L1_3
  end
  L4_2 = L3_2
  L5_2 = {}
  L5_2.x = 110
  L5_2.y = 50
  L5_2.style = 0
  L5_2.align = 0
  L5_2.scale = 0.978
  L5_2.text = "MPOBJ"
  L6_2 = GameColour
  L7_2 = 3
  L6_2 = L6_2(L7_2)
  L5_2.colour = L6_2
  L4_2(L5_2)
  L4_2 = GameType
  L4_2 = L4_2()
  if L4_2 == 0 then
    L4_2 = IsTeamGame
    L4_2 = L4_2()
    if L4_2 then
      L4_2 = L3_2
      L5_2 = {}
      L5_2.x = 116
      L5_2.y = 76
      L5_2.align = 0
      L5_2.scale = 0.663
      L5_2.text = "GS_TO1"
      L6_2 = {}
      L7_2 = 255
      L8_2 = 255
      L9_2 = 255
      L10_2 = 255
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L6_2[4] = L10_2
      L5_2.colour = L6_2
      L4_2(L5_2)
    else
      L4_2 = L3_2
      L5_2 = {}
      L5_2.x = 114
      L5_2.y = 76
      L5_2.align = 0
      L5_2.scale = 0.663
      L5_2.text = "GS_O1"
      L6_2 = {}
      L7_2 = 255
      L8_2 = 255
      L9_2 = 255
      L10_2 = 255
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L6_2[4] = L10_2
      L5_2.colour = L6_2
      L4_2(L5_2)
    end
  else
    L4_2 = GameType
    L4_2 = L4_2()
    if L4_2 == 1 then
      L4_2 = L3_2
      L5_2 = {}
      L5_2.x = 116
      L5_2.y = 76
      L5_2.align = 0
      L5_2.scale = 0.663
      L5_2.text = "GS_O2"
      L6_2 = {}
      L7_2 = 255
      L8_2 = 255
      L9_2 = 255
      L10_2 = 255
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L6_2[4] = L10_2
      L5_2.colour = L6_2
      L4_2(L5_2)
    else
      L4_2 = GameType
      L4_2 = L4_2()
      if L4_2 == 2 then
        L4_2 = L1_2.TeamId
        L4_2 = L4_2()
        L5_2 = DefendingTeam
        L5_2 = L5_2()
        L5_2 = L5_2 - 1
        if L4_2 == L5_2 then
          L4_2 = L3_2
          L5_2 = {}
          L5_2.x = 116
          L5_2.y = 76
          L5_2.align = 0
          L5_2.scale = 0.663
          L5_2.text = "GS_OD3"
          L6_2 = {}
          L7_2 = 255
          L8_2 = 255
          L9_2 = 255
          L10_2 = 255
          L6_2[1] = L7_2
          L6_2[2] = L8_2
          L6_2[3] = L9_2
          L6_2[4] = L10_2
          L5_2.colour = L6_2
          L4_2(L5_2)
        else
          L4_2 = L3_2
          L5_2 = {}
          L5_2.x = 116
          L5_2.y = 76
          L5_2.align = 0
          L5_2.scale = 0.663
          L5_2.text = "GS_OA3"
          L6_2 = {}
          L7_2 = 255
          L8_2 = 255
          L9_2 = 255
          L10_2 = 255
          L6_2[1] = L7_2
          L6_2[2] = L8_2
          L6_2[3] = L9_2
          L6_2[4] = L10_2
          L5_2.colour = L6_2
          L4_2(L5_2)
        end
      else
        L4_2 = GameType
        L4_2 = L4_2()
        if L4_2 == 3 then
          L4_2 = L3_2
          L5_2 = {}
          L5_2.x = 115
          L5_2.y = 76
          L5_2.align = 0
          L5_2.scale = 0.663
          L5_2.text = "GS_O4"
          L6_2 = {}
          L7_2 = 255
          L8_2 = 255
          L9_2 = 255
          L10_2 = 255
          L6_2[1] = L7_2
          L6_2[2] = L8_2
          L6_2[3] = L9_2
          L6_2[4] = L10_2
          L5_2.colour = L6_2
          L4_2(L5_2)
        else
          L4_2 = GameType
          L4_2 = L4_2()
          if L4_2 == 4 then
            L4_2 = L3_2
            L5_2 = {}
            L5_2.x = 116
            L5_2.y = 76
            L5_2.align = 0
            L5_2.scale = 0.663
            L5_2.text = "GS_O5"
            L6_2 = {}
            L7_2 = 255
            L8_2 = 255
            L9_2 = 255
            L10_2 = 255
            L6_2[1] = L7_2
            L6_2[2] = L8_2
            L6_2[3] = L9_2
            L6_2[4] = L10_2
            L5_2.colour = L6_2
            L4_2(L5_2)
          else
            L4_2 = GameType
            L4_2 = L4_2()
            if L4_2 == 5 then
              L4_2 = L3_2
              L5_2 = {}
              L5_2.x = 116
              L5_2.y = 76
              L5_2.align = 0
              L5_2.scale = 0.663
              L5_2.text = "GS_O6"
              L6_2 = {}
              L7_2 = 255
              L8_2 = 255
              L9_2 = 255
              L10_2 = 255
              L6_2[1] = L7_2
              L6_2[2] = L8_2
              L6_2[3] = L9_2
              L6_2[4] = L10_2
              L5_2.colour = L6_2
              L4_2(L5_2)
            else
              L4_2 = GameType
              L4_2 = L4_2()
              if L4_2 == 6 then
                L4_2 = L3_2
                L5_2 = {}
                L5_2.x = 116
                L5_2.y = 76
                L5_2.align = 0
                L5_2.scale = 0.663
                L5_2.text = "GS_O7"
                L6_2 = {}
                L7_2 = 255
                L8_2 = 255
                L9_2 = 255
                L10_2 = 255
                L6_2[1] = L7_2
                L6_2[2] = L8_2
                L6_2[3] = L9_2
                L6_2[4] = L10_2
                L5_2.colour = L6_2
                L4_2(L5_2)
              else
                L4_2 = GameType
                L4_2 = L4_2()
                if L4_2 == 7 then
                  L4_2 = L3_2
                  L5_2 = {}
                  L5_2.x = 116
                  L5_2.y = 76
                  L5_2.align = 0
                  L5_2.scale = 0.663
                  L5_2.text = "GS_O8"
                  L6_2 = {}
                  L7_2 = 255
                  L8_2 = 255
                  L9_2 = 255
                  L10_2 = 255
                  L6_2[1] = L7_2
                  L6_2[2] = L8_2
                  L6_2[3] = L9_2
                  L6_2[4] = L10_2
                  L5_2.colour = L6_2
                  L4_2(L5_2)
                else
                  L4_2 = GameType
                  L4_2 = L4_2()
                  if L4_2 == 8 then
                    L4_2 = L3_2
                    L5_2 = {}
                    L5_2.x = 116
                    L5_2.y = 76
                    L5_2.align = 0
                    L5_2.scale = 0.663
                    L5_2.text = "GS_O9"
                    L6_2 = {}
                    L7_2 = 255
                    L8_2 = 255
                    L9_2 = 255
                    L10_2 = 255
                    L6_2[1] = L7_2
                    L6_2[2] = L8_2
                    L6_2[3] = L9_2
                    L6_2[4] = L10_2
                    L5_2.colour = L6_2
                    L4_2(L5_2)
                  else
                    L4_2 = GameType
                    L4_2 = L4_2()
                    if L4_2 == 9 then
                      L4_2 = main
                      L4_2 = L4_2.game
                      L4_2 = L4_2.vipTeam
                      if L4_2 ~= nil then
                        L4_2 = main
                        L4_2 = L4_2.game
                        L4_2 = L4_2.vipPeerId
                        if L4_2 ~= nil then
                          L4_2 = PlayerId
                          L4_2 = L4_2()
                          L5_2 = main
                          L5_2 = L5_2.game
                          L5_2 = L5_2.vipPeerId
                          if L4_2 == L5_2 then
                            L4_2 = L3_2
                            L5_2 = {}
                            L5_2.x = 116
                            L5_2.y = 76
                            L5_2.align = 0
                            L5_2.scale = 0.663
                            L5_2.text = "GS_1OV"
                            L6_2 = {}
                            L7_2 = 255
                            L8_2 = 255
                            L9_2 = 255
                            L10_2 = 255
                            L6_2[1] = L7_2
                            L6_2[2] = L8_2
                            L6_2[3] = L9_2
                            L6_2[4] = L10_2
                            L5_2.colour = L6_2
                            L4_2(L5_2)
                          else
                            L4_2 = L1_2.TeamId
                            L4_2 = L4_2()
                            L5_2 = main
                            L5_2 = L5_2.game
                            L5_2 = L5_2.vipTeam
                            if L4_2 == L5_2 then
                              L4_2 = L3_2
                              L5_2 = {}
                              L5_2.x = 116
                              L5_2.y = 76
                              L5_2.align = 0
                              L5_2.scale = 0.663
                              L5_2.text = "GS_1OD"
                              L6_2 = {}
                              L7_2 = 255
                              L8_2 = 255
                              L9_2 = 255
                              L10_2 = 255
                              L6_2[1] = L7_2
                              L6_2[2] = L8_2
                              L6_2[3] = L9_2
                              L6_2[4] = L10_2
                              L5_2.colour = L6_2
                              L4_2(L5_2)
                            else
                              L4_2 = L3_2
                              L5_2 = {}
                              L5_2.x = 116
                              L5_2.y = 76
                              L5_2.align = 0
                              L5_2.scale = 0.663
                              L5_2.text = "GS_1OA"
                              L6_2 = {}
                              L7_2 = 255
                              L8_2 = 255
                              L9_2 = 255
                              L10_2 = 255
                              L6_2[1] = L7_2
                              L6_2[2] = L8_2
                              L6_2[3] = L9_2
                              L6_2[4] = L10_2
                              L5_2.colour = L6_2
                              L4_2(L5_2)
                            end
                          end
                        end
                      end
                    else
                      L4_2 = GameType
                      L4_2 = L4_2()
                      if L4_2 == 10 then
                        L4_2 = L3_2
                        L5_2 = {}
                        L5_2.x = 116
                        L5_2.y = 76
                        L5_2.align = 0
                        L5_2.scale = 0.663
                        L5_2.text = "GS_11"
                        L6_2 = {}
                        L7_2 = 255
                        L8_2 = 255
                        L9_2 = 255
                        L10_2 = 255
                        L6_2[1] = L7_2
                        L6_2[2] = L8_2
                        L6_2[3] = L9_2
                        L6_2[4] = L10_2
                        L5_2.colour = L6_2
                        L4_2(L5_2)
                      else
                        L4_2 = GameType
                        L4_2 = L4_2()
                        if L4_2 == 11 then
                          L4_2 = L3_2
                          L5_2 = {}
                          L5_2.x = 116
                          L5_2.y = 76
                          L5_2.align = 0
                          L5_2.scale = 0.663
                          L5_2.text = "GS_12"
                          L6_2 = {}
                          L7_2 = 255
                          L8_2 = 255
                          L9_2 = 255
                          L10_2 = 255
                          L6_2[1] = L7_2
                          L6_2[2] = L8_2
                          L6_2[3] = L9_2
                          L6_2[4] = L10_2
                          L5_2.colour = L6_2
                          L4_2(L5_2)
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L4_2 = L3_2
  L5_2 = {}
  L5_2.x = 110
  L5_2.y = 126
  L5_2.style = 0
  L5_2.align = 0
  L5_2.scale = 0.978
  L5_2.text = "MPLEG"
  L6_2 = GameColour
  L7_2 = 3
  L6_2 = L6_2(L7_2)
  L5_2.colour = L6_2
  L4_2(L5_2)
end
L0_1.DrawHelp = L1_1
L0_1 = ScoreSheet
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = pairs
  L2_2 = A0_2.title_sprites
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L3_2, L4_2 in L1_2, L2_2 do
    L6_2 = L4_2
    L5_2 = L4_2.Remove
    L5_2(L6_2)
  end
  L1_2 = {}
  A0_2.title_sprites = L1_2
end
L0_1.HideTitles = L1_1
L0_1 = ScoreSheet
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = pairs
  L2_2 = A0_2.score_sprites
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L3_2, L4_2 in L1_2, L2_2 do
    L6_2 = L4_2
    L5_2 = L4_2.Remove
    L5_2(L6_2)
  end
  L1_2 = {}
  A0_2.score_sprites = L1_2
end
L0_1.HideScores = L1_1
L0_1 = ScoreSheet
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = pairs
  L2_2 = A0_2.option_sprites
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L3_2, L4_2 in L1_2, L2_2 do
    L6_2 = L4_2
    L5_2 = L4_2.Remove
    L5_2(L6_2)
  end
  L1_2 = {}
  A0_2.option_sprites = L1_2
  L1_2 = SetPauseScreenSelection
  L2_2 = -1
  L1_2(L2_2)
end
L0_1.HideOptions = L1_1
L0_1 = ScoreSheet
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = ShowHelp
  L2_2 = false
  L1_2(L2_2)
  L1_2 = pairs
  L2_2 = A0_2.help_sprites
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L3_2, L4_2 in L1_2, L2_2 do
    L6_2 = L4_2
    L5_2 = L4_2.Remove
    L5_2(L6_2)
  end
  L1_2 = {}
  A0_2.help_sprites = L1_2
end
L0_1.HideHelp = L1_1
L0_1 = StateMachine
L1_1 = {}
L2_1 = "Update"
L1_1[1] = L2_1
L0_1 = L0_1(L1_1)
ScoreSheetScript = L0_1
L0_1 = ScoreSheetScript
function L1_1(A0_2, A1_2)
  local L2_2, L3_2
  A0_2.locked = A1_2
  L3_2 = A0_2
  L2_2 = A0_2._Show
  L2_2(L3_2)
end
L0_1.Show = L1_1
L0_1 = ScoreSheetScript
function L1_1(A0_2, A1_2)
  local L2_2, L3_2
  L3_2 = A0_2
  L2_2 = A0_2._Hide
  L2_2(L3_2)
  A0_2.locked = A1_2
end
L0_1.Hide = L1_1
L0_1 = ScoreSheetScript
function L1_1(A0_2)
  local L1_2
  L1_2 = A0_2.locked
  if L1_2 then
    return
  end
  L1_2 = A0_2.startjustup
  return L1_2
end
L0_1._NeedToggle = L1_1
L0_1 = ScoreSheetScript
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = HasPlayerEnteredGame
  L4_2 = L1_2
  L3_2 = L1_2.PlayerNum
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L3_2(L4_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  if not L2_2 then
    return
  end
  L2_2 = A0_2.scores
  if L2_2 then
    L3_2 = L1_2
    L2_2 = L1_2.IsPlaying
    L2_2 = L2_2(L3_2)
    if not L2_2 then
      L2_2 = A0_2.scores
      L2_2 = L2_2.screen
      if L2_2 == 2 then
        L3_2 = A0_2
        L2_2 = A0_2._Hide
        L2_2(L3_2)
      else
        L2_2 = A0_2.scores
        L3_2 = L2_2
        L2_2 = L2_2.HideOptions
        L2_2(L3_2)
      end
      return
    end
    L2_2 = A0_2.scores
    L2_2 = L2_2.doUpdate
    L3_2 = false
    if L2_2 == L3_2 then
      return
    end
    L2_2 = A0_2.scores
    L3_2 = L2_2
    L2_2 = L2_2.DrawOptions
    L2_2(L3_2)
  end
  L2_2 = A0_2.scores
  if not L2_2 then
    L2_2 = StartDown
    L2_2 = L2_2()
    L3_2 = L2_2 or L3_2
    if L2_2 then
      L3_2 = A0_2.startdown
      L3_2 = not L3_2
    end
    L4_2 = A0_2.startdown
    if L4_2 then
      L4_2 = not L2_2
    end
    A0_2.startdown = L2_2
    A0_2.startpressed = L3_2
    A0_2.startjustup = L4_2
  else
    L2_2 = false
    A0_2.startjustup = L2_2
  end
  L3_2 = A0_2
  L2_2 = A0_2._NeedToggle
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = A0_2.scores
    if L2_2 then
      L3_2 = A0_2
      L2_2 = A0_2._Hide
      L2_2(L3_2)
    else
      L3_2 = A0_2
      L2_2 = A0_2._Show
      L2_2(L3_2)
      L2_2 = A0_2.scores
      L2_2.screen = 0
      L2_2 = main
      L2_2 = L2_2.game
      L2_2 = L2_2.state
      if L2_2 ~= "StateGameWon" then
        L2_2 = A0_2.scores
        L2_2.option = 0
      else
        L2_2 = A0_2.scores
        L2_2.option = 1
      end
    end
  else
    L2_2 = A0_2.scores
    if L2_2 then
      L2_2 = UpdatePad
      L2_2()
      L2_2 = StartDown
      L2_2 = L2_2()
      L3_2 = L2_2 or L3_2
      if L2_2 then
        L3_2 = A0_2.startdown
        L3_2 = not L3_2
      end
      L4_2 = A0_2.startdown
      if L4_2 then
        L4_2 = not L2_2
      end
      A0_2.startdown = L2_2
      A0_2.startpressed = L3_2
      A0_2.startjustup = L4_2
      L5_2 = DownDown
      L5_2 = L5_2()
      L6_2 = UpDown
      L6_2 = L6_2()
      L7_2 = CrossDown
      L7_2 = L7_2()
      L8_2 = CircleDown
      L8_2 = L8_2()
      L9_2 = TriangleDown
      L9_2 = L9_2()
      L10_2 = L5_2 or L10_2
      if L5_2 then
        L10_2 = A0_2.leftdown
        L10_2 = not L10_2
      end
      L11_2 = L6_2 or L11_2
      if L6_2 then
        L11_2 = A0_2.rightdown
        L11_2 = not L11_2
      end
      L12_2 = L7_2 or L12_2
      if L7_2 then
        L12_2 = A0_2.crossdown
        L12_2 = not L12_2
      end
      L13_2 = L8_2 or L13_2
      if L8_2 then
        L13_2 = A0_2.circledown
        L13_2 = not L13_2
      end
      L14_2 = A0_2.circledown
      if L14_2 then
        L14_2 = not L8_2
      end
      L15_2 = L9_2 or L15_2
      if L9_2 then
        L15_2 = A0_2.triangledown
        L15_2 = not L15_2
      end
      L16_2 = A0_2.triangledown
      if L16_2 then
        L16_2 = not L9_2
      end
      A0_2.leftdown = L5_2
      A0_2.rightdown = L6_2
      A0_2.crossdown = L7_2
      A0_2.circledown = L8_2
      A0_2.triangledown = L9_2
      L17_2 = A0_2.scores
      if L17_2 then
        L17_2 = A0_2.scores
        L17_2 = L17_2.screen
        if L17_2 < 2 then
          L17_2 = A0_2.scores
          L18_2 = L17_2
          L17_2 = L17_2.DrawScores
          L17_2(L18_2)
        end
      end
      L17_2 = main
      L17_2 = L17_2.game
      L17_2 = L17_2.state
      if L17_2 == "StateGameWon" then
        L17_2 = A0_2.scores
        L17_2 = L17_2.screen
        if L17_2 == 0 then
          goto lbl_261
        end
      end
      L17_2 = GameType
      L17_2 = L17_2()
      if L17_2 == 9 then
        if L10_2 or L11_2 then
          L17_2 = A0_2.scores
          L17_2 = L17_2.option
          if L17_2 == 0 then
            L17_2 = A0_2.scores
            L17_2.option = 1
          else
            L17_2 = A0_2.scores
            L17_2.option = 0
          end
          L17_2 = A0_2.scores
          L18_2 = L17_2
          L17_2 = L17_2.DrawOptions
          L17_2(L18_2)
        end
      else
        if L10_2 then
          L17_2 = A0_2.scores
          if L17_2 then
            L17_2 = A0_2.scores
            L17_2 = L17_2.screen
            if L17_2 < 2 then
              L17_2 = A0_2.scores
              L17_2 = L17_2.screen
              if L17_2 == 0 then
                L17_2 = A0_2.scores
                L17_2 = L17_2.option
                if L17_2 == 2 then
                  L17_2 = A0_2.scores
                  L17_2.option = 0
              end
              else
                L17_2 = A0_2.scores
                L17_2 = L17_2.screen
                if L17_2 == 1 then
                  L17_2 = A0_2.scores
                  L17_2 = L17_2.option
                  if L17_2 == 1 then
                    L17_2 = A0_2.scores
                    L17_2.option = 0
                end
                else
                  L17_2 = A0_2.scores
                  L18_2 = A0_2.scores
                  L18_2 = L18_2.option
                  L18_2 = L18_2 + 1
                  L17_2.option = L18_2
                end
              end
              L17_2 = A0_2.scores
              L18_2 = L17_2
              L17_2 = L17_2.DrawOptions
              L17_2(L18_2)
          end
        end
        elseif L11_2 then
          L17_2 = A0_2.scores
          if L17_2 then
            L17_2 = A0_2.scores
            L17_2 = L17_2.screen
            if L17_2 < 2 then
              L17_2 = A0_2.scores
              L17_2 = L17_2.screen
              if L17_2 == 0 then
                L17_2 = A0_2.scores
                L17_2 = L17_2.option
                if L17_2 == 0 then
                  L17_2 = A0_2.scores
                  L17_2.option = 2
              end
              else
                L17_2 = A0_2.scores
                L17_2 = L17_2.screen
                if L17_2 == 1 then
                  L17_2 = A0_2.scores
                  L17_2 = L17_2.option
                  if L17_2 == 0 then
                    L17_2 = A0_2.scores
                    L17_2.option = 1
                end
                else
                  L17_2 = A0_2.scores
                  L18_2 = A0_2.scores
                  L18_2 = L18_2.option
                  L18_2 = L18_2 - 1
                  L17_2.option = L18_2
                end
              end
              L17_2 = A0_2.scores
              L18_2 = L17_2
              L17_2 = L17_2.DrawOptions
              L17_2(L18_2)
            end
          end
        end
      end
      ::lbl_261::
      if L12_2 then
        L17_2 = A0_2.scores
        L17_2 = L17_2.option
        if L17_2 == 0 then
          L17_2 = A0_2.scores
          L17_2 = L17_2.screen
          if L17_2 == 0 then
            L17_2 = Player
            L17_2 = L17_2()
            L19_2 = L17_2
            L18_2 = L17_2.IsPlaying
            L18_2 = L18_2(L19_2)
            if not L18_2 then
              L18_2 = CameraFadeOut
              L19_2 = 1
              L18_2(L19_2)
              L18_2 = Wait
              L19_2 = 750
              L18_2(L19_2)
            end
            L19_2 = A0_2
            L18_2 = A0_2._Hide
            L18_2(L19_2)
          else
            L17_2 = A0_2.scores
            L17_2.screen = 0
            L17_2 = A0_2.scores
            L17_2.option = 0
            L17_2 = A0_2.scores
            L18_2 = L17_2
            L17_2 = L17_2.DrawTitles
            L17_2(L18_2)
            L17_2 = A0_2.scores
            L18_2 = L17_2
            L17_2 = L17_2.DrawScores
            L17_2(L18_2)
            L17_2 = A0_2.scores
            L18_2 = L17_2
            L17_2 = L17_2.DrawOptions
            L17_2(L18_2)
            L17_2 = A0_2.scores
            L18_2 = L17_2
            L17_2 = L17_2.HideHelp
            L17_2(L18_2)
          end
        else
          L17_2 = A0_2.scores
          L17_2 = L17_2.option
          if L17_2 == 1 then
            L17_2 = A0_2.scores
            L17_2 = L17_2.screen
            if L17_2 == 0 then
              L17_2 = main
              L17_2 = L17_2.game
              L17_2 = L17_2.state
              if L17_2 == "StateGameWon" then
                L18_2 = A0_2
                L17_2 = A0_2._Hide
                L17_2(L18_2)
                L17_2 = main
                L18_2 = L17_2
                L17_2 = L17_2.EndGame
                L17_2(L18_2)
              else
                L17_2 = A0_2.scores
                L17_2.screen = 1
                L17_2 = A0_2.scores
                L17_2.option = 0
                L17_2 = A0_2.scores
                L18_2 = L17_2
                L17_2 = L17_2.DrawTitles
                L17_2(L18_2)
                L17_2 = A0_2.scores
                L18_2 = L17_2
                L17_2 = L17_2.DrawOptions
                L17_2(L18_2)
                L17_2 = A0_2.scores
                L18_2 = L17_2
                L17_2 = L17_2.HideScores
                L17_2(L18_2)
              end
            else
              L17_2 = A0_2.scores
              L17_2 = L17_2.screen
              if L17_2 == 1 then
                L18_2 = A0_2
                L17_2 = A0_2._Hide
                L17_2(L18_2)
                L17_2 = main
                L18_2 = L17_2
                L17_2 = L17_2.EndGame
                L17_2(L18_2)
              else
                L17_2 = A0_2.scores
                L17_2 = L17_2.screen
                if L17_2 == 2 then
                  L17_2 = A0_2.scores
                  L17_2.screen = 0
                  L17_2 = A0_2.scores
                  L17_2.option = 2
                  L17_2 = A0_2.scores
                  L18_2 = L17_2
                  L17_2 = L17_2.DrawTitles
                  L17_2(L18_2)
                  L17_2 = A0_2.scores
                  L18_2 = L17_2
                  L17_2 = L17_2.DrawScores
                  L17_2(L18_2)
                  L17_2 = A0_2.scores
                  L18_2 = L17_2
                  L17_2 = L17_2.DrawOptions
                  L17_2(L18_2)
                  L17_2 = A0_2.scores
                  L18_2 = L17_2
                  L17_2 = L17_2.HideHelp
                  L17_2(L18_2)
                end
              end
            end
          else
            L17_2 = A0_2.scores
            L17_2.screen = 2
            L17_2 = A0_2.scores
            L17_2.option = 1
            L17_2 = A0_2.scores
            L18_2 = L17_2
            L17_2 = L17_2.DrawTitles
            L17_2(L18_2)
            L17_2 = A0_2.scores
            L18_2 = L17_2
            L17_2 = L17_2.DrawHelp
            L17_2(L18_2)
            L17_2 = A0_2.scores
            L18_2 = L17_2
            L17_2 = L17_2.DrawOptions
            L17_2(L18_2)
            L17_2 = A0_2.scores
            L18_2 = L17_2
            L17_2 = L17_2.HideScores
            L17_2(L18_2)
          end
        end
      elseif L13_2 or L15_2 then
        L17_2 = A0_2.scores
        L17_2 = L17_2.screen
        if L17_2 ~= 0 then
          L17_2 = A0_2.scores
          L17_2.screen = 0
          L17_2 = A0_2.scores
          L17_2.option = 0
          L17_2 = A0_2.scores
          L18_2 = L17_2
          L17_2 = L17_2.DrawTitles
          L17_2(L18_2)
          L17_2 = A0_2.scores
          L18_2 = L17_2
          L17_2 = L17_2.DrawScores
          L17_2(L18_2)
          L17_2 = A0_2.scores
          L18_2 = L17_2
          L17_2 = L17_2.DrawOptions
          L17_2(L18_2)
          L17_2 = A0_2.scores
          L18_2 = L17_2
          L17_2 = L17_2.HideHelp
          L17_2(L18_2)
        end
      elseif L14_2 or L16_2 then
        L17_2 = A0_2.scores
        L17_2 = L17_2.screen
        if L17_2 == 0 then
          L18_2 = A0_2
          L17_2 = A0_2._Hide
          L17_2(L18_2)
        end
      else
        L17_2 = A0_2.startjustup
        if L17_2 then
          L18_2 = A0_2
          L17_2 = A0_2._Hide
          L17_2(L18_2)
        end
      end
    end
  end
end
L0_1.Update = L1_1
L0_1 = ScoreSheetScript
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = HasPlayerEnteredGame
  L4_2 = L1_2
  L3_2 = L1_2.PlayerNum
  L3_2, L4_2 = L3_2(L4_2)
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    return
  end
  L2_2 = A0_2.scores
  if not L2_2 then
    L2_2 = main
    L2_2 = L2_2.commentary
    L3_2 = L2_2
    L2_2 = L2_2.CleanUp
    L2_2(L3_2)
    L2_2 = ScoreSheet
    L3_2 = {}
    L2_2 = L2_2(L3_2)
    L3_2 = L2_2
    L2_2 = L2_2.Start
    L2_2 = L2_2(L3_2)
    A0_2.scores = L2_2
    L2_2 = RenderPauseScreenStuff
    L3_2 = true
    L2_2(L3_2)
    L2_2 = A0_2.scores
    L3_2 = L2_2
    L2_2 = L2_2.DrawTitles
    L2_2(L3_2)
    L2_2 = A0_2.scores
    L3_2 = L2_2
    L2_2 = L2_2.DrawScores
    L2_2(L3_2)
    L2_2 = A0_2.scores
    L3_2 = L2_2
    L2_2 = L2_2.DrawOptions
    L2_2(L3_2)
    L2_2 = A0_2.scores
    L3_2 = true
    L2_2.doUpdate = L3_2
  end
end
L0_1._Show = L1_1
L0_1 = ScoreSheetScript
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = A0_2.scores
  if L1_2 then
    L1_2 = RenderPauseScreenStuff
    L2_2 = false
    L1_2(L2_2)
    L1_2 = A0_2.scores
    L2_2 = L1_2
    L1_2 = L1_2.HideOptions
    L1_2(L2_2)
    L1_2 = A0_2.scores
    L2_2 = L1_2
    L1_2 = L1_2.HideScores
    L1_2(L2_2)
    L1_2 = A0_2.scores
    L2_2 = L1_2
    L1_2 = L1_2.HideTitles
    L1_2(L2_2)
    L1_2 = A0_2.scores
    L2_2 = L1_2
    L1_2 = L1_2.HideHelp
    L1_2(L2_2)
    L1_2 = A0_2.scores
    L2_2 = L1_2
    L1_2 = L1_2.Stop
    L1_2(L2_2)
    A0_2.scores = nil
    L1_2 = false
    A0_2.locked = L1_2
    L1_2 = GameType
    L1_2 = L1_2()
    if L1_2 == 1 then
      L1_2 = main
      L1_2 = L1_2.game
      L2_2 = L1_2
      L1_2 = L1_2.ShowHUD
      L3_2 = true
      L1_2(L2_2, L3_2)
    end
  end
end
L0_1._Hide = L1_1
L0_1 = ScoreSheetScript
function L1_1(A0_2)
  local L1_2, L2_2
  L2_2 = A0_2
  L1_2 = A0_2._Hide
  L1_2(L2_2)
end
L0_1.CleanUp = L1_1
L0_1 = ScoreSheetScript
function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2.scores
  if L2_2 then
    L2_2 = A0_2.scores
    L2_2.doUpdate = A1_2
  end
end
L0_1.ToggleUpdate = L1_1
