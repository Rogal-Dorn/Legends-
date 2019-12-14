this.perk_legend_peaceful <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_peaceful";
		this.m.Name = this.Const.Strings.PerkName.LegendPeaceful;
		this.m.Description = this.Const.Strings.PerkDescription.LegendPeaceful;
		this.m.Icon = "ui/perks/bandage_circle.png";
		this.m.IconDisabled = "ui/perks/bandage_circle_bw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		_properties.IsContentWithBeingInReserve = true;
	}

	function onUpdate( _properties )
	{
		_properties.IsContentWithBeingInReserve = true;
	}

	function onRemoved()
	{
		_properties.IsContentWithBeingInReserve = false;
	}

});
