this.perk_legend_specialist_sling_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_sling_skill";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistSlingSkill;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistSlingSkill;
		this.m.Icon = "ui/perks/shortbow_02.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand).getID() == "weapon.legend_sling")
		{
		_properties.RangedSkill += 15;
		_properties.ArmorDamageMult += 0.25;
		}
	}

});
