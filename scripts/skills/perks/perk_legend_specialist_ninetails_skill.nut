this.perk_legend_specialist_ninetails_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_ninetails_skill";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistNinetailsSkill;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistNinetailsSkill;
		this.m.Icon = "ui/perks/spear_02.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item != null && item.getID() == "weapon.legend_cat_o_nine_tails")
		{
			_properties.MeleeSkill += 15;
		}
	}

});
