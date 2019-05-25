this.legends_necro_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.legends_necro";
		this.m.Name = "Legends Warlock";
		this.m.Description = "[p=c][img]gfx/ui/events/event_46.png[/img][/p][p] Death is no barrier, others flee from its yawning abyss, but you embrace the other side. \n\n[color=#bcad8c]Necromancy:[/color] Start with undead companions and a scythe that summons the dead\n[color=#bcad8c]Gruesome harvest:[/color] Collect human corpses to fashion new minions, maintain them with medical supplies\n[color=#bcad8c]Blood magic:[/color]Drain blood, feast on corpses and use your own blood in rituals\n[color=#bcad8c]Avatar:[/color]When the warlock dies, the spells fade and the game ends[/p]";
		this.m.Difficulty = 2;
		this.m.Order = 13;
	}

	function isValid()
	{
		return this.Const.DLC.Wildmen;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 3; i = ++i )
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.m.HireTime = this.Time.getVirtualTimeF();;

			while (names.find(bro.getNameOnly()) != null)
			{
				bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
			}

			names.push(bro.getNameOnly());
		}

		local bros = roster.getAll();
		bros[0].setStartValuesEx([
			"legend_necro_commander_background"
		]);
		bros[0].getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
		bros[0].getSkills().add(this.new("scripts/skills/traits/cultist_prophet_trait"));
		bros[0].getTags().set("IsPlayerCharacter", true);
		bros[0].setPlaceInFormation(2);

		bros[1].setPlaceInFormation(3);
        bros[1].getTags().add("PlayerSkeleton");
        bros[1].getTags().add("undead");
        bros[1].getTags().add("skeleton");
        bros[1].setStartValuesEx(this.Const.CharacterBackgroundsAnimated);
		bros[1].getBackground().m.RawDescription = "You found %name% starved to death on the road, you tease him endlessly about being skin and bones. You enjoy the ribbing, but he does not find it humerous.";
        bros[1].getSkills().add(this.new("scripts/skills/special/legend_animated_player_properties"));

		bros[2].setPlaceInFormation(4);
        bros[2].getTags().add("PlayerZombie");
        bros[2].getTags().add("undead");
        bros[2].getTags().add("zombie_minion");
        bros[2].setStartValuesEx(this.Const.CharacterBackgroundsAnimated);
		bros[2].getBackground().m.RawDescription = "You can not remember much about who %name% was in life, it is probably for the best that he can\'t either. All that matters is he is yours now.";
        bros[2].getSkills().add(this.new("scripts/skills/special/legend_animated_player_properties"));
		this.World.Assets.addMoralReputation(-50);
		this.World.Assets.m.Money = this.World.Assets.m.Money;
	}

	function onSpawnPlayer()
	{
		local randomVillage;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = ++i )
		{
			randomVillage = this.World.EntityManager.getSettlements()[i];

			if (!randomVillage.isMilitary() && !randomVillage.isIsolatedFromRoads() && randomVillage.getSize() == 1)
			{
				break;
			}
		}

		local randomVillageTile = randomVillage.getTile();
		local navSettings = this.World.getNavigator().createSettings();
		navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost_Flat;

		do
		{
			local x = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.X - 4), this.Math.min(this.Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 4));
			local y = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.Y - 4), this.Math.min(this.Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 4));

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
				else if (tile.Type != this.Const.World.TerrainType.Plains && tile.Type != this.Const.World.TerrainType.Steppe && tile.Type != this.Const.World.TerrainType.Tundra && tile.Type != this.Const.World.TerrainType.Snow)
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

		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList(this.Const.Music.CivilianTracks, this.Const.Music.CrossFadeTime);
		//	this.World.Events.fire("event.cultists_scenario_intro");
		}, null);
	}
		function onInit()
	{
		this.World.Assets.m.BrothersMax = 3;
		this.World.Tags.set("IsLegendsNecro", true);
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
		if (_list.len() >= 10)
		{
			_list.push("gravedigger_background");
		}
	}

});

