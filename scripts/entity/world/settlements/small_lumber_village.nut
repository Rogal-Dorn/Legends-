this.small_lumber_village <- this.inherit("scripts/entity/world/settlement", {
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
			"Eschbach",
			"Grunenbach",
			"Nesselwald",
			"Kleinholz",
			"Jungholz",
			"Eisenholz",
			"Ehrwalden",
			"Ettelwald"
		]);
		this.m.DraftList = [
			"apprentice_background",
			"bowyer_background",
			"bowyer_background",
			"butcher_background",
			"daytaler_background",
			"lumberjack_background",
			"lumberjack_background",
			"lumberjack_background",
			"poacher_background",
			"poacher_background",
			"poacher_background",
			"wildman_background",
			"wildwoman_background",
			"hunter_background",
			"hunter_background",
			"tailor_background",
			"apprentice_background",
			"female_bowyer_background",
			"female_bowyer_background",
			"female_butcher_background",
			"female_daytaler_background",
			"lumberjack_background",
			"lumberjack_background",
			"lumberjack_background",
			"poacher_background",
			"poacher_background",
			"poacher_background",
			"wildman_background",
			"hunter_background",
			"hunter_background",
			"female_tailor_background"
		];

		if (this.Const.DLC.Unhold)
		{
			this.m.DraftList.push("beast_hunter_background");
		}

		this.m.UIDescription = "A village living off of lumber and everything the forest offers";
		this.m.Description = "A village living off of lumber and everything the forest offers.";
		this.m.UIBackgroundCenter = "ui/settlements/townhall_01";
		this.m.UIBackgroundLeft = "ui/settlements/bg_houses_01_left";
		this.m.UIBackgroundRight = "ui/settlements/bg_houses_01_right";
		this.m.UIRampPathway = "ui/settlements/ramp_01_planks";
		this.m.UISprite = "ui/settlement_sprites/townhall_01.png";
		this.m.Sprite = "world_townhall_01";
		this.m.Lighting = "world_townhall_01_light";
		this.m.Rumors = this.Const.Strings.RumorsForestSettlement;
		this.m.IsMilitary = false;
		this.m.Size = 1;
		this.m.HousesType = 1;
		this.m.HousesMin = 1;
		this.m.HousesMax = 2;
		this.m.AttachedLocationsMax = 3;
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

			//  [1, {
			// 	Script = "scripts/entity/world/attached_location/fletchers_hut_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

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

            // [1, {
			// 	Script = "scripts/entity/world/attached_location/leather_tanner_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/amber_collector_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 2,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/wheat_fields_location",
			// 	Terrain = [this.Const.World.TerrainType.Plains],
			// 	NearTerrain = [],
			// 	Distance = 0,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

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

			[1, {
				Script = "scripts/entity/world/attached_location/gatherers_hut_location",
				Terrain = ALL,
				NearTerrain = [],
				Distance = 1,
				Road = false,
				Clear = true,
				Force = true
			}]

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/salt_mine_location",
			// 	Terrain = [this.Const.World.TerrainType.Swamp],
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/gem_mine_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }]
		]
		local item = this.Const.World.Common.pickItem(items)
		return this.buildAttachedLocation(1, item.Script, item.Terrain, item.NearTerrain, item.Distance, item.Road, item.Clear, item.Force)
	}

	function onBuild( _settings )
	{
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/crowd_building"), 5);
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/marketplace_building"), 2);

		if (this.Const.DLC.Unhold && (this.Const.World.Buildings.Taxidermists == 0 || this.Math.rand(1, 100) <= 33))
		{
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/taxidermist_building"));
		}
		else if (this.Math.rand(1, 100) <= 50)
		{
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/fletcher_building"));
		}

		if (this.Math.rand(1, 100) <= 50)
		{
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/hunters_cabin_location", [
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
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/gatherers_hut_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Swamp,
				this.Const.World.TerrainType.Steppe,
				this.Const.World.TerrainType.Forest,
				this.Const.World.TerrainType.AutumnForest,
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.SnowyForest,
				this.Const.World.TerrainType.LeaveForest,
				this.Const.World.TerrainType.Hills,
				this.Const.World.TerrainType.Tundra
			], []);
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
			], 0, false, true);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/gatherers_hut_location", [
				this.Const.World.TerrainType.Plains,
				this.Const.World.TerrainType.Swamp,
				this.Const.World.TerrainType.Steppe,
				this.Const.World.TerrainType.Forest,
				this.Const.World.TerrainType.AutumnForest,
				this.Const.World.TerrainType.Snow,
				this.Const.World.TerrainType.SnowyForest,
				this.Const.World.TerrainType.LeaveForest,
				this.Const.World.TerrainType.Hills,
				this.Const.World.TerrainType.Tundra
			], []);
		}

		this.buildAttachedLocation(1, "scripts/entity/world/attached_location/lumber_camp_location", [
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
	}

});

