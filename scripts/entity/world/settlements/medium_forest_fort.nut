this.medium_forest_fort <- this.inherit("scripts/entity/world/settlement", {
	m = {},
	function create()
	{
		this.settlement.create();
		this.m.Name = this.getRandomName([
			"Holzburg",
			"Tannburg",
			"Waldburg",
			"Hainburg",
			"Dunkelburg",
			"Finsterburg",
			"Eichburg",
			"Waidburg",
			"Fahrnburg",
			"Moosburg",
			"Forstburg",
			"Eulenburg",
			"Fuchsburg",
			"Dusterburg",
			"Dornburg",
			"Grunburg",
			"Buchenburg",
			"Haselburg",
			"Breitenburg",
			"Nesselburg",
			"Wurzelburg",
			"Bieberburg",
			"Katzenburg",
			"Wolfsburg",
			"Natternburg",
			"Findelsburg"
		]);
		this.m.DraftList = [
			"legend_shieldmaiden_background",
			"apprentice_background",
			"houndmaster_background",
			"female_bowyer_background",
			"female_bowyer_background",
			"brawler_background",
			"female_butcher_background",
			"daytaler_background",
			"gravedigger_background",
			"hunter_background",
			"lumberjack_background",
			"lumberjack_background",
			"messenger_background",
			"militia_background",
			"militia_background",
			"wildman_background",
			"wildwoman_background",
			"witchhunter_background",
			"bastard_background",
			"deserter_background",
			"female_disowned_noble_background",
			"female_disowned_noble_background",
			"retired_soldier_background",
			"squire_background"
		];
		this.m.StablesList = [
			"legend_donkey",
			"legend_horse_rouncey"
		];

		if (this.Const.DLC.Unhold)
		{
			this.m.DraftList.push("beast_hunter_background");
		}

		this.m.UIDescription = "A mighty stone keep surrounded by woods.";
		this.m.Description = "This mighty stone keep surrounded by forest acts as a base of operations in the area.";
		this.m.UIBackgroundCenter = "ui/settlements/stronghold_02";
		this.m.UIBackgroundLeft = "ui/settlements/bg_houses_02_left";
		this.m.UIBackgroundRight = "ui/settlements/bg_houses_02_right";
		this.m.UIRampPathway = "ui/settlements/ramp_01_planks";
		this.m.UISprite = "ui/settlement_sprites/stronghold_02.png";
		this.m.Sprite = "world_stronghold_02";
		this.m.Lighting = "world_stronghold_02_light";
		this.m.Rumors = this.Const.Strings.RumorsForestSettlement;
		this.m.IsMilitary = true;
		this.m.Size = 2;
		this.m.HousesType = 2;
		this.m.HousesMin = 2;
		this.m.HousesMax = 3;
		this.m.AttachedLocationsMax = 4;
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
			[1, {
				Script = "scripts/entity/world/attached_location/stone_watchtower_location",
				Terrain = ALL,
				NearTerrain = [],
				Distance = 5,
				Road = true,
				Clear = true,
				Force = true
			}],

			[1, {
				Script = "scripts/entity/world/attached_location/fortified_outpost_location",
				Terrain = ALL,
				NearTerrain = [],
				Distance = 1,
				Road = true,
				Clear = true,
				Force = true
			}],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/militia_trainingcamp_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = true,
			// 	Clear = true,
			// 	Force = true
			// }],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/wooden_watchtower_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 4,
			// 	Road = true,
			// 	Clear = true,
			// 	Force = true
			// }],

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

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/lumber_camp_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

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

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/herbalists_grove_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

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
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/fletcher_building"));

		if (this.Math.rand(1, 100) <= 50)
		{
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/armorsmith_building"));
		}
		else
		{
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/weaponsmith_building"));
		}

		if (this.Const.World.Buildings.Kennels == 0)
		{
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/kennel_building"));
		}
		else if (this.Const.World.Buildings.Stables == 0)
		{
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/stables_building"));
		}
		else
		{
			local r = this.Math.rand(1, 4);

			if (r == 1)
			{
				this.addBuilding(this.new("scripts/entity/world/settlements/buildings/tavern_building"));
			}
			else if (r == 2)
			{
				this.addBuilding(this.new("scripts/entity/world/settlements/buildings/temple_building"));
			}
			else if (r == 3)
			{
				this.addBuilding(this.new("scripts/entity/world/settlements/buildings/kennel_building"));
			}
			else if (r == 4)
			{
				this.addBuilding(this.new("scripts/entity/world/settlements/buildings/stables_building"));
			}
		}

		if (this.Math.rand(1, 100) <= 70)
		{
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/stone_watchtower_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Steppe,
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills,
				this.Const.World.TerrainType.Tundra
			], [], 4, true);
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/fortified_outpost_location", [
				this.Const.World.TerrainType.Tundra,
				this.Const.World.TerrainType.Hills
			], [], 2, true);
		}
		else
		{
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/stone_watchtower_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Steppe,
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.Hills,
				this.Const.World.TerrainType.Tundra
			], [], 4, true);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/fortified_outpost_location", [
				this.Const.World.TerrainType.Tundra,
				this.Const.World.TerrainType.Hills
			], [], 2, true);
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
		], 0, false, true);
		this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/wheat_fields_location", [
			this.Const.World.TerrainType.Plains
		], [], 1);
	}

});

