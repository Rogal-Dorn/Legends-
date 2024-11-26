this.perk_legend_scholar <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		::Const.Perks.setup(this.m, ::Const.Perks.PerkDefs.LegendScholar);
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isDroppedAsLoot( _item )
	{
		return this.Math.rand(1, 100) <= 10; //10% more loot, counts for beast loot, weapons, armour, scrolls and anything else tagged as "isdroppedasloot". Stacks with other sources.
	}

});
