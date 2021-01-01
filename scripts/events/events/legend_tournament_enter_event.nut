this.legend_tournament_enter_event <- this.inherit("scripts/events/event", {
	m = {
	Veteran = null,
	IsActive = false
	},
	function create()
	{
		this.logInfo("Creating tournament event")
		this.m.ID = "event.location.legend_tournament_enter";
		this.m.Title = "As you approach...";
		this.m.Cooldown = 100;
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/legend_tournament.png[/img]{ You approach a large metal door set into a huge defensive wall. There is clearly only one way in. A gaurd calls down from the battlements %SPEECH_ON% Here for the tournament? Never heard of you. Prove yourselves in the southern arena before you tread these hallowed grounds.%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "We must head to the arena.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{


			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/legend_tournament.png[/img]{ You approach a large metal door set into a huge defensive wall. There is clearly only one way in. A gaurd calls down from the battlements gesturing towards your arena veteran %SPEECH_ON% Hail %veteran%! I heard of your performance in the arena, but who are these welps with you? Your party will need at least three veterans before we can let you in to the grand tournament. Teach them your ways and come back, we look forward to seeing you in the tourney. %SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "We must return to the arena.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{


			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/legend_tournament.png[/img]{ You approach the huge defensive wall, the metal door opens without a guard in sight. As you pass through the gates a round of trumpets call out, and voice echoes %SPEECH_ON% Welcome %companyname% to the grand tournment!%SPEECH_OFF%. A scattered round of applause follows the announcement and you head into the entrance hall.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "The welcome we deserve",
					function getResult( _event )
					{
						return "D";
					}

				}
			],
			function start( _event )
			{


			}

		});
		this.m.Screens.push({
			ID = "D",
			Text = "[img]gfx/ui/events/legend_tournament.png[/img]{A door opens and a confident woman strides up to you. The trumpets sound again and a voice announces Artemisia, marshal of the grand tournament. She carries herself with the bearing of a fighter, she wears a gambeson, a full scabard and a welcoming smile. %SPEECH_ON% Good to see the renowned %companyname%, it is great to see you all could join the other greatest fighters for bragging rights and coin. %SPEECH_OFF%. She leads you to a window that looks down on an large grassy arena where rich patrons watch on as warriors are sparring with one another. %SPEECH_ON% We have a variety of events to compete in, would you like to compete today? %SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Tell me of the events",
					function getResult( _event )
					{
						return "E";
					}

				},
				{
					Text = "Not today",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "E",
			Text = "[img]gfx/ui/events/legend_tournament.png[/img]{Artemisia gives a well practiced recital %SPEECH_ON% The rules of the Melee are simple, fight as many battles in a row as you can. The prize begins at 1000 gold, and each battle the difficulty will increase and the prize will double. You will fight both humans and beasts of all kinds.%SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Lets begin",
					function getResult( _event )
					{
						return "ECollar";
					}

				},
				{
					Text = "Not today",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{

			}

		});

		this.m.Screens.push({
			ID = "ECollar",
			Text = "[img]gfx/ui/events/legend_tournament.png[/img]{Artemisia exclaims %SPEECH_ON% Excellent! Here are 5 collars. Place them on your choosen champions and return. %SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Choose 5 you say?",
					function getResult( _event )
					{
						return 0;
					}
				},
			],
			function start( _event )
			{
				this.World.Flags.set("LegendTournamentRound", 1);
				this.World.Assets.getStash().add(this.new("scripts/items/accessory/special/legend_arena_collar_item"));
				this.World.Assets.getStash().add(this.new("scripts/items/accessory/special/legend_arena_collar_item"));
				this.World.Assets.getStash().add(this.new("scripts/items/accessory/special/legend_arena_collar_item"));
				this.World.Assets.getStash().add(this.new("scripts/items/accessory/special/legend_arena_collar_item"));
				this.World.Assets.getStash().add(this.new("scripts/items/accessory/special/legend_arena_collar_item"));
			}

		});

		this.m.Screens.push({
			ID = "ChooseCollar",
			Text = "[img]gfx/ui/events/legend_tournament.png[/img]{Choose your champions from the character screen by placing collars in the accessory slots of the chosen. Return when ready to fight.}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Pick your champions",
					function getResult( _event )
					{
						return 0;
					}
				},
			],
			function start( _event )
			{
			}

		});

		this.m.Screens.push({
			ID = "WelcomeBack",
			Text = "[img]gfx/ui/events/legend_tournament.png[/img]Artemisia welcomes you back and quickly leads your chosen champions to the pits to ready for the fight",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Lets Fight!",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult())
						_event.registerToShowAfterCombat("F", null);
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				}
			],
			function start( _event )
			{
				_event.m.IsActive = true;
			}

		});

		this.m.Screens.push({
			ID = "F",
			Text = "[img]gfx/ui/events/legend_tournament.png[/img]{After the battle you fall back to an antechamber off the main tourney grounds. Artemisia offers you a choice to keep going or take your prize}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Another round",
					function getResult( _event )
					{
						local p = _event.selectFight(_event.getReputationToDifficultyLightMult())
						_event.registerToShowAfterCombat("F", null);
						this.World.State.startScriptedCombat(p, false, false, false);
						return 0;
					}

				},
				{
					Text = "That is enough",
					function getResult( _event )
					{
						return "G";
					}

				}
			],
			function start( _event )
			{
			}

		});


		this.m.Screens.push({
			ID = "G",
			Text = "[img]gfx/ui/events/legend_tournament.png[/img]{Having completed the gauntlet you are led as champions from the field. Artemisia presents your reward and walks you out to the door %SPEECH_ON% Well fought! I hope we see you in the tournament again, though I imagine you need some rest after that performance. %SPEECH_OFF%}",
			Image = "",
			List = [],
			Characters = [],
			Options = [

				{
					Text = "Fare well",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				local round = this.World.Flags.get("LegendTournamentRound");
				local payment = 1000;
				for( local i = 0; i < round && i < 5; i = ++i )
				{
					payment *= 2;
				}
				this.World.Assets.addMoney(payment);
				this.World.Flags.set("LegendTournamentRound", 0);
			}
		});
	}

 	function selectFight(scale)
	{
		local round = this.World.Flags.get("LegendTournamentRound");
		local roundDifficulty = 1 + (round / 10);
		this.World.Flags.increment("LegendTournamentRound", 1);
		local p = this.Const.Tactical.CombatInfo.getClone();
		p.LocationTemplate = clone this.Const.Tactical.LocationTemplate;
		p.TerrainTemplate = "tactical.legend_tournament";
		p.LocationTemplate.Template[0] = "tactical.legend_tournament_floor";
		p.CombatID = "Legend Tournament";
		p.Music = this.Const.Music.UndeadTracks;
		p.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Arena;
		p.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Arena;
		p.IsFleeingProhibited = true;
		p.IsFogOfWarVisible = false;
		p.IsArenaMode = true;
		p.Players.extend(this.Const.World.Common.getArenaBros())
		p.Entities = [];
		this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.GrandMelee, this.Math.rand(90, 110) * (this.Math.pow(scale,roundDifficulty)), this.Const.Faction.Enemy);
		p.AfterDeploymentCallback = function ()
		{
			this.Tactical.getWeather().setAmbientLightingPreset(1);
			this.Tactical.getWeather().setAmbientLightingSaturation(1.1);
		};
	}

	function onUpdateScore()
	{
	}

	function onPrepare()
	{
	}

	function onDetermineStartScreen()
	{
		local round = this.World.Flags.get("LegendTournamentRound");
		if (round == 1) {
			if (this.Const.World.Common.getArenaBros().len() <= 0) {
				return "ChooseCollar"
			}

			return "WelcomeBack"
		}

		local candidate_veteran = [];

		foreach (bro in this.World.getPlayerRoster().getAll())
		{
			if (bro.getSkills().hasSkill("trait.arena_veteran"))
			{
				candidate_veteran.push(bro);
			}
		}

		if (candidate_veteran.len() == 0)
		{
			//return "A";
			return "C";

		}

		this.m.Veteran = candidate_veteran[this.Math.rand(0, candidate_veteran.len() - 1)]

		if ( veterans < 3 )
		{
			return "B";
		}

		return "C"
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"veteran",
			this.m.Veteran != null ? this.m.Veteran.getNameOnly() : ""
		]);

	}

	function onClear()
	{
		if (this.m.IsActive)
		{
			local roster = this.World.getPlayerRoster().getAll();

			foreach( bro in roster )
			{
				local item = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Accessory);

				if (item != null && item.getID() == "accessory.legend_arena_collar")
				{
					bro.getItems().unequip(item);
				}
			}

			local items = this.World.Assets.getStash().getItems();

			foreach( i, item in items )
			{
				if (item != null && item.getID() == "accessory.legend_arena_collar")
				{
					items[i] = null;
				}
			}
		}
	}

});

