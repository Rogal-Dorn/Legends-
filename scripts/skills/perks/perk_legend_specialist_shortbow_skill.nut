this.perk_legend_specialist_shortbow_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_shortbow_skill";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistShortbowSkill;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistShortbowSkill;
		this.m.Icon = "ui/perks/shortbow_02.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand).getID() == "weapon.short_bow")
		{
		_properties.RangedSkill += 15;
		_properties.ArmorDamageMult += 0.25;
		}
	}

});
