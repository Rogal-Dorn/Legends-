this.legends_debug_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.legends_debug_party";
		this.m.Name = "(Developer Debug)";
		this.m.Description = "[p=c][img]gfx/ui/events/event_80.png[/img][/p]Debug mode for legends developers";
		this.m.Difficulty = 2;
		this.m.Order = 99;
	}

	function isValid()
	{
		return this.Const.LegendMod.DebugMode;
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

		 local horsesize = 0
		 for( local i = 0; i < horsesize; i = ++i )
		 {
		 	local broLevel = broLevelMax
		 	local broPerks = broLevel - 1;
		 	local bro;
		 	bro = roster.create("scripts/entity/tactical/player");
		 	bro.m.HireTime = this.Time.getVirtualTimeF();
		 	bro.setStartValuesEx(this.Const.HorseBackgrounds);
		 	bro.m.Level = broLevel;
		 	bro.m.LevelUps = broPerks;
		 	bro.m.PerkPoints = broPerks;
		 	bro.setVeteranPerks(2);
		 }

		foreach( bro in bros )
		{
			local val = this.World.State.addNewID(bro);
			bro.m.CompanyID = val;
		}

		this.World.Assets.m.Money = 50000;
		this.World.Assets.m.ArmorParts = 200;
		this.World.Assets.m.Medicine = 200;
		this.World.Assets.m.Ammo = 200;
		this.World.Assets.m.Food = 200;
		this.World.Assets.m.BusinessReputation = 1000;
		this.World.Assets.getStash().setResizable(true);
		this.World.Assets.getStash().resize(600);

		local banner = this.new("scripts/items/tools/player_banner");
		banner.setVariant(2);
		this.World.Assets.getStash().add(banner);
		local rune =  this.new("scripts/items/rune_sigils/legend_vala_inscription_token");
		rune.setRuneVariant(5);
		rune.updateRuneSigilToken();
		this.World.Assets.getStash().add(rune);

		local stashitems = [
			"accessory/bandage_item",
			"supplies/roots_and_berries_item",
			"supplies/legend_fresh_fruit_item",
			"supplies/legend_cooking_spices_item",
			"supplies/ground_grains_item",
		]

		foreach (si in stashitems)
		{
			local pla = this.new("scripts/items/" + si);
			this.World.Assets.getStash().add(pla);
		}

		local armors = [
			"cloth/legend_tunic_noble",
			"cloth/legend_tunic",
			"cloth/legend_thick_tunic",
			"cloth/legend_sackcloth_tattered",
			"cloth/legend_sackcloth_patched",
			"cloth/legend_sackcloth",
			"cloth/legend_robes_wizard",
			"cloth/legend_robes_nun",
			"cloth/legend_robes_herbalist",
			"cloth/legend_robes",
			"cloth/legend_padded_surcoat",
			"cloth/legend_gambeson_wolf",
			"cloth/legend_gambeson_rare_color",
			"cloth/legend_gambeson_plain",
			"cloth/legend_gambeson_named",
			"cloth/legend_gambeson_common_color",
			"cloth/legend_gambeson",
			"cloth/legend_dark_tunic",
			"cloth/legend_apron_taxidermist",
			"cloth/legend_apron_smith",
			"cloth/legend_apron_butcher",
			"cloth/legend_apron",
			"cloth/legend_ancient_cloth_restored",
			"cloth/legend_ancient_cloth"

			"chain/legend_armor_ancient_double_mail",
			"chain/legend_armor_ancient_mail",
			"chain/legend_armor_basic_mail",
			"chain/legend_armor_hauberk",
			"chain/legend_armor_hauberk_full",
			"chain/legend_armor_hauberk_full_named",
			"chain/legend_armor_hauberk_sleevless",
			"chain/legend_armor_mail_shirt",
			"chain/legend_armor_mail_shirt_simple",
			"chain/legend_armor_reinforced_mail",
			"chain/legend_armor_reinforced_mail_shirt",
			"chain/legend_armor_reinforced_rotten_mail_shirt",
			"chain/legend_armor_reinforced_worn_mail",
			"chain/legend_armor_reinforced_worn_mail_shirt",
			"chain/legend_armor_rusty_mail_shirt",
			"chain/legend_armor_short_mail",

			"plate/legend_animal_hide_armor",
			"plate/legend_armor_leather_brigandine",
			"plate/legend_armor_leather_brigandine_hardened",
			"plate/legend_armor_leather_brigandine_hardened_full",
			"plate/legend_armor_leather_brigandine_named",
			"plate/legend_armor_leather_jacket",
			"plate/legend_armor_leather_jacket_named",
			"plate/legend_armor_leather_jacket_simple",
			"plate/legend_armor_leather_lamellar",
			"plate/legend_armor_leather_lamellar_harness_heavy",
			"plate/legend_armor_leather_lamellar_harness_reinforced",
			"plate/legend_armor_leather_lamellar_heavy",
			"plate/legend_armor_leather_lamellar_heavy_named",
			"plate/legend_armor_leather_lamellar_reinforced",
			"plate/legend_armor_leather_noble",
			"plate/legend_armor_leather_padded",
			"plate/legend_armor_leather_riveted",
			"plate/legend_armor_leather_riveted_light",
			"plate/legend_armor_leather_scale",
			"plate/legend_armor_plate_ancient_chest",
			"plate/legend_armor_plate_ancient_chest_restored",
			"plate/legend_armor_plate_ancient_gladiator",
			"plate/legend_armor_plate_ancient_harness",
			"plate/legend_armor_plate_ancient_mail",
			"plate/legend_armor_plate_ancient_scale",
			"plate/legend_armor_plate_ancient_scale_coat",
			"plate/legend_armor_plate_ancient_scale_harness",
			"plate/legend_armor_plate_chest",
			"plate/legend_armor_plate_chest_rotten",
			"plate/legend_armor_plate_cuirass",
			"plate/legend_armor_plate_full",
			"plate/legend_armor_plate_full_greaves",
			"plate/legend_armor_plate_full_greaves_painted",
			"plate/legend_armor_scale",
			"plate/legend_armor_scale_coat",
			"plate/legend_armor_scale_coat_named",
			"plate/legend_armor_scale_coat_rotten",
			"plate/legend_armor_scale_shirt",
			"plate/legend_heavy_iron_armor",
			"plate/legend_hide_and_bone_armor",
			"plate/legend_reinforced_animal_hide_armor",
			"plate/legend_rugged_scale_armor",
			"plate/legend_scrap_metal_armor",
			"plate/legend_thick_furs_armor",
			"plate/legend_thick_plated_barbarian_armor",

			"tabard/legend_armor_named_tabard",
			"tabard/legend_armor_noble_tabard",
			"tabard/legend_armor_tabard",

			"cloak/legend_armor_cloak_common",
			"cloak/legend_armor_cloak_heavy",
			"cloak/legend_armor_cloak_noble",
			"cloak/legend_armor_cloak_rich",
			"cloak/legend_armor_hexe_leader_cloak_upgrade",
			"cloak/legend_armor_redback_cloak_upgrade",
			"cloak/legend_armor_sash",

			"armor_upgrades/legend_additional_padding_upgrade",
			"armor_upgrades/legend_armor_stollwurm_scales_upgrade",
			"armor_upgrades/legend_armor_white_wolf_pelt_upgrade",
			"armor_upgrades/legend_barbarian_horn_upgrade",
			"armor_upgrades/legend_bone_platings_upgrade",
			"armor_upgrades/legend_direwolf_pelt_upgrade",
			"armor_upgrades/legend_double_mail_upgrade",
			"armor_upgrades/legend_heraldic_plates_upgrade",
			"armor_upgrades/legend_horn_plate_upgrade",
			"armor_upgrades/legend_joint_cover_upgrade",
			"armor_upgrades/legend_leather_neckguard_upgrade",
			"armor_upgrades/legend_leather_shoulderguards_upgrade",
			"armor_upgrades/legend_light_padding_replacement_upgrade",
			"armor_upgrades/legend_lindwurm_scales_upgrade",
			"armor_upgrades/legend_mail_patch_upgrade",
			"armor_upgrades/legend_metal_pauldrons_upgrade",
			"armor_upgrades/legend_metal_plating_upgrade",
			"armor_upgrades/legend_protective_runes_upgrade",
			"armor_upgrades/legend_unhold_fur_upgrade",

			"runes/legend_rune_endurance",
			"runes/legend_rune_resilience",
			"runes/legend_rune_safety",

			"armor/legend_armor_crusader",
			"armor/legend_armor_rabble_fur",
			"armor/legend_armor_ranger",
			"armor/legend_armor_robes_cultist",
			"armor/legend_armor_seer_robes",
			"armor/legend_armor_vala_cloak",
			"armor/legend_armor_vala_dress",
			"armor/legend_armor_warlock_cloak",
			"armor/legend_armor_werewolf_mail",

			"legendary/legend_armor_mountain",
			"legendary/legend_armor_of_davkul",
			"legendary/legend_armor_skin",
			"legendary/legend_emperors_armor",
			"legendary/legend_emperors_armor_fake",
			"legendary/legend_ijirok_armor",

			"named/legend_armor_named_warlock_cloak",
			"named/legend_black_leather_armor",
			"named/legend_blue_studded_mail_armor",
			"named/legend_brown_coat_of_plates_armor",
			"named/legend_golden_scale_armor",
			"named/legend_green_coat_of_plates_armor",
			"named/legend_heraldic_mail_armor",
			"named/legend_lindwurm_armor",
			"named/legend_named_bronze_armor",
			"named/legend_named_golden_lamellar_armor",
			"named/legend_named_noble_mail_armor",
			"named/legend_named_plated_fur_armor",
			"named/legend_named_sellswords_armor",
			"named/legend_named_skull_and_chain_armor"

		];

		foreach(a in armors)
		{
			local item = this.new("scripts/items/legend_armor/" + a);
			if (item.m.Variants.len() == 0)
			{
				this.logInfo("Adding " + a);
				this.World.Assets.getStash().add(item);
				continue;
			}

			for( local i = 0; i < item.m.Variants.len(); i = ++i )
			{
				this.logInfo("Adding " + a + " :: " + i);
				local vitem =  this.new("scripts/items/legend_armor/" + a);
				vitem.setVariant(item.m.Variants[i]);
				this.World.Assets.getStash().add(vitem);
			}
		}

		local weapons = [
			"legend_halberd",
			"legend_military_voulge",
			"legend_ranged_flail",
			"legend_ranged_wooden_flail",
			"legend_voulge",
			"named/legend_named_voulge",
			"named/legend_named_halberd",
			"named/named_lute",
			"named/legend_named_flail"
		]

		foreach(w in weapons)
		{
			this.logInfo("Adding " + w);
			local pla = this.new("scripts/items/weapons/" + w);
			this.World.Assets.getStash().add(pla);
		}

		for (local i = 1; i < 10; i = ++i)
		{
			local item = this.new("scripts/items/legend_armor/armor/legend_armor_heraldic");
			item.setupArmor(i);
			this.World.Assets.getStash().add(item);
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
foreach (b in this.World.getPlayerRoster().getAll())
		{
			foreach (add in this.World.getPlayerRoster().getAll())
			{
				b.changeActiveRelationship(add, this.Math.rand(0, 10));
			}
		}
	}

	function onBuildPerkTree( _tree)
	{
		if  (_tree == null)
		{
			return;
		}

		_tree.addPerk(this.Const.Perks.PerkDefs.LegendPiercingShot);
		_tree.addPerk(this.Const.Perks.PerkDefs.LegendMedIngredients);
		_tree.addPerk(this.Const.Perks.PerkDefs.LegendCampCook);

	}

});

