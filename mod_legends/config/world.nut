::Const.World.TerrainType.SwampGreen <- 19,
::Const.World.TerrainType.SwampForest <- 20,
::Const.World.TerrainType.COUNT = 21

::Const.World.AllTerrainTypes <- []; // Added by Legends
for (local i = 0; i < ::Const.World.TerrainType.COUNT; i++)
{
	::Const.World.AllTerrainTypes.push(i);
}

::Const.World.getAllTerrainTypesExcept <- function ( _types )
{
	local ret = clone ::Const.World.AllTerrainTypes;
	local garbage = clone _types;
	::MSU.Array.sortDescending(garbage);
	foreach( i in garbage )
	{
		ret.remove(i);
	}
	return ret;
}

::Const.World.TerrainScript.extend([
	"world.tile.swamp_green",
	"world.tile.swamp_forest",
]);

::Const.World.TerrainLocation <- [
	"at an impassable location",
	"at sea",
	"on the plains",
	"in the swamps",
	"on the hills",
	"in the forests",
	"in the snowy forests",
	"in the leafy forests",
	"in the autumn forests",
	"in the mountains",
	"in an urban location",
	"in the farmlands",
	"in the snow",
	"in the badlands",
	"in the tundra",
	"in the steppes",
	"by the shore",
	"in the desert",
	"in the oasis",
	"in the green swamps",
	"in the forested swamps"
]
::Const.World.TerrainTypeSpeedMult = [
	0.0,
	0.0,
	1.0,
	0.5,
	0.64,
	0.64,
	0.64,
	0.64,
	0.64,
	0.25,
	0.5,
	1.0,
	0.75,
	0.9,
	0.9,
	1.0,
	0.5,
	0.75,
	0.9,
	0.64,
	0.64,
];
::Const.World.TerrainTypeVisibilityMult = [
	1.0,
	1.0,
	1.0,
	0.9,
	0.9,
	0.5,
	0.5,
	0.5,
	0.5,
	0.5,
	1.0,
	1.0,
	1.0,
	1.0,
	1.0,
	1.0,
	1.0,
	1.0,
	0.9,
	0.9,
	0.9,
];
::Const.World.TerrainTypeVisionRadiusMult = [
	1.0,
	1.0,
	1.0,
	1.0,
	1.25,
	1.0,
	1.0,
	1.0,
	1.0,
	2.0,
	1.0,
	1.0,
	1.0,
	1.0,
	1.0,
	1.0,
	1.0,
	1.0,
	1.0,
	1.0,
	1.0,
];

::Const.World.TerrainFoodConsumption = [
	0.0,
	1.0,
	1.0,
	1.1,
	1.1,
	1.0,
	1.1,
	1.0,
	1.0,
	2.0,
	1.0,
	1.0,
	1.1,
	1.25,
	1.0,
	1.1,
	1.0,
	1.5,
	1.0,
	0.9,
	0.9
];

::Const.World.TerrainTypeLineBattle = [
	false,
	false,
	true,
	false,
	true,
	false,
	false,
	false,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true,
	true
];

::Const.World.TerrainTacticalType.SwampGreen <- 25,
::Const.World.TerrainTacticalType.SwampForest <- 26,
::Const.World.TerrainTacticalType.COUNT = 27

::Const.World.TerrainTacticalTemplate.extend([
	"tactical.swamp_green",
	"tactical.swamp_forest"
]);

::Const.World.TerrainTacticalImage.extend([
	"engage/engage_swamp_green",
	"engage/engage_swamp_forest"
]);

::Const.World.TerrainSettlementImages.extend([
	{
		Foreground = "ui/settlements/foreground_06",
		Background = "ui/settlements/village_bg_07",
		Ramp = "ui/settlements/ramp_06",
		Mood = "ui/settlements/mood_swamp"
	},
	{
		Foreground = "ui/settlements/foreground_06",
		Background = "ui/settlements/village_bg_07",
		Ramp = "ui/settlements/ramp_06",
		Mood = "ui/settlements/mood_swamp"
	}
]);

::Const.World.SpeedSettings.FastMult = 2.5;
::Const.World.SpeedSettings.EscortMult = 4;
::Const.World.SpeedSettings.CampMult = 2.5;

::Const.World.FootprintsType.Basilisks <- 26;
::Const.World.FootprintsType.COUNT = 27

::Const.World.Buildings.Stables = 0;
local reset = ::Const.World.Buildings.reset;
::Const.World.Buildings.reset = function()
{
	reset();
	this.Stables = 0;
};
