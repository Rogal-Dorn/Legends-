this.wildman_causes_havoc_event <- this.inherit("scripts/events/event", {
	m = {
		Trader = null,
		Berserker = null,
		Wildman = null,
		Town = null,
		Compensation = 600
	},
	function create()
	{
		this.m.ID = "event.wildman_causes_havoc";
		this.m.Title = "At %townname%";
		this.m.Cooldown = 50.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_20.png[/img]Civilization is no place for a wildling like %wildman%, who quickly proves it.\n\nApparently, the damned mercenary went crazy while in a shop and trashed the whole place. As the story goes, they just walked in and started taking things, not quite understanding the social norms of paying for goods. The shop owner then came after them with a broom, trying to shoo the wildling out of his store. Believing the broom a monster, the wildling proceeded to go completely crazy. Judging by the reports, it was quite the commotion, up to and including shite throwing.\n\nNow the shop owner is in your face demanding compensation for the damage done. Apparently he\'s wanting %compensation% crowns. Behind him, a few town militia stand with very watchful eyes.",
			Image = "",
			List = [],
			Characters = [],			
			Options = [],
			function start( _event )
			{
				this.Options.push({
					Text = "This ain\'t our problem.",
					function getResult( _event )
					{
						return "B";
					}

				});

				if (_event.m.Wildman != null && _event.m.Berserker == null)
				{
					this.Options.push({
						Text = "Fine, the company will cover the damages - but %wildman% will work it off.",
						function getResult( _event )
						{
							return "D";
						}

					});
				}

				if (_event.m.Berserker != null)
				{
					this.Options.push({
						Text = "Fine, the company will cover the damages - but %berserker% will work it off.",
						function getResult( _event )
						{
							return "X";
						}

					});
				}

				this.Options.push({
					Text = "Fine, the company will cover the damages.",
					function getResult( _event )
					{
						return "C";
					}

				});

				if (_event.m.Trader != null)
				{
					this.Options.push({
						Text = "Fine, the company will cover the damages. But %trader% will assess compensation",
						function getResult( _event )
						{
							if (_event.m.Berserker != null)
							{
								this.m.Compensation = this.Math.round(400 + 0.03 * this.World.Assets.getMoney());
							}
							else
							{
								this.m.Compensation = this.Math.round(300 + 0.02 * this.World.Assets.getMoney());
							}

							return "T";
						}

					});
				}
			}

			function end( _event )
			{
				if (_event.m.Berserker != null)
				{
					this.Characters.push(_event.m.Berserker.getImagePath());
				}

				if (_event.m.Wildman != null && _event.m.Berserker == null)
				{
					this.Characters.push(_event.m.Wildman.getImagePath());
				}
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_20.png[/img]You push the shop owner away, telling him that you owe nothing. When he jumps forward again, your hand deftly moves to the pommel of your sword, stopping the man in one swift motion. He raises his hands up, nodding as he backs off. A few townspeople see this and skirt by, trying to avoid your gaze. The militiamen notice, but they seem uncertain on whether to take action or not.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "To hell with your shop.",
					function getResult( _event )
					{
						return this.Math.rand(1, 100) <= 80 ? "E" : 0;
					}

				}
			],
			function start( _event )
			{
				if (_event.m.Berserker != null)
				{
					this.Characters.push(_event.m.Berserker.getImagePath());
				}

				if (_event.m.Wildman != null && _event.m.Berserker == null)
				{
					this.Characters.push(_event.m.Wildman.getImagePath());
				}

				this.World.FactionManager.getFaction(_event.m.Town.getFactions()[0]).addPlayerRelation(this.Const.World.Assets.RelationCivilianContractFail, "You refused to pay for damages caused by one of your mercenaries");
			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/event_01.png[/img]You go and see the shop. The wildling truly did a number on the place. And it reeks of... scent markings. It would be a bad look for the company to not handle this issue with great care. You agree to pay for the damages, something most mercenary bands would not have done. This act of kindness does not slip the townspeople by.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Charity through destruction?",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				if (_event.m.Berserker != null)
				{
					this.Characters.push(_event.m.Berserker.getImagePath());
				}

				if (_event.m.Wildman != null && _event.m.Berserker == null)
				{
					this.Characters.push(_event.m.Wildman.getImagePath());
				}

				this.World.Assets.addMoney(-_event.m.Compensation);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]" + _event.m.Compensation + "[/color] Crowns"
				});
			}

		});
		this.m.Screens.push({
			ID = "D",
			Text = "[img]gfx/ui/events/event_20.png[/img]Surveying the damage, you agree to compensate the businessman. But this isn\'t your fault, it\'s the wildling\'s. You dock their pay: for some time to come, the mercenary\'s earnings will be halved. Furthermore, you take what earnings they\'ve made and hand it over to the shop owner. It doesn\'t even begin to cover the damages, but it\'s a start. One is left happy, and another quite disgruntled.\n\nYou tell the wild cretin that now they\'ll think twice about smearing shit all over someone else\'s walls. But the wildling doesn\'t seem to understand you. %wildman% just understands that the gold they once owned has been given to someone else, and eyes its departure with sadness and bottled anger.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Don\'t look at me like that, you know what you did.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.World.Assets.addMoney(-_event.m.Compensation);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]" + _event.m.Compensation + "[/color] Crowns"
				});
				this.Characters.push(_event.m.Wildman.getImagePath());
				_event.m.Wildman.getBaseProperties().DailyWage -= this.Math.floor(_event.m.Wildman.getDailyCost() / 4);
				_event.m.Wildman.getSkills().update();
				this.World.FactionManager.getFaction(_event.m.Town.getFactions()[0]).addPlayerRelation(this.Const.World.Assets.RelationCivilianContractFail, "One of your mercenaries caused havoc in town");
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_daily_money.png",
					text = _event.m.Wildman.getName() + " is now paid [color=" + this.Const.UI.Color.NegativeEventValue + "]" + _event.m.Wildman.getDailyCost() + "[/color] crowns a day"
				});
				_event.m.Wildman.worsenMood(2.0, "Got a pay cut");

				if (_event.m.Wildman.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Wildman.getMoodState()],
						text = _event.m.Wildman.getName() + this.Const.MoodStateEvent[_event.m.Wildman.getMoodState()]
					});
				}
			}

		});
		this.m.Screens.push({
			ID = "X",
			Text = "[img]gfx/ui/events/event_20.png[/img]Surveying the damage, you agree to compensate the businessman. But this isn\'t your fault, it\'s the wildling\'s. You dock their pay: for some time to come, the mercenary\'s earnings will be halved. Furthermore, you take what earnings they\'ve made and hand it over to the shop owner. It doesn\'t even begin to cover the damages, but it\'s a start. One is left happy, and another quite disgruntled.\n\nYou tell the wild cretin that now they\'ll think twice about smearing shit all over someone else\'s walls. But the wildling doesn\'t seem to understand you. %wildman% just understands that the gold they once owned has been given to someone else, and eyes its departure with sadness and bottled anger.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "That was not a good idea...",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.World.Assets.addMoney(-_event.m.Compensation);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]" + _event.m.Compensation + "[/color] Crowns"
				});
				this.Characters.push(_event.m.Berserker.getImagePath());
				_event.m.Berserker.getBaseProperties().DailyWage -= this.Math.floor(_event.m.Berserker.getDailyCost() / 4);
				_event.m.Berserker.getSkills().update();
				this.World.FactionManager.getFaction(_event.m.Town.getFactions()[0]).addPlayerRelation(this.Const.World.Assets.RelationCivilianContractFail, "One of your mercenaries caused havoc in town");
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_daily_money.png",
					text = _event.m.Berserker.getName() + " is now paid [color=" + this.Const.UI.Color.NegativeEventValue + "]" + _event.m.Berserker.getDailyCost() + "[/color] crowns a day"
				});
				_event.m.Berserker.worsenMood(2.0, "Got a pay cut");

				if (_event.m.Berserker.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Berserker.getMoodState()],
						text = _event.m.Berserker.getName() + this.Const.MoodStateEvent[_event.m.Berserker.getMoodState()]
					});
				}

				local brothers = this.World.getPlayerRoster().getAll();

				foreach( bro in brothers )
				{
					if (this.Math.rand(1, 100) <= 75)
					{
						if (this.Math.rand(1, 100) <= 66)
						{
							local injury = bro.addInjury(this.Const.Injury.Brawl);
							this.List.push({
								id = 10,
								icon = injury.getIcon(),
								text = bro.getName() + " suffers " + injury.getNameOnly()
							});
						}
						else
						{
							bro.addLightInjury();
							this.List.push({
								id = 10,
								icon = "ui/icons/days_wounded.png",
								text = bro.getName() + " suffers light wounds"
							});
						}
					}
				}
			}

		});
		this.m.Screens.push({
			ID = "E",
			Text = "[img]gfx/ui/events/event_141.png[/img]While leaving town, you hear a bark over your shoulder. But it is from no dog: you turn \'round to find a number of militiamen converging on the road, fanning out from homes and shops. They say you did that businessman wrong and they won\'t be having your kind in a place like this no more. You can either pay up right now, or they\'ll take it from you by force.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "A shame it had to come to this.",
					function getResult( _event )
					{
						this.World.FactionManager.getFaction(_event.m.Town.getFactions()[0]).addPlayerRelation(this.Const.World.Assets.RelationBetrayal, "You killed some of the militia");
						local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
						properties.CombatID = "Event";
						properties.Music = this.Const.Music.CivilianTracks;
						properties.IsAutoAssigningBases = false;
						properties.Entities = [];
						this.Const.World.Common.addUnitsToCombat(properties.Entities, this.Const.World.Spawn.Militia, this.Math.rand(90, 130), this.Const.Faction.Enemy);
						this.World.State.startScriptedCombat(properties, false, false, true);
						return 0;
					}

				},
				{
					Text = "Fine. I did not wake up this morning looking to slaughter innocents.",
					function getResult( _event )
					{
						return "G";
					}

				}
			],
			function start( _event )
			{
				if (_event.m.Berserker != null)
				{
					this.Characters.push(_event.m.Berserker.getImagePath());
				}

				if (_event.m.Wildman != null && _event.m.Berserker == null)
				{
					this.Characters.push(_event.m.Wildman.getImagePath());
				}
			}

		});
		this.m.Screens.push({
			ID = "G",
			Text = "[img]gfx/ui/events/event_141.png[/img]The men before you are weak and frail, a force cobbled together out of the meek and downtrodden. Nowhere in their ranks is the actual businessman you had trouble with. While you admire their tenacity, you can\'t quite bring yourself to slaughter half a town over a rather small affair. You reach to your side, drawing a few gasps from the poorly armed crowd of men, only to return your hand with a purse in its palm. A deal is struck and the compensation is paid. The townspeople are relieved, though a few of the men are not so happy about backing down from a fight.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "It\'s better this way.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				if (_event.m.Berserker != null)
				{
					this.Characters.push(_event.m.Berserker.getImagePath());
				}

				if (_event.m.Wildman != null && _event.m.Berserker == null)
				{
					this.Characters.push(_event.m.Wildman.getImagePath());
				}

				this.World.Assets.addMoney(-_event.m.Compensation);
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You spend [color=" + this.Const.UI.Color.NegativeEventValue + "]" + _event.m.Compensation + "[/color] Crowns"
				});
				local brothers = this.World.getPlayerRoster().getAll();

				foreach( bro in brothers )
				{
					if (bro.getBackground().isCombatBackground() && this.Math.rand(1, 100) <= 33)
					{
						bro.worsenMood(1.0, "The company backed down from a fight");
					}

					if (bro.getMoodState() < this.Const.MoodState.Neutral)
					{
						this.List.push({
							id = 10,
							icon = this.Const.MoodStateIcon[bro.getMoodState()],
							text = bro.getName() + this.Const.MoodStateEvent[bro.getMoodState()]
						});
					}
				}
			}

		});
	}

	function onUpdateScore()
	{
		if (!this.World.getTime().IsDaytime)
		{
			return;
		}

		if (this.World.Assets.getMoney() < this.m.Compensation)
		{
			return;
		}

		local towns = this.World.EntityManager.getSettlements();
		local nearTown = false;
		local town;
		local playerTile = this.World.State.getPlayer().getTile();

		foreach( t in towns )
		{
			if (t.getTile().getDistanceTo(playerTile) <= 3 && !t.isIsolated())
			{
				nearTown = true;
				town = t;
				break;
			}
		}

		if (!nearTown)
		{
			return;
		}

		this.m.Town = town;
		local brothers = this.World.getPlayerRoster().getAll();
		local candidates_wildmen = [];
		local candidates_berserkers = [];
		local thetraders = [];

		foreach( bro in brothers )
		{
			switch(bro.getBackground().getID())
			{
			case "background.legend_trader":
			case "background.legend_trader_commander":
				thetraders.push(bro);
				break;

			case "background.wildman":
			case "background.wildwoman":
				candidates_wildmen.push(bro);
				break;

			case "background.legend_berserker":
				candidates_berserkers.push(bro);
				break;
			}
		}

		if (candidates_wildmen.len() == 0 && candidates_berserkers.len() == 0)
		{
			return;
		}

		if (candidates_berserkers.len() != 0)
		{
			this.m.Compensation = this.Math.round(1000 + 0.05 * this.World.Assets.getMoney());
			this.m.Berserker = candidates_berserkers[this.Math.rand(0, candidates_berserkers.len() - 1)];
		}

		if (candidates_wildmen.len() != 0)
		{
			this.m.Compensation = this.Math.round(500 + 0.03 * this.World.Assets.getMoney());
			this.m.Wildman = candidates_wildmen[this.Math.rand(0, candidates_wildmen.len() - 1)];
		}

		if (thetraders.len() != 0)
		{
			this.m.Trader = thetraders[this.Math.rand(0, thetraders.len() - 1)];
		}

		this.m.Town = town;
		this.m.Score = 9999;
		this.logDebug(towns);
		this.logDebug(candidates_berserkers);
		this.logDebug(candidates_wildmen);
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"trader",
			this.m.Trader.getNameOnly()
		]);
		_vars.push([
			"berserker",
			this.m.Berserker.getNameOnly()
		]);
		_vars.push([
			"wildman",
			this.m.Wildman.getNameOnly()
		]);
		_vars.push([
			"townname",
			this.m.Town.getName()
		]);
		_vars.push([
			"compensation",
			this.m.Compensation
		]);
	}

	function onClear()
	{
		this.m.Trader = null;
		this.m.Berserker = null;
		this.m.Wildman = null;
		this.m.Town = null;
	}

});

