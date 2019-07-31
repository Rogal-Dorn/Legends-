this.perk_legend_specialist_shortbow_damage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_shortbow_damage";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistShortbowDamage;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistShortbowDamage;
		this.m.Icon = "ui/perks/shortbow_01.png";
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
		if (item != null && item.getID() == "weapon.short_bow")
		{
			_properties.DamageRegularMin += 4;
			_properties.DamageRegularMax += 12;
		}

		if (item != null && item.getID() == "weapon.goblin_bow")
		{
			_properties.DamageRegularMin += 4;
			_properties.DamageRegularMax += 12;
		}
		if (item != null && item.getID() == "weapon.wonky_bow")
		{
			_properties.DamageRegularMin += 4;
			_properties.DamageRegularMax += 12;
		}

		if (item != null && item.getID() == "weapon.hunting_bow")
		{
			_properties.DamageRegularMin += 1;
			_properties.DamageRegularMax += 3;
		}
		if (item != null && item.getID() == "weapon.masterwork_bow")
		{
			_properties.DamageRegularMin += 1;
			_properties.DamageRegularMax += 3;
		}
		if (item != null && item.getID() == "weapon.war_bow")
		{
			_properties.DamageRegularMin += 1;
			_properties.DamageRegularMax += 3;
		}
		if (item != null && item.getID() == "weapon.goblin_heavy_bow")
		{
			_properties.DamageRegularMin += 1;
			_properties.DamageRegularMax += 3;
		}
		if (item != null && item.getID() == "weapon.named_goblin_heavy_bow")
		{
			_properties.DamageRegularMin += 1;
			_properties.DamageRegularMax += 3;
		}
		if (item != null && item.getID() == "weapon.named_warbow")
		{
			_properties.DamageRegularMin += 1;
			_properties.DamageRegularMax += 3;
		}
	}

});
