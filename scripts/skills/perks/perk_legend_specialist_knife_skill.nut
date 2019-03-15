this.perk_legend_specialist_knife_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_knife_skill";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistKnifeSkill;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistKnifeSkill;
		this.m.Icon = "ui/perks/spear_02.png";
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
			_properties.MeleeSkill += 15;
			_properties.DirectDamageMult += 0.5;
		}
	}

});
