// TODO Edit strings.nut
this.perk_legend_magic_chain_lightning <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_magic_chain_lightning";
		this.m.Name = this.Const.Strings.PerkName.LegendMagicChainLightning;
		this.m.Description = this.Const.Strings.PerkDescription.LegendMagicChainLightning;
		this.m.Icon = "ui/perks/lightning_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.legend_magic_chain_lightning"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/legend_magic_chain_lightning_skill"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.legend_magic_chain_lightning");
	}

});
