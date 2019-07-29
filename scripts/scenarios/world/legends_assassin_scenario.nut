this.legends_assassin_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.legends_assassin";
		this.m.Name = "Solo Assassin (Legends)";
		this.m.Description = "[img]gfx/ui/events/event_51.png[/img] \n[p]A quick, efficient and ruthless assassin. You strike from the shadows and collect the rewards. \n\n[color=#bcad8c]Camouflage:[/color] You will grant the Camouflage ability to anyone who joins you in battle. \n[color=#bcad8c]Underworld:[/color] You have a small chance of finding other Assassins for hire.\n[color=#bcad8c]Avatar:[/color] Begin alone. If you die, it is game over.[/p]";
		this.m.Difficulty = 2;
		this.m.Order = 19;
	}

	function isValid()
	{
		return this.Const.DLC.Wildmen;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();

		local bro;
		bro = roster.create("scripts/entity/tactical/player");
		bro.setStartValuesEx([
			"legend_assassin_commander_background"
		]);
		bro.getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
		bro.setPlaceInFormation(4);
		bro.setVeteranPerks(2);
		bro.getTags().set("IsPlayerCharacter", true);
		bro.getSprite("miniboss").setBrush("bust_miniboss_lone_wolf");

		this.World.Assets.m.Money = 1.5 * this.World.Assets.m.Money;
		this.World.Assets.m.Ammo = this.World.Assets.m.Ammo;
	}

	function onSpawnPlayer()
	{
		local randomVillage;
		local northernmostY = 0;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = i )
		{
			local v = this.World.EntityManager.getSettlements()[i];

			if (v.getTile().SquareCoords.Y > northernmostY && !v.isMilitary() && !v.isIsolatedFromRoads() && v.getSize() <= 2)
			{
				northernmostY = v.getTile().SquareCoords.Y;
				randomVillage = v;
			}

			i = ++i;
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


		local nobles = this.World.FactionManager.getFactionsOfType(this.Const.FactionType.NobleHouse);
		local houses = [];

		foreach( n in nobles )
		{
			local closest;
			local dist = 9999;

			foreach( s in n.getSettlements() )
			{
				local d = s.getTile().getDistanceTo(randomVillageTile);

				if (d < dist)
				{
					dist = d;
					closest = s;
				}
			}

			houses.push({
				Faction = n,
				Dist = dist
			});
		}

		houses.sort(function ( _a, _b )
		{
			if (_a.Dist > _b.Dist)
			{
				return 1;
			}
			else if (_a.Dist < _b.Dist)
			{
				return -1;
			}

			return 0;
		});

		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		this.World.Assets.updateLook(110);
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList(this.Const.Music.CivilianTracks, this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.legend_assassin_scenario_intro");
		}, null);
	}

	function onInit()
	{
		this.starting_scenario.onInit();
		this.World.Assets.m.BrothersMax = 3;
		this.World.Tags.set("IsLegendsAssassin", true);
	}

	function onCombatFinished()
	{
		local roster = this.World.getPlayerRoster().getAll();

		foreach( bro in roster )
		{
			if (bro.getTags().get("IsPlayerCharacter"))
			{
				return true;
			}
		}

		return false;
	}

	function onUpdateDraftList( _list )
	{
		if (_list.len() >= 8)
		{
			local r;
			r = this.Math.rand(0, 9);

			if (r == 0)
			{
				_list.push("assassin_background");
			}

			local r;
			r = this.Math.rand(0, 3);

			if (r == 0)
			{
				_list.push("thief_background");
			}

			local r;
			r = this.Math.rand(0, 3);

			if (r == 0)
			{
				_list.push("female_thief_background");
			}
		}

		if (_list.len() <= 5)
		{
			local r;
			r = this.Math.rand(0, 9);

			if (r == 0)
			{
				_list.push("killer_on_the_run_background");
			}

			local r;
			r = this.Math.rand(0, 6);

			if (r == 0)
			{
				_list.push("graverobber_background");
			}

			local r;
			r = this.Math.rand(0, 6);

			if (r == 0)
			{
				_list.push("gambler_background");
			}
		}
	}


	function onHiredByScenario( bro )
	{
		bro.improveMood(0.5, "Learned a new skill");
		bro.getSkills().add(this.new("scripts/skills/perks/perk_legend_hidden"));
	}

	function onBuildPerkTree( _tree )
	{
		if (_tree == null)
		{
			return;
		}

		_tree.addPerk(this.Const.Perks.PerkDefs.LegendHidden);
	}

});

