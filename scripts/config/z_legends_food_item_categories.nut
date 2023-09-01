local gt = this.getroottable();

if (!("Hunting_Categories" in gt.Const))
{
	gt.Const.Hunting_Categories <- {};
}

// for copying
// item1 = [ , ""],

gt.Const.Hunting_Categories <- {

	Containers = {
		noLevels = null,
		chef = null
	},

	GenericLoot = [
		[// no upgrade, 0
			[1 ,"scripts/items/supplies/legend_fresh_meat_item"],
			[1 , "scripts/items/supplies/strange_meat_item"]
		],
		[// has chef 1
			[1, "scripts/items/supplies/bread_item"],
		],
		[// has chef and upgrade, 2

		]
	],

	// _biomeType = integer, should be one of the tile type in gt.Const.World.TerrainType
	// _init = true initialize and set the categories else extend the current categories
	// _upgrade = true means to add both upgraded tent and non-upgraded items
	function extendCategories (_biomeType, _init, _Upgrade){
		if(_init){
			this.Containers.noLevels = ::MSU.Class.WeightedContainer( null ),
			this.Containers.chef = ::MSU.Class.WeightedContainer( null )
		}
		if (this.BiomeType[_biomeType] == null) return;
		local itemList = this.BiomeType[_biomeType];

		// add the generic camp loot
		this.Containers.noLevels.addArray(this.GenericLoot[0]);
		this.Containers.chef.addArray(this.GenericLoot[1]);
		if(_Upgrade){
			this.Containers.noLevels.addArray(itemList[0]);
			this.Containers.chef.addArray(itemList[1]);
		}else {
			this.Containers.noLevels.addArray(itemList[0]);
			this.Containers.chef.addArray(itemList[1]);
			this.Containers.chef.addArray(itemList[2]);
		}
		foreach (item in this.Containers.noLevels.toArray(true)){
			::logInfo("NoLevel: " + item);
		}
		foreach (item in this.Containers.chef.toArray(true)){
			::logInfo("TentLevel: " + item);
		}
	}

	function addBiome(_biomeType, _Upgrade){
		if(this.Containers.noLevels == null){
			extendCategories(_biomeType, true, _Upgrade);
		}
		else{
			extendCategories(_biomeType, false, _Upgrade);
		}
	}

	// clear the categories out for a new campsite
	function clear(){
		if(this.Containers.noLevels == null) return;
		this.Containers.chef.clear();
		this.Containers.noLevels.clear();
		// // add the generic camp loot
		// this.Containers.noLevels.addArray(this.GenericLoot[0]);
		// this.Containers.chef.addArray(this.GenericLoot[1]);
	}

	// randomize the weights of the items
	function randomizeWeights()
	{

	}
}

// since all of these all based on the world tile type, so i think this approach should be better
gt.Const.Hunting_Categories.BiomeType <- array(gt.Const.World.TerrainType.COUNT, null);


gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Ocean] = [
	[
		[1 , "scripts/items/supplies/legend_fresh_fish_item"]
	],
	[],
	[
		[1 , "scripts/items/supplies/dried_fish_item"],
	]
];

gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Plains] = [
	[
		[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
	],
	[
		[1 , "scripts/items/supplies/ground_grains_item"],
	],
	[
		[2 , "scripts/items/supplies/roots_and_berries_item"]
		[2 , "scripts/items/supplies/cured_venison_item"],
		[2 , "scripts/items/supplies/dried_lamb_item"],
		[2 , "scripts/items/supplies/goat_cheese_item"],
	]
];

gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Swamp] = [
	[
		[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
	],
	[
		[1 , "scripts/items/supplies/pickled_mushrooms_item"]
	],
	[
		[2 , "scripts/items/supplies/black_marsh_stew_item"],
	]
];

gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Hills] = [
	[
		[0 , "scripts/items/supplies/legend_fresh_fruit_item"]
	],
	[],
	[
		[2 , "scripts/items/supplies/cured_venison_item"],
		[2 , "scripts/items/supplies/dried_fruits_item"],
		[2 , "scripts/items/supplies/goat_cheese_item"],
	]
];

gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Forest] = [
	[
		[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
	],
	[],
	[
		[2 , "scripts/items/supplies/cured_venison_item"],
		[2 , "scripts/items/supplies/roots_and_berries_item"]
	]
];

gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.SnowyForest] = [
	[],
	[],
	[
		[2 , "scripts/items/supplies/cured_venison_item"],
		[2, "scripts/items/supplies/legend_porridge_item"]
	]
];

gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.LeaveForest] = [
	[
		[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
	],
	[],
	[
		[2 , "scripts/items/supplies/cured_venison_item"],
		[2, "scripts/items/supplies/dried_fruits_item"],
		[2 , "scripts/items/supplies/pickled_mushrooms_item"],
		[2 , "scripts/items/supplies/roots_and_berries_item"]
	]
];

gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.AutumnForest] = [
	[
		[0 , "scripts/items/supplies/dried_fruits_item"],
		[0 , "scripts/items/supplies/legend_fresh_fruit_item"]
	],
	[],
	[
		[2 , "scripts/items/supplies/cured_venison_item"],
	]
];

gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Mountains] = [
	[
		[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
	],
	[],
	[
		[2 , "scripts/items/supplies/goat_cheese_item"],
		[2 , "scripts/items/supplies/dried_fruits_item"],
		[2 , "scripts/items/supplies/roots_and_berries_item"]
	],
];

gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Urban] = [
	[
		[0 , "scripts/items/supplies/legend_fresh_milk"]
	],
	[],
	[
		[2 , "scripts/items/supplies/cured_venison_item"],
	],
];

gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Farmland] = [
	[
		[0 , "scripts/items/supplies/legend_fresh_milk"]
	],
	[
		[1 , "scripts/items/supplies/ground_grains_item"],
	],
	[
		[2 , "scripts/items/supplies/goat_cheese_item"],
	],
];

gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Snow] = [
	[],
	[],
	[
		[2 , "scripts/items/supplies/cured_venison_item"],
		[2, "scripts/items/supplies/legend_porridge_item"]
	],
];

gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Badlands] = [
	[],
	[
		[1 , "scripts/items/supplies/ground_grains_item"]
	],
	[
		[2 , "scripts/items/supplies/cured_venison_item"],
		[2 , "scripts/items/supplies/goat_cheese_item"],
	]
];

gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Tundra] = [
	[],
	[],
	[
		[2 , "scripts/items/supplies/cured_venison_item"],
		[2, "scripts/items/supplies/legend_porridge_item"]
	]
];

gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Steppe] = [
	[],
	[
		[1 , "scripts/items/supplies/ground_grains_item"]
	],
	[
		[2 , "scripts/items/supplies/cured_venison_item"],
		[2 , "scripts/items/supplies/dried_lamb_item"],
		[2 , "scripts/items/supplies/goat_cheese_item"],
	]
];

gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Shore] = [
	[
		[0 , "scripts/items/supplies/legend_fresh_fish_item"],
	],
	[],
	[
		[2 , "scripts/items/supplies/dried_fish_item"],
		[2, "scripts/items/supplies/legend_porridge_item"]
	]
];

gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Desert] = [
	[],
	[
		[1 , "scripts/items/supplies/dates_item"],
		[1 , "scripts/items/supplies/rice_item"]
	],
	[
		[2 , "scripts/items/supplies/legend_curry_item"],
	]
];

gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Oasis] = [
	[],
	[
		[1 , "scripts/items/supplies/dates_item"],
		[1 , "scripts/items/supplies/rice_item"]
	],
	[
		[2 , "scripts/items/supplies/legend_curry_item"],
	]
];

gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.SwampGreen] = [
	[
		[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
	],
	[],
	[
		[2 , "scripts/items/supplies/black_marsh_stew_item"],
		[2 , "scripts/items/supplies/pickled_mushrooms_item"]
	]
];

gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.SwampForest] = [
	[
		[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
	],
	[],
	[
		[2 , "scripts/items/supplies/black_marsh_stew_item"],
		[2 , "scripts/items/supplies/pickled_mushrooms_item"],
		[2 , "scripts/items/supplies/roots_and_berries_item"],
		[2 , "scripts/items/supplies/pickled_mushrooms_item"]
	]
];
