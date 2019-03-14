this.legend_specialist_militia_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_militia_skill";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistMilitiaSkill;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistMilitiaSkill;
		this.m.Icon = "ui/perks/spear_02.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand).getID() = "weapon.militia_spear")
		{
			_properties.MeleeSkill += 15;
		}
	}

});
