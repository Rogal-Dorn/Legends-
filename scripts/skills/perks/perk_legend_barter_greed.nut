this.perk_legend_barter_greed <- this.inherit("scripts/skills/skill", {
	m = {
		Amount = 0.15
	},
	function create()
	{
		this.m.ID = "perk.legend_barter_greed";
		this.m.Name = this.Const.Strings.PerkName.LegendBarterGreed;
		this.m.Description = this.Const.Strings.PerkDescription.LegendBarterGreed;
		this.m.Icon = "ui/perks/BarterT1.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function getModifier()
	{
		return this.m.Amount;
	}

	function onAdded()
	{
		this.World.State.getPlayer().calculateBarterMult();
	}

	function onRemoved()
	{
		this.World.State.getPlayer().calculateBarterMult();
	}


});
