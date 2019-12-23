this.legend_risen_legion <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.legend_risen_legion";
		this.m.Name = "Risen Legion (Legends)";
		this.m.Description = "[p=c][img]gfx/ui/events/event_73.png[/img][/p][p]An ancient legion risen from the dead to reclaim the world \n[color=#bcad8c]Despised:[/color] All towns will begin hostile to you \n[color=#bcad8c]Beyond death:[/color]Every character in your party has a 66% chance to survive death\n[color=#bcad8c]Dirty Dozen:[/color]Control a team of a dozen from the start, but you can hire no more in towns\n";
		this.m.Difficulty = 3;
		this.m.Order = 15;
	}

	function isValid()
	{
		return this.Const.DLC.Wildmen;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local partysize = 12;
		local broLevelMax = 3;

		

		for( local i = 0; i < partysize; i = ++i )
		{
			local broLevel = this.Math.rand(1, broLevelMax);
			local broPerks = broLevel - 1; 
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.m.HireTime = this.Time.getVirtualTimeF();
			bro.setStartValuesEx(this.Const.CharacterBackgroundsRandom);
			bro.m.Level = broLevel;
			bro.m.LevelUps = broPerks;
			bro.m.PerkPoints = broPerks;
			bro.setVeteranPerks(3);
			bro.getTags().add("PlayerSkeleton");
			bro.getTags().add("undead");
			bro.getTags().add("skeleton");
			bro.setStartValuesEx(this.Const.CharacterBackgroundsAnimated);
			bro.getSkills().add(this.new("scripts/skills/special/legend_animated_player_properties"));
			items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
			items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
			items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
			items.equip(this.new("scripts/items/weapons/ancient/ancient_spear"));
			items.equip(this.new("scripts/items/shields/ancient/tower_shield"));
			items.equip(this.new("scripts/items/weapons/javelin"));
			items.equip(this.new("scripts/items/weapons/javelin"));
			items.equip(this.new("scripts/items/helmets/ancient/legend_ancient_legionary_helmet_restored"));
			items.equip(this.new("scripts/items/legend_armor/cloth/sackcloth_tattered"));
			items.equip(this.new("scripts/items/legend_armor/plate/legend_armor_plate_ancient_chest_restored"));
		}
			items.equip(this.new("scripts/items/helmets/ancient/legend_ancient_gladiator_helmet"));
			items.equip(this.new("scripts/items/helmets/ancient/legend_ancient_gladiator_helmet"));
			items.equip(this.new("scripts/items/tools/throwing_net"));
			items.equip(this.new("scripts/items/tools/throwing_net"));
			items.equip(this.new("scripts/items/weapons/throwing_spear"));
			items.equip(this.new("scripts/items/weapons/throwing_spear"));
			items.equip(this.new("scripts/items/weapons/ancient/bladed_pike"));
			items.equip(this.new("scripts/items/weapons/ancient/bladed_pike"));
			items.equip(this.new("scripts/items/legend_armor/plate/legend_armor_plate_ancient_gladiator"));
			items.equip(this.new("scripts/items/legend_armor/plate/legend_armor_plate_ancient_gladiator"));
			this.World.Assets.getStash().add(this.new("scripts/items/supplies/bread_item"));
			this.World.Assets.getStash().add(this.new("scripts/items/supplies/beer_item"));


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

	function onUpdateHiringRoster( _roster )
	{
		local garbage = [];
		local bros = _roster.getAll();

		foreach( i, bro in bros )
		{
			if (bro.isStabled())
			{
				continue;
			}
			if (!bro.isStabled())
			{
				garbage.push(bro);
			}
		}

		foreach( g in garbage )
		{
			_roster.remove(g);
		}
	}

	function onHiredByScenario( bro )
	{
		bro.getSkills().add(this.new("scripts/skills/traits/legend_deathly_spectre_trait"));
		local r = this.Math.rand(0, 2);
		if (bro.getBackground().isOutlawBackground())
		{
			bro.improveMood(0.5, "Finds perverse joy in your actions")
			if (r == 0)
			{
				bro.getSkills().add(this.new("scripts/skills/traits/paranoid_trait"));
			}
		}
		else if (bro.getBackground().isCrusaderRecruitBackground())
		{
			bro.worsenMood(1.5, "Is deeply disturbed by you");
			if (r == 0)
			{
				bro.getSkills().add(this.new("scripts/skills/traits/superstitious_trait"));
			}
			if (r == 1)
			{
				bro.getSkills().add(this.new("scripts/skills/traits/paranoid_trait"));
			}
		}

	}

});

