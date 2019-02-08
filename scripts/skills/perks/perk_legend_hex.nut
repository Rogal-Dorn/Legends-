this.perk_legend_hex_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_hex_skill";
		this.m.Name = this.Const.Strings.PerkName.LegendHex;
		this.m.Description = this.Const.Strings.PerkDescription.LegendHex;
		this.m.Icon = "skills/active_101.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_hex_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_hex_skill"));
		}
	}
		function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_hex_skill");
	}

});
