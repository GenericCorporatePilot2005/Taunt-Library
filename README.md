## Into the Breach Library: Taunt - Version: 2.1 - By: NamesAreHard and Truelch
## Update by Generic
Contact me on discord via the Into The Breach server or @NamesAreHard#2501 for bug reports or questions
Contact Truelch via the Into The Breach or at @Truelch#4266 for art issues

##Notes for Use:
**Please read the beginning of the documentation in** `taunt.lua` for the best documentation! There's a lot of important information, like dependencies, init info, and other important notes for getting this working properly, which is only partially done here. It's a generally hacky library because it has to do with queued attacks, which in the vanila game, never change once made, so there's some extra steps you have to go through ex: custom tooltips. Sorry for any inconvience, I hope it's helpful!

## Init:
For use, add the following lines to the beginning of any file that uses taunt, and then make sure you've got modApiExt and memedit enabled
Place the taunt folder in your scripts folder
```lua
local mod = mod_loader.mods[modApi.currentMod]
local scriptPath = mod.scriptPath
local taunt = require(scriptPath.."taunt/taunt")
```
### Dependencies:
`weaponPreview`: allows to show an icon where the tile is taunted, comes prebaked with the library now, it's the newest version possible
`memedit` + `modApiExt`: Add them as dependencies to your mod, with the modloader. Versions may be outdated
```lua
dependencies = {
  modApiExt = "1.18",
  memedit = "1.0.2",
},
```
## Functions:
 ### `taunt.addTauntEffectEnemy(SkillEffect effect, BoardPawn pawn, Point point, int dmg)`
 Adds a taunt to the Skill Effect object given, when given a pawn id: 
 You should use this primarily, or the space version, since it will add icons.
 Note: The space version has the advantage of adding the
 fail icon even if there is no enemy there, while this function will not.

 @param effect	the SkillEffect Object to add to <br>
 @param pawn		the id <br>
 @param point		the new point for the pawn to target <br>
 @param dmg[opt=0] the damage to do to the taunted point (if you do this outside, the icon will be overridden) <br>
 dmg as DAMAGE_DEATH will always make the taunt fail, DAMAGE_ZERO will default to 0
 @param push[opt=DIR_NONE] makes it so the taunt also pushes the unit; the taunt only applies to the original tile, not to the new one.
 DIR_FLIP will default to DIR_NONE
 @param failFlag[opt=false] If true, if the taunt fails, it no longer does damage
 @param addition[opt=""] if "fire", "acid", or "crack", applies the respective effect, as if iFire == 1, iAcid == 1, or iCrack == 1 for each case
 The only way I could add this without adding 3 new parameters, won't accept "frozen" or "smoke" for obvious reasons
 @param pushFlag[opt=false] if true, won't push when the taunt fails, defaults to false if push is DIR_NONE
 @param hideFlag[opt=false] if true, hides the taunt completely, specifically the animations, if you were to need this option
 @return returns a bool: true if the taunt is successful and false if it is not
 
 ### `taunt.addTauntEffectSpace(SkillEffect effect, Point space, Point point, int dmg)`
 Adds a taunt to the Skill Effect object given, when given a space:
 You should use this primarily, or the pawn version, since it will add icons.
 Note: The pawn version has the disadvantage of not adding the fail icon
 if there is invalid enemy id given, while this function will.

 @param effect	the SkillEffect Object to add to <br>
 @param space		the space to trigger the effect on <br>
 @param point		the new point for the pawn to target <br>
 @param dmg[opt=0] the damage to do to the taunted point (if you do this outside, the icon will be overridden) <br>
 dmg as DAMAGE_DEATH will always make the taunt fail, DAMAGE_ZERO will default to 0
 @param push[opt=DIR_NONE] makes it so the taunt also pushes the unit; the taunt only applies to the original tile, not to the new one.
 DIR_FLIP will default to DIR_NONE
 @param failFlag[opt=false] If true, if the taunt fails, it no longer does damage
 @param addition[opt=""] if "fire", "acid", or "crack", applies the respective effect, as if iFire == 1, iAcid == 1, or iCrack == 1 for each case
 The only way I could add this without adding 3 new parameters, won't accept "frozen" or "smoke" for obvious reasons
 @param pushFlag[opt=false] if true, won't push when the taunt fails, defaults to false if push is DIR_NONE
 @param hideFlag[opt=false] if true, hides the taunt completely, specifically the animations, if you were to need this option
 @return returns a bool: true if the taunt is successful and false if it is not