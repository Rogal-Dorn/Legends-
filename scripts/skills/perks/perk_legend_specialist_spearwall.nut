this.perk_legend_specialist_spearwall <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_spearwall";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecSpearWall;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecSpearWall;
		this.m.Icon = "ui/perks/spearwall_mastery.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		_properties.IsSpecializedInSpearWall = true;
	}

});

