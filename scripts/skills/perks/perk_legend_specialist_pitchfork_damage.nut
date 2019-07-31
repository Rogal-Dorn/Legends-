this.perk_legend_specialist_pitchfork_damage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_pitchfork_damage";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistPitchforkDamage;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistPitchforkDamage;
		this.m.Icon = "ui/perks/pitchfork_01.png";
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
			if(item.getID() == "weapon.pitchfork" || item.getID() == "weapon.legend_wooden_pitchfork"  || item.getID() == "weapon.legend_hoe"  || item.getID() == "weapon.legend_scythe"  || item.getID() == "weapon.wooden_flail")
			{
			_properties.DamageRegularMin += 4;
			_properties.DamageRegularMax += 12;
			}
			if(item.getID() == "weapon.pike" || item.getID() == "weapon.hooked_blade" || item.getID() == "weapon.billhook"  || item.getID() == "weapon.goblin_pike"   || item.getID() == "weapon.bladed_pike"  || item.getID() == "weapon.broken_bladed_pike" || item.getID() == "weapon.named_pike" || item.getID() == "weapon.named_billhook" || item.getID() == "weapon.warscythe" || item.getID() == "weapon.named_warscythe")
			{
			_properties.DamageRegularMin += 1;
			_properties.DamageRegularMax += 3;
			}
		}
	}

});
