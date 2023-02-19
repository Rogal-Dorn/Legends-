this.perk_legend_opportunist <- this.inherit("scripts/skills/skill", {
	m = {},

	function create()
	{
		this.m.ID = "perk.perk_legend_opportunist"; 
		this.m.Name = this.Const.Strings.PerkName.LegendOpportunist;
		this.m.Description = this.Const.Strings.PerkDescription.LegendOpportunist;
		this.m.Icon = "opportunist.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity == null)
		{
			return;
		}

		if (!_targetEntity.isAlliedWith(this.getContainer().getActor()))
		{
			if (_targetEntity.getSkills().hasSkill("effects.legend_grazed_effect") || _targetEntity.getSkills().hasSkill("effects.bleeding") || _targetEntity.getSkills().hasSkill("effects.goblin_poison") || _targetEntity.getSkills().hasSkill("effects.spider_poison") || _targetEntity.getSkills().hasSkill("effects.legend_redback_spider_poison"))
			{
				local effect = this.new("scripts/skills/effects/dazed_effect");
			}
		}
	}

	function onUpdate(_properties)
	{
		local effect = new("scripts/skills/effects/smoke_effect"); 
		if(this.getContainer().getActor().hasSkill(effect))
		{
			_properties.RangedSkillMult *= 1.5; //Offsets the -50% from smoke_effect.nut
			_properties.MeleeSkillMult *= 1.25;
		}
	}
});

