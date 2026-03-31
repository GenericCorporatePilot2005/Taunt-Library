------------------------------------------------------------------------- Imports
local mod = mod_loader.mods[modApi.currentMod]
local resourcePath = mod.resourcePath
local scriptPath = mod.scriptPath

------------------------------------------------------------------------- Assets
--temporary
modApi:appendAsset("img/effects/taunting.png", scriptPath.."taunt/img/animations/taunting.png")
modApi:appendAsset("img/effects/taunted.png", scriptPath.."taunt/img/animations/taunted.png")



------------------------------------------------------------------------- Anims
ANIMS.taunting = Animation:new{
	Image = "effects/taunting.png",
	NumFrames = 5,
	Time = .1,
	PosX = -24,
	PosY = -2,
}


ANIMS.taunted = Animation:new{
	Image = "effects/taunted.png",
	NumFrames = 4,
	Time = .07,
	PosX = -24,
	PosY = -2,
	Frames = { 1, 2, 3, 2, 1, 2, 3, 2, 1, 2, 3, 4 },
}

ANIMS.tauntIcon_target_1 = Animation:new{--Preview for taunted tile,
--not using MarkSpaceImage to not overwrite anything
    Image = "combat/tile_icon/tauntIcon_target.png",
    PosX = -30, PosY = 0,
    Time = 1.5, Loop = false, Layer = LAYER_FLOOR, NumFrames = 1,
}
ANIMS.tauntIcon_target_1w = ANIMS.tauntIcon_target_1:new{PosY = 7}--same but for water and chasms
ANIMS.tauntIcon_target_2 = ANIMS.tauntIcon_target_1:new{--floating icon that also helps
    Image = "combat/icons/tauntIcon_target.png",
    PosX = -15, PosY = -14,Layer = LAYER_SKY}