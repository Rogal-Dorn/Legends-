this.medium_lumber_village <- this.inherit("scripts/entity/world/settlement", {
	m = {},
	function create()
	{
		this.settlement.create();
		this.m.Name = this.getRandomName([
			"Westerholz",
			"Langholz",
			"Grossholz",
			"Tanndorf",
			"Waldhain",
			"Elkshorn",
			"Dunkeltal",
			"Eichholz",
			"Eulenkrug",
			"Nordholz",
			"Finsterwalde",
			"Damwald",
			"Tannheim",
			"Filzmoos",
			"Dunkelwald",
			"Hagermoos",
			"Neufarn",
			"Taubenmoos",
			"Waidhof",
			"Waidtal",
			"Eichendorf",
			"Holzschlag",
			"Hirschbach",
			"Friedewald",
			"Talbach",
			"Finsterweiler",
			"Tannenweiler",
			"Weilersheim",
			"Grunforst",
			"Tiefenforst",
			"Schwarzforst"
		]);
		this.m.DraftList = [
			"beggar_background",
			"bowyer_background",
			"bowyer_background",
			"brawler_background",
			"butcher_background",
			"daytaler_background",
			"historian_background",
			"hunter_background",
			"hunter_background",
			"killer_on_the_run_background",
			"lumberjack_background",
			"lumberjack_background",
			"lumberjack_background",
			"militia_background",
			"flagellant_background",
			"poacher_background",
			"poacher_background",
			"tailor_background",
			"vagabond_background",
			"wildwoman_background",
			"wildman_background",
			"witchhunter_background",
			"cripple_background",
			"eunuch_background",
				"female_beggar_background",
			"female_bowyer_background",
			"female_bowyer_background",
			"brawler_background",
			"butcher_background",
			"female_daytaler_background",
			"historian_background",
			"hunter_background",
			"hunter_background",
			"killer_on_the_run_background",
			"lumberjack_background",
			"lumberjack_background",
			"lumberjack_background",
			"militia_background",
			"flagellant_background",
			"poacher_background",
			"poacher_background",
			"female_tailor_background",
			"vagabond_background",
			"wildman_background",
			"wildman_background",
			"witchhunter_background",
			"cripple_background",
			"eunuch_background"
		];
		this.m.StablesList = [
			"legend_donkey",
			"legend_horse_rouncey"
		];
		if (this.Const.DLC.Unhold)
		{
			this.m.DraftList.push("beast_hunter_background");
		}

		this.m.UIDescription = "A developed village thriving on lumber and game";
		this.m.Description = "An established village close to the forest living mainly from lumber cutting and game.";
		this.m.UIBackgroundCenter = "ui/settlements/townhall_02";
		this.m.UIBackgroundLeft = "ui/settlements/bg_houses_02_left";
		this.m.UIBackgroundRight = "ui/settlements/bg_houses_02_right";
		this.m.UIRampPathway = "ui/settlements/ramp_01_planks";
		this.m.UISprite = "ui/settlement_sprites/townhall_02.png";
		this.m.Sprite = "world_townhall_02";
		this.m.Lighting = "world_townhall_02_light";
		this.m.Rumors = this.Const.Strings.RumorsForestSettlement;
		this.m.IsMilitary = false;
		this.m.Size = 2;
		this.m.HousesType = 2;
		this.m.HousesMin = 2;
		this.m.HousesMax = 3;
		this.m.AttachedLocationsMax = 4;
		this.m.ProduceString = "wood";
	}

	function buildNewLocation()
	{
		local ALL = [
			this.Const.World.TerrainType.Plains,
			this.Const.World.TerrainType.Steppe,
			this.Const.World.TerrainType.Snow,
			this.Const.World.TerrainType.Hills,
			this.Const.World.TerrainType.Tundra,
			this.Const.World.TerrainType.Forest,
			this.Const.World.TerrainType.SnowyForest,
			this.Const.World.TerrainType.AutumnForest,
			this.Const.World.TerrainType.LeaveForest
		];
		local items = [
			// [1, {
			// 	Script = "scripts/entity/world/attached_location/stone_watchtower_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 5,
			// 	Road = true,
			// 	Clear = true,
			// 	Force = true
			// }],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/fortified_outpost_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = true,
			// 	Clear = true,
			// 	Force = true
			// }],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/militia_trainingcamp_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = true,
			// 	Clear = true,
			// 	Force = true
			// }],

			[1, {
				Script = "scripts/entity/world/attached_location/wooden_watchtower_location",
				Terrain = ALL,
				NearTerrain = [],
				Distance = 4,
				Road = true,
				Clear = true,
				Force = true
			}],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/ore_smelters_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 0,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/blast_furnace_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 0,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/workshop_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 0,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

			 [1, {
				Script = "scripts/entity/world/attached_location/fletchers_hut_location",
				Terrain = ALL,
				NearTerrain = [],
				Distance = 1,
				Road = false,
				Clear = true,
				Force = true
			}],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/harbor_location",
			// 	Terrain = [this.Const.World.TerrainType.Shore],
			// 	NearTerrain = [this.Const.World.TerrainType.Shore, this.Const.World.TerrainType.Ocean],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = false,
			// 	Force = true
			// }],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/fishing_huts_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [this.Const.World.TerrainType.Shore],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

			[1, {
				Script = "scripts/entity/world/attached_location/hunters_cabin_location",
				Terrain = ALL,
				NearTerrain = [],
				Distance = 1,
				Road = false,
				Clear = true,
				Force = true
			}],

			[1, {
				Script = "scripts/entity/world/attached_location/lumber_camp_location",
				Terrain = ALL,
				NearTerrain = [],
				Distance = 1,
				Road = false,
				Clear = true,
				Force = true
			}],

            // [1, {
			// 	Script = "scripts/entity/world/attached_location/trapper_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

            [1, {
				Script = "scripts/entity/world/attached_location/leather_tanner_location",
				Terrain = ALL,
				NearTerrain = [],
				Distance = 1,
				Road = false,
				Clear = true,
				Force = true
			}],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/amber_collector_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 2,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

			[1, {
				Script = "scripts/entity/world/attached_location/wheat_fields_location",
				Terrain = [this.Const.World.TerrainType.Plains],
				NearTerrain = [],
				Distance = 0,
				Road = false,
				Clear = true,
				Force = true
			}],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/orchard_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

			[1, {
				Script = "scripts/entity/world/attached_location/herbalists_grove_location",
				Terrain = ALL,
				NearTerrain = [],
				Distance = 1,
				Road = false,
				Clear = true,
				Force = true
			}],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/brewery_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/goat_herd_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

            // [1, {
			// 	Script = "scripts/entity/world/attached_location/surface_copper_vein_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

            // [1, {
			// 	Script = "scripts/entity/world/attached_location/surface_iron_vein_location",
			// 	Terrain = ALL
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/wool_spinner_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }]

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/winery_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [this.Const.World.TerrainType.Hills],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/dye_maker_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [this.Const.World.TerrainType.Hills],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/pig_farm_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/peat_pit_location",
			// 	Terrain = [this.Const.World.TerrainType.Swamp],
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/mushroom_grove_location",
			// 	Terrain = [this.Const.World.TerrainType.Swamp],
			// 	NearTerrain = [],
			// 	Distance = 2,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/gatherers_hut_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

		]
		local item = this.Const.World.Common.pickItem(items)
		return this.buildAttachedLocation(1, item.Script, item.Terrain, item.NearTerrain, item.Distance, item.Road, item.Clear, item.Force)
	}

	function onBuild( _settings )
	{
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/crowd_building"), 5);
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/marketplace_building"), 2);
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/tavern_building"));

		if (this.Const.DLC.Unhold)
		{
			local r = this.Math.rand(1, 4);

			if (r == 1 || this.Const.World.Buildings.Taxidermists == 0)
			{
				this.addBuilding(this.new("scripts/entity/world/settlements/buildings/taxidermist_building"));
			}
			else if (r == 2 || this.Const.World.Buildings.Fletchers == 0)
			{
				this.addBuilding(this.new("scripts/entity/world/settlements/buildings/fletcher_building"));
			}
			else if (r == 3 || this.Const.World.Buildings.Barbers == 0)
			{
				this.addBuilding(this.new("scripts/entity/world/settlements/buildings/barber_building"));
			}
			else if (r == 4)
			{
				this.addBuilding(this.new("scripts/entity/world/settlements/buildings/temple_building"));
			}
		}
		else
		{
			local r = this.Math.rand(1, 3);

			if (r == 1 || this.Const.World.Buildings.Fletchers == 0)
			{
				this.addBuilding(this.new("scripts/entity/world/settlements/buildings/fletcher_building"));
			}
			else if (r == 2 || this.Const.World.Buildings.Barbers == 0)
			{
				this.addBuilding(this.new("scripts/entity/world/settlements/buildings/barber_building"));
			}
			else if (r == 3)
			{
				this.addBuilding(this.new("scripts/entity/world/settlements/buildings/temple_building"));
			}
		}

		if (this.Math.rand(1, 100) <= 50)
		{
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/fletchers_hut_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Forest,
				this.Const.World.TerrainType.AutumnForest,
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.SnowyForest,
				this.Const.World.TerrainType.LeaveForest,
				this.Const.World.TerrainType.Hills,
				this.Const.World.TerrainType.Tundra
			], [], 1, false, true);
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/leather_tanner_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Hills
			], [], 1);
		}
		else
		{
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/fletchers_hut_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Forest,
				this.Const.World.TerrainType.AutumnForest,
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.SnowyForest,
				this.Const.World.TerrainType.LeaveForest,
				this.Const.World.TerrainType.Hills,
				this.Const.World.TerrainType.Tundra
			], [], 1, false, true);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/leather_tanner_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Hills
			], [], 1);
		}

		if (this.Math.rand(1, 100) <= 50)
		{
			this.buildAttachedLocation(this.Math.rand(1, 2), "scripts/entity/world/attached_location/hunters_cabin_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Steppe,
				this.Const.World.TerrainType.Forest,
				this.Const.World.TerrainType.SnowyForest,
				this.Const.World.TerrainType.AutumnForest,
				this.Const.World.TerrainType.LeaveForest,
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills,
				this.Const.World.TerrainType.Tundra
			], [
				this.Const.World.TerrainType.Forest,
				this.Const.World.TerrainType.SnowyForest,
				this.Const.World.TerrainType.AutumnForest,
				this.Const.World.TerrainType.LeaveForest
			], 2, false, true);
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/lumber_camp_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Steppe,
				this.Const.World.TerrainType.Forest,
				this.Const.World.TerrainType.SnowyForest,
				this.Const.World.TerrainType.AutumnForest,
				this.Const.World.TerrainType.LeaveForest,
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills,
				this.Const.World.TerrainType.Tundra
			], [
				this.Const.World.TerrainType.Forest,
				this.Const.World.TerrainType.SnowyForest,
				this.Const.World.TerrainType.AutumnForest,
				this.Const.World.TerrainType.LeaveForest
			], 1, false, true);
		}
		else
		{
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/hunters_cabin_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Steppe,
				this.Const.World.TerrainType.Forest,
				this.Const.World.TerrainType.SnowyForest,
				this.Const.World.TerrainType.AutumnForest,
				this.Const.World.TerrainType.LeaveForest,
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills,
				this.Const.World.TerrainType.Tundra
			], [
				this.Const.World.TerrainType.Forest,
				this.Const.World.TerrainType.SnowyForest,
				this.Const.World.TerrainType.AutumnForest,
				this.Const.World.TerrainType.LeaveForest
			], 2, false, true);
			this.buildAttachedLocation(this.Math.rand(1, 2), "scripts/entity/world/attached_location/lumber_camp_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Steppe,
				this.Const.World.TerrainType.Forest,
				this.Const.World.TerrainType.SnowyForest,
				this.Const.World.TerrainType.AutumnForest,
				this.Const.World.TerrainType.LeaveForest,
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills,
				this.Const.World.TerrainType.Tundra
			], [
				this.Const.World.TerrainType.Forest,
				this.Const.World.TerrainType.SnowyForest,
				this.Const.World.TerrainType.AutumnForest,
				this.Const.World.TerrainType.LeaveForest
			], 1, false, true);
		}

		this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/herbalists_grove_location", [
			this.Const.World.TerrainType.Plains,
			this.Const.World.TerrainType.Swamp,
			this.Const.World.TerrainType.Steppe,
			this.Const.World.TerrainType.Forest,
			this.Const.World.TerrainType.AutumnForest,
			this.Const.World.TerrainType.LeaveForest,
			this.Const.World.TerrainType.Hills,
			this.Const.World.TerrainType.Tundra
		], [], 2);
		this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/wooden_watchtower_location", [
			this.Const.World.TerrainType.Plains,
			this.Const.World.TerrainType.Steppe,
			this.Const.World.TerrainType.Snow,
			this.Const.World.TerrainType.Hills,
			this.Const.World.TerrainType.Tundra
		], [], 3, true);
		this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/wheat_fields_location", [
			this.Const.World.TerrainType.Plains
		], [], 1);
	}

});

