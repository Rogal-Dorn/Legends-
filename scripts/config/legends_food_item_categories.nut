local gt = this.getroottable();

if (!("Hunting_Categories" in gt.Const))
{
	gt.Const.Hunting_Categories <- {};
}

// for copying
// item1 = [ , ""],

gt.Const.Hunting_Categories <- {

	// _init = true initialize and set the categories else extend the current categories
	// _upgrade = true means to add both upgraded tent and non-upgraded items
	function extendCategories (_Biome, _init, _Upgrade){
		if(_init){
			this.Const.Hunting_Categories.Containers.noLevels = ::MSU.Class.WeightedContainer( null ),
			this.Const.Hunting_Categories.Containers.chef = ::MSU.Class.WeightedContainer( null )
		}

		local noLevelFood = this.Const.Hunting_Categories.Containers.noLevels;
		local LevelUpgradeFood = this.Const.Hunting_Categories.Containers.chef;

		if(_Upgrade){
			foreach(item in _Biome){
				if(item[0] == 0){
					noLevelFood.add(item[1], 1);
				}else {
					LevelUpgradeFood.add(item[1], 1);
				}
			}
		}else if (!_Upgrade) {
			foreach(item in _Biome){
				if(item[0] == 0){
					noLevelFood.add(item[1], 1);
				}else if (item [0] == 1) {
					LevelUpgradeFood.add(item[1], 1);
				}
			}
		}
		foreach (item in this.Const.Hunting_Categories.Containers.noLevels.toArray()){
			::logInfo("NoLevel: " + item);
		}
		foreach (item in this.Const.Hunting_Categories.Containers.chef.toArray()){
			::logInfo("TentLevel: " + item);
		}
		this.Const.Hunting_Categories.Containers.chef = LevelUpgradeFood;
		this.Const.Hunting_Categories.Containers.noLevels = noLevelFood;
	}

	function addBiome(_Biome, _Upgrade){
		if(this.Const.Hunting_Categories.Containers.noLevels == null){
			extendCategories(_Biome, true, _Upgrade);
		}
		else{
			extendCategories(_Biome, false, _Upgrade);
		}
	}

	// clear the categories out for a new campsite
	function clear(){
		this.Const.Hunting_Categories.Containers.chef.clear();
		this.Const.Hunting_Categories.Containers.noLevels.clear();
	}

	// randomize the weights of the items
	function randomizeWeights()
	{

	}
}


gt.Const.Hunting_Categories.Containers <- {
	noLevels = null,
	chef = null
};


gt.Const.Hunting_Categories.Ocean <- [
	[2 , "scripts/items/supplies/dried_fish_item"],
	[0 , "scripts/items/supplies/legend_fresh_fish_item"]
];

gt.Const.Hunting_Categories.Plains <- [
	[2 , "scripts/items/supplies/cured_venison_item"],
	[2 , "scripts/items/supplies/dried_lamb_item"],
	[2 , "scripts/items/supplies/goat_cheese_item"],
	[1 , "scripts/items/supplies/ground_grains_item"],
	[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
	[2 , "scripts/items/supplies/roots_and_berries_item"]
];


gt.Const.Hunting_Categories.Swamp <- [
	[2 , "scripts/items/supplies/black_marsh_stew_item"],
	[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
	[1 , "scripts/items/supplies/pickled_mushrooms_item"]
];

gt.Const.Hunting_Categories.Hills <- [
	[2 , "scripts/items/supplies/cured_venison_item"],
	[2 , "scripts/items/supplies/dried_fruits_item"],
	[2 , "scripts/items/supplies/goat_cheese_item"],
	[0 , "scripts/items/supplies/legend_fresh_fruit_item"]
];

gt.Const.Hunting_Categories.Forest <- [
	[2 , "scripts/items/supplies/cured_venison_item"],
	[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
	[2 , "scripts/items/supplies/roots_and_berries_item"]
];

gt.Const.Hunting_Categories.SnowyForest <- [
	[2 , "scripts/items/supplies/cured_venison_item"],
	[2, "scripts/items/supplies/legend_porridge_item"]
];

gt.Const.Hunting_Categories.LeaveForest <- [
	[2 , "scripts/items/supplies/cured_venison_item"],
	[2, "scripts/items/supplies/dried_fruits_item"],
	[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
	[2 , "scripts/items/supplies/pickled_mushrooms_item"],
	[2 , "scripts/items/supplies/roots_and_berries_item"]
];

gt.Const.Hunting_Categories.AutumnForest <- [
	[2 , "scripts/items/supplies/cured_venison_item"],
	[0 , "scripts/items/supplies/dried_fruits_item"],
	[0 , "scripts/items/supplies/legend_fresh_fruit_item"]
];

gt.Const.Hunting_Categories.Mountains <- [
	[2 , "scripts/items/supplies/goat_cheese_item"],
	[2 , "scripts/items/supplies/dried_fruits_item"],
	[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
	[2 , "scripts/items/supplies/roots_and_berries_item"]
];

gt.Const.Hunting_Categories.Urban <- [
	[2 , "scripts/items/supplies/cured_venison_item"],
	[0 , "scripts/items/supplies/legend_fresh_milk"]
];

gt.Const.Hunting_Categories.Farmland <- [
	[2 , "scripts/items/supplies/goat_cheese_item"],
	[1 , "scripts/items/supplies/ground_grains_item"],
	[0 , "scripts/items/supplies/legend_fresh_milk"]
];

gt.Const.Hunting_Categories.Snow <- [
	[2 , "scripts/items/supplies/cured_venison_item"],
	[2, "scripts/items/supplies/legend_porridge_item"]
];

gt.Const.Hunting_Categories.Badlands <- [
	[2 , "scripts/items/supplies/cured_venison_item"],
	[2 , "scripts/items/supplies/goat_cheese_item"],
	[1 , "scripts/items/supplies/ground_grains_item"]
];

gt.Const.Hunting_Categories.Tundra <- [
	[2 , "scripts/items/supplies/cured_venison_item"],
	[2, "scripts/items/supplies/legend_porridge_item"]
];

gt.Const.Hunting_Categories.Steppe <- [
	[2 , "scripts/items/supplies/cured_venison_item"],
	[2 , "scripts/items/supplies/dried_lamb_item"],
	[2 , "scripts/items/supplies/goat_cheese_item"],
	[1 , "scripts/items/supplies/ground_grains_item"]
];

gt.Const.Hunting_Categories.Shore <- [
	[2 , "scripts/items/supplies/dried_fish_item"],
	[0 , "scripts/items/supplies/legend_fresh_fish_item"],
	[2, "scripts/items/supplies/legend_porridge_item"]
];

gt.Const.Hunting_Categories.Desert <- [
	[1 , "scripts/items/supplies/dates_item"],
	[2 , "scripts/items/supplies/legend_curry_item"],
	[1 , "scripts/items/supplies/rice_item"]

];

gt.Const.Hunting_Categories.Oasis <- [
	[1 , "scripts/items/supplies/dates_item"],
	[2 , "scripts/items/supplies/legend_curry_item"],
	[1 , "scripts/items/supplies/rice_item"]
];

gt.Const.Hunting_Categories.SwampGreen <- [
	[2 , "scripts/items/supplies/black_marsh_stew_item"],
	[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
	[2 , "scripts/items/supplies/pickled_mushrooms_item"]
];

gt.Const.Hunting_Categories.SwampForest <- [
	[2 , "scripts/items/supplies/black_marsh_stew_item"],
	[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
	[2 , "scripts/items/supplies/pickled_mushrooms_item"],
	[2 , "scripts/items/supplies/roots_and_berries_item"],
	[2 , "scripts/items/supplies/pickled_mushrooms_item"]
];

gt.Const.Hunting_Categories.AllBiomes <- [
	[0 ,"scripts/items/supplies/legend_fresh_meat_item"],
	[1, "scripts/items/supplies/bread_item"],
	[0, "scripts/items/supplies/strange_meat_item"]
];

gt.Const.Hunting_Categories.BiomeType <- [
	"",
	this.Const.Hunting_Categories.Ocean,
	this.Const.Hunting_Categories.Plains,
	this.Const.Hunting_Categories.Swamp,
	this.Const.Hunting_Categories.Hills,
	this.Const.Hunting_Categories.Forest,
	this.Const.Hunting_Categories.SnowyForest,
	this.Const.Hunting_Categories.LeaveForest,
	this.Const.Hunting_Categories.AutumnForest,
	this.Const.Hunting_Categories.Mountains,
	"",
	this.Const.Hunting_Categories.Farmland,
	this.Const.Hunting_Categories.Snow,
	this.Const.Hunting_Categories.Badlands,
	this.Const.Hunting_Categories.Tundra,
	this.Const.Hunting_Categories.Steppe,
	this.Const.Hunting_Categories.Shore,
	this.Const.Hunting_Categories.Desert,
	this.Const.Hunting_Categories.Oasis,
	this.Const.Hunting_Categories.SwampGreen,
	this.Const.Hunting_Categories.SwampForest,
];
