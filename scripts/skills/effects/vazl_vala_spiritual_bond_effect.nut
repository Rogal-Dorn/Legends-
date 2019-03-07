this.vazl_vala_spiritual_bond_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Item = null
	},
	function setItem( _i )
	{
		if (typeof _i == "instance")
		{
			this.m.Item = _i;
		}
		else
		{
			this.m.Item = this.WeakTableRef(_i);
		}
	}


	function setName( _n )
	{
		this.m.Name = _n;
	}
	function getName()
	{
		return this.m.Name;
	}


	function create()
	{
		this.m.ID = "effects.vazl_vala_spiritual_bond_effect";
		this.m.Name = "Spiritual Bond";
		this.m.Icon = "skills/status_effect_87.png";
		this.m.IconMini = "status_effect_87_mini";
		this.m.Overlay = "status_effect_87";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
//		this.m.IsRemovedAfterBattle = true;
	}


	function isHidden()
	{
		return true;
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
					text = ""
				}
			];
		}
		else
		{
			return;
		}
	}


	function onUpdate( _properties )
	{
	}


	function onCombatFinished()
	{
		this.removeSelf();
	}


	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_attacker != null && _attacker.getID() == this.getContainer().getActor().getID() || _skill != null && !_skill.isAttack())
		{
			return;
		}

		if (this.m.Item.m.WardenEntity != null)
		{
			local reduction = 1 - (0.1 + (this.getContainer().getActor().getCurrentProperties().Bravery / 400.00));

			if (reduction <= 0.5)
			{
				reduction = 0.5;
			}

			_properties.DamageReceivedRegularMult *= reduction;
		}
	}

	
	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		if (this.m.Item.m.WardenEntity == null)
		{
			return;
		}

		local transfer = 0.1 + (this.getContainer().getActor().getCurrentProperties().Bravery / 400.00);

		if (transfer >= 0.5)
		{
			transfer = 0.5;
		}

		local transfer_total = _damageHitpoints * transfer;

		if (transfer_total > 0)
		{
			this.m.Item.m.WardenEntity.m.Hitpoints = this.Math.round(this.m.Item.m.WardenEntity.m.Hitpoints - transfer_total);
		}

		if (this.m.Item.m.WardenEntity.m.Hitpoints <= 0)
		{
			this.m.Item.m.WardenEntity.killSilently();
		}
	}
});
