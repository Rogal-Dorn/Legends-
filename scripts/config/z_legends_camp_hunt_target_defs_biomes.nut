// Example Setup; Also serves as default for any biome we haven't covered
::Const.HuntingLoot.BiomesDefault <- [
	// Targets	
	[
		[5, ::Const.HuntingLoot.TargetDefs.Fruit],
		[3, ::Const.HuntingLoot.TargetDefs.Deer],
		[1, ::Const.HuntingLoot.TargetDefs.Direwolf],
	],
	// Brew Loot (Always the same for now until further rework)
	[
		[1, "scripts/items/supplies/beer_item"],
		[1, "scripts/items/supplies/wine_item"],
	]
]


::Const.HuntingLoot.Biomes <- array(::Const.World.TerrainType.COUNT, null);


// TODO: Update these to the final version
::Const.HuntingLoot.Biomes[::Const.World.TerrainType.SnowyForest] = [
	// Targets
	[
		[10, ::Const.HuntingLoot.TargetDefs.Berries],
		[8, ::Const.HuntingLoot.TargetDefs.Squirrel],
		[8, ::Const.HuntingLoot.TargetDefs.Rabbit],
		[5, ::Const.HuntingLoot.TargetDefs.Deer],
		[1, ::Const.HuntingLoot.TargetDefs.Direwolf],
	],
	// Brew Loot (Always the same for now until further rework)
	[
		[1, "scripts/items/supplies/beer_item"],
		[1, "scripts/items/supplies/wine_item"],
	]
]

::Const.HuntingLoot.Biomes[::Const.World.TerrainType.Tundra] = [
	// Targets
	[
		[20, ::Const.HuntingLoot.TargetDefs.Herbs],
		[10, ::Const.HuntingLoot.TargetDefs.Rabbit],
		[1, ::Const.HuntingLoot.TargetDefs.FrostUnhold],
	],
	// Brew Loot (Always the same for now until further rework)
	[
		[1, "scripts/items/supplies/beer_item"],
		[1, "scripts/items/supplies/wine_item"],
	]
]

// For reference only. These will be changed according to the design document https://docs.google.com/spreadsheets/d/1UHcwQFuL0dFtThlDFAXlAt7Lj4dNgWHKjO1palEq1to/edit?usp=sharing
// gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Ocean] = [
// 	[
// 		[1 , "scripts/items/supplies/legend_fresh_fish_item"]
// 	],
// 	[],
// 	[
// 		[1 , "scripts/items/supplies/dried_fish_item"],
// 	]
// ];

// gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Plains] = [
// 	[
// 		[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
// 	],
// 	[
// 		[1 , "scripts/items/supplies/ground_grains_item"],
// 	],
// 	[
// 		[2 , "scripts/items/supplies/roots_and_berries_item"],
// 		[2 , "scripts/items/supplies/cured_venison_item"],
// 		[2 , "scripts/items/supplies/dried_lamb_item"],
// 		[2 , "scripts/items/supplies/goat_cheese_item"],
// 	],
// ];

// gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Swamp] = [
// 	[
// 		[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
// 	],
// 	[
// 		[1 , "scripts/items/supplies/pickled_mushrooms_item"]
// 	],
// 	[
// 		[2 , "scripts/items/supplies/black_marsh_stew_item"],
// 	],
// ];

// gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Hills] = [
// 	[
// 		[0 , "scripts/items/supplies/legend_fresh_fruit_item"]
// 	],
// 	[],
// 	[
// 		[2 , "scripts/items/supplies/cured_venison_item"],
// 		[2 , "scripts/items/supplies/dried_fruits_item"],
// 		[2 , "scripts/items/supplies/goat_cheese_item"],
// 	],
// ];

// gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Forest] = [
// 	[
// 		[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
// 	],
// 	[],
// 	[
// 		[2 , "scripts/items/supplies/cured_venison_item"],
// 		[2 , "scripts/items/supplies/roots_and_berries_item"],
// 	],
// ];

// gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.SnowyForest] = [
// 	[],
// 	[],
// 	[
// 		[2 , "scripts/items/supplies/cured_venison_item"],
// 		[2, "scripts/items/supplies/legend_porridge_item"],
// 	],
// 	[
// 		[7 , "scripts/items/trade/furs_item"],
// 		[6 , "scripts/items/misc/adrenaline_gland_item"],
// 	],
// ];

// gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.LeaveForest] = [
// 	[
// 		[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
// 	],
// 	[],
// 	[
// 		[2 , "scripts/items/supplies/cured_venison_item"],
// 		[2, "scripts/items/supplies/dried_fruits_item"],
// 		[2 , "scripts/items/supplies/pickled_mushrooms_item"],
// 		[2 , "scripts/items/supplies/roots_and_berries_item"],
// 	],
// ];

// gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.AutumnForest] = [
// 	[
// 		[0 , "scripts/items/supplies/dried_fruits_item"],
// 		[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
// 	],
// 	[],
// 	[
// 		[2 , "scripts/items/supplies/cured_venison_item"],
// 	]
// ];

// gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Mountains] = [
// 	[
// 		[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
// 	],
// 	[],
// 	[
// 		[2 , "scripts/items/supplies/goat_cheese_item"],
// 		[2 , "scripts/items/supplies/dried_fruits_item"],
// 		[2 , "scripts/items/supplies/roots_and_berries_item"],
// 	],
// ];

// gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Urban] = [
// 	[
// 		[0 , "scripts/items/supplies/legend_fresh_milk"],
// 	],
// 	[],
// 	[
// 		[2 , "scripts/items/supplies/cured_venison_item"],
// 	],
// ];

// gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Farmland] = [
// 	[
// 		[0 , "scripts/items/supplies/legend_fresh_milk"],
// 	],
// 	[
// 		[1 , "scripts/items/supplies/ground_grains_item"],
// 	],
// 	[
// 		[2 , "scripts/items/supplies/goat_cheese_item"],
// 	],
// ];

// gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Snow] = [
// 	[],
// 	[],
// 	[
// 		[2 , "scripts/items/supplies/cured_venison_item"],
// 		[2, "scripts/items/supplies/legend_porridge_item"],
// 	],
// 	[
// 		[7 , "scripts/items/trade/furs_item"],
// 		[6 , "scripts/items/misc/adrenaline_gland_item"],
// 	],
// ];

// gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Badlands] = [
// 	[],
// 	[
// 		[1 , "scripts/items/supplies/ground_grains_item"],
// 	],
// 	[
// 		[2 , "scripts/items/supplies/cured_venison_item"],
// 		[2 , "scripts/items/supplies/goat_cheese_item"],
// 	],
// ];

// gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Tundra] = [
// 	[],
// 	[],
// 	[
// 		[2 , "scripts/items/supplies/cured_venison_item"],
// 		[2, "scripts/items/supplies/legend_porridge_item"],
// 	],
// ];

// gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Steppe] = [
// 	[],
// 	[
// 		[1 , "scripts/items/supplies/ground_grains_item"],
// 	],
// 	[
// 		[2 , "scripts/items/supplies/cured_venison_item"],
// 		[2 , "scripts/items/supplies/dried_lamb_item"],
// 		[2 , "scripts/items/supplies/goat_cheese_item"],
// 	],
// ];

// gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Shore] = [
// 	[
// 		[0 , "scripts/items/supplies/legend_fresh_fish_item"],
// 	],
// 	[],
// 	[
// 		[2 , "scripts/items/supplies/dried_fish_item"],
// 		[2, "scripts/items/supplies/legend_porridge_item"]
// 	],
// ];

// gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Desert] = [
// 	[],
// 	[
// 		[1 , "scripts/items/supplies/dates_item"],
// 		[1 , "scripts/items/supplies/rice_item"],
// 	],
// 	[
// 		[2 , "scripts/items/supplies/legend_curry_item"],
// 	],
// 	[
// 		[8 , "scripts/items/misc/sulfurous_rocks_item"],
// 		[7 , "scripts/items/misc/serpent_skin_item"],
// 		[6 , "scripts/items/misc/hyena_fur_item"],
// 	],
// ];

// gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.Oasis] = [
// 	[],
// 	[
// 		[1 , "scripts/items/supplies/dates_item"],
// 		[1 , "scripts/items/supplies/rice_item"],
// 	],
// 	[
// 		[2 , "scripts/items/supplies/legend_curry_item"],
// 	],
// 	[
// 		[8 , "scripts/items/misc/sulfurous_rocks_item"],
// 		[7 , "scripts/items/misc/serpent_skin_item"],
// 		[6 , "scripts/items/misc/hyena_fur_item"],
// 	],
// ];

// gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.SwampGreen] = [
// 	[
// 		[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
// 	],
// 	[],
// 	[
// 		[2 , "scripts/items/supplies/black_marsh_stew_item"],
// 		[2 , "scripts/items/supplies/pickled_mushrooms_item"],
// 	],
// ];

// gt.Const.Hunting_Categories.BiomeType[gt.Const.World.TerrainType.SwampForest] = [
// 	[
// 		[0 , "scripts/items/supplies/legend_fresh_fruit_item"],
// 	],
// 	[],
// 	[
// 		[2 , "scripts/items/supplies/black_marsh_stew_item"],
// 		[2 , "scripts/items/supplies/pickled_mushrooms_item"],
// 		[2 , "scripts/items/supplies/roots_and_berries_item"],
// 		[2 , "scripts/items/supplies/pickled_mushrooms_item"],
// 	],
// ];

