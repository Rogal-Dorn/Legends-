this.legend_vala_chant_fury_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Vala = null,
		Range = 3
	},
	function setVala(_v)
	{
		if (typeof _v == "instance")
		{
			this.m.Vala = _v;
		}
		else
		{
			this.m.Vala = this.WeakTableRef(_v);
		}
	}


	function create()
	{
		this.m.ID = "effects.legend_vala_chant_fury_effect";
		this.m.Name = "";
		this.m.Icon = "";
		this.m.IconMini = "";
		this.m.Overlay = "";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}


	function isHidden()
	{
		if (!this.checkEntities())
		{
			this.updateEffect(false);
			return true;
		}

		if (!this.isInRange())
		{
			this.updateEffect(false);
			return true;
		}

		this.updateEffect(true);
		return false;
	}


	function getTooltip()
	{
		if (!this.isHidden())
		{
			local distance = this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile());
			local regulardamage = (this.m.Vala.getBravery() / 30.0) + ((this.getContainer().getActor().getFatigueMax() - this.getContainer().getActor().getFatigue()) / 30.0);
			local paybackchance = (this.m.Vala.getBravery() / 4.0) + (this.getContainer().getActor().getHitpoints() / 3.0);
			local paybackdamage = (this.m.Vala.getBravery() / 3.0) + (this.getContainer().getActor().getCurrentProperties().getMeleeSkill() / 4.0);

			if (this.isMastered())
			{
				regulardamage *= 1.1;
				paybackchance *= 1.1;
				paybackdamage *= 1.1;
			}

			if (distance == 2)
			{
				regulardamage *= 0.75;
				paybackchance *= 0.75;
				paybackdamage *= 0.75;
			}
			else if (distance == 3)
			{
				regulardamage *= 0.5;
				paybackchance *= 0.5;
				paybackdamage *= 0.5;
			}

			if (paybackchance > 95)
			{
				paybackchance = 95;
			}
			if (paybackchance < 5)
			{
				paybackchance = 5;
			}

			if (paybackdamage > 100)
			{
				paybackdamage = 100;
			}

			return [
				{
					id = 1,
					type = "title",
					text = this.getName()
				},
				{
					id = 10,
					type = "text",
					icon = "ui/icons/special.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + this.Math.round(regulardamage) + "%[/color] damage inflicted."
				},
				{
					id = 11,
					type = "text",
					icon = "ui/icons/special.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + this.Math.round(paybackchance) + "%[/color] chance to retaliate against an attacker that hits you in melee range, for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.Math.round(paybackdamage) + "%[/color] damage."
				}
			];
		}
		else
		{
			return;
		}
	}


	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (this.isInRange())
		{
			if (this.Tactical.TurnSequenceBar.getActiveEntity() == null || this.Tactical.TurnSequenceBar.getActiveEntity().getID() != this.getContainer().getActor().getID())
			{
				local distance = this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile());
				local damage = (this.m.Vala.getBravery() / 300.0) + (this.getContainer().getActor().getCurrentProperties().getMeleeSkill() / 400.0);

				if (this.isMastered())
				{
					damage *= 1.1;
				}

				if (distance == 2)
				{
					damage *= 0.75;
				}
				else if (distance == 3)
				{
					damage *= 0.5;
				}

				if (damage > 1)
				{
					damage = 1;
				}

				_properties.DamageTotalMult *= damage;
				_properties.FatigueEffectMult *= 0.0;
			}
		}
	}


	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		if (_attacker == null)
		{
			return;
		}

		if (_attacker.isAlliedWith(this.getContainer().getActor()))
		{
			return;
		}

		if (this.Tactical.TurnSequenceBar.getActiveEntity().getID() != _attacker.getID())
		{
			return;
		}

		if (!this.isInRange())
		{
			return;
		}

		if (this.getContainer().getActor().getTile().getDistanceTo(_attacker.getTile()) != 1)
		{
			return;
		}

		local distance = this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile());
		local chance = (this.m.Vala.getBravery() / 4.0) + (this.getContainer().getActor().getHitpoints() / 3.0);

		if (this.isMastered())
		{
			chance *= 1.1;
		}

		if (distance == 2)
		{
			chance *= 0.75;
		}
		else if (distance == 3)
		{
			chance *= 0.5;
		}

		if (chance > 95)
		{
			chance = 95;
		}
		if (chance < 5)
		{
			chance = 5;
		}

		if (this.Math.rand(1, 100) <= chance)
		{
			local payback = this.getContainer().getActor().getSkills().getAttackOfOpportunity();

			if (payback != null)
			{
				this.getContainer().setBusy(true);
				local attackinfo = {
					User = this.getContainer().getActor(),
					Skill = payback,
					TargetTile = _attacker.getTile()
				};
				this.Time.scheduleEvent(this.TimeUnit.Virtual, this.Const.Combat.RiposteDelay, this.onPerformPaypack, attackinfo);
			}
		}
	}


	function onPerformPaypack(_attackinfo)
	{
		_attackinfo.Skill.getContainer().setBusy(false);

		if (_attackinfo.User.isAlive() && _attackinfo.TargetTile.getEntity().isAlive())
		{
			return _attackinfo.Skill.attackEntity(_attackinfo.User, _attackinfo.TargetTile.getEntity());
		}
	}


	function updateEffect(_v)
	{
		if (_v)
		{
			this.m.Name = "Fury";
			this.m.Icon = "ui/perks/perk_36.png";
			this.m.IconMini = "perk_36_mini";
			this.m.Overlay = "perk_36";
		}
		else
		{
			this.m.Name = "";
			this.m.Icon = "";
			this.m.IconMini = "";
			this.m.Overlay = "";
		}
	}


	function checkEntities()
	{
		local actor = this.getContainer().getActor();
		if (actor == null) 
		{
			return false;
		}

		local tile = actor.getTile();
		if (tile == null)
		{
			return false;
		}

		if (this.m.Vala == null)
		{
			return false;
		}

		if (this.m.Vala.getTile() == null)
		{
			return false;
		}

		return true;
	}


	function isInRange()
	{
		if (this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile()) <= this.m.Range)
		{
			return true;
		}

		return false;
	}


	function isMastered()
	{
		if (this.m.Vala == null)
		{
			return false;
		}

		if (this.m.Vala.getSkills().hasSkill("perk.legend_vala_chanting_mastery"))
		{
			return true;
		}

		return false;
	}


	function onMovementCompleted()
	{
		if (!this.checkEntities())
		{
			this.updateEffect(false);
			return
		}

		if (!this.isInRange())
		{
			this.updateEffect(false);
			return 
		}

		if (this.getContainer().getActor().getID() != this.m.Vala.getID())
		{
			this.spawnIcon("perk_36", this.getContainer().getActor().getTile());
		}

		this.updateEffect(true);
	}


	function onUpdate(_properties)
	{
		if (!this.checkEntities())
		{
			this.updateEffect(false);
			return
		}

		if (!this.isInRange())
		{
			this.updateEffect(false);
			return 
		}

		local distance = this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile());
		local bonus = (this.m.Vala.getBravery() / 3000.0) + ((this.getContainer().getActor().getFatigueMax() - this.getContainer().getActor().getFatigue()) / 3000.0);

		if (this.isMastered())
		{
			bonus *= 1.1;
		}

		if (distance == 2)
		{
			bonus *= 0.75;
		}
		else if (distance == 3)
		{
			bonus *= 0.5;
		}

		_properties.DamageTotalMult *= 1.0 + bonus;

		this.updateEffect(true);
	}


	function onCombatFinished()
	{
		this.removeSelf();
	}
});
