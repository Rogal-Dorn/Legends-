this.perk_legend_specialist_butcher_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_butcher_skill";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistButcherSkill;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistButcherSkill;
		this.m.Icon = "ui/perks/cleaver_02.png";
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
		if (item.getID() == "weapon.butchers_cleaver")
		{
			_properties.MeleeSkill += 15;
		}
	}

});
