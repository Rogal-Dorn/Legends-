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
		local actor = this.getContainer().getActor();
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (item == null)
		{
			return;
		}

		switch (item.getID())
		{
			case "weapon.militia_spear":
			case "weapon.legend_wooden_spear":
			case "weapon.ancient_spear":
				_properties.DamageRegularMin += 4;
				_properties.DamageRegularMax += 12;
				break;
			case "weapon.goblin_spear":
			case "weapon.fighting_spear":
			case "weapon.named_spear":
			case "weapon.boar_spear":
			case "weapon.named_goblin_spear":
			case "weapon.throwing_spear":
			case "weapon.legend_glaive":
			case "weapon.legend_named_glaive":
			case "weapon.legend_militia_glaive":
			case "weapon.legend_battle_glaive":
				_properties.DamageRegularMin += 1;
				_properties.DamageRegularMax += 3;
				break;
		}
	}

});
