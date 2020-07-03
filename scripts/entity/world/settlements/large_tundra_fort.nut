this.large_tundra_fort <- this.inherit("scripts/entity/world/settlement", {
	m = {},
	function create()
	{
		this.settlement.create();
		this.m.Name = this.getRandomName([
			"Tonderborg",
			"Hornborg",
			"Grimborg",
			"Helleborg",
			"Kalkborg",
			"Lydersborg",
			"Homsborg",
			"Sommersborg",
			"Brammingborg",
			"Vardeborg",
			"Norreborg",
			"Birkeborg",
			"Donnersborg",
			"Tangborg",
			"Helvikborg",
			"Torvaborg",
			"Skjoldborg",
			"Eidsvikborg",
			"Halsborg",
			"Gerborg",
			"Gunnborg",
			"Asenborg",
			"Hammarborg",
			"Skagaborg",
			"Selasborg",
			"Haellborg",
			"Kampaborg",
			"Gufarsborg",
			"Husnarborg",
			"Reistarborg",
			"Geirborg"
		]);
		this.m.DraftList = [
			"legend_shieldmaiden_background",
			"apprentice_background",
			"female_beggar_background",
			"female_bowyer_background",
			"brawler_background",
			"brawler_background",
			"brawler_background",
			"gambler_background",
			"cultist_background",
			"female_daytaler_background",
			"female_farmhand_background",
			"gravedigger_background",
			"graverobber_background",
			"messenger_background",
			"militia_background",
			"militia_background",
			"militia_background",
			"peddler_background",
			"ratcatcher_background",
			"refugee_background",
			"shepherd_background",
			"shepherd_background",
			"vagabond_background",
			"wildman_background",
			"wildwoman_background",
			"wildman_background",
			"witchhunter_background",
			"bastard_background",
			"bastard_background",
			"deserter_background",
			"deserter_background",
			"female_disowned_noble_background",
			"raider_background",
			"retired_soldier_background",
			"sellsword_background",
			"sellsword_background",
			"squire_background",
			"swordmaster_background",
			"cripple_background",
			"eunuch_background",
			"hedge_knight_background",
			"hedge_knight_background"
		];
		this.m.StablesList = [
			"legend_donkey",
			"legend_horse_rouncey",
			"legend_horse_destrier"
		];
		this.m.UIDescription = "A large citadel towering high over the surrounding tundra";
		this.m.Description = "A large citadel towering high over the surrounding tundra and securing the large and open region. Many come here to resupply, make repairs and rest until venturing on.";
		this.m.UIBackgroundCenter = "ui/settlements/stronghold_03";
		this.m.UIBackgroundLeft = "ui/settlements/bg_houses_03_left";
		this.m.UIBackgroundRight = "ui/settlements/bg_houses_03_right";
		this.m.UIRampPathway = "ui/settlements/ramp_01_cobblestone";
		this.m.UISprite = "ui/settlement_sprites/stronghold_03.png";
		this.m.Sprite = "world_stronghold_03";
		this.m.Lighting = "world_stronghold_03_light";
		this.m.Rumors = this.Const.Strings.RumorsTundraSettlement;
		this.m.IsMilitary = true;
		this.m.Size = 3;
		this.m.HousesType = 3;
		this.m.HousesMin = 3;
		this.m.HousesMax = 4;
		this.m.AttachedLocationsMax = 5;
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

			[1, {
				Script = "scripts/entity/world/attached_location/fortified_outpost_location",
				Terrain = ALL,
				NearTerrain = [],
				Distance = 1,
				Road = true,
				Clear = true,
				Force = true
			}],

			[1, {
				Script = "scripts/entity/world/attached_location/ore_smelters_location",
				Terrain = ALL,
				NearTerrain = [],
				Distance = 0,
				Road = false,
				Clear = true,
				Force = true
			}],

			[1, {
				Script = "scripts/entity/world/attached_location/blast_furnace_location",
				Terrain = ALL,
				NearTerrain = [],
				Distance = 0,
				Road = false,
				Clear = true,
				Force = true
			}],

			[1, {
				Script = "scripts/entity/world/attached_location/workshop_location",
				Terrain = ALL,
				NearTerrain = [],
				Distance = 0,
				Road = false,
				Clear = true,
				Force = true
			}],

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

			// [1, {
			// 	Script = "scripts/entity/world/attached_location/herbalists_grove_location",
			// 	Terrain = ALL,
			// 	NearTerrain = [],
			// 	Distance = 1,
			// 	Road = false,
			// 	Clear = true,
			// 	Force = true
			// }],

			[1, {
				Script = "scripts/entity/world/attached_location/brewery_location",
				Terrain = ALL,
				NearTerrain = [],
				Distance = 1,
				Road = false,
				Clear = true,
				Force = true
			}],

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
			// 	Terrain = [this.Const.World.TerrainType.Hills, this.Const.World.TerrainType.Snow ],
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

			[1, {
				Script = "scripts/entity/world/attached_location/pig_farm_location",
				Terrain = ALL,
				NearTerrain = [],
				Distance = 1,
				Road = false,
				Clear = true,
				Force = true
			}],

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
			// }]


		]
		local item = this.Const.World.Common.pickItem(items)
		return this.buildAttachedLocation(1, item.Script, item.Terrain, item.NearTerrain, item.Distance, item.Road, item.Clear, item.Force)
	}


	function onBuild( _settings )
	{
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/crowd_building"), 5);
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/marketplace_building"), 2);

		if ( _settings.StackCitadels)
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
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/training_hall_building"));
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/armorsmith_building"));
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/weaponsmith_building"));
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/fletcher_building"));
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/stone_watchtower_location", ALL, [], 5, true, true, true);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/fortified_outpost_location", ALL, [], 1, true, true, true);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/fletchers_hut_location", ALL, [], 0, false, true, true);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/ore_smelters_location", ALL, [], 0, false, true, true);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/blast_furnace_location", ALL, [], 0, false, true, true);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/workshop_location", ALL, [], 0, false, true, true);

			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/pig_farm_location", ALL, [], 0, false, true, true);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/brewery_location", ALL, [], 0, false, true, true);
			return;
		}

		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/armorsmith_building"));
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/weaponsmith_building"));
		this.addBuilding(this.new("scripts/entity/world/settlements/buildings/training_hall_building"));

		if (this.Math.rand(1, 100) <= 50)
		{
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/tavern_building"));
		}
		else
		{
			this.addBuilding(this.new("scripts/entity/world/settlements/buildings/temple_building"));
		}

		if (this.Math.rand(1, 100) <= 30)
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

		if (this.Math.rand(1, 100) <= 70)
		{
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/pig_farm_location", [
				this.Const.World.TerrainType.Tundra,
				this.Const.World.TerrainType.Hills
			], [], 1);
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/brewery_location", [
				this.Const.World.TerrainType.Tundra,
				this.Const.World.TerrainType.Hills
			], [], 1);
		}
		else
		{
			this.buildAttachedLocation(this.Math.rand(0, 1), "scripts/entity/world/attached_location/pig_farm_location", [
				this.Const.World.TerrainType.Tundra,
				this.Const.World.TerrainType.Hills
			], [], 1);
			this.buildAttachedLocation(1, "scripts/entity/world/attached_location/brewery_location", [
				this.Const.World.TerrainType.Tundra,
				this.Const.World.TerrainType.Hills
			], [], 1);
		}

		this.buildAttachedLocation(1, "scripts/entity/world/attached_location/ore_smelters_location", [
			this.Const.World.TerrainType.Snow,
			this.Const.World.TerrainType.Hills,
			this.Const.World.TerrainType.Tundra
		], [
			this.Const.World.TerrainType.Hills
		]);
		this.buildAttachedLocation(1, "scripts/entity/world/attached_location/blast_furnace_location", [
			this.Const.World.TerrainType.Tundra,
			this.Const.World.TerrainType.Hills
		], [
			this.Const.World.TerrainType.Tundra
		]);
		this.buildAttachedLocation(this.Math.rand(1, 1), "scripts/entity/world/attached_location/workshop_location", [
			this.Const.World.TerrainType.Tundra,
			this.Const.World.TerrainType.Hills
		], []);
	}

});

