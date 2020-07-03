this.small_fishing_village <- this.inherit("scripts/entity/world/settlement", {
	m = {},
	function create()
	{
		this.settlement.create();
		this.m.Name = this.getRandomName([
			"Seedorf",
			"Kielseng",
			"Meierwik",
			"Sanddorf",
			"Sandwik",
			"Holnis",
			"Holmwik",
			"Niewik",
			"Hattlund",
			"Stohl",
			"Strande",
			"Sandkamp",
			"Sandberg",
			"Birkenstrand",
			"Sundheim",
			"Seekamp",
			"Krakendorf",
			"Blankwasser",
			"Harkensee",
			"Otterndorf",
			"Seefeld",
			"Horum",
			"Krumhorn",
			"Gothmund",
			"Angeln",
			"Sandholm",
			"Jadensee",
			"Egernsande",
			"Nebelheim",
			"Sudersande",
			"Grossenkoog",
			"Aalbek",
			"Seedeich"
		]);
		this.m.DraftList = [
			"beggar_background",
			"beggar_background",
			"daytaler_background",
			"fisherman_background",
			"fisherman_background",
			"fisherman_background",
			"fisherman_background",
			"fisherman_background",
			"gravedigger_background",
			"peddler_background",
			"tailor_background",
			"vagabond_background",
			"vagabond_background",
						"female_beggar_background",
			"female_beggar_background",
			"female_daytaler_background",
			"female_butcher_background",
			"female_butcher_background",
			"fisherman_background",
			"fisherman_background",
			"fisherman_background",
			"fisherman_background",
			"fisherman_background",
			"gravedigger_background",
			"peddler_background",
			"female_tailor_background",
			"vagabond_background",
			"vagabond_background"
		];
		this.m.UIDescription = "A small fishing village made up of a few humble huts";
		this.m.Description = "A small fishing village made up of a few humble huts.";
		this.m.UIBackgroundCenter = "ui/settlements/townhall_01";
		this.m.UIBackgroundLeft = "ui/settlements/water_01";
		this.m.UIBackgroundRight = "ui/settlements/bg_houses_01_right";
		this.m.UIRampPathway = "ui/settlements/ramp_01_planks";
		this.m.UISprite = "ui/settlement_sprites/townhall_01.png";
		this.m.Sprite = "world_townhall_01";
		this.m.Lighting = "world_townhall_01_light";
		this.m.Rumors = this.Const.Strings.RumorsFishingSettlement;
		this.m.IsMilitary = false;
		this.m.Size = 1;
		this.m.HousesType = 1;
		this.m.HousesMin = 1;
		this.m.HousesMax = 2;
		this.m.AttachedLocationsMax = 3 + 1;
		this.m.ProduceString = "fish";
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

			[1, {
				Script = "scripts/entity/world/attached_location/harbor_location",
				Terrain = [this.Const.World.TerrainType.Shore],
				NearTerrain = [this.Const.World.TerrainType.Shore, this.Const.World.TerrainType.Ocean],
				Distance = 1,
				Road = false,
				Clear = false,
				Force = true
			}],

			[1, {
				Script = "scripts/entity/world/attached_location/fishing_huts_location",
				Terrain = ALL,
				NearTerrain = [this.Const.World.TerrainType.Shore],
				Distance = 1,
				Road = false,
				Clear = true,
				Force = true
			}],

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/hunters_cabin_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

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

            // [1, {
			// 	Script = "scripts/entity/world/attached_location/leather_tanner_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

			[1, {
				Script = "scripts/entity/world/attached_location/amber_collector_location",
				Terrain = ALL,
				NearTerrain = [],
				Distance = 2,
				Road = false,
				Clear = true,
				Force = true
			}],

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
			}]

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
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/port_building"), 3);

		if (this.Math.rand(1, 100) <= 20)
		{
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/temple_building"));
		}

		this.buildAttachedLocation(1, "scripts/entity/world/attached_location/harbor_location", [
			this.Const.World.TerrainType.Shore
		], [
			this.Const.World.TerrainType.Ocean,
			this.Const.World.TerrainType.Shore
		], -1, false, false);
		this.buildAttachedLocation(1, "scripts/entity/world/attached_location/fishing_huts_location", [
			this.Const.World.TerrainType.Plains,
			this.Const.World.TerrainType.Steppe,
			this.Const.World.TerrainType.Snow,
			this.Const.World.TerrainType.Tundra
		], [
			this.Const.World.TerrainType.Shore
		]);
		this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/amber_collector_location", [
			this.Const.World.TerrainType.Plains,
			this.Const.World.TerrainType.Steppe,
			this.Const.World.TerrainType.Snow,
			this.Const.World.TerrainType.Tundra
		], [
			this.Const.World.TerrainType.Shore
		], 1);
		this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/herbalists_grove_location", [
			this.Const.World.TerrainType.Plains,
			this.Const.World.TerrainType.Swamp,
			this.Const.World.TerrainType.Forest,
			this.Const.World.TerrainType.AutumnForest,
			this.Const.World.TerrainType.LeaveForest,
			this.Const.World.TerrainType.Hills,
			this.Const.World.TerrainType.Tundra
		], []);
	}

});

