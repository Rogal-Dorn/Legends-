this.legend_vala_trance_malevolent <- this.inherit("scripts/skills/skill", {
	m = {
		TranceIsActive = false,
		Failures = 0,
		Difficulty = 1.25
	},


	function create()
	{
		this.m.ID = "perk.legend_vala_trance_malevolent";
		this.m.Name = "Malevolent Spirits (Trance)";
		this.m.Description = "The spirit world is home to many malevolent beings, and the Vala knows how to contact them. Once her access to their realm has been established, she calls upon these ill-willed spirits in hopes of receiving their help.";
		this.m.Icon = "ui/perks/legend_vala_trance_malevolent_active.png";
		this.m.IconDisabled = "ui/perks/legend_vala_trance_malevolent_active_sw.png";
		this.m.Type = this.Const.SkillType.Active | this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted + 11;
		this.m.IsSerialized = true;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
		this.m.IsAttack = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.IsDoingForwardMove = false;
		this.m.IsVisibleTileNeeded = true;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 30;
		this.m.MinRange = 2;
		this.m.MaxRange = 7;
		this.m.MaxLevelDifference = 4;
	}


	function isUsable()
	{
		local actor = this.getContainer().getActor();

		if (!this.Tactical.isActive())
		{
			return false;
		}

		if (actor.getTile().hasZoneOfControlOtherThan(actor.getAlliedFactions()))
		{
			return false;
		}

		if (!this.skill.isUsable())
		{
			return false;
		}

		if (this.m.TranceIsActive)
		{
			return false;
		}

		if (actor.getSkills().hasSkill("effects.legend_vala_currently_chanting") || actor.getSkills().hasSkill("effects.legend_vala_in_trance"))
		{
			return false;
		}

		if (actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) == null)
		{
			return false;
		}

		if (actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getID() != "weapon.legend_staff_vala")
		{
			return false;
		}

		return true;
	}


	function getTranceCostString()
	{
		return "[i]Costs [b][color=" + this.Const.UI.Color.NegativeValue + "]all (at least 6) AP[/color][/b] to use and builds up " + (this.isAffordableBasedOnFatiguePreview() ? "[b][color=" + this.Const.UI.Color.PositiveValue + "]" + this.getFatigueCost() : "[b][color=" + this.Const.UI.Color.NegativeValue + "]" + this.getFatigueCost()) + " Fatigue[/color][/b][/i]\n";
	}


	function getTooltip()
	{
		local actor = this.getContainer().getActor();

		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				text = this.getTranceCostString()
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "If the Vala is successful in her dealings with these harmful spirits, they will haunt and weaken her opponents."
			},
		];

		if (actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) == null || (actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getID() != "weapon.legend_staff_vala"))
		{
			ret.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Requires the Vala's staff.[/color]"
			});
		}

		if (actor.getSkills().hasSkill("effects.legend_vala_currently_chanting"))
		{
			ret.push({
				id = 10,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Cannot enter a trance while chanting.[/color]"
			});
		}

		if (this.Tactical.isActive() && actor.getTile().hasZoneOfControlOtherThan(actor.getAlliedFactions()))
		{
			ret.push({
				id = 11,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Cannot enter a trance while engaged in melee.[/color]"
			});
		}

		return ret;
	}


	function onTurnStart()
	{
		local actor = this.getContainer().getActor();
		local targets = this.Tactical.Entities.getAllInstances();

		if (actor.getSkills().hasSkill("effects.legend_vala_in_trance") && this.m.TranceIsActive)
		{
			local TotalVictims = 0;
			foreach (tar in targets)
			{
				foreach (t in tar)
				{
					if (t.getFlags().get("IsSpiritVictim"))
					{
						TotalVictims = 1;
						break;
					}
				}
			}

			if (TotalVictims == 0)  //  CANCEL TRANCE BECAUSE TARGET IS DEAD OR DYING
			{
				this.m.TranceIsActive = false;
				this.m.Failures = 0;
				actor.getSkills().removeByID("effects.legend_vala_in_trance");
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " returns to this realm.");
				this.logInfo("MALEVOLENT SPIRITS :: onTurnStart victim is dead or dying");
				return;
			}

			local expertise = actor.getBravery() / this.m.Difficulty;
			expertise += this.m.Failures * 20.0 / this.m.Difficulty;
			foreach (tar in targets)
			{
				foreach (t in tar)
				{
					local distance = t.getTile().getDistanceTo(actor.getTile());

					if (distance <= 3 && t.isAlliedWith(actor))
					{
						expertise += this.Math.maxf(0.0, 1.33 - distance / 3.0);
					}
				}
			}

			if (actor.getSkills().hasSkill("perk.legend_vala_trance_mastery"))
			{
				expertise += 10.0;

				if (expertise > 95)
				{
					expertise = 95;
				}
			}
			else
			{
				if (expertise > 85)
				{
					expertise = 85;
				}
			}

			if (expertise < 5)
			{
				expertise = 5;
			}

			this.logInfo("MALEVOLENT SPIRITS :: expertise is " + expertise);

			if (this.Math.rand(1, 100) <= expertise)  // TRANCE SUCCESS
			{
				foreach (tar in targets)
				{
					foreach (t in tar)
					{
						if (!t.getSkills().hasSkill("effects.legend_vala_trance_malevolent_effect") && t.getFlags().get("IsSpiritVictim"))
						{
							local effect = this.new("scripts/skills/effects/legend_vala_trance_malevolent_effect");
							effect.setPower(this.getContainer().getActor().getBravery());
							t.getSkills().add(effect);
							t.getFlags().set("IsSpiritVictim", false);
						}
					}
				}

				this.Sound.play("sounds/combat/legend_vala_malevolent.wav");
				this.m.TranceIsActive = false;
				this.m.Failures = 0;
				actor.getSkills().removeByID("effects.legend_vala_in_trance");
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " returns to this realm.");
			}
			else  // TRANCE FAILURE
			{
				if (this.isAffordableBasedOnFatigue())  //  STAY IN TRANCE AND GAIN A STACKING BONUS SUCCESS CHANCE FOR NEXT TURN
				{
					this.Sound.play("sounds/combat/legend_vala_trance.wav");
					this.m.TranceIsActive = true;
					++this.m.Failures;
					actor.m.ActionPoints = 0;
					actor.setFatigue(actor.getFatigue() + this.getFatigueCost());
				}
				else  //  CANCEL TRANCE BECAUSE OF FATIGUE
				{
					this.m.TranceIsActive = false;
					this.m.Failures = 0;
					actor.getSkills().removeByID("effects.legend_vala_in_trance");
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " returns to this realm.");

					foreach (tar in targets)
					{
						foreach (t in tar)
						{
							if (t.getFlags().get("IsSpiritVictim"))
							{
								t.getFlags().set("IsSpiritVictim", false);
							}
						}
					}
				}
			}
		}
	}


	function onCombatFinished()
	{
		local actor = this.getContainer().getActor();

		if (actor.getSkills().hasSkill("effects.legend_vala_in_trance"))
		{
			actor.getSkills().removeByID("effects.legend_vala_in_trance");
		}

		this.m.TranceIsActive = false;
		this.m.Failures = 0;
	}


	function onAfterUpdate( _properties )
	{
		local actor = this.getContainer().getActor();

		if (actor.getSkills().hasSkill("perk.legend_vala_trance_mastery"))
		{
			this.m.FatigueCostMult = 0.75;
		}
		else
		{
			this.m.FatigueCostMult = 1.0;
		}
	}


	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		local actor = this.getContainer().getActor();
		local targets = this.Tactical.Entities.getAllInstances();

		if (_attacker != null && _attacker.getID() == this.getContainer().getActor().getID())
		{
			return;
		}

		if (actor.getSkills().hasSkill("effects.legend_vala_in_trance"))
		{
			if (actor.getSkills().hasSkill("perk.legend_vala_trance_mastery"))
			{
				if (this.Math.rand(1, 100) <= 50)  //  MASTERY GRANTS A 50% CHANCE TO AVOID DROPPING OUT OF TRANCE
				{
					this.m.TranceIsActive = false;
					this.m.Failures = 0;
					actor.getSkills().removeByID("effects.legend_vala_in_trance");
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " returns to this realm.");

					foreach (tar in targets)
					{
						foreach (t in tar)
						{
							if (t.getFlags().get("IsSpiritVictim"))
							{
								t.getFlags().set("IsSpiritVictim", false);
							}
						}
					}
				}
			}
			else
			{
				this.m.TranceIsActive = false;
				this.m.Failures = 0;
				actor.getSkills().removeByID("effects.legend_vala_in_trance");
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " returns to this realm.");

				foreach (tar in targets)
				{
					foreach (t in tar)
					{
						if (t.getFlags().get("IsSpiritVictim"))
						{
							t.getFlags().set("IsSpiritVictim", false);
						}
					}
				}
			}
		}
	}


	function onDeath()
	{
		local actor = this.getContainer().getActor();
		local targets = this.Tactical.Entities.getAllInstances();

		foreach (tar in targets)
		{
			foreach (t in tar)
			{
				if (t.getSkills().hasSkill("effects.legend_vala_trance_malevolent_effect"))
				{
					t.getSkills().removeByID("effects.legend_vala_trance_malevolent_effect");
				}

				if (t.getFlags().get("IsSpiritVictim"))
				{
					t.getFlags().set("IsSpiritVictim", false);
				}
			}
		}
	}


	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!_targetTile.IsOccupiedByActor)
		{
			return false;
		}

		if (!_targetTile.getEntity().isAlive() || _targetTile.getEntity().isDying())
		{
			return false;
		}

		if (_targetTile.IsEmpty)
		{
			return false;
		}

		if (_targetTile.getEntity().isAlliedWith(this.getContainer().getActor()))
		{
			return false;
		}

		if (_targetTile.getEntity().getSkills().hasSkill("effects.legend_vala_trance_malevolent_effect"))
		{
			return false;
		}

		if (_targetTile.getEntity().getFlags().get("IsSpiritVictim"))
		{
			return false;
		}

		return this.skill.onVerifyTarget(_originTile, _targetTile);
	}


	function onUse(_user, _targetTile)
	{
		if (this.isUsable())
		{
			local actor = this.getContainer().getActor();

			if (!actor.getSkills().hasSkill("effects.legend_vala_in_trance"))
			{
				actor.getSkills().add(this.new("scripts/skills/effects/legend_vala_in_trance"));
			}

			_targetTile.getEntity().getFlags().set("IsSpiritVictim", true);
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " trembles and hums as they drift into a trance.");
			this.Sound.play("sounds/combat/legend_vala_trance.wav");
			actor.m.ActionPoints = 0;
			this.m.TranceIsActive = true;
		}
	}
});
