this.legends_crusader_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.legends_crusader";
		this.m.Name = "Crusader";
		this.m.Description = "[p=c][img]gfx/ui/events/event_35.png[/img][/p][p]Sent on a holy quest to rid the world of undead, you walk a righteous path. \n\n[color=#bcad8c]Pure of Heart:[/color] You cannot recruit outlaw backgrounds, while pious recruits and squires cost less.\n[color=#bcad8c]Strict Sermons:[/color] You will grant the Fortified Mind perk to any pious background or squire who joins you. Find pilgrims to aid you on your journey.\n[color=#bcad8c]Avatar:[/color] If your crusader dies, the campaign ends.[/p]";
		this.m.Difficulty = 1;
		this.m.Order = 70;
		this.m.IsFixedLook = true;
		this.m.StartingRosterTier = this.Const.Roster.getTierForSize(3);
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
			"legend_crusader_commander_background"
		]); //skills on start
		bro.getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
		bro.getSkills().add(this.new("scripts/skills/perks/perk_fortified_mind"));
		bro.getSkills().add(this.new("scripts/skills/perks/perk_rebound"));
		bro.getSkills().add(this.new("scripts/skills/perks/perk_legend_favoured_enemy_zombie"));
		bro.m.PerkPointsSpent += 3;
		bro.setPlaceInFormation(4);
		bro.setVeteranPerks(2);
		bro.getFlags().set("IsPlayerCharacter", true);
 		bro.getSprite("socket").setBrush("bust_base_crusader"); //custom base
		bro.getSprite("miniboss").setBrush("bust_miniboss_crusader"); //custom bust
		bro.m.HireTime = this.Time.getVirtualTimeF();
		this.World.Assets.addMoralReputation(20);
		this.World.Assets.addBusinessReputation(1150);
		this.setRosterReputationTiers(this.Const.Roster.createReputationTiers(this.World.Assets.getBusinessReputation()));
		this.World.Assets.m.Ammo = 0;

		// this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/legend_gambeson"));
		// this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/chain/legend_armor_hauberk"));
		// this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/plate/legend_armor_plates"));
		// this.World.Assets.getStash().add(this.new("scripts/items/legend_armor/tabard/legend_armor_tabard_10"));
	}

	function onSpawnPlayer() //spawn location
	{
		local randomVillage;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = ++i )
		{
			randomVillage = this.World.EntityManager.getSettlements()[i];

			if (randomVillage.isMilitary() && !randomVillage.isIsolatedFromRoads() && randomVillage.getSize() >= 3)
			{
				break;
			}
		}

		local randomVillageTile = randomVillage.getTile();

		do
		{
			local x = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.X - 1), this.Math.min(this.Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 1));
			local y = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.Y - 1), this.Math.min(this.Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 1));

			if (!this.World.isValidTileSquare(x, y))
			{
			}
			else
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.Type == this.Const.World.TerrainType.Ocean || tile.Type == this.Const.World.TerrainType.Shore)
				{
				}
				else if (tile.getDistanceTo(randomVillageTile) == 0)
				{
				}
				else if (!tile.HasRoad)
				{
				}
				else
				{
					randomVillageTile = tile;
					break;
				}
			}
		}
		while (1);

		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		this.World.Assets.updateLook(102);
		//this.World.State.m.Player.getSprite("body").setBrush("figure_player_crusader");
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList([
				"music/noble_02.ogg"
			], this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.legend_crusader_scenario_intro");
		}, null);

	}

	function onInit() //starting slots
	{
		this.starting_scenario.onInit();
		this.World.Flags.set("IsLegendsCrusader", true);
	}

	function onCombatFinished() //is crusader kill?
	{
		local roster = this.World.getPlayerRoster().getAll();

		foreach( bro in roster )
		{
			if (bro.getFlags().get("IsPlayerCharacter"))
			{
				return true;
			}
		}

		return false;
	}

	function onHiredByScenario( bro )
	{
		if (bro.getBackground().getID() == "background.flagellant" || bro.getBackground().getID() == "background.squire" || bro.getBackground().getID() == "background.legend_nun" || bro.getBackground().getID() == "background.monk" || bro.getBackground().getID() == "background.witchhunter")
		{
			bro.improveMood(1.5, "Joined a righteous cause");
 			bro.getSprite("socket").setBrush("bust_base_crusader"); //custom base
			bro.getSkills().add(this.new("scripts/skills/perks/perk_fortified_mind"));
		}
		else
		{
			bro.worsenMood(2.0, "Dislikes your sermons");
		}
	}

	function onUpdateHiringRoster( _roster )
	{
		local garbage = [];
		local bros = _roster.getAll();

		foreach( i, bro in bros )
		{
			if (bro.getBackground().getID() == "background.flagellant" || bro.getBackground().getID() == "background.legend_nun" || bro.getBackground().getID() == "background.monk" || bro.getBackground().getID() == "background.witchhunter")
			{
				bro.m.HiringCost = this.Math.floor(bro.m.HiringCost * 0.75);
				bro.getBaseProperties().DailyWage = this.Math.floor(bro.getBaseProperties().DailyWage * 0.75);

			}
			else if (bro.getBackground().getID() == "background.squire")
			{
				bro.m.HiringCost = this.Math.floor(bro.m.HiringCost * 0.85);
				bro.getBaseProperties().DailyWage = this.Math.floor(bro.getBaseProperties().DailyWage * 0.85);
			}
			else
			{
				bro.m.HiringCost = this.Math.floor(bro.m.HiringCost * 1.25);
				bro.getBaseProperties().DailyWage = this.Math.floor(bro.getBaseProperties().DailyWage * 1.25);
			}

            if (bro.getBackground().isBackgroundType(this.Const.BackgroundType.Outlaw))
            {
                garbage.push(bro);
            }
		}

		foreach( g in garbage )
		{
			_roster.remove(g);
		}
	}

	function onBuildPerkTree( _background )
	{
		if (_background.m.CustomPerkTree == null)
		{
			return;
		}
		_background.m.CustomPerkTree[0].push(this.Const.Perks.PerkDefs.FortifiedMind);
	}

	function onUpdateDraftList( _list, _gender)
	{
		if (_list.len() < 5)
		{
			local r;
			r = this.Math.rand(0, 2);
			if (r == 0)
			{
			_list.push("flagellant_background");
			}
			r = this.Math.rand(0, 4);
			if (r == 0)
			{
			_list.push("pilgrim_background");
			}
			r = this.Math.rand(0, 4);
			if (r == 0)
			{
			_list.push("monk_background");
			}
			r = this.Math.rand(0, 6);
			if (r == 0 && _gender)
			{
			_list.push("legend_nun_background");
			}
			r = this.Math.rand(0, 9);
			if (r == 0)
			{
				_list.push("witchhunter_background");
			}
			r = this.Math.rand(0, 49);
			if (r == 0)
			{
				_list.push("legend_crusader_background");
			}
		}
		if (_list.len() >= 5)
		{
			local r;
			r = this.Math.rand(0, 5);
			if (r == 0)
			{
				_list.push("flagellant_background");
			}
			r = this.Math.rand(0, 5);
			if (r == 0)
			{
				_list.push("pilgrim_background");
			}
			r = this.Math.rand(0, 6);
			if (r == 0)
			{
				_list.push("monk_background");
			}
			r = this.Math.rand(0, 4);
			if (r == 0)
			{
				_list.push("legend_nun_background");
			}
			r = this.Math.rand(0, 5);
			if (r == 0)
			{
				_list.push("witchhunter_background");
			}
			r = this.Math.rand(0, 19);
			if (r == 0)
			{
				_list.push("legend_crusader_background");
			}
		}
	}

});

