this.perk_legend_lacerate <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_lacerate";
		this.m.Name = this.Const.Strings.PerkName.LegendLacerate;
		this.m.Description = this.Const.Strings.PerkDescription.LegendLacerate;
		this.m.Icon = "ui/perks/graze_circle.png";
		this.m.IconDisabled = "ui/perks/graze_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
		this.m.SoundOnHitHitpoints = [
			"sounds/combat/cleave_hit_hitpoints_01.wav",
			"sounds/combat/cleave_hit_hitpoints_02.wav",
			"sounds/combat/cleave_hit_hitpoints_03.wav"
		];
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (!_targetEntity.isAlive() || _targetEntity.isDying())
		{
			return false;
		}
		
		if (_targetEntity.getCurrentProperties().IsImmuneToBleeding)
		{
			return false;
		}

		if (_targetEntity.isNonCombatant())
		{
			return false;
		}

		// local user = _skill.getContainer().getActor();
		// local ourHP =  user.getHitpoints();		//75
		// local ourMaxHP =  user.getHitpointsMax();//100
		// local PercentHP = ourMaxHP / 100;		// (100/100) = 1
		// local chance = ourHP / PercentHP;		// 75/1

		local user = _skill.getContainer().getActor();
		local currentHP = user.getHitpoints(); //75
		local maxHP = user.getHitpointsMax();  //100
		local missingHP = maxHP - currentHP;   //missing 25
		local percentMissingHP = this.Math.round(missingHP / maxHP); // (25/100) = .25
		local chance = percentMissingHP * 100; //.25 * 100 = 25 chance


		if (this.Math.rand(1, 100) > chance)
		{
			return false;
		}

		_targetEntity.getSkills().add(this.new("scripts/skills/effects/legend_grazed_effect"));

		if (!user.isHiddenToPlayer() && _targetEntity.getTile().IsVisibleForPlayer)
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " lacerated " + this.Const.UI.getColorizedEntityName(_targetEntity) + " leaving them grazed");
		}
	

		return true;
		
	}

});
