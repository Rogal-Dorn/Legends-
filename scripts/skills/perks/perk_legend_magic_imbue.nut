// TODO Edit strings, icon
this.perk_mage_legend_magic_imbue <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_magic_imbue";
		this.m.Name = this.Const.Strings.PerkName.LegendMagicImbue;
		this.m.Description = this.Const.Strings.PerkDescription.LegendMagicImbue;
		this.m.Icon = "ui/perks/legend_magic_imbue_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_magic_imbue"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_magic_imbue_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_magic_imbue");
	}

});
