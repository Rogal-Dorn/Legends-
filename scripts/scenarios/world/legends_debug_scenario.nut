this.legends_debug_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.legends_debug_party";
		this.m.Name = "Debug (Legends)";
		this.m.Description = "[p=c][img]gfx/ui/events/event_80.png[/img][/p][p]Debug mode for legends dev";
		this.m.Difficulty = 2;
		this.m.Order = 99;
	}

	function isValid()
	{
		return this.Const.DLC.Wildmen;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local partysize = 4
		local broLevelMax = 11

		for( local i = 0; i < partysize; i = ++i )
		{
			local broLevel = broLevelMax
			local broPerks = broLevel - 1;
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.m.HireTime = this.Time.getVirtualTimeF();
			bro.setStartValuesEx(this.Const.CharacterBackgroundsRandom);
			bro.m.Level = broLevel;
			bro.m.LevelUps = broPerks;
			bro.m.PerkPoints = broPerks;
			bro.setVeteranPerks(2);
		}

		// local horsesize = 10
		// for( local i = 0; i < horsesize; i = ++i )
		// {
		// 	local broLevel = broLevelMax
		// 	local broPerks = broLevel - 1;
		// 	local bro;
		// 	bro = roster.create("scripts/entity/tactical/player");
		// 	bro.m.HireTime = this.Time.getVirtualTimeF();
		// 	bro.setStartValuesEx(this.Const.HorseBackgrounds);
		// 	bro.m.Level = broLevel;
		// 	bro.m.LevelUps = broPerks;
		// 	bro.m.PerkPoints = broPerks;
		// 	bro.setVeteranPerks(2);
		// }



		this.World.Assets.m.Money = 50000;
		this.World.Assets.m.ArmorParts = 200;
		this.World.Assets.m.Medicine = 200;
		this.World.Assets.m.Ammo = 200;
		this.World.Assets.m.Food = 200;
		this.World.Assets.m.BusinessReputation = 1000;
		this.World.Assets.getStash().setResizable(true);
		this.World.Assets.getStash().resize(300);

		local armors = [
			["legend_gambeson", 0, 39],
			["legend_padded_surcoat", 40, 64],
			["legend_robes_smith",4,5],
			["legend_robes",1,2],
			["legend_robes_nun",6,7],
			["legend_robes_wizard",10,10],
			["legend_robes_butcher",3,3],
			["legend_sackcloth_patched",3,3],
			["legend_sackcloth_tattered",2,2],
			["legend_sackcloth",1,1],
			["legend_tunic_noble",6,6],
			["legend_tunic",1,5],
		];

		foreach(a in armors)
		{
			for( local i = a[1]; i < a[2] + 1; i = ++i )
			{
				this.logInfo("Adding " + a[0]);
				local item = this.new("scripts/items/legend_armor/cloth/" + a[0])
				item.setVariant(i);
				this.World.Assets.getStash().add(item);
			}

		}

		local chain = [
			"legend_armor_ancient_double_mail",
			"legend_armor_ancient_mail",
			"legend_armor_basic_mail",
			"legend_armor_hauberk_full",
			"legend_armor_hauberk_sleevless",
			"legend_armor_hauberk",
			"legend_armor_mail_shirt_simple",
			"legend_armor_mail_shirt",
			"legend_armor_reinforced_mail_shirt",
			"legend_armor_reinforced_mail",
			"legend_armor_reinforced_rotten_mail_shirt",
			"legend_armor_reinforced_worn_mail_shirt",
			"legend_armor_reinforced_worn_mail",
			"legend_armor_rusty_mail_shirt",
			"legend_armor_short_mail"
			// "legend_armor_leather",
			// "legend_armor_hide_and_bone",
			// "legend_armor_patched_mail",
			// "legend_armor_leather_lamellar",
			// "legend_armor_ancient_mail",
			// "legend_armor_worn_mail",
			// "legend_armor_basic_mail",
			// "legend_armor_ancient_double_layer",
			// "legend_armor_mail_shirt",
			// "legend_armor_leather_scale",
			// "legend_armor_mail_hauberk",
			// "legend_armor_decayed_reinforced",
			// "legend_armor_light_scale",
			// "legend_armor_footmans_armor",
			// "legend_armor_lamellar",
			// "legend_armor_scale",
			// "legend_armor_heraldic",
			// "legend_armor_sellswords",
			// "legend_armor_coat_of_scales",
			// "legend_armor_ikon_scale"
		];

		foreach(c in chain)
		{
			this.logInfo("Adding " + c);
			local cha = this.new("scripts/items/legend_armor/chain/" + c);
			this.World.Assets.getStash().add(cha);
		}

		local plate = [
			"legend_armor_leather_brigandine",
			"legend_armor_leather_brigandine_hardened",
			"legend_armor_leather_brigandine_hardened_full",
			"legend_armor_leather_jacket",
			"legend_armor_leather_jacket_simple",
			"legend_armor_leather_lamellar",
			"legend_armor_leather_lamellar_harness_heavy",
			"legend_armor_leather_lamellar_harness_reinforced",
			"legend_armor_leather_lamellar_heavy",
			"legend_armor_leather_lamellar_reinforced",
			"legend_armor_leather_noble",
			"legend_armor_leather_padded",
			"legend_armor_leather_riveted",
			"legend_armor_leather_riveted_light",
			"legend_armor_leather_scale",
			"legend_armor_plate_ancient_chest",
			"legend_armor_plate_ancient_harness",
			"legend_armor_plate_ancient_mail",
			"legend_armor_plate_ancient_scale",
			"legend_armor_plate_ancient_scale_coat",
			"legend_armor_plate_ancient_scale_harness",
			"legend_armor_plate_chest",
			"legend_armor_plate_chest_rotten",
			"legend_armor_plate_cuirass",
			"legend_armor_plate_full",
			"legend_armor_scale",
			"legend_armor_scale_coat",
			"legend_armor_scale_coat_rotten",
			"legend_armor_scale_shirt",
			"legend_animal_hide_armor.nut",
			"legend_armor_scale_shirt.nut",
			"legend_heavy_iron_armor.nut",
			"legend_hide_and_bone_armor.nut",
			"legend_reinforced_animal_hide_armor.nut",
			"legend_rugged_scale_armor.nut",
			"legend_scrap_metal_armor.nut",
			"legend_thick_furs_armor.nut",
			"legend_thick_plated_barbarian_armor.nut"
			// "legend_armor_leather_"
			// "legend_armor_hide_and_bone",
			// "legend_armor_lamellar",
			// "legend_armor_rugged_scale",
			// "legend_armor_heavy_iron",
			// "legend_armor_ancient_scale_harness",
			// "legend_armor_ancient_breastplate",
			// "legend_armor_ancient_plate",
			// "legend_armor_ancient_plate_harness",
			// "legend_armor_ancient_plate_scale",
			// "legend_armor_refurbished_ancient_plate",
			// "legend_armor_decayed_plates",
			// "legend_armor_heavy_lamellar",
			// "legend_armor_coat_of_plates",
			// "legend_armor_chestplate_2",
			// "legend_armor_dem_avalon_plate",
			// "legend_armor_wuxiang_plate",
			// "legend_armor_pixel_plate",
			// "legend_armor_ikon_plates",
			// "legend_armor_karl_plates",
			// "legend_armor_shkimmilk_plates"
		];

		foreach(p in plate)
		{
			this.logInfo("Adding " + p);
			local pla = this.new("scripts/items/legend_armor/plate/" + p);
			this.World.Assets.getStash().add(pla);
		}

		for( local i = 101; i < 113; i = ++i )
		{
			local item = this.new("scripts/items/legend_armor/tabard/legend_armor_company_tabard")
			item.setVariant(i);
			this.World.Assets.getStash().add(item);
		}

		for( local i = 1; i < 11; i = ++i )
		{
			local item = this.new("scripts/items/legend_armor/tabard/legend_armor_noble_tabard")
			item.setVariant(i);
			this.World.Assets.getStash().add(item);
		}

		local fixed = [
			"legend_armor_crusader",
			"legend_armor_rabble_fur",
			"legend_armor_ranger",
			"legend_armor_seer_robes",
			"legend_armor_vala_cloak",
			"legend_armor_vala_dress",
			"legend_armor_warlock_cloak",
			"legend_armor_werewolf_mail"
		];

		foreach(p in fixed)
		{
			this.logInfo("Adding " + p);
			local pla = this.new("scripts/items/legend_armor/armor/" + p);
			this.World.Assets.getStash().add(pla);
		}

		local named = [
			"legend_armor_named_warlock_cloak",
			"legend_black_leather_armor",
			"legend_blue_studded_mail_armor",
			"legend_brown_coat_of_plates_armor",
			"legend_golden_scale_armor",
			"legend_green_coat_of_plates_armor",
			"legend_heraldic_mail_armor",
			"legend_lindwurm_armor",
			"legend_named_bronze_armor",
			"legend_named_golden_lamellar_armor",
			"legend_named_noble_mail_armor",
			"legend_named_plated_fur_armor",
			"legend_named_sellswords_armor",
			"legend_named_skull_and_chain_armor"
		];

		foreach(p in named)
		{
			this.logInfo("Adding " + p);
			local pla = this.new("scripts/items/legend_armor/named/" + p);
			this.World.Assets.getStash().add(pla);
		}

	}


	function onSpawnPlayer()
	{
		local randomVillage;
		local northernmostY = 0;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = ++i )
		{
			local v = this.World.EntityManager.getSettlements()[i];

			if (v.getTile().SquareCoords.Y > northernmostY && !v.isMilitary() && !v.isIsolatedFromRoads() && v.getSize() <= 2)
			{
				northernmostY = v.getTile().SquareCoords.Y;
				randomVillage = v;
			}
		}

		randomVillage.setLastSpawnTimeToNow();
		local randomVillageTile = randomVillage.getTile();
		local navSettings = this.World.getNavigator().createSettings();
		navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost_Flat;

		do
		{
			local x = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.X - 2), this.Math.min(this.Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 2));
			local y = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.Y - 2), this.Math.min(this.Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 2));

			if (!this.World.isValidTileSquare(x, y))
			{
			}
			else
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.Type == this.Const.World.TerrainType.Ocean || tile.Type == this.Const.World.TerrainType.Shore || tile.IsOccupied)
				{
				}
				else if (tile.getDistanceTo(randomVillageTile) <= 1)
				{
				}
				else
				{
					local path = this.World.getNavigator().findPath(tile, randomVillageTile, navSettings, 0);

					if (!path.isEmpty())
					{
						randomVillageTile = tile;
						break;
					}
				}
			}
		}
		while (1);

		local attachedLocations = randomVillage.getAttachedLocations();
		local closest;
		local dist = 99999;

		foreach( a in attachedLocations )
		{
			if (a.getTile().getDistanceTo(randomVillageTile) < dist)
			{
				dist = a.getTile().getDistanceTo(randomVillageTile);
				closest = a;
			}
		}

		if (closest != null)
		{
			closest.setActive(false);
			closest.spawnFireAndSmoke();
		}

		local s = this.new("scripts/entity/world/settlements/situations/raided_situation");
		s.setValidForDays(5);
		randomVillage.addSituation(s);

		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList([
				"music/civilians_01.ogg"
			], this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.legend_random_party_scenario_intro");
		}, null);
	}
});

