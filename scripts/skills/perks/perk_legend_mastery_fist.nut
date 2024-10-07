this.perk_legend_mastery_fist <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_mastery_fist";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecFists;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecFists;
		this.m.Icon = "ui/perks/unarmed_mastery_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.IsSpecializedInFists = true;
	}

	function onAdded()
	{
		if (!this.getContainer().hasSkill("actives.legend_kick") && this.getContainer().getActor().isPlayerControlled())
		{
			this.getContainer().add(this.new("scripts/skills/actives/legend_kick_skill"));
		}
	}

	function onRemoved()
	{
		this.getContainer().removeByID("actives.legend_kick");
	}

});