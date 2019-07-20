this.legend_hunting_skin_ghouls_contract <- this.inherit("scripts/contracts/contract", {
	m = {
		Target = null,
		Dude = null,
		IsPlayerAttacking = false,
		MinStrength = 100,
		Perk = "perk.legend_favoured_enemy_ghoul",
		ValidTypes = this.Const.LegendMod.FavoriteGhoul		
	},
	function create()
	{
		this.contract.create();
		this.m.Type = "contract.legend_hunting_skin_ghouls";
		this.m.Name = "Hunting Skin Ghouls (Legendary)";
		this.m.TimeOut = this.Time.getVirtualTimeF() + this.World.getTime().SecondsPerDay * 7.0;
		this.m.DifficultyMult = this.Math.rand(145, 175) * 0.01;
	}

	function getBanner()
	{
		return "ui/banners/factions/banner_legend_s";
	}

	function onImportIntro()
	{
		this.importSettlementIntro();
	}

	function start()
	{
		this.m.Payment.Pool = 1200 * this.getPaymentMult() * this.Math.pow(this.getDifficultyMult(), this.Const.World.Assets.ContractRewardPOW) * this.getReputationToPaymentMult();

		if (this.Math.rand(1, 100) <= 10)
		{
			this.m.Payment.Completion = 0.9;
			this.m.Payment.Advance = 0.1;
		}
		else
		{
			this.m.Payment.Completion = 1.0;
		}

		this.contract.start();
	}

	function createStates()
	{
		this.m.States.push({
			ID = "Offer",
			function start()
			{
				this.Contract.m.BulletpointsObjectives = [
					"Hunt down skin ghouls around " + this.Contract.m.Home.getName()
				];

				if (this.Math.rand(1, 100) <= this.Const.Contracts.Settings.IntroChance)
				{
					this.Contract.setScreen("Intro");
				}
				else
				{
					this.Contract.setScreen("Task");
				}
			}

			function end()
			{
				this.World.Assets.addMoney(this.Contract.m.Payment.getInAdvance());
				local r = this.Math.rand(1, 100);

				this.Flags.set("StartTime", this.Time.getVirtualTimeF());
				local playerTile = this.World.State.getPlayer().getTile();
				local tile = this.Contract.getTileToSpawnLocation(playerTile, 5, 10);

				local party;
				party = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Beasts).spawnEntity(tile, "Skin Ghouls", false, this.Const.World.Spawn.LegendSkinGhouls, 200 * this.Contract.getDifficultyMult() * this.Contract.getReputationToDifficultyMult());
				party.setDescription("A horde of terrorizing skin ghouls.");
				party.setAttackableByAI(false);
				party.setFootprintSizeOverride(0.75);

				for( local i = 0; i < 2; i = ++i )
				{
					local nearTile = this.Contract.getTileToSpawnLocation(playerTile, 4, 5);

					if (nearTile != null)
					{
						this.Const.World.Common.addFootprintsFromTo(nearTile, party.getTile(), this.Const.BeastFootprints, 0.75);
					}
				}

				this.Contract.m.Target = this.WeakTableRef(party);
				party.getSprite("banner").setBrush("banner_beasts_01");
				local c = party.getController();
				c.getBehavior(this.Const.World.AI.Behavior.ID.Flee).setEnabled(false);
				c.getBehavior(this.Const.World.AI.Behavior.ID.Attack).setEnabled(false);
				local roam = this.new("scripts/ai/world/orders/roam_order");
				roam.setMinRange(2);
				roam.setMaxRange(8);
				roam.setAllTerrainAvailable();
				roam.setTerrain(this.Const.World.TerrainType.Ocean, false);
				roam.setTerrain(this.Const.World.TerrainType.Shore, false);
				roam.setTerrain(this.Const.World.TerrainType.Mountains, false);
				c.addOrder(roam);
				this.Contract.m.Home.setLastSpawnTimeToNow();
				this.Contract.setScreen("Overview");
				this.World.Contracts.setActiveContract(this.Contract);
			}

		});
		this.m.States.push({
			ID = "Running",
			function start()
			{
				if (this.Contract.m.Target != null && !this.Contract.m.Target.isNull())
				{
					this.Contract.m.Target.getSprite("selection").Visible = true;
					this.Contract.m.Target.setOnCombatWithPlayerCallback(this.onTargetAttacked.bindenv(this));
				}
			}

			function update()
			{
				if (this.Contract.m.Target == null || this.Contract.m.Target.isNull() || !this.Contract.m.Target.isAlive())
				{
					this.Contract.setScreen("Victory");

					this.World.Contracts.showActiveContract();
					this.Contract.setState("Return");
				}
				else if (!this.Flags.get("IsBanterShown") && this.Contract.m.Target.isHiddenToPlayer() && this.Math.rand(1, 1000) <= 1 && this.Flags.get("StartTime") + 10.0 <= this.Time.getVirtualTimeF())
				{
					local tileType = this.World.State.getPlayer().getTile().Type;

					this.Flags.set("IsBanterShown", true);
					this.Contract.setScreen("Banter");
					this.World.Contracts.showActiveContract();
		
				}
			}

			function onTargetAttacked( _dest, _isPlayerAttacking )
			{
				if (!this.Flags.get("IsEncounterShown"))
				{
					this.Flags.set("IsEncounterShown", true);
					this.Contract.setScreen("Encounter");
					this.World.Contracts.showActiveContract();
				}
				else
				{
					this.World.Contracts.showCombatDialog(_isPlayerAttacking);
				}
			}

		});
		this.m.States.push({
			ID = "Return",
			function start()
			{
				this.Contract.m.BulletpointsObjectives = [
					"Return to " + this.Contract.m.Home.getName()
				];
				this.Contract.m.Home.getSprite("selection").Visible = true;
			}

			function update()
			{
				if (this.Contract.isPlayerAt(this.Contract.m.Home))
				{
					this.Contract.setScreen("Success");
					this.World.Contracts.showActiveContract();
				}
			}

		});
	}

	function createScreens()
	{
		this.importScreens(this.Const.Contracts.NegotiationDefault);
		this.importScreens(this.Const.Contracts.Overview);
		this.m.Screens.push({
			ID = "Task",
			Title = "Negotiations",
			Text = "[img]gfx/ui/events/event_31.png[/img]{As you approach the keep of %employer% you pass through a courtyard filled with broken down carts and barking dogs pulling at their chains, a gaurd in a stained jerkin sits drinking on the stair, he nods you past. As you enter the keep itself you hear children yelling at each other, before a nasal woman\'s voice cuts through their chatter.%SPEECH_ON%Oi! you lot knock it off, we\'ve got company%SPEECH_OFF% The children protest a little but calm down. A large man waves you over, he is sitting topless by a fireplace eating a large hunk of meat, that has spilled juices on his huge hairy belly %SPEECH_ON%You came then? I thought maybe you were as weak as the rest of them beast hunters. Well I guess you've heard then, we've got a horde of ghould scavengers. They are drawn in by the peasant filth. %SPEECH_OFF%  He wipes his mouth with a hairy arm and takes a huge swig from an ale cask before burping loudly.  %SPEECH_ON%These ain\'t ghouls mind you, they have claws the size of a mans head and arms twice as long as that spear you have there. I know it is a big job, and I\'m prepared to pay you well for it. Interested? %SPEECH_OFF%  | You find %employer% behind the main keep, stretched out on his back under a catapult. You don\'t think he could have seen you from under there, but while still tinkering away he calls out. %SPEECH_ON%Ah, the beast hunters, just the one I wanted to see. We have a bit of a nasty problem.%SPEECH_OFF% He slides out from under the catapult and you see his uncovered chest is smeared with dirt, he pats the device affectionately. %SPEECH_ON%Not the kind of problem Bertha here can fix %SPEECH_OFF%. He pulls a robe over his shoulders and continues as he walks you back to the keep. %SPEECH_ON%We have had skin ghouls in these parts, absolute devestating if they get attack the local farms.  Scary beasts, giant claws and arms that can disembowel a man from across the room. I hear you are the one for the job, and I am prepared to pay handsomely. Are you Interested? %SPEECH_OFF% }",
			Image = "",
			List = [],
			ShowEmployer = true,
			ShowDifficulty = true,
			Options = [
				{
					Text = "{How many crowns can you muster? | Let\'s talk pay. | Let\'s talk crowns.}",
					function getResult()
					{
						return "Negotiation";
					}

				},
				{
					Text = "{This doesn\'t sound like our kind of work.}",
					function getResult()
					{
						this.World.Contracts.removeContract(this.Contract);
						return 0;
					}

				}
			],
			function start()
			{
			}

		});
		this.m.Screens.push({
			ID = "Banter",
			Title = "Along the way...",
			Text = "[img]gfx/ui/events/event_25.png[/img]{You stumble across a dead farmer with its flesh ripped to pieces. %randombrother% crouches and runs and inspects the corpse. %SPEECH_ON%This is clearly the work of a skin ghoul. They\'re close...%SPEECH_OFF% | %randombrother% spits and nods.%SPEECH_ON%Alright. We\'re close. Rather, they\'re close. %SPEECH_OFF%Well that\'s good. Time for the men to find these monsters. }",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Keep your eyes peeled.",
					function getResult()
					{
						return 0;
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "Encounter",
			Title = "As you approach...",
			Text = "[img]gfx/ui/events/legend_skin_ghoul.png[/img]{The horde of skin ghouls suddenly turn as one. They let out a screech unlike anything you've ever heard before. Claws raised before them, the began to swarm towards the company.}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Charge!",
					function getResult()
					{
						this.Contract.getActiveState().onTargetAttacked(this.Contract.m.Target, this.Contract.m.IsPlayerAttacking);
						return 0;
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "Victory",
			Title = "After the battle...",
			Text = "[img]gfx/ui/events/legend_skin_ghoul_dead.png[/img]{The last of the skin ghouls is dealt with. You nod at the company\'s good work then order the men to gather weapons and tend to the wounded, glad these beasts have been vanquished. }",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Let\'s be done with this, we have crowns to collect.",
					function getResult()
					{
						return 0;
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "Success",
			Title = "On your return...",
			Text = "[img]gfx/ui/events/event_85.png[/img]{%employer% meets you at the town entrance and there\'s a crowd of folks beside him. He welcomes you warmly, stating he had a scout following you who saw the whole battle unfold. After he hands you your reward, the townsfolk come forward one by one, many of which are reluctant to stare a sellsword in the eyes, but they offer a few gifts as thanks for relieving them of the skin ghoul horrors. | You have to track down %employer%, ultimately finding the man in a stable livery with a peasant girl. He saws upward from the hay, startling the horses which whinny and stamp their feet. Half-dressed, the man states he already has your pay and forks it over. Eyeing you eyeing the girl, he then starts to grab whatever\'s in reach, including from the saddlebags of stabled mounts, and hands them over.%SPEECH_ON%The, uh, townsfolk also sought to pitch in. You know, as thanks.%SPEECH_OFF%Right. For further \'thanks\' you ask if he\'ll give you whatever\'s in a nearby satchel. | %employer% welcomes you back with a great clap and rub of his hands, as though you\'d just brought in a turkey and not the horrifying evidence of your victory. After paying you the agreed reward, you hear some surprising news. The mayor states that the estate of a lost townsman could not be properly divvied up and, as further thanks, you\'re free to take what\'s left of it.}",
			Image = "",
			Characters = [],
			List = [],
			ShowEmployer = true,
			Options = [
				{
					Text = "A successful hunt.",
					function getResult()
					{
						this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractSuccess);
						this.World.Assets.addMoney(this.Contract.m.Payment.getOnCompletion());
						this.World.FactionManager.getFaction(this.Contract.getFaction()).addPlayerRelation(this.Const.World.Assets.RelationCivilianContractSuccess, "Rid the town of skin ghouls");
						this.World.Contracts.finishActiveContract();
						return 0;
					}

				}
			],
			function start()
			{
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]" + this.Contract.m.Payment.getOnCompletion() + "[/color] Crowns"
				});
				this.Contract.m.SituationID = this.Contract.resolveSituation(this.Contract.m.SituationID, this.Contract.m.Home, this.List);
			}

		});
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"direction",
			this.m.Target == null || this.m.Target.isNull() ? "" : this.Const.Strings.Direction8[this.m.Home.getTile().getDirection8To(this.m.Target.getTile())]
		]);
	}

	function onHomeSet()
	{
		if (this.m.SituationID == 0)
		{
			this.m.SituationID = this.m.Home.addSituation(this.new("scripts/entity/world/settlements/situations/disappearing_villagers_situation"));
		}
	}

	function onClear()
	{
		if (this.m.IsActive)
		{
			if (this.m.Target != null && !this.m.Target.isNull())
			{
				this.m.Target.getSprite("selection").Visible = false;
				this.m.Target.setOnCombatWithPlayerCallback(null);
			}

			this.m.Home.getSprite("selection").Visible = false;
		}

		if (this.m.Home != null && !this.m.Home.isNull() && this.m.SituationID != 0)
		{
			local s = this.m.Home.getSituationByInstance(this.m.SituationID);

			if (s != null)
			{
				s.setValidForDays(3);
			}
		}
	}

	function onIsValid()
	{
		foreach( bro in this.World.getPlayerRoster().getAll() )
		{
			if (!bro.getSkills().hasSkill(this.m.Perk))
			{
				continue;
			}

			local stats = this.Const.LegendMod.GetFavoriteEnemyStats(bro, this.m.ValidTypes);
			if (stats.Strength >= this.m.MinStrength) 
			{
				return true;
			}
		}
		return false;
	}

	function onSerialize( _out )
	{
		if (this.m.Target != null && !this.m.Target.isNull())
		{
			_out.writeU32(this.m.Target.getID());
		}
		else
		{
			_out.writeU32(0);
		}

		this.contract.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		local target = _in.readU32();

		if (target != 0)
		{
			this.m.Target = this.WeakTableRef(this.World.getEntityByID(target));
		}

		this.contract.onDeserialize(_in);
	}

});

