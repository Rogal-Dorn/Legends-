this.alp_racial <- this.inherit("scripts/skills/skill", {
	m = {
		TimesWaited = 0
	},
	function create()
	{
		this.m.ID = "racial.alp";
		this.m.Name = "";
		this.m.Description = "";
		this.m.Icon = "skills/status_effect_81.png";
		this.m.SoundOnUse = [
			"sounds/enemies/ghost_death_01.wav",
			"sounds/enemies/ghost_death_02.wav"
		];
		this.m.Type = this.Const.SkillType.Racial | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function onTurnStart()
	{
		this.m.TimesWaited = 0;
	}

	function onResumeTurn()
	{
		if (++this.m.TimesWaited <= 1 && this.getContainer().getActor().getActionPoints() >= 4)
		{
			this.getContainer().getActor().setWaitActionSpent(false);
		}
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
								if (_skill.getID() == "actives.throw_spear")
								{
									_properties.DamageReceivedRegularMult *= 0.5;
								}
								else
								{
									_properties.DamageReceivedRegularMult *= 0.25;
								}								
							}
							else
							{
								_properties.DamageReceivedRegularMult *= 0.25;
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
				_properties.DamageReceivedRegularMult *= 1.25;
				break;

			case this.Const.Damage.DamageType.Cutting:
				if (_skill != null)
				{
					if (_skill.getID() == "actives.wardog_bite" || _skill.getID() == "actives.wolf_bite" || _skill.getID() == "actives.warhound_bite")
					{
						_properties.DamageReceivedRegularMult *= 0.33;
					}
					else if (this.getContainer().getActor().getFlags().has("demon"))
					{
						_properties.DamageReceivedRegularMult *= 0.9;
					}
				}
				break;
		}
	}

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		local actor = this.getContainer().getActor();

		if (_damageHitpoints >= actor.getHitpoints())
			return;

		this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.Skill);
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 30, this.teleport.bindenv(this), this.getContainer().getActor().getFaction());
	}

	function onDeath( _fatalityType )
	{
		this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.Skill);
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 30, this.teleport.bindenv(this), this.getContainer().getActor().getFaction());
	}

	function teleport( _faction )
	{
		foreach( a in this.Tactical.Entities.getInstancesOfFaction(_faction) )
		{
			if (a.getHitpoints() > 0 && a.getFlags().has("alp") && a.getAIAgent().getBehavior(this.Const.AI.Behavior.ID.AlpTeleport) != null)
			{
				local b = a.getAIAgent().getBehavior(this.Const.AI.Behavior.ID.AlpTeleport);
				b.onEvaluate(a);
				b.onExecute(a);
			}
		}
	}

});
