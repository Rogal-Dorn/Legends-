this.perk_legend_roster_5 <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_roster_5";
		this.m.Name = this.Const.Strings.PerkName.LegendRoster5;
		this.m.Description = this.Const.Strings.PerkDescription.LegendRoster5;
		this.m.Icon = "ui/perks/recruit5.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		this.World.Assets.setBrothersMax(this.World.Assets.getBrothersMax() + 5);
	}
	
	function onRemoved()
	{
		this.World.Assets.setBrothersMax(this.World.Assets.getBrothersMax() - 5);
	}

});
