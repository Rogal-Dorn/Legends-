this.perk_legend_specialist_butcher_damage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_butcher_damage";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistButcherDamage;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistButcherDamage;
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
		if (item != null && item.getID() == "weapon.butchers_cleaver")
		{
			_properties.DamageRegularMin += 10;
			_properties.DamageRegularMax += 15;
		}
	}

});
