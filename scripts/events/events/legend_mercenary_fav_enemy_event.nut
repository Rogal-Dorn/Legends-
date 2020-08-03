this.legend_mercenary_fav_enemy_event <- this.inherit("scripts/events/event", {
	m = {
		Stats = null,
		MinStrength = 100,
		Flags = null,
		Perk = "perk.legend_favoured_enemy_mercenary",
		ValidTypes = this.Const.LegendMod.FavoriteMercenary
	},
	function create()
	{
		this.m.ID = "event.devparty";
		this.m.Title = "As you approach...";
		this.m.Cooldown = 100.0 * this.World.getTime().SecondsPerDay;

		this.m.Screens.push({
			ID = "A1",
            Text = "{LET\'S GO FUNNY EVENT GOOD LUCK}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				_event.m.Title = "While marching...";
                this.Options.push({
                    Text = "Alright, teach these buggers a lesson.",
                    function getResult( _event )
                    {
                        return "Y";
                    }
                });
                this.Options.push({
                    Text = "Actually, maybe we should leave."
                    function getResult( _event )
                    {
                        return 0;
                    }
                });
			}
		});
		this.m.Screens.push({
			ID = "Y",
			Text = "{Funny event we said yes on}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "",
					function getResult( _event )
					{
						local tile = this.World.State.getPlayer().getTile();
						local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
						properties.Music = this.Const.Music.BanditTracks;
                        properties.TerrainTemplate = this.Const.World.TerrainTacticalTemplate[tile.TacticalType];
                        properties.Tile = this.World.State.getPlayer().getTile();
                        properties.CombatID = "LegendsDev";
                        properties.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Line;
                        properties.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Line;

                        foreach(bro in this.World.getPlayerRoster().getAll())
                            properties.Players.push(bro);		

						properties.IsUsingSetPlayers = true;
						properties.IsFleeingProhibited = true;
						properties.IsAttackingLocation = true;
						properties.BeforeDeploymentCallback = function ()
						{
							local size = this.Tactical.getMapSize();

							for( local x = 0; x < size.X; x = ++x )
							{
								for( local y = 0; y < size.Y; y = ++y )
								{
									local tile = this.Tactical.getTileSquare(x, y);
									tile.Level = this.Math.min(1, tile.Level);
								}
							}
						};
                        	
						properties.Entities = [];
						properties.Entities.push({
								ID = this.Const.EntityType.Mercenary,
								Variant = 0,
								Row = 0,
								Name = "Karl",
								Script = "scripts/entity/tactical/humans/special/mercenary_karl",
								Faction = this.Const.Faction.Enemy
								function Callback( _entity, _tag )
								{
									_entity.setName("Karl");
								}							
						});
						properties.Entities.push({
								ID = this.Const.EntityType.Mercenary,
								Variant = 0,
								Row = 0,
								Name = "Mwah ILY",
								Script = "scripts/entity/tactical/humans/special/mercenary_mwah",
								Faction = this.Const.Faction.Enemy
								function Callback( _entity, _tag )
								{
									_entity.setName("Mwah ILY");
								}							
						});
						properties.Entities.push({
								ID = this.Const.EntityType.Mercenary,
								Variant = 0,
								Row = 0,
								Name = "Freykin",
								Script = "scripts/entity/tactical/humans/special/mercenary_freykin",
								Faction = this.Const.Faction.Enemy
								function Callback( _entity, _tag )
								{
									_entity.setName("Freykin");
								}							
						});
						properties.Entities.push({
								ID = this.Const.EntityType.LegendSkinGhoul,
								Variant = 0,
								Row = 0,
								Name = "Luft the Mascot",
								Script = "scripts/entity/tactical/enemies/legend_skin_ghoul",
								Faction = this.Const.Faction.Enemy
								function Callback( _entity, _tag )
								{
									_entity.setName("Luft the Mascot");
									local helm = this.new("scripts/items/helmets/named/jugglers_hat");
									helm.m.ConditionMax = 125;
									helm.m.Condition = 125;
									helm.m.IsDroppedAsLoot = false;
									_entity.addSprite("helmet");
									_entity.m.Items.equip(helm); //todo: change to layer later
									_entity.getSprite("helmet").Visible = true;
									_entity.getSprite("helmet").setHorizontalFlipping(true);
									_entity.setSpriteOffset("helmet", this.createVec(0, -5));
								}							
						});
						properties.Entities.push({
								ID = this.Const.EntityType.Mercenary,
								Variant = 0,
								Row = 0,
								Name = "\'Bandit Rabble\' Poss",
								Script = "scripts/entity/tactical/humans/special/mercenary_poss",
								Faction = this.Const.Faction.Enemy
								function Callback( _entity, _tag )
								{
									_entity.setName("\'Bandit Rabble\' Poss");
								}							
						});
						properties.Entities.push({
								ID = this.Const.EntityType.Mercenary,
								Variant = 0,
								Row = 0,
								Name = "Cultscidon the Bringer of Darkness",
								Script = "scripts/entity/tactical/humans/special/mercenary_culty",
								Faction = this.Const.Faction.Enemy
								function Callback( _entity, _tag )
								{
									_entity.setName("Cultscidon the Bringer of Darkness");
								}							
						});
						properties.Entities.push({
								ID = this.Const.EntityType.Mercenary,
								Variant = 0,
								Row = 0,
								Name = "Forest Wraith",
								Script = "scripts/entity/tactical/humans/special/mercenary_forest",
								Faction = this.Const.Faction.Enemy
								function Callback( _entity, _tag )
								{
									_entity.setName("Forest Wraith");
								}							
						});
						properties.Entities.push({
								ID = this.Const.EntityType.Mercenary,
								Variant = 0,
								Row = 0,
								Name = "Rue the Jester",
								Script = "scripts/entity/tactical/humans/special/mercenary_rue",
								Faction = this.Const.Faction.Enemy
								function Callback( _entity, _tag )
								{
									_entity.setName("Rue the Jester");
								}							
						});

						// properties.Entities.push({
                        //     ID = this.Const.EntityType.Mercenary,
                        //     Variant = 1,
                        //     Row = 0,
                        //     Script = "scripts/entity/tactical/humans/special/mercenary_mwah",
                        //     Faction = this.Const.Faction.Enemy
                        //     function Callback( _entity, _tag )
                        //     {
                        //         _entity.setName("Mwah I Love You");
                        //     }							
                        // });
		
						// properties.Entities.push({
                        //     ID = this.Const.EntityType.BanditLeader,
                        //     Variant = 1,
                        //     Row = 0,
                        //     Script = "scripts/entity/tactical/enemies/bandit_leader",
                        //     Faction = this.Const.Faction.Enemy
                        //     function Callback( _entity, _tag )
                        //     {
                        //         _entity.setName(name);
                        //     }							
                        // });
		
						// properties.Entities.push({
                        //     ID = this.Const.EntityType.HedgeKnight,
                        //     Variant = 1,
                        //     Row = 0,
                        //     Script = "scripts/entity/tactical/humans/hedge_knight",
                        //     Faction = this.Const.Faction.Enemy
                        //     function Callback( _entity, _tag )
                        //     {
                        //         _entity.setName(name);
                        //     }							
                        // });

                       
						_event.registerToShowAfterCombat("Victory", "Defeat");
						this.World.State.startScriptedCombat(properties, false, false, false);
						return 0;
					}

				}
			],
			function start( _event )
			{
				_event.m.Title = "The fight!";
				this.Options[0].Text = "LET\'S GOOOOOOOOOO!";
			}

		});		
		this.m.Screens.push({
			ID = "Victory",
			Text = "{faty win lets go}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "You won! Wheeeeee!.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				_event.m.Title = "After the battle...";
				this.World.Assets.addBusinessReputation(500);
				this.List = [
					{
						id = 10,
						icon = "ui/icons/special.png",
						text = "The company gained renown"
					}
				];
				
				local playerRoster = this.World.getPlayerRoster().getAll();

				foreach(bro in playerRoster)
				{
					bro.improveMood(0.5, "You beat the devs! You sorta won!");	

					if (bro.getMoodState() > this.Const.MoodState.Neutral)
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
		this.m.Screens.push({
			ID = "Defeat",
			Text = "{u lost lol}",
			Image = "",
			List = [],
			Characters = [],
			Options = [],
			function start( _event )
			{
				_event.m.Title = "After the battle...";
				this.Options.push({
					Text = "Ah that sucks!",
					function getResult( _event )
					{
						return 0;
					}

				});
			}

		});
	}

	function onUpdateScore()
	{
		//keep this uncommented if we need to push some of my other changes, then none of the custom mercenary stuff matters, atm this is mostly testing and will be moved to a location later
		// return; 
		if (!this.World.getTime().IsDaytime) { return; }

		local towns = this.World.EntityManager.getSettlements();
		local town = null;
		local playerTile = this.World.State.getPlayer().getTile();

		foreach( t in towns )
		{
			if (t.getTile().getDistanceTo(playerTile) <= 10 && !t.isIsolated())
			{
				town = t;
				break;
			}
		}

		if (town == null) {	return; }
		

        foreach( bro in this.World.getPlayerRoster().getAll() )
        {		
            if (!bro.getSkills().hasSkill("perk.legend_favoured_enemy_mercenary")) { continue; }

			local stats = this.Const.LegendMod.GetFavoriteEnemyStats(bro, this.Const.LegendMod.FavoriteMercenary);

			if (stats.Strength < this.m.MinStrength) { continue; }
			
			this.m.Stats = this.Math.floor(stats.Strength);
		}
		if (this.m.Stats == null)
		{
			// return;
			this.m.Score = 9999;
		}
		else
		{
			this.m.Score = 9999 + this.m.Stats * 0.1;
		}
 	}

	function onPrepare()
	{
		this.m.Flags = this.new("scripts/tools/tag_collection");	
	}


	function onDetermineStartScreen()
	{
        return "A1"
	}

	function onClear()
	{
		this.m.Stats = null;
		this.m.MinStrength = null;
		this.m.Perk = null;
		this.m.ValidTypes = null;
	}	
});

