
# Liberty City Collector

## Description

*Find and collect as many packages as possible. The harder the location is, the more points you get! Do everything to
prevent others from collecting more than you.*

In this custom game mode you have to collect hidden packages. The locations are different from single player. Some
of them require using various vehicles or performing stunts to get to them. Others are only available in the "Team
vs Team" mode, because they are very hard to reach on your own, if not downright impossible. You'll get more points
for harder packages.

**Version:** 1.5

**Features:**

- 60+ brand new locations for each island
- Team play support
- Password system for saving and restoring the game
- Multiple settings you can tweak in the lobby or directly in game to satisfy your needs

**Game over conditions:**

- No packages are left
- Time is up
- There are not enough points left in game to catch up to the leader

**Known issues:**
- the original pickup range is extremely large and that's unacceptable, so you must run through a package
to collect it. Otherwise, you won't receive any points, and the package will respawn in 30 seconds. Make
sure you see a message confirming that you got the points before continuing with your search!

## Installation

Open your game .iso in UMDGen (v4.00) and navigate to `PSP_GAME -> USRDIR -> LUASCRIPTS`. Rename
`PAKKOTS.LUA.LC` to `DEATHMATCH.LUA.LC` and replace it in the aforementioned directory. Starting from version 1.5,
you'll also need the `MENU` module. To install it, simply put [MENU.LUA.LC](../Utils/MENU.LUA.LC) in the same directory
(`LUASCRIPTS`). If you're planning to use passwords (more about them later), install the `STATESAVER` module
([STATESAVER.LUA.LC](../Utils/STATESAVER.LUA.LC)) the same way. Save the game under a new name. In game, choose
the "Liberty City Survivor" game mode. The settings and their meaning are the following:

- Game Location: the island you're going to play on
- Play Cutscene: package model to use. "Yes" - the original, "No" - package from GTA III (harder to spot),
"Only once" - the first match the model is going to be the original, the next ones - from GTA III
- Game Style: "Free for all" or "Gang war" ("Team vs Team")
- Kill Limit: maximum number of packages to spawn. "Unlimited" will spawn as many as possible
- Time Limit: maximum length of the game. The value is going to be multiplied by 3
- Powerups: currently unused
- Character: your character

There are extra settings you can specify directly in `PAKKOTS.LUA`. If set, they will overwrite what the host
chooses in the lobby. The installation process for this file is the same as above, except you rename `PAKKOTS.LUA`
to `DEATHMATCH.LUA.LC`. These settings that require you to modify the file are slowly getting removed in favor of
entering them directly in game. Right now, only one is left:

- `NUM_PACKAGES`:   number of packages to spawn. If set, the "Kill Limit" setting will be ignored.
                    Default: `nil` (unset)

## Using passwords

The main issue of LCS Multiplayer is players losing connection. If that happens, there's no way to join the game back.
Since this game mode is meant to be played for a prolonged period of time, these disconnects can be quite devastating.
To overcome this problem, a state saving system has been implemented. It's capable of saving the remaining
on the map packages and players' scores, so you can stop the game and continue from the same point later.

The system works by generating and displaying a password - a unique string of some length. This mechanism is optional,
and the host will be asked if they want to use it after starting a game. Next, they will be asked to enter a password.
If you don't have one yet, start a new game by leaving it empty. The password string is visible to the host only. It is
located under the HUD and updates every time somebody collects a package.

Some characters in GTA: Liberty City Stories look the same. For example, `0` and `O`, `I` and `l`. The alphabet for
passwords was chosen with this problem in mind. Only one character from each such pair is used, meaning you won't be
able to enter the wrong character as only the right ones are present.

## Changelog

Check [PAKKOTS.LUA](./LC Collector/PAKKOTS.LUA)
