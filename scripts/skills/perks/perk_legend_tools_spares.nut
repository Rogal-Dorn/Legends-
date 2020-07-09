this.perk_legend_tools_spares <- this.inherit("scripts/skills/skill", {
	m = {
		Amount = 20
	},
	function create()
	{
		this.m.ID = "perk.legend_tools_spares";
		this.m.Name = this.Const.Strings.PerkName.LegendToolsSpares;
		this.m.Description = this.Const.Strings.PerkDescription.LegendToolsSpares;
		this.m.Icon = "ui/perks/MaxToolsT2.png";
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
		this.World.State.getPlayer().calculateArmorPartsModifier();
	}

	function onRemoved()
	{
		this.World.State.getPlayer().calculateArmorPartsModifier();
	}

});
