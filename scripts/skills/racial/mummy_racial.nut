this.mummy_racial <- this.inherit("scripts/skills/skill", {
	m = {
		Killer = null
	},
	function create()
	{
		this.m.ID = "racial.mummy";
		this.m.Name = "Resistant to Ranged Attacks";
		this.m.Description = "";
		this.m.Icon = "";
		this.m.Type = this.Const.SkillType.Racial | this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		switch (_hitInfo.DamageType)
		{
			case this.Const.Damage.DamageType.Piercing:
				if (_skill == null)
				{
					_properties.DamageReceivedRegularMult *= 0.2; 
				}
				else
				{					
					if (_skill.isRanged())
					{				
						local weapon = _skill.getItem();
						if (weapon != null && weapon.isItemType(this.Const.Items.ItemType.Weapon))
						{
							if (weapon.isWeaponType(this.Const.Items.WeaponType.Bow))
							{
								_properties.DamageReceivedRegularMult *= 0.2;
							}
							else if (weapon.isWeaponType(this.Const.Items.WeaponType.Crossbow) || weapon.isWeaponType(this.Const.Items.WeaponType.Firearm))
							{
								_properties.DamageReceivedRegularMult *= 0.66;
							}
							else if (weapon.isWeaponType(this.Const.Items.WeaponType.Throwing))
							{
								_properties.DamageReceivedRegularMult *= 0.5;
							}
							else
							{
								_properties.DamageReceivedRegularMult *= 0.2;
							}
						}
						else
						{
							_properties.DamageReceivedRegularMult *= 0.2;
						}
					}
					else
					{
						_properties.DamageReceivedRegularMult *= 0.75;
					}
				}
				break;

			case this.Const.Damage.DamageType.Burning:
				_properties.DamageReceivedRegularMult *= 1.25;
				break;
		}

		if (_skill != null && "Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			_properties.DamageReceivedRegularMult *= 0.75;
		}
	}

	function onDamageReceived(_attacker, _damageHitpoints, _damageArmor)
	{
		if (_damageHitpoints >= this.getContainer().getActor().getHitpoints())
		{
			this.m.Killer = _attacker;
		}
	}

	function onDeath()
	{
		this.skill.onDeath();
		if (this.m.Killer != null)
		{
			this.m.Killer.getSkills().add(this.new("scripts/skills/effects/mummy_curse_effect"));
		}
	}	

});
