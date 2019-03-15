this.perk_legend_specialist_knife_damage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_knife_damage";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistKnifeDamage;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistKnifeDamage;
		this.m.Icon = "ui/perks/woodaxe_01.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand).getID() == "weapon.knife")
		{
			_properties.DamageRegularMin += 5;
			_properties.DamageRegularMax += 15;
		}
	}

});
