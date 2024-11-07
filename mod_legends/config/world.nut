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
];

::Const.World.TerrainTacticalType.SwampGreen <- 25,
::Const.World.TerrainTacticalType.SwampForest <- 26,
::Const.World.TerrainTacticalType.COUNT = 27

::Const.World.FootprintsType.Basilisks <- 26;
::Const.World.FootprintsType.COUNT = 27

::Const.World.Buildings.Stables = 0;
