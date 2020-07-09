this.legend_custom_scenario_intro <- this.inherit("scripts/events/event", {
	m = {
		PartySize =  1,
		Background = "beggar_background",
		Dude = null

	},
	function create()
	{
		this.m.ID = "event.legend_custom_scenario_intro";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
        	Text = "[img]gfx/ui/events/event_128.png[/img]Think back to your past. Where were your formative years spent? ",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Fighting to survive",
					function getResult( _event )
					{
						return "B";
					}

				},
				{
					Text = "Scrounging for food",
					function getResult( _event )
					{
						return "C";
					}

				},
				{
					Text = "Studying books",
					function getResult( _event )
					{
						return "D";
					}

				},
								{
					Text = "Studying books",
					function getResult( _event )
					{
						return "D";
					}

				},
								{
					Text = "Studying books",
					function getResult( _event )
					{
						return "D";
					}

				},
								{
					Text = "Studying books",
					function getResult( _event )
					{
						return "D";
					}

				},

				{
					Text = "Learning a skill",
					function getResult( _event )
					{
						return "E";
					}

				}
			],
			function start( _event )
			{
			}
		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_25.png[/img]The gnawing hunger in your belly drove you to hunt and kill. The path of a hunter was unavoidable, but each person finds their own meaning. What did you discover?",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "War keeps you fed",
					function getResult( _event )
					{
						return "F";
						_event.m.Background = "legend_noble_ranged";
					}

				},
				{
					Text = "The forest is home",
					function getResult( _event )
					{
						return "B1";
					}

				},
				{
					Text = "There is game in the city",
					function getResult( _event )
					{
						return "F";
						_event.m.Background = "ratcatcher_background";
					}

				},
				{
					Text = "Big enemies, big rewards",
					function getResult( _event )
					{
						return "F";
						_event.m.Background = "beast_hunter_background";
					}

				}
			],
			function start( _event )
			{
			}

		});

	this.m.Screens.push({
			ID = "B1",
			Text = "[img]gfx/ui/events/event_25.png[/img]Deep in the forest you found what you sought.  What was your decision?",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "To protect the land from humans",
					function getResult( _event )
					{
						return "F";
						_event.m.Background = "legend_ranger_background";
					}

				},
				{
					Text = "To hunt big game",
					function getResult( _event )
					{
						return "F";
						_event.m.Background = "hunter_background";
					}

				},
				{
					Text = "To hunt small game",
					function getResult( _event )
					{
						return "F";
						_event.m.Background = "poacher_backgroundd";
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/event_25.png[/img]The cruelty of the world was baked into you young. The path of a fighter was chosen for you, but each person finds their own meaning. What did you discover?",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Glory of war",
					function getResult( _event )
					{
						return "F";
						_event.m.Background = "retired_soldier_background";
					}

				},
				{
					Text = "Joy among suffering",
					function getResult( _event )
					{
						return "F";
						_event.m.Background = "raider_background";
					}

				},
				{
					Text = "Strength through adversity",
					function getResult( _event )
					{
						return "F";
						_event.m.Background = "wildman_background";
					}

				},
				{
					Text = "Skill from practice",
					function getResult( _event )
					{
						return "F";
						_event.m.Background = "swordmaster_background";
					}

				}
			],
			function start( _event )
			{
			}

		});
	this.m.Screens.push({
			ID = "D",
			Text = "[img]gfx/ui/events/event_25.png[/img]The love of knowledge consumed your youth. Teachers and books pass on thought, but each person finds their own meaning. What did you discover?",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Purity of Faith",
					function getResult( _event )
					{
						return "F";
						_event.m.Background = "monk_background";
					}

				},
				{
					Text = "Inevitability of Death",
					function getResult( _event )
					{
						return "F";
						_event.m.Background = "legend_necromancer_background";
					}

				},
				{
					Text = "The alure of power",
					function getResult( _event )
					{
						return "F";
						_event.m.Background = "legend_witch_background";
					}

				},
				{
					Text = "The wisdom of nature",
					function getResult( _event )
					{
						return "F";
						_event.m.Background = "legend_druid_background";
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "E",
			Text = "[img]gfx/ui/events/event_25.png[/img]Your work became your passion, driving you to produce. The craft may define the tools, but each person finds their own meaning. What did you discover?",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "The strength of iron",
					function getResult( _event )
					{
						return "F";
						_event.m.Background = "legend_blacksmith_background";
					}

				},
				{
					Text = "The beauty of song",
					function getResult( _event )
					{
						return "F";
						_event.m.Background = "minstrel_background";
					}

				},
				{
					Text = "The pull of coin",
					function getResult( _event )
					{
						return "F";
						_event.m.Background = "legend_trader_background";
					}

				},
				{
					Text = "The power of a tool",
					function getResult( _event )
					{
						return "F";
						_event.m.Background = "apprentice_background";
					}

				}
			],
			function start( _event )
			{
			}

		});
		this.m.Screens.push({
			ID = "F",
			Text = "[img]gfx/ui/events/event_25.png[/img]Your work became your passion, driving you to produce. The craft may define the tools, but each person finds their own meaning. What did you discover?",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "That is all",
					function getResult( _event )
					{
						local roster = this.World.getTemporaryRoster();
						_event.m.Dude = roster.create("scripts/entity/tactical/player");
						_event.m.Dude.setStartValuesEx([_event.m.Background]);
						this.World.getPlayerRoster().add(_event.m.Dude);
						//item
						_event.m.Dude.getSkills().add(this.new("scripts/skills/traits/hate_greenskins_trait"));
						local necklace = this.new("scripts/items/accessory/special/slayer_necklace_item");
						necklace.m.Name = _event.m.Dude.getNameOnly() + "\'s Necklace";
						_event.m.Dude.getItems().equip(necklace);

						this.World.getTemporaryRoster().clear();
						_event.m.Dude.onHired();
						return 0;

						foreach( bro in bros )
						{
							local val = this.World.State.addNewID(bro);
							bro.m.CompanyID = val;
						}

						if (this.Const.LegendMod.Configs.RelationshipsEnabled())
						{
						local avgAlignment = 0;
							foreach (bro in this.World.getPlayerRoster().getAll())
							{
								if (bro.getAlignment() <= this.Const.LegendMod.Alignment.NeutralMin)
								{
									avgAlignment += (bro.getAlignment() - this.Const.LegendMod.Alignment.NeutralMin);
								}
								else if (bro.getAlignment() >= this.Const.LegendMod.Alignment.NeutralMax)
								{
									avgAlignment += (bro.getAlignment() - this.Const.LegendMod.Alignment.NeutralMax);
								}
							}
						avgAlignment *= (10 / this.World.getPlayerRoster().getSize());
						this.World.Assets.addMoralReputation(avgAlignment);
						}
					}
				},
				{
					Text = "I have another companion",
					function getResult( _event )
					{
					local roster = this.World.getTemporaryRoster();
					_event.m.Dude = roster.create("scripts/entity/tactical/player");
					_event.m.Dude.setStartValuesEx([_event.m.Background]);
					this.World.getPlayerRoster().add(_event.m.Dude);
					//item
					_event.m.Dude.getSkills().add(this.new("scripts/skills/traits/hate_greenskins_trait"));
					local necklace = this.new("scripts/items/accessory/special/slayer_necklace_item");
					necklace.m.Name = _event.m.Dude.getNameOnly() + "\'s Necklace";
					_event.m.Dude.getItems().equip(necklace);

					this.World.getTemporaryRoster().clear();
					_event.m.Dude.onHired();
					_event.m.PartySize += 1;
					_event.m.Dude = null;
					return "A";
					}

				}
			],
			function start( _event )
			{



			}

		});
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepare()
	{
		this.m.Title = "The Outset";
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"home",
			this.World.Tags.get("HomeVillage")
		]);
	}

	function onClear()
	{
	}

});