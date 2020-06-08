this.perk_legend_tumble <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_tumble";
		this.m.Name = this.Const.Strings.PerkName.LegendTumble;
		this.m.Description = this.Const.Strings.PerkDescription.LegendTumble;
		this.m.Icon = "ui/perks/tumble_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.IsFleetfooted = true;
	}
});

