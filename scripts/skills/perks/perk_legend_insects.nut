this.perk_legend_insects <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_insects";
		this.m.Name = this.Const.Strings.PerkName.LegendInsects;
		this.m.Description = this.Const.Strings.PerkDescription.LegendInsects;
		this.m.Icon = "ui/perks/insects_circle.png";
		this.m.IconDisabled = "ui/perks/insects_circle_bw.png"
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.insects_skill"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/insects_skill"));
		}
	}
		function onRemoved()
	{
		this.m.Container.removeByID("actives.insects_skill");
	}

});
