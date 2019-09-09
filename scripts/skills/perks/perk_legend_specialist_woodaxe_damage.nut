this.perk_legend_specialist_woodaxe_damage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_woodaxe_damage";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistWoodaxeDamage;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistWoodaxeDamage;
		this.m.Icon = "ui/perks/woodaxe_01.png";
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
		if (item != null)
		{
			if(item.getID() == "weapon.woodcutters_axe" || item.getID() == "weapon.legend_saw")
			{
			_properties.DamageRegularMin += 4;
			_properties.DamageRegularMax += 12;
			}
			if(item.getID() == "weapon.hand_axe" || item.getID() == "weapon.hatchet" ||item.getID() == "weapon.orc_axe"  || item.getID() == "weapon.fighting_axe"  || item.getID() == "weapon.throwing_axe"  || item.getID() == "weapon.orc_axe_2h"  || item.getID() == "weapon.named_axe"  || item.getID() == "weapon.axehammer"  || item.getID() == "weapon.crude_axe"  || item.getID() == "weapon.heavy_rusty_axe"  || item.getID() == "weapon.heavy_throwing_axe" || item.getID() == "weapon.named_heavy_rusty_axe" || item.getID() == "weapon.named_orc_axe" || item.getID() == "weapon.named_greataxe" || item.getID() == "weapon.greataxe" ||item.getID() == "weapon.longaxe" || item.getID() == "weapon.legend_hoe")
			{
			_properties.DamageRegularMin += 1;
			_properties.DamageRegularMax += 3;
			}
		}
	}

});
