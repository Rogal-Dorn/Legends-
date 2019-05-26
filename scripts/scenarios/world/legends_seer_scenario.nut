this.legends_seer_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.legends_seer";
		this.m.Name = "Seer";
		this.m.Description = "[p=c][img]gfx/ui/events/event_35.png[/img][/p][p]After studying alchemy and mystic secrets for years, you have set out to confront the evils of the world \n\n[color=#bcad8c]Bookworm:[/color] Educated people want to work for you, the uneducated find you boring to be around.\n[color=#bcad8c]Teacher[/color] Anyone you fight with gains the Student perk.\n[color=#bcad8c]Avatar:[/color] If your seer dies, the campaign ends.[/p]";
		this.m.Difficulty = 3;
		this.m.Order = 18;
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
			"legend_witch_commander_background"
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
		this.World.State.m.Player.getSprite("body").setBrush("figure_player_seer");
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList([
				"music/noble_02.ogg"
			], this.Const.Music.CrossFadeTime);
		//	this.World.Events.fire("event.lone_wolf_scenario_intro");
		}, null);
	}

	function onInit()
	{
		this.World.Assets.m.BrothersMax = 2;
		this.World.Tags.set("IsLegendsSeer", true);
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
			_list.push("apprentice_background");
		}
	}

	function onUpdateHiringRoster( _roster )
	{
		local garbage = [];
		local bros = _roster.getAll();

		foreach( i, bro in bros )
		{
			if (bro.getBackground().IsEducatedBackground())
			{
				bro.m.HiringCost = this.Math.floor(this.m.HiringCost * 0.9);
				bro.m.DailyCost = this.Math.floor(this.m.DailyCost * 0.9);
				bro.improveMood(1.5, "Excited to study from you");
			}

			if (!bro.getBackground().IsEducatedBackground())
			{
				bro.m.HiringCost = this.Math.floor(this.m.HiringCost * 1.1);
				bro.m.DailyCost = this.Math.floor(this.m.DailyCost * 1.1);
				bro.worsenMood(0.5, "Does not like your big words");
			}

			if (bro.getSkills().hasSkill("trait.bright")))
			{
				bro.m.HiringCost = this.Math.floor(this.m.HiringCost * 0.9);
				bro.m.DailyCost = this.Math.floor(this.m.DailyCost * 0.9);
				bro.improveMood(1.0, "Keen to learn from a master");
			}

			if (bro.getSkills().hasSkill("trait.dumb")))
			{
				bro.m.HiringCost = this.Math.floor(this.m.HiringCost * 1.1);
				bro.m.DailyCost = this.Math.floor(this.m.DailyCost * 1.1);
				bro.worsenMood(0.5, "Thinks you are boring");
			}
		}

		foreach( g in garbage )
		{
			_roster.remove(g);
		}
	}

});

