this.perk_legend_hex <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_hex";
		this.m.Name = this.Const.Strings.PerkName.LegendHex;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHex;
		this.m.Icon = "ui/perks/perk_27.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
		this.m.isStacking = false;
	}

	function isStacking()
	{
		return this.m.IsStacking;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_hex"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_hex_skill"));
		}
	}
	
	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_hex");
	}

});
