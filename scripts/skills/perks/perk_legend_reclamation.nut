this.perk_legend_reclamation <- this.inherit("scripts/skills/skill", {
	m = {
		LootChance = 20
	},
	function create()
	{
		::Const.Perks.setup(this.m, ::Const.Perks.PerkDefs.LegendReclamation);
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

});
