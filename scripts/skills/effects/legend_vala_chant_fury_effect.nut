this.legend_vala_chant_fury_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Vala = null
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
		if (this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile()) <= 3)
		{
			this.m.Name = "Fury";
			this.m.Icon = "ui/perks/perk_36.png";
			this.m.IconMini = "perk_36_mini";
			this.m.Overlay = "perk_36";
			return false;
		}
		else
		{
			this.m.Name = "";
			this.m.Icon = "";
			this.m.IconMini = "";
			this.m.Overlay = "";
			return true;
		}
	}


	function getTooltip()
	{
		if (!this.isHidden())
		{
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
					text = "Raaawr!"
				}
			];
		}
		else
		{
			return;
		}
	}


	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile()) <= 3)
		{
			if (this.Tactical.TurnSequenceBar.getActiveEntity() == null || this.Tactical.TurnSequenceBar.getActiveEntity().getID() != this.getContainer().getActor().getID())
			{
				_properties.DamageTotalMult = 0.5;
				_properties.FatigueEffectMult = 0.5;
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

		if (this.getContainer().getActor().getTile().getDistanceTo(_attacker.getTile()) != 1)
		{
			return;
		}

		if (this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile()) > 3)
		{
			return;
		}

		local chance = 10.0 + (this.m.Vala.getBravery() / 2.0) + (this.getContainer().getActor().getInitiative() / 4.0);
		local distance = this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile());

		if (distance == 2)
		{
			chance *= 0.67;
		}
		else if (distance == 3)
		{
			chance *= 0.33;
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
		return _attackinfo.Skill.attackEntity(_attackinfo.User, _attackinfo.TargetTile.getEntity());
	}


	function ChantUpdate()
	{
		if (this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile()) <= 3)
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


	function onMovementCompleted()
	{
		if (this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile()) <= 3)
		{
			if (this.getContainer().getActor().getID() != this.m.Vala.getID())
			{
				this.spawnIcon("status_effect_65", this.getContainer().getActor().getTile());
			}
		}

		this.ChantUpdate();
	}


	function onUpdate(_properties)
	{
		if (this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile()) <= 3)
		{
			local bonus = this.m.Vala.getBravery() / 800.0;
			local distance = this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile());

			if (distance == 2)
			{
				bonus *= 0.67;
			}
			else if (distance == 3)
			{
				bonus *= 0.33;
			}

			_properties.DamageTotalMult *= 1.0 + bonus;

			if (this.Tactical.TurnSequenceBar.getActiveEntity() == null || this.Tactical.TurnSequenceBar.getActiveEntity().getID() != this.getContainer().getActor().getID())
			{
				_properties.DamageTotalMult = 0.5;
				_properties.FatigueEffectMult = 0.5;
			}
		}

		this.ChantUpdate();
	}


	function onCombatFinished()
	{
		this.removeSelf();
	}
});
