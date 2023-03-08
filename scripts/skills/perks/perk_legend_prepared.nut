//Author: WNTR Jimmy
this.perk_legend_prepared <- this.inherit("scripts/skills/skill", {
	m  = { 
		PoisonChance = 25 
	},

	function create()
	{
		this.m.ID = "perk.legend_prepared"; 
		this.m.Name = this.Const.Strings.PerkName.LegendPrepared;
		this.m.Description = this.Const.Strings.PerkDescription.LegendPrepared;
		this.m.Icon = "prepared.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	// need the poison part
	function onUpdate(_properties )
	{
		if(this.getContainer().getActor().getMainhandItem().isWeaponType(this.Const.WeaponType.Dagger))
		{ 
        	_properties.MeleeSkill += 12;
    	}
	}

	function onAfterUpdate( _properties )
   {
      if(this.getContainer().getActor().getMainhandItem().isWeaponType(this.Const.WeaponType.Dagger))
      {
      	_properties.FatigueRecoveryRate += 3;
   	}
   }

   function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_targetEntity == null || !_targetEntity.isAlive())
		{
			return;
		}

		local effect = new("scripts/skills/effects/goblin_poison_effect");
		if(_skill.isWeaponType(this.Const.WeaponType.Dagger) && _damageInflictedHitpoints > 0)
		{
			if(this.Math.rand(1, 100) < this.m.PoisonChance)
			{
				_targetEntity.getSkills().add(effect);
			}
		}

	}

});

