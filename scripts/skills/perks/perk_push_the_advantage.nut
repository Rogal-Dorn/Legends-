this.perk_push_the_advantage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.push_the_advantage";
		this.m.Name = this.Const.Strings.PerkName.PushTheAdvantage;
		this.m.Description = this.Const.Strings.PerkDescription.PushTheAdvantage;
		this.m.Icon = "ui/perks/onslaught_circle.png";
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

		if (_targetEntity.getSkills().hasSkill("effects.sleeping")) || _targetEntity.getSkills().hasSkill("effects.stunned")) && !_targetEntity.isAlliedWith(this.getContainer().getActor()))
		{
			_properties.MeleeSkill += 20;
			_properties.RangedSkill += 20;
			_properties.HitChance[this.Const.BodyPart.Head] += 20;
		}
	}

});
