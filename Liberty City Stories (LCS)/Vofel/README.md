# LCS Multiplayer

## Intro

The aim of this project is to reverse all GTA LCS Lua scripts for PSP by replacing parts of them one by one, such that
multiplayer works at all times.

## Installation

Open your game .iso in UMDGen (v4.00) and navigate to `PSP_GAME -> USRDIR -> LUASCRIPTS`. Rename the files from this
repository by adding `.LC` to the extension (`*.LUA -> *.LUA.LC`) and replace them in the aforementioned directory.
You can have any mix of original and reversed files. Save the game under a new name.

## Creating your own gamemodes

You can create custom gamemodes by replacing the original files. You're limited by the existing functions and your
imagination. You don't need to compile the scripts, but if you want to, then use Lua 5.0.2. Compiling is a good
way of finding syntax errors, because the game itself will silently crash.

## Available mods

- [Liberty City Collector](/LC%20Collector)
