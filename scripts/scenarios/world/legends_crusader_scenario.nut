this.legends_crusader_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.legends_crusader";
		this.m.Name = "Solo Crusader (Legends)";
		this.m.Description = "[p=c][img]gfx/ui/events/event_35.png[/img][/p][p]Sent on a holy quest to rid the world of undead, you walk a righteous path alone. \n\n[color=#bcad8c]Pure of heart:[/color] Can not recruit outlaw backgrounds, pious backgrounds will cost less\n[color=#bcad8c]Strict Sermons[/color] Anyone you fight with gains Fortified Mind.\n[color=#bcad8c]Avatar:[/color] If your crusader dies, the campaign ends.[/p]";
		this.m.Difficulty = 3;
		this.m.Order = 17;
		this.m.IsFixedLook = true;
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
		]);
		bro.getSkills().add(this.new("scripts/skills/traits/player_character_trait"));
		bro.setPlaceInFormation(4);
		bro.setVeteranPerks(2);	
		bro.getTags().set("IsPlayerCharacter", true);
		bro.getSprite("miniboss").setBrush("bust_miniboss_lone_wolf");
		bro.m.HireTime = this.Time.getVirtualTimeF();
		this.World.Assets.m.BusinessReputation = 100;
		this.World.Assets.m.Ammo = 0;
	}

	function onSpawnPlayer()
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
		this.World.State.m.Player.getSprite("body").setBrush("figure_player_crusader");
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList([
				"music/noble_02.ogg"
			], this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.legend_crusader_scenario_intro");
		}, null);
	}

	function onInit()
	{
		this.World.Assets.m.BrothersMax = 2;
		this.World.Tags.set("IsLegendsCrusader", true);
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
		if (_list.len() < 10)
		{
			return;
		}

		_list.push("monk_background");
		local r;
		r = this.Math.rand(0, 999);	
		if (r == 0)
		{
			_list.push("legend_crusader_background");
		}
	}

	function onUpdateHiringRoster( _roster )
	{
		local garbage = [];
		local bros = _roster.getAll();

		foreach( i, bro in bros )
		{
			if (bro.getBackground().isCrusaderRecruitBackground())
			{
				bro.m.HiringCost = this.Math.floor(bro.m.HiringCost * 0.9);
				bro.getBaseProperties().DailyWage = this.Math.floor(bro.getBaseProperties().DailyWage * 0.9);
				bro.improveMood(1.0, "Joined a righteous cause");
				bro.getSkills().add(this.new("scripts/skills/perks/perk_fortified_mind"));
				bro.improveMood(0.5, "Learned a new skill");
			} 
			else
			{
				bro.m.HiringCost = this.Math.floor(bro.m.HiringCost * 1.25);
				bro.getBaseProperties().DailyWage = this.Math.floor(bro.getBaseProperties().DailyWage * 1.25);
				bro.worsenMood(1.0, "Dislikes your sermons");
				bro.getSkills().add(this.new("scripts/skills/perks/perk_fortified_mind"));
				bro.improveMood(0.5, "Learned a new skill");
			}

			if (bro.getBackground().isOutlawBackground())
			{
				garbage.push(bro);
			}
		}

		foreach( g in garbage )
		{
			_roster.remove(g);
		}
	}

});

