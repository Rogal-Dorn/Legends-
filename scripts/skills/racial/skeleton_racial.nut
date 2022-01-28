this.skeleton_racial <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "racial.skeleton";
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
								_properties.DamageReceivedRegularMult *= 0.1;
							}
							else if (weapon.isWeaponType(this.Const.Items.WeaponType.Crossbow) || weapon.isWeaponType(this.Const.Items.WeaponType.Firearm))
							{
								_properties.DamageReceivedRegularMult *= 0.33;
							}
							else if (weapon.isWeaponType(this.Const.Items.WeaponType.Throwing))
							{
								_properties.DamageReceivedRegularMult *= 0.25;
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
						_properties.DamageReceivedRegularMult *= 0.5;
					}
				}
				break;

			case this.Const.Damage.DamageType.Burning:
				_properties.DamageReceivedRegularMult *= 0.2;
				break;
		}

		if (_skill != null && "Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			_properties.DamageReceivedRegularMult *= 0.75;
		}

	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			if (_targetEntity.getCurrentProperties().IsImmuneToBleeding || _damageInflictedHitpoints <= this.Const.Combat.MinDamageToApplyBleeding || _targetEntity.getHitpoints() <= 0)
			{
				return;
			}

			if (!_targetEntity.isAlive())
			{
				return;
			}

			if (_targetEntity.getFlags().has("undead"))
			{
				return;
			}

			if (!_targetEntity.isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_targetEntity) + " is bleeding");
			}

			local effect = this.new("scripts/skills/effects/bleeding_effect");
			effect.setDamage(this.getContainer().getActor().getCurrentProperties().IsSpecializedInCleavers ? 5 : 3);
			local bleed = _targetEntity.getSkills().getSkillByID("effects.bleeding_effect");
			if (bleed == null)
			{
				if (this.getContainer().getActor().getFaction() == this.Const.Faction.Player )
				{
					effect.setActor(this.getContainer().getActor());
				}
				_targetEntity.getSkills().add(effect);
			}
			else
			{
				effect.resetTime();
			}
		}
	}

});

