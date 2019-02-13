this.perk_legend_roster_6 <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_roster_6";
		this.m.Name = this.Const.Strings.PerkName.LegendRoster;
		this.m.Description = this.Const.Strings.PerkDescription.LegendRoster;
		this.m.Icon = "ui/perks/perk_21.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		this.World.Assets.setBrothersMax(this.World.Assets.getBrothersMax() + 3);
	}
	
	function onRemoved()
	{
		this.World.Assets.setBrothersMax(this.World.Assets.getBrothersMax() - 3);
	}

});
