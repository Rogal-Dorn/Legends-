this.perk_legend_back_to_basics <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_back_to_basics";
		this.m.Name = this.Const.Strings.PerkName.LegendBackToBasics;
		this.m.Description = this.Const.Strings.PerkDescription.LegendBackToBasics;
		this.m.Icon = "skills/status_effect_14.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.IsAffectedByLosingHitpoints = false;
	}

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		if (_attacker == null)
		{
			return;
		}

		local a = this.getContainer().getActor();

		a.getSkills().add(this.new("scripts/skills/effects/legend_back_to_basics_effect"));
		
		if (!a.getSkills().hasSkill("effects.rallied"))
			{
				local difficulty = this.Math.floor(a.getCurrentProperties().getBravery() * 0.5);
				local morale = a.getMoraleState();

				if (a.getMoraleState() == this.Const.MoraleState.Fleeing)
				{
					a.checkMorale(this.Const.MoraleState.Wavering - this.Const.MoraleState.Fleeing, difficulty, this.Const.MoraleCheckType.Default, "status_effect_56");
				}

				if (morale != a.getMoraleState())
				{
					a.getSkills().add(this.new("scripts/skills/effects/rallied_effect"));
				}
			}
		
	}


});
