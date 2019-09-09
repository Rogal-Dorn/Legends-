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

		local horsesize = 10
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



		this.World.Assets.m.Money = 50000;
		this.World.Assets.m.ArmorParts = 200;
		this.World.Assets.m.Medicine = 200;
		this.World.Assets.m.Ammo = 200;
		this.World.Assets.m.Food = 200;
		this.World.Assets.m.BusinessReputation = 1000;
		this.World.Assets.getStash().resize(300);

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

		local armors = [
			"legend_gambeson_blotched",
			"legend_gambeson",
			"legend_robe_herbalist",
			"legend_robe_monk",
			"legend_robe_necromancers",
			"legend_robe_nun_dark",
			"legend_robe_nun_light",
			"legend_robe_wizard",
			"legend_sackcloth_tattered",
			"legend_sackcloth",
			"legend_surcoat_ragged",
			"legend_surcoat_ragged_dark",
			"legend_surcoat_padded",
			"legend_tunic_linen",
			"legend_tunic_noble",
			"legend_tunic_thick_dark",
			"legend_tunic_thick",
			"legend_tunic_rabble",
			"legend_cloak_warlock",
			"legend_dress_vala",
			"legend_cloak_vala",
			"legend_dress_maid",
			"legend_rabble_fur"
		];

		foreach(a in armors)
		{
			this.logInfo("Adding " + a);
			local arm = this.new("scripts/items/legend_armor/armor/" + a);
			this.World.Assets.getStash().add(arm);
		}
		
		local chain = [
			"legend_armor_leather",
			"legend_armor_hide_and_bone",
			"legend_armor_patched_mail",
			"legend_armor_leather_lamellar",
			"legend_armor_ancient_mail",
			"legend_armor_worn_mail",
			"legend_armor_basic_mail",
			"legend_armor_ancient_double_layer",
			"legend_armor_mail_shirt",
			"legend_armor_leather_scale",
			"legend_armor_mail_hauberk",
			"legend_armor_decayed_reinforced",
			"legend_armor_light_scale",
			"legend_armor_footmans_armor",
			"legend_armor_lamellar",
			"legend_armor_scale",
			"legend_armor_heraldic",
			"legend_armor_sellswords",
			"legend_armor_coat_of_plates",
			"legend_armor_ikon_scale"
		];
		
		foreach(c in chain)
		{
			this.logInfo("Adding " + c);
			local cha = this.new("scripts/items/legend_armor/chain/" + c);
			this.World.Assets.getStash().add(cha);
		}
		
		local chain = [
			"legend_armor_hide_and_bone",
			"legend_armor_lamellar",
			"legend_armor_rugged_scale",
			"legend_armor_heavy_iron",
			"legend_armor_ancient_scale_harness",
			"legend_armor_ancient_breastplate",
			"legend_armor_ancient_plate",
			"legend_armor_ancient_plate_harness",
			"legend_armor_ancient_plate_scale",
			"legend_armor_refurbished_ancient_plate",
			"legend_armor_decayed_plates",
			"legend_armor_heavy_lamellar",
			"legend_armor_coat_of_plates",
			"legend_armor_chestplate_2",
			"legend_armor_dem_avalon_plate",
			"legend_armor_wuxiang_plate",
			"legend_armor_pixel_plate",
			"legend_armor_ikon_plates",
			"legend_armor_karl_plates",
			"legend_armor_shkimmilk_plates"
		];
		
		foreach(p in plate)
		{
			this.logInfo("Adding " + p);
			local pla = this.new("scripts/items/legend_armor/plate/" + p);
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

