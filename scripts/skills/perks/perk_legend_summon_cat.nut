this.perk_legend_summon_cat <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_summon_cat";
		this.m.Name = this.Const.Strings.PerkName.LegendSummonCat;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSummonCat;
		this.m.Icon = "ui/perks/cat_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		local stash = this.World.Assets.getStash()
		stash.add(this.new("scripts/items/accessory/legend_cat_item"));
	}

});