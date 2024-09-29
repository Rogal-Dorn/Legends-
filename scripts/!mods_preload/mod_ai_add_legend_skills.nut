this.getroottable().Const.LegendMod.hookAISkills <- function()
{
	::mods_hookExactClass("ai/tactical/behaviors/ai_flee", function(o)
	{
		o.onExecute = function( _entity )
		{
			if (!_entity.isAlive() || _entity.isNull())
			{
				this.getAgent().setFinished(true);
				return true;
			}
			if (this.m.TargetTile != null)
			{
				local navigator = this.Tactical.getNavigator();

				if (this.m.IsFirstExecuted)
				{
					this.getAgent().getOrders().IsRetreating = true;
					local settings = navigator.createSettings();
					settings.ActionPointCosts = _entity.getActionPointCosts();
					settings.FatigueCosts = _entity.getFatigueCosts();
					settings.FatigueCostFactor = this.Const.Movement.FatigueCostFactor;
					settings.ActionPointCostPerLevel = _entity.getLevelActionPointCost();
					settings.FatigueCostPerLevel = _entity.getLevelFatigueCost();
					settings.AllowZoneOfControlPassing = true;
					settings.ZoneOfControlCost = this.Const.AI.Behavior.ZoneOfControlAPPenalty * 2;
					settings.AlliedFactions = _entity.getAlliedFactions();
					settings.Faction = _entity.getFaction();

					if (this.Const.AI.VerboseMode)
					{
						this.logInfo("* " + this.getAgent().getActor().getName() + ": Fleeing.");
					}

					navigator.findPath(_entity.getTile(), this.m.TargetTile, settings, 0);

					if (this.Const.AI.PathfindingDebugMode)
					{
						navigator.buildVisualisation(_entity, settings, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue());
					}

					local movement = navigator.getCostForPath(_entity, settings, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue());
					this.m.Agent.adjustCameraToDestination(movement.End);

					if (this.Tactical.State.getStrategicProperties() != null && this.Tactical.State.getStrategicProperties().IsArenaMode)
					{
						this.Sound.play(this.Const.Sound.ArenaFlee[this.Math.rand(0, this.Const.Sound.ArenaFlee.len() - 1)], this.Const.Sound.Volume.Tactical * this.Const.Sound.Volume.Arena);
					}

					this.m.IsFirstExecuted = false;
				}

				if (!navigator.travel(_entity, _entity.getActionPoints(), _entity.getFatigueMax() - _entity.getFatigue()))
				{
					if (_entity.isAlive() && !_entity.isNull())
					{
						if (_entity.isPlayerControlled())
						{
							_entity.setDirty(true);
						}

						if (!_entity.isHiddenToPlayer())
						{
							this.getAgent().declareAction();
						}
					}

					this.m.TargetTile = null;
					return true;
				}
				else
				{
					return false;
				}
			}

			this.getAgent().setFinished(true);
			return true;
		}
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_alp_teleport", function(o)
	{
		o.onEvaluate = function( _entity )
		{
			local score = this.getProperties().BehaviorMult[this.m.ID];
			this.m.TargetTile = null;
			this.m.SelectedSkill = null;

			if (_entity.getCurrentProperties().IsRooted)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			if (_entity.getCurrentProperties().IsStunned)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			if (this.getAgent().getBehavior(this.Const.AI.Behavior.ID.Retreat) != null && this.getAgent().getBehavior(this.Const.AI.Behavior.ID.Retreat).getScore() > 0)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			if (this.Tactical.TurnSequenceBar.getActiveEntity() != null && this.Tactical.TurnSequenceBar.getActiveEntity().getID() == _entity.getID())
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			local skills = [];

			foreach( skillID in this.m.PossibleSkills )
			{
				local skill = _entity.getSkills().getSkillByID(skillID);

				if (skill != null && skill.isUsable() && skill.isAffordable())
				{
					this.m.SelectedSkill = skill;
					break;
				}
			}

			if (this.m.SelectedSkill == null)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			local myTile = _entity.getTile();
			local potentialDestinations = [];

			if (this.Const.Tactical.Actor.Alp.TeleportTargets.len() == 0 || this.Const.Tactical.Actor.Alp.TeleportFrame != this.Time.getFrame())
			{
				this.Const.Tactical.Actor.Alp.TeleportTargets = [];
				this.Const.Tactical.Actor.Alp.TeleportFrame = this.Time.getFrame();
				this.getStrategy().cleanUpKnownOpponents();
				this.getStrategy().compileKnownOpponents();
				local targets = this.getAgent().getKnownOpponents();

				foreach( t in targets )
				{
					if (t.Actor.isNull())
					{
						continue;
					}

					local targetValue = this.queryTargetValue(_entity, t.Actor);

					if (t.Actor.getCurrentProperties().IsStunned && t.Actor.getSkills().hasSkill("effects.sleeping"))
					{
						targetValue = targetValue * 1.5;
					}

					if (t.Actor.getCurrentProperties().MoraleCheckBraveryMult[1] > 0.0)
					{
						targetValue = targetValue / t.Actor.getCurrentProperties().MoraleCheckBraveryMult[1];
					}

					local potentialTiles = this.queryDestinationsInRange(t.Actor.getTile(), this.getProperties().EngageRangeMin, this.getProperties().EngageRangeMax);

					foreach( tile in potentialTiles )
					{
						if (!tile.IsEmpty || tile.Type == this.Const.Tactical.TerrainType.Impassable)
						{
							continue;
						}

						local score = 60.0 + 40.0 * targetValue;
						score = score - tile.getZoneOfOccupationCountOtherThan(_entity.getAlliedFactions()) * 20.0;
						score = score + tile.TVTotal;
						score = score - (this.hasNegativeTileEffect(tile, _entity) ? 40.0 : 0.0);

						foreach( o in targets )
						{
							if (o.Actor.isNull() || o.Actor.getID() == t.Actor.getID())
							{
								continue;
							}

							if (o.Actor.getMoraleState() == this.Const.MoraleState.Fleeing || o.Actor.getCurrentProperties().IsStunned)
							{
								continue;
							}

							local d = o.Actor.getTile().getDistanceTo(tile);

							if (d <= 3)
							{
								score = score - 5.0;
							}
						}

						this.Const.Tactical.Actor.Alp.TeleportTargets.push({
							Tile = tile,
							Score = score
						});
					}
				}
			}

			foreach( pd in this.Const.Tactical.Actor.Alp.TeleportTargets )
			{
				if (!pd.Tile.IsEmpty || pd.Tile.Type == this.Const.Tactical.TerrainType.Impassable)
				{
					continue;
				}

				local score = pd.Score;

				for( local i = 0; i < 6; i = ++i )
				{
					if (!pd.Tile.hasNextTile(i))
					{
					}
					else
					{
						local nextTile = pd.Tile.getNextTile(i);

						if (nextTile.IsOccupiedByActor && nextTile.getEntity().getType() == this.Const.EntityType.Alp)
						{
							score = score - 10.0;
						}
					}
				}

				potentialDestinations.push({
					Tile = pd.Tile,
					Score = score
				});
			}

			if (potentialDestinations.len() == 0)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			potentialDestinations.sort(this.onSortByScore);
			this.m.TargetTile = potentialDestinations[0].Tile;
			return this.Const.AI.Behavior.Score.AlpTeleport * score;
		}
	});
	::mods_hookExactClass("ai/tactical/behaviors/ai_attack_default", function(o) 
	{
		o.m.PossibleSkills.extend([
			"actives.cat_bite",
			"actives.legend_staff_bash",
			"actives.legend_skin_ghoul_claws",
			"actives.legend_white_wolf_bite",
			"actives.legend_redback_spider_bite",
			"actives.legend_great_slash",
			"actives.legend_glaive_slash",
			"actives.legend_chain_flail",
			"actives.legend_demon_hound_bite",
			"actives.legend_ranged_flail",
			"actives.legend_halberd_impale",
			"actives.legend_voulge_cleave",
			"actives.legend_horse_kick",
			"actives.legend_donkey_kick",
			"actives.legend_bear_bite",
			"actives.legend_bear_claws",
			"actives.legend_flaggelate",
			"actives.legend_boar_gore",
			"actives.legend_rat_claws",
			"actives.legend_rat_bite",
			"actives.legend_en_garde",
			"actives.lunge",
			"actives.nightmare_touch",
			"actives.legend_basilisk_peck",
			"actives.legend_basilisk_sentry_inject",
			"actives.legend_basilisk_sentry_fowleye",
		]);
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_attack_bow", function(o) 
	{
		o.m.PossibleSkills.extend([
			"actives.legend_catapult_boulder",
			"actives.legend_sling_heavy_stone",
			"actives.legend_shoot_dart"
		]);
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_adrenaline", function(o) 
	{
		o.m.PossibleSkills.extend([
			"actives.adrenaline",
			"actives.legend_transform_into_bear"
		]);
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_attack_crush_armor", function(o) 
	{
		o.m.PossibleSkills.push("actives.legend_halberd_smite");
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_attack_decapitate", function(o) 
	{
		o.m.PossibleSkills.push("actives.legend_voulge_decapitate");
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_attack_lash", function(o) 
	{
		o.m.PossibleSkills.push("actives.legend_ranged_lash");
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_attack_thresh", function(o)
	{
		o.m.PossibleSkills.push("actives.legend_chain_thresh");
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_attack_swallow_whole", function(o) 
	{
		o.m.PossibleSkills.push("actives.legend_skin_ghoul_swallow_whole");
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_attack_terror", function(o) 
	{
		o.m.PossibleSkills.extend([
			"actives.legend_banshee_scream",
			"actives.legend_horrific_scream"
		]);
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_boost_stamina", function(o) 
	{
		o.m.PossibleSkills.extend([
			"actives.legend_drums_of_life",
			"actives.legend_drums_of_war",
			"actives.legend_push_forward",
			"actives.legend_hold_the_line"
		]);
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_buff_howl", function(o) 
	{
		o.m.PossibleSkills.push("actives.legend_white_wolf_howl");
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_charge", function(o) 
	{
		o.m.PossibleSkills.extend([
			"actives.charge",
			"actives.unstoppable_charge",
			"actives.legend_horse_charge"
		]);
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_charm", function(o) 
	{
		o.m.PossibleSkills.push("actives.legend_intensely_charm");

		o.onEvaluate = function( _entity )
		{
			// Function is a generator.
			this.m.Skill = null;
			this.m.TargetTile = null;
			this.m.Danger = null;
			this.m.ScoreBonus = 0.0;
			local score = this.getProperties().BehaviorMult[this.m.ID];

			if (_entity.getActionPoints() < this.Const.Movement.AutoEndTurnBelowAP)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			if (!this.getAgent().hasKnownOpponent())
			{
				return this.Const.AI.Behavior.Score.Zero;
			}
			if (this.getAgent().getKnownOpponents().len() <= 1)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}
			this.m.Skill = this.selectSkill(this.m.PossibleSkills);

			if (this.m.Skill == null)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			score = score * this.getFatigueScoreMult(this.m.Skill);
			local opponents = this.getAgent().getKnownOpponents();
			local func = this.calculateDanger(_entity, opponents);

			while (resume func == null)
			{
				yield null;
			}

			local func = this.findBestTarget(_entity, opponents);

			while (resume func == null)
			{
				yield null;
			}

			if (this.m.TargetTile == null)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			this.m.Danger = null;
			return this.Const.AI.Behavior.Score.Charm * score + this.m.ScoreBonus;
		}
	});

	// ::mods_hookExactClass("ai/tactical/behaviors/ai_corruption", function(o)
	// {
	// 	o.m.PossibleSkills.push("actives.legend_demon_shadows");
	// });

	::mods_hookExactClass("ai/tactical/behaviors/ai_darkflight", function(o) 
	{
		o.m.PossibleSkills.push("actives.legend_teleport");
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_defend_knock_back", function ( o ) 
	{
		o.m.PossibleSkills.extend([
			"actives.legend_revolt",
			"actives.legend_push",
			"actives.legend_chain_hook"
		]);
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_defend_riposte", function(o) 
	{
		o.m.PossibleSkills.extend([
			"actives.legend_staff_riposte",
			"actives.return_favor"
		]);
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_defend_rotation", function(o)
	{
		if (::Legends.Mod.ModSettings.getSetting("DisableAiRotation").getValue())
			o.m.PossibleSkills = [];

		o.onEvaluate = function( _entity )
		{
			// Function is a generator.
			this.m.TargetTile = null;
			this.m.Skill = null;
			local scoreMult = this.getProperties().BehaviorMult[this.m.ID];
			local time = this.Time.getExactTime();

			if (_entity.getActionPoints() < this.Const.Movement.AutoEndTurnBelowAP)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			if (!this.getAgent().hasVisibleOpponent())
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			if (this.getAgent().getIntentions().IsChangingWeapons && _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getRangeMax() > 2)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			this.m.Skill = this.selectSkill(this.m.PossibleSkills);

			if (this.m.Skill == null)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			scoreMult = scoreMult * this.getFatigueScoreMult(this.m.Skill);
			local allies = this.queryAlliesInMeleeRange();

			if (allies.len() == 0)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			local myTile = _entity.getTile();
			local zoc = _entity.getTile().getZoneOfOccupationCountOtherThan(_entity.getAlliedFactions());
			local isOffensive = this.m.Skill.getID() == "actives.barbarian_fury";
			local hitpointRatio = (_entity.getHitpoints() + _entity.getArmor(this.Const.BodyPart.Body) + _entity.getArmor(this.Const.BodyPart.Head)) / (_entity.getHitpointsMax() + _entity.getArmorMax(this.Const.BodyPart.Body) + _entity.getArmorMax(this.Const.BodyPart.Head));
			local isEntityWounded = false;

			if (hitpointRatio <= 0.5)
			{
				isEntityWounded = true;
			}

			local isEntityArmedWithShield = _entity.isArmedWithShield();
			local isEntityExpendable = _entity.getCurrentProperties().TargetAttractionMult <= 0.5;
			local isEntityRangedUnit = this.isRangedUnit(_entity);
			local isEntityArmedWithMeleeWeapon = true;

			if (isEntityRangedUnit)
			{
				isEntityArmedWithMeleeWeapon = false;
			}
			else if (_entity.isArmedWithMeleeWeapon() && _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getRangeMax() > 1)
			{
				isEntityArmedWithMeleeWeapon = false;
			}

			local isEntitySupport = _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isItemType(this.Const.Items.ItemType.Misc);
			local attackSkill = _entity.getSkills().getAttackOfOpportunity();
			local apRequiredForAttack = attackSkill != null ? attackSkill.getActionPointCost() : 4;
			local isEntityAOE = isEntityArmedWithMeleeWeapon && _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isItemType(this.Const.Items.ItemType.Weapon) && _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isAoE();
			local isEntityTwoHanded = isEntityArmedWithMeleeWeapon && _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isItemType(this.Const.Items.ItemType.Weapon) && _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isItemType(this.Const.Items.ItemType.TwoHanded);
			local currentPotentialTargets = this.queryTargetsInMeleeRange(this.getProperties().EngageRangeMin, this.Math.max(_entity.getIdealRange(), this.getProperties().EngageRangeMax), 1, myTile);
			local currentBestTarget = this.queryBestMeleeTarget(_entity, null, currentPotentialTargets);
			local targets = this.getAgent().getKnownOpponents();
			local dirs = [
				0,
				0,
				0,
				0,
				0,
				0
			];

			foreach( opponent in targets )
			{
				local dir = myTile.getDirection8To(opponent.Actor.getTile());
				local mult = this.isRangedUnit(opponent.Actor) ? 2 : 1;
				mult = mult * (7.0 / myTile.getDistanceTo(opponent.Actor.getTile()));

				switch(dir)
				{
				case this.Const.Direction8.W:
					dirs[this.Const.Direction.NW] += 4 * mult;
					dirs[this.Const.Direction.SW] += 4 * mult;
					break;

				case this.Const.Direction8.E:
					dirs[this.Const.Direction.NE] += 4 * mult;
					dirs[this.Const.Direction.SE] += 4 * mult;
					break;

				default:
					local dir = myTile.getDirectionTo(opponent.Actor.getTile());
					local dir_left = dir - 1 >= 0 ? dir - 1 : 6 - 1;
					local dir_right = dir + 1 < 6 ? dir + 1 : 0;
					dirs[dir] += 4 * mult;
					dirs[dir_left] += 3 * mult;
					dirs[dir_right] += 3 * mult;
					break;
				}
			}

			local entityCover = 0.0;

			for( local i = 0; i < 6; i = ++i )
			{
				if (!myTile.hasNextTile(i))
				{
				}
				else
				{
					local adjacentTile = myTile.getNextTile(i);

					if (dirs[i] >= 8 && !adjacentTile.IsEmpty)
					{
						entityCover = entityCover + dirs[i] / targets.len() * this.Const.AI.Behavior.DefendSeekCoverMult;
					}
				}
			}

			local isEntityAtIdealWeaponRange = true;

			if (zoc != 0 && !isEntityArmedWithMeleeWeapon)
			{
				isEntityAtIdealWeaponRange = false;
			}

			local bestTile;
			local bestScore = 1.0;

			foreach( ally in allies )
			{
				if (!this.m.Skill.onVerifyTarget(myTile, ally.getTile()))
				{
					continue;
				}

				if (this.isAllottedTimeReached(time))
				{
					yield null;
					time = this.Time.getExactTime();
				}

				local score = 1.0;
				local reverseScore = 1.0;
				local allyTile = ally.getTile();
				local allyZOC = allyTile.getZoneOfOccupationCountOtherThan(ally.getAlliedFactions());
				local isAllyExpendable = ally.getCurrentProperties().TargetAttractionMult <= 0.5;
				local isAllyValuable = ally.getCurrentProperties().TargetAttractionMult > _entity.getCurrentProperties().TargetAttractionMult;
				local isEntityValuable = _entity.getCurrentProperties().TargetAttractionMult > ally.getCurrentProperties().TargetAttractionMult;
				local isAllyArmedWithMeleeWeapon = true;
				local isAllyRangedUnit = this.isRangedUnit(ally);

				if (isAllyRangedUnit)
				{
					isAllyArmedWithMeleeWeapon = false;
				}
				else if (ally.isArmedWithMeleeWeapon() && ally.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getRangeMax() > 1)
				{
					isAllyArmedWithMeleeWeapon = false;
				}

				local isAllySupport = ally.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && ally.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isItemType(this.Const.Items.ItemType.Misc);
				local isAllyAOE = isAllyArmedWithMeleeWeapon && ally.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && ally.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isItemType(this.Const.Items.ItemType.Weapon) && ally.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).isAoE();
				local isAllyAtIdealWeaponRange = true;

				if (allyZOC != 0 && !isAllyArmedWithMeleeWeapon)
				{
					isAllyAtIdealWeaponRange = false;
				}

				local isAllyFleeing = ally.getMoraleState() == this.Const.MoraleState.Fleeing;
				local isAllyDone = isAllyFleeing || ally.isTurnDone() || ally.getFatiguePct() >= 0.8 && _entity.getFatiguePct() <= 0.5 || ally.getCurrentProperties().IsStunned || !ally.getCurrentProperties().IsAbleToUseWeaponSkills;
				local isAllyTurnDone = isAllyFleeing || ally.isTurnDone() || ally.getCurrentProperties().IsStunned || !ally.getCurrentProperties().IsAbleToUseWeaponSkills;
				local isAllyArmedWithShield = ally.isArmedWithShield();
				local allyHitpointRatio = (ally.getHitpoints() + ally.getArmor(this.Const.BodyPart.Body) + ally.getArmor(this.Const.BodyPart.Head)) / (ally.getHitpointsMax() + ally.getArmorMax(this.Const.BodyPart.Body) + ally.getArmorMax(this.Const.BodyPart.Head));
				local dirs = [
					0,
					0,
					0,
					0,
					0,
					0
				];

				foreach( opponent in targets )
				{
					local dir = allyTile.getDirection8To(opponent.Actor.getTile());
					local mult = this.isRangedUnit(opponent.Actor) ? 2 : 1;
					mult = mult * (7.0 / allyTile.getDistanceTo(opponent.Actor.getTile()));

					switch(dir)
					{
					case this.Const.Direction8.W:
						dirs[this.Const.Direction.NW] += 4 * mult;
						dirs[this.Const.Direction.SW] += 4 * mult;
						break;

					case this.Const.Direction8.E:
						dirs[this.Const.Direction.NE] += 4 * mult;
						dirs[this.Const.Direction.SE] += 4 * mult;
						break;

					default:
						local dir = allyTile.getDirectionTo(opponent.Actor.getTile());
						local dir_left = dir - 1 >= 0 ? dir - 1 : 6 - 1;
						local dir_right = dir + 1 < 6 ? dir + 1 : 0;
						dirs[dir] += 4 * mult;
						dirs[dir_left] += 3 * mult;
						dirs[dir_right] += 3 * mult;
						break;
					}
				}

				local allyCover = 0.0;

				for( local i = 0; i < 6; i = ++i )
				{
					if (!allyTile.hasNextTile(i))
					{
					}
					else
					{
						local adjacentTile = allyTile.getNextTile(i);

						if (dirs[i] >= 8 && !adjacentTile.IsEmpty)
						{
							allyCover = allyCover + dirs[i] / targets.len() * this.Const.AI.Behavior.DefendSeekCoverMult;
						}
					}
				}

				if (!isAllyFleeing && isEntityArmedWithMeleeWeapon && !isAllyArmedWithMeleeWeapon && allyZOC != 0 && zoc == 0)
				{
					score = score * this.Const.AI.Behavior.RotationWrongWeaponMult;
				}
				else if (!isAllyValuable && !isAllyFleeing && !isEntityArmedWithMeleeWeapon && isAllyArmedWithMeleeWeapon && allyZOC == 0 && zoc != 0)
				{
					score = score * this.Const.AI.Behavior.RotationWrongWeaponMult;

					if (isEntityRangedUnit)
					{
						score = score * (this.Const.AI.Behavior.RotationWrongWeaponMult * 3.0);
					}
				}

				if (!isAllyExpendable && !isAllyFleeing && isEntityArmedWithMeleeWeapon && isAllyArmedWithMeleeWeapon && isEntityArmedWithShield && !isAllyArmedWithShield && !isAllyAOE && allyZOC > zoc + 2)
				{
					score = score * this.Const.AI.Behavior.RotationShieldInFrontMult;
				}
				else if (!isAllyValuable && !isAllyFleeing && isEntityArmedWithMeleeWeapon && isAllyArmedWithMeleeWeapon && !isEntityArmedWithShield && isAllyArmedWithShield && !isEntityAOE && zoc > allyZOC + 2)
				{
					score = score * this.Const.AI.Behavior.RotationShieldInFrontMult;
				}

				if (!isOffensive && !isAllyExpendable && isEntityArmedWithMeleeWeapon && allyHitpointRatio < 0.5 && allyHitpointRatio < hitpointRatio - 0.2 && allyZOC > zoc + 1)
				{
					score = score * (this.Const.AI.Behavior.RotationSaveWoundedMult * (1.0 + (hitpointRatio - allyHitpointRatio)));
				}
				else if (!isOffensive && !isAllyValuable && !isAllyFleeing && isAllyArmedWithMeleeWeapon && hitpointRatio < 0.5 && allyHitpointRatio > hitpointRatio + 0.2 && zoc > allyZOC + 1)
				{
					score = score * (this.Const.AI.Behavior.RotationSaveWoundedMult * (1.0 + (allyHitpointRatio - hitpointRatio)));
				}

				if (!isAllyExpendable && isAllyFleeing && allyZOC > 0 && zoc == 0 && isEntityArmedWithMeleeWeapon)
				{
					score = score * this.Const.AI.Behavior.RotationSaveFleeingAlly;
				}

				if (ally.getCurrentProperties().TargetAttractionMult > _entity.getCurrentProperties().TargetAttractionMult * this.Const.AI.Behavior.RotationPriorityTargetMinPct && zoc < allyZOC)
				{
					score = score * this.Const.AI.Behavior.RotationPriorityTargetMult;
				}
				else if (_entity.getCurrentProperties().TargetAttractionMult > ally.getCurrentProperties().TargetAttractionMult * this.Const.AI.Behavior.RotationPriorityTargetMinPct && zoc > allyZOC && isAllyArmedWithMeleeWeapon)
				{
					score = score * this.Const.AI.Behavior.RotationPriorityTargetMult;
				}

				if (zoc == 0 && allyZOC >= 3 && isEntityAOE && !isAllyAOE && _entity.getActionPoints() >= 9 && isAllyTurnDone)
				{
					score = score * this.Const.AI.Behavior.RotationAOEMult;
				}
				else if (zoc >= 3 && allyZOC == 0 && !isEntityAOE && isAllyAOE && !isAllyTurnDone && !isAllyFleeing)
				{
					score = score * this.Const.AI.Behavior.RotationAOEMult;
				}

				if (isOffensive && _entity.getActionPoints() >= 9 && !isEntitySupport && !(allyZOC > zoc && !isEntityArmedWithMeleeWeapon) && !(zoc > allyZOC && !isAllyArmedWithMeleeWeapon) && !(isAllyFleeing && zoc != 0) && _entity.getCurrentProperties().IsAbleToUseWeaponSkills)
				{
					local potentialTargets = this.queryTargetsInMeleeRange(this.getProperties().EngageRangeMin, this.Math.max(_entity.getIdealRange(), this.getProperties().EngageRangeMax), 1, ally.getTile());
					local bestTarget = this.queryBestMeleeTarget(_entity, null, potentialTargets);

					if (!(zoc == 0 && bestTarget.Target != null && this.getAgent().getBehavior(this.Const.AI.Behavior.ID.EngageMelee) != null && this.getAgent().getBehavior(this.Const.AI.Behavior.ID.EngageMelee).m.TargetActor != null && this.getAgent().getBehavior(this.Const.AI.Behavior.ID.EngageMelee).m.TargetActor.getID() == bestTarget.Target.getID()))
					{
						if (isAllyDone && !isEntityTwoHanded && bestTarget.Score > currentBestTarget.Score * 2.0 || isAllyDone && isEntityTwoHanded && bestTarget.Score > currentBestTarget.Score * 1.5 || bestTarget.Score > currentBestTarget.Score * 3.0)
						{
							score = score * (this.Const.AI.Behavior.RotationOffensiveMult + bestTarget.Score);
						}
					}
				}
				else if ((isOffensive || _entity.getXPValue() >= ally.getXPValue() * this.Const.AI.Behavior.RotationEliteAllyXPMult) && _entity.getActionPoints() <= 3 && ally.getActionPoints() >= 9 && !isAllyFleeing && !isAllySupport && ally.getCurrentProperties().IsAbleToUseWeaponSkills && (isAllyArmedWithMeleeWeapon || zoc == 0))
				{
					local potentialTargets = this.queryTargetsInMeleeRange(ally.getAIAgent().getProperties().EngageRangeMin, this.Math.max(ally.getIdealRange(), ally.getAIAgent().getProperties().EngageRangeMax), 1, myTile);
					local bestTarget = this.queryBestMeleeTarget(ally, null, potentialTargets);
					local allyPotentialTargets = this.queryTargetsInMeleeRange(ally.getAIAgent().getProperties().EngageRangeMin, this.Math.max(ally.getIdealRange(), ally.getAIAgent().getProperties().EngageRangeMax), 1, ally.getTile());
					local allyBestTarget = this.queryBestMeleeTarget(ally, null, allyPotentialTargets);

					if (bestTarget.Score > allyBestTarget.Score * 2.0)
					{
						score = score * (this.Const.AI.Behavior.RotationOffensiveMult + bestTarget.Score);
					}
				}

				if (this.getStrategy().isDefending() && isEntityArmedWithShield && !isAllyArmedWithShield && isEntityArmedWithMeleeWeapon && isAllyArmedWithMeleeWeapon && !isAllyRangedUnit && !isEntityRangedUnit && entityCover > allyCover * 2.0)
				{
					score = score * this.Const.AI.Behavior.RotationCoverMult;
				}
				else if (this.getStrategy().isDefending() && !isEntityArmedWithShield && isAllyArmedWithShield && isEntityArmedWithMeleeWeapon && isAllyArmedWithMeleeWeapon && !isAllyRangedUnit && !isEntityRangedUnit && allyCover > entityCover * 2.0)
				{
					score = score * this.Const.AI.Behavior.RotationCoverMult;
				}

				if (!isAllyFleeing && isEntityArmedWithMeleeWeapon && !isAllyArmedWithMeleeWeapon && allyZOC == 0 && zoc != 0)
				{
					reverseScore = reverseScore * this.Const.AI.Behavior.RotationWrongWeaponMult;
				}
				else if (!isAllyValuable && !isAllyFleeing && !isEntityArmedWithMeleeWeapon && isAllyArmedWithMeleeWeapon && allyZOC != 0 && zoc == 0)
				{
					reverseScore = reverseScore * this.Const.AI.Behavior.RotationWrongWeaponMult;

					if (isEntityRangedUnit)
					{
						reverseScore = reverseScore * (this.Const.AI.Behavior.RotationWrongWeaponMult * 3.0);
					}
				}

				if (!isAllyExpendable && !isAllyFleeing && isEntityArmedWithMeleeWeapon && isAllyArmedWithMeleeWeapon && isEntityArmedWithShield && !isAllyArmedWithShield && !isAllyAOE && allyZOC <= zoc + 2)
				{
					reverseScore = reverseScore * this.Const.AI.Behavior.RotationShieldInFrontMult;
				}
				else if (!isAllyValuable && !isAllyFleeing && isEntityArmedWithMeleeWeapon && isAllyArmedWithMeleeWeapon && !isEntityArmedWithShield && isAllyArmedWithShield && !isEntityAOE && zoc <= allyZOC + 2)
				{
					reverseScore = reverseScore * this.Const.AI.Behavior.RotationShieldInFrontMult;
				}

				if (!isOffensive && !isAllyExpendable && isEntityArmedWithMeleeWeapon && allyHitpointRatio < 0.5 && allyHitpointRatio < hitpointRatio - 0.2 && allyZOC <= zoc + 1)
				{
					reverseScore = reverseScore * (this.Const.AI.Behavior.RotationSaveWoundedMult * (1.0 + (hitpointRatio - allyHitpointRatio)));
				}
				else if (!isOffensive && !isAllyValuable && !isAllyFleeing && isAllyArmedWithMeleeWeapon && hitpointRatio < 0.5 && allyHitpointRatio > hitpointRatio + 0.2 && zoc <= allyZOC + 1)
				{
					reverseScore = reverseScore * (this.Const.AI.Behavior.RotationSaveWoundedMult * (1.0 + (allyHitpointRatio - hitpointRatio)));
				}

				if (ally.getCurrentProperties().TargetAttractionMult > _entity.getCurrentProperties().TargetAttractionMult * this.Const.AI.Behavior.RotationPriorityTargetMinPct && zoc >= allyZOC)
				{
					reverseScore = reverseScore * this.Const.AI.Behavior.RotationPriorityTargetMult;
				}
				else if (_entity.getCurrentProperties().TargetAttractionMult > ally.getCurrentProperties().TargetAttractionMult * this.Const.AI.Behavior.RotationPriorityTargetMinPct && zoc <= allyZOC && isEntityArmedWithMeleeWeapon)
				{
					reverseScore = reverseScore * this.Const.AI.Behavior.RotationPriorityTargetMult;
				}

				if (allyZOC == 0 && zoc >= 3 && isEntityAOE && !isAllyAOE && !isAllyFleeing && _entity.getActionPoints() >= 9)
				{
					reverseScore = reverseScore * this.Const.AI.Behavior.RotationAOEMult;
				}
				else if (allyZOC >= 3 && zoc == 0 && !isEntityAOE && isAllyAOE && !isAllyFleeing)
				{
					reverseScore = reverseScore * this.Const.AI.Behavior.RotationAOEMult;
				}

				if (score > reverseScore && score > bestScore)
				{
					bestTile = ally.getTile();
					bestScore = score;
				}
			}

			if (bestTile == null)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			this.m.TargetTile = bestTile;
			scoreMult = scoreMult * bestScore;

			if (this.getAgent().getBehavior(this.Const.AI.Behavior.ID.EngageMelee) != null && this.getAgent().getBehavior(this.Const.AI.Behavior.ID.EngageMelee).getScore() * 1.5 >= this.Const.AI.Behavior.Score.Rotation * scoreMult)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			return this.Const.AI.Behavior.Score.Rotation * scoreMult;
		}

		o.onExecute = function( _entity )
		{
			if (this.m.IsFirstExecuted)
			{
				this.getAgent().adjustCameraToTarget(this.m.TargetTile);
				this.m.IsFirstExecuted = false;
				return false;
			}

			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + _entity.getName() + ": Using Rotation!");
			}
			
			if (this.m.TargetTile == null || this.m.Skill == null)
			{
				return true;
			}

			this.m.Skill.use(this.m.TargetTile);

			if (!_entity.isHiddenToPlayer() || this.m.TargetTile.IsVisibleForPlayer)
			{
				this.getAgent().declareEvaluationDelay(2000);
				this.getAgent().declareAction();
			}

			this.m.TargetTile = null;
			this.m.Skill = null;
			return true;
		}

	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_disengage", function(o) 
	{
		o.m.PossibleSkills.extend([
			"actives.footwork",
			"actives.legend_horse_pirouette"
		]);
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_engage_ranged", function(o) 
	{
		o.m.PossibleSkills.extend([
			"actives.legend_magic_missile",
			"actives.legend_catapult_boulder",
			"actives.legend_sling_heavy_stone",
			"actives.legend_shoot_dart"
		]);
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_line_breaker", function(o) 
	{
		o.m.PossibleSkills.push("actives.legend_boar_charge");
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_attack_throw_net", function(o) 
	{
		o.m.PossibleSkills.push("actives.legend_daze");
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_move_tail", function(o) 
	{
		o.m.PossibleSkills.push("actives.legend_stollwurm_move_tail");
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_move_tentacle", function(o) 
	{

		o.onEvaluate = function ( _entity )
		{
			// Function is a generator.
			local score = this.getProperties().BehaviorMult[this.m.ID];
			this.m.TargetTile = null;
			this.m.SelectedSkill = null;
			local time = this.Time.getExactTime();

			if (_entity.getActionPoints() < this.Const.Movement.AutoEndTurnBelowAP)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			if (_entity.getCurrentProperties().IsRooted)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			if (this.getAgent().getIntentions().IsDefendingPosition)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			local skills = [];

			foreach( skillID in this.m.PossibleSkills )
			{
				local skill = _entity.getSkills().getSkillByID(skillID);

				if (skill != null && skill.isUsable() && skill.isAffordable())
				{
					this.m.SelectedSkill = skill;
					break;
				}
			}

			if (this.m.SelectedSkill == null)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			if (!this.getAgent().hasKnownOpponent())
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			local masterTile;
			local instances = this.Tactical.Entities.getAllInstances();

			for( local f = this.Const.Faction.PlayerAnimals + 1; f != instances.len(); f = ++f )
			{
				for( local p = 0; p != instances[f].len(); p = ++p )
				{
					if (instances[f][p].getType() == this.Const.EntityType.Kraken)
					{
						masterTile = instances[f][p].getTile();
						break;
					}
				}
			}

			local targets = this.getAgent().getKnownOpponents();
			local potentialDestinations = [];
			local myTile = _entity.getTile();
			local myTileScore;

			foreach( t in targets )
			{
				if (this.isAllottedTimeReached(time))
				{
					yield null;
					time = this.Time.getExactTime();
				}

				if (t.Actor.isNull())
					continue;

				local target = t.Actor;
				local targetTile = t.Actor.getTile();

				if (_entity.getMode() == 0 && target.getCurrentProperties().IsRooted)
				{
					continue;
				}

				local zocByAllies = targetTile.getZoneOfControlCountOtherThan(target.getAlliedFactions());
				local potentialTiles = this.queryDestinationsInRange(targetTile, this.getProperties().EngageRangeMin, this.Math.max(_entity.getIdealRange(), this.getProperties().EngageRangeMax));
				potentialTiles.push(myTile);

				foreach( tile in potentialTiles )
				{
					local next = false;

					foreach( pt in potentialDestinations )
					{
						if (pt.ID == tile.ID)
						{
							next = true;
							break;
						}
					}

					if (next)
					{
						continue;
					}

					local dist = myTile.getDistanceTo(tile);
					local tileScore = 30.0;
					tileScore = this.Math.maxf(1.0, score - myTile.getDistanceTo(tile));

					if (masterTile != null)
					{
						tileScore = this.Math.maxf(1.0, score - masterTile.getDistanceTo(tile));
					}

					if (target.getCurrentProperties().IsRooted)
					{
						tileScore = tileScore * this.Const.AI.Behavior.MoveTentacleTargetAlreadyRooted;
					}

					local zoc = tile.getZoneOfControlCountOtherThan(_entity.getAlliedFactions());
					tileScore = tileScore * this.Math.pow(this.Const.AI.Behavior.MoveTentacleZOCMult, zoc - 1);
					tileScore = tileScore * this.Math.pow(this.Const.AI.Behavior.MoveTentacleAlliesPresentMult, zocByAllies - 1);
					local targetValues = 0.0;
					local targetsInRange = this.queryTargetsInMeleeRange(this.getProperties().EngageRangeMin, this.Math.max(_entity.getIdealRange(), this.getProperties().EngageRangeMax), 4, tile);

					foreach( pr in targetsInRange )
					{
						targetValues = targetValues + this.queryTargetValue(_entity, pr);

						if (pr.getTile().getDistanceTo(tile) <= pr.getIdealRange())
						{
							targetValues = targetValues - 0.1;
						}
					}

					tileScore = tileScore * targetValues;

					if (myTile.ID == tile.ID)
					{
						tileScore = tileScore * this.Const.AI.Behavior.MoveTentacleMyTileMult;
					}

					if (masterTile != null && masterTile.getDistanceTo(tile) == 1)
					{
						tileScore = tileScore * this.Const.AI.Behavior.MoveTentacleBlockHeadMult;
					}

					potentialDestinations.push({
						Tile = tile,
						Score = tileScore,
						ID = tile.ID
					});
				}
			}

			if (potentialDestinations.len() == 0)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			potentialDestinations.sort(this.onSortByScore);
			local i = 0;

			while (i < potentialDestinations.len())
			{
				if (potentialDestinations[i].Tile.ID == myTile.ID)
				{
					this.m.TargetTile = null;
					return this.Const.AI.Behavior.Score.Zero;
				}
				else if (!this.m.SelectedSkill.isUsableOn(potentialDestinations[i].Tile))
				{
					local betweenTile = myTile.getTileBetweenThisAnd(potentialDestinations[i].Tile);

					if (!this.m.SelectedSkill.isUsableOn(betweenTile))
					{
						i = ++i;
						continue;
					}
					else
					{
						this.m.TargetTile = betweenTile;
						break;
					}
				}
				else
				{
					this.m.TargetTile = potentialDestinations[i].Tile;
					break;
				}
			}

			if (this.m.TargetTile == null)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			this.getAgent().getIntentions().TargetTile = this.m.TargetTile;
			return this.Const.AI.Behavior.Score.MoveTentacle * score;
		}
		o.onExecute = function( _entity )
		{
			if (this.m.IsFirstExecuted)
			{
				this.m.IsFirstExecuted = false;

				if (this.Const.AI.VerboseMode)
				{
					this.logInfo("* " + _entity.getName() + ": Moving to engage.");
				}

				this.m.Agent.adjustCameraToTarget(this.m.TargetTile);
				this.m.SelectedSkill.use(this.m.TargetTile);

				if (_entity.isAlive())
				{
					local delay = 0;

					if (!_entity.isHiddenToPlayer())
					{
						delay = delay + 2000; //Was 800, increased to 2000 in line with ai_move_tail as this lack of delay may be contributing to the game being frozen when these tentacles move - Luft 7/3/23
					}

					if (this.m.TargetTile.IsVisibleForPlayer)
					{
						delay = delay + 2000;
					}

					this.getAgent().declareEvaluationDelay(delay);
				}
			}
			else if (!_entity.isStoringColor())
			{
				return true;
			}

			return false;
		}
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_attack_puncture", function(o) 
	{
		o.m.PossibleSkills.push("actives.puncture_parry_dagger");

		o.onExecute = function ( _entity )
		{
			if (this.m.IsFirstExecuted)
			{
				this.getAgent().adjustCameraToTarget(this.m.TargetTile);
				this.m.IsFirstExecuted = false;
				return false;
			}

			if (this.m.TargetTile != null && this.m.TargetTile.IsOccupiedByActor)
			{
				if (this.Const.AI.VerboseMode)
				{
					this.logInfo("* " + _entity.getName() + ": Using " + this.m.Skill.getName() + " against " + this.m.TargetTile.getEntity().getName() + "!");
				}

				this.m.Skill.use(this.m.TargetTile);

				if (_entity.isAlive() && (!_entity.isHiddenToPlayer() || this.m.TargetTile.IsVisibleForPlayer))
				{
					this.getAgent().declareAction();
				}

				this.m.TargetTile = null;
			}

			return true;
		}

		o.getBestTarget = function( _entity, _skill, _targets )
		{
			local bestTarget;
			local bestScore = 0.0;

			foreach( target in _targets )
			{
				if (!_skill.isUsableOn(target.getTile()))
				{
					continue;
				}

				if (target.getArmor(this.Const.BodyPart.Body) <= 25 || target.getArmor(this.Const.BodyPart.Head) <= 15)
				{
					continue;
				}

				if (target.getFatigue() >= (target.getFatigueMax() / 2))
				{
					continue;
				}

				local p = _entity.getCurrentProperties();
				local armor = target.getArmor(this.Const.BodyPart.Body) * (p.getHitchance(this.Const.BodyPart.Body) / 100.0) + target.getArmor(this.Const.BodyPart.Head) * (p.getHitchance(this.Const.BodyPart.Head) / 100.0);

				if (armor <= 40 && target.getHitpoints() > _entity.getCurrentProperties().getRegularDamageAverage())
				{
					continue;
				}

				local score = this.queryTargetValue(_entity, target, _skill);
				score = score * this.Math.pow(armor / 100.0, 1.1);

				if (score > bestScore)
				{
					bestTarget = target;
					bestScore = score;
				}
			}

			return {
				Target = bestTarget,
				Score = bestScore
			};
		}
	});

	::mods_hookExactClass("ai/tactical/behaviors/ai_attack_knock_out", function ( o )
	{
		o.m.PossibleSkills.extend([
			"actives.legend_staff_knock_out",
			"actives.legend_grapple",
			"actives.legend_buckler_bash",
			"actives.legend_ninetails_disarm"
		]);

		local getBestTarget = o.getBestTarget;
		o.getBestTarget = function ( _entity, _skill, _targets )
		{
			local attackSkill = _entity.getSkills().getAttackOfOpportunity();

			if (attackSkill == null)
			{
				this.m.BestTarget = {
					Target = null,
					Score = 0.0
				};
				yield null;
				return true;
			}

			local getBestTarget = getBestTarget(_entity, _skill, _targets);
			
			while( resume getBestTarget == null)
			{
				yield null;
			}
			
			return getBestTarget;
		};
	});
		
	delete this.Const.LegendMod.hookAISkills;
}
