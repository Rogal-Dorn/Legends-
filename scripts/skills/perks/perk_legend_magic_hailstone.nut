// TODO Edit strings.nut
this.perk_legend_magic_hailstone <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_magic_hailstone";
		this.m.Name = this.Const.Strings.PerkName.LegendMagicHailstone;
		this.m.Description = this.Const.Strings.PerkDescription.LegendMagicHailstone;
		this.m.Icon = "ui/perks/mage_legend_magic_hailstone_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_magic_hailstone"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_magic_hailstone"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_magic_hailstone");
	}

});
