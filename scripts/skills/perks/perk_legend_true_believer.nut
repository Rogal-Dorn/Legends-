this.perk_legend_true_believer <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_true_believer";
		this.m.Name = this.Const.Strings.PerkName.LegendTrueBeliever;
		this.m.Description = this.Const.Strings.PerkDescription.LegendTrueBeliever;
		this.m.Icon = "ui/perks/composed_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.IsAffectedByFleeingAllies = false;
	}

});