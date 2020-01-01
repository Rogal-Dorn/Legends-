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
		return true;
		return this.Const.DLC.Wildmen;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local partysize = 12
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

		this.World.Assets.getStash().add(this.new("scripts/items/weapons/heavy_crossbow"));

		local armors = [
			["legend_gambeson", 0, 39],
			["legend_padded_surcoat", 40, 64],
			["legend_apron",1,10],
			["legend_robes",1,2],
			["legend_robes",11,18],
			["legend_robes_nun",6,7],
			["legend_robes_wizard",3,3],
			["legend_sackcloth_patched",3,3],
			["legend_sackcloth_patched",19,25],
			["legend_sackcloth_tattered",2,2],
			["legend_sackcloth_tattered",13,18],
			["legend_sackcloth",1,1],
			["legend_sackcloth",4,12],
			["legend_tunic_noble",6,6],
			["legend_tunic",1,28],
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
			"legend_animal_hide_armor",
			"legend_armor_scale_shirt",
			"legend_heavy_iron_armor",
			"legend_hide_and_bone_armor",
			"legend_reinforced_animal_hide_armor",
			"legend_rugged_scale_armor",
			"legend_scrap_metal_armor",
			"legend_thick_furs_armor",
			"legend_thick_plated_barbarian_armor"
		];

		foreach(p in plate)
		{
			this.logInfo("Adding " + p);
			local pla = this.new("scripts/items/legend_armor/plate/" + p);
			this.World.Assets.getStash().add(pla);
		}

		for( local i = 101; i < 113; i = ++i )
		{
			local item = this.new("scripts/items/legend_armor/tabard/legend_armor_tabard")
			item.setVariant(i);
			this.World.Assets.getStash().add(item);
		}

		for( local i = 1; i < 11; i = ++i )
		{
			local item = this.new("scripts/items/legend_armor/tabard/legend_armor_noble_tabard")
			item.setVariant(i);
			this.World.Assets.getStash().add(item);
		}

		local cloakV = [
			["legend_armor_cloak", 1, 7],
			["legend_armor_cloak_rich",1, 5]
		];

		foreach(a in cloakV)
		{
			for( local i = a[1]; i < a[2] + 1; i = ++i )
			{
				this.logInfo("Adding " + a[0]);
				local item = this.new("scripts/items/legend_armor/cloak/" + a[0])
				item.setVariant(i);
				this.World.Assets.getStash().add(item);
			}
		}

		local cloaks = [
			"legend_armor_hexe_leader_cloak_upgrade",
			"legend_armor_redback_cloak_upgrade"
		];

		foreach(p in cloaks)
		{
			this.logInfo("Adding " + p);
			local pla = this.new("scripts/items/legend_armor/cloak/" + p);
			this.World.Assets.getStash().add(pla);
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

		local legendary = [
			"legend_armor_mountain",
			"legend_armor_of_davkul",
			"legend_armor_skin",
			"legend_emperors_armor",
			"legend_emperors_armor_fake",
			"legend_ijirok_armor"
		];

		foreach(p in legendary)
		{
			this.logInfo("Adding " + p);
			local pla = this.new("scripts/items/legend_armor/legendary/" + p);
			this.World.Assets.getStash().add(pla);
		}

		local upgrades = [
			"legend_additional_padding_upgrade",
			"legend_armor_stollwurm_scales_upgrade",
			"legend_armor_white_wolf_pelt_upgrade",
			"legend_barbarian_horn_upgrade",
			"legend_bone_platings_upgrade",
			"legend_direwolf_pelt_upgrade",
			"legend_double_mail_upgrade",
			"legend_heraldic_plates_upgrade",
			"legend_horn_plate_upgrade",
			"legend_joint_cover_upgrade",
			"legend_leather_neckguard_upgrade",
			"legend_leather_shoulderguards_upgrade",
			"legend_light_padding_replacement_upgrade",
			"legend_lindwurm_scales_upgrade",
			"legend_mail_patch_upgrade",
			"legend_metal_pauldrons_upgrade",
			"legend_metal_plating_upgrade",
			"legend_unhold_fur_upgrade"
		];

		foreach(p in upgrades)
		{
			this.logInfo("Adding " + p);
			local pla = this.new("scripts/items/legend_armor/armor_upgrades/" + p);
			this.World.Assets.getStash().add(pla);
		}

		local runes = [
			"legend_rune_safety",
			"legend_rune_endurance",
			"legend_rune_resilience"
		];

		foreach(p in runes)
		{
			this.logInfo("Adding " + p);
			local pla = this.new("scripts/items/legend_armor/runes/" + p);
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

	function onBuildPerkTree( _tree)
	{
		if  (_tree == null)
		{
			return;
		}

		_tree.addPerk(this.Const.Perks.PerkDefs.LegendPiercingShot);
	}
});

