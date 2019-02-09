this.perk_legend_stunned <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_stunned";
		this.m.Name = this.Const.Strings.PerkName.LegendStun;
		this.m.Description = this.Const.Strings.PerkDescription.LegendStun;
		this.m.Icon = "skills/active_101.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_stun"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_stunned"));
		}
	}
		function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_stun");
	}

});
