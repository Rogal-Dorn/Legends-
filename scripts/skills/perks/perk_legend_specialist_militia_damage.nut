this.perk_legend_specialist_militia_damage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_militia_damage";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistMilitiaDamage;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistMilitiaDamage;
		this.m.Icon = "ui/perks/spear_01.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand).getID() == "weapon.militia_spear")
		{
			_properties.DamageRegularMin += 5;
			_properties.DamageRegularMax += 10;
		}
	}

});
