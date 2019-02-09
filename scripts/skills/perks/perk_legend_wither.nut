this.perk_legend_wither <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_wither";
		this.m.Name = this.Const.Strings.PerkName.LegendWither;
		this.m.Description = this.Const.Strings.PerkDescription.LegendWither;
		this.m.Icon = "ui/perks/perk_34_active.png";
		this.m.IconDisabled = "ui/perks/perk_34_active_sw.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.perfect_focus"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_wither"));
		}
	}
		function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_wither");
	}

});
