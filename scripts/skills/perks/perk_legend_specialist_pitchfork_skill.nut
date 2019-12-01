this.perk_legend_specialist_pitchfork_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_pitchfork_skill";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistPitchforkSkill;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistPitchforkSkill;
		this.m.Icon = "ui/perks/pitchfork_02.png";
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
			_properties.MeleeSkill += 12;
			_properties.DamageArmorMult += 0.25;
			}
			if(item.getID() == "weapon.pike" || item.getID() == "weapon.hooked_blade" || item.getID() == "weapon.billhook"  || item.getID() == "weapon.goblin_pike"   || item.getID() == "weapon.bladed_pike"  || item.getID() == "weapon.broken_bladed_pike" || item.getID() == "weapon.named_pike" || item.getID() == "weapon.named_billhook" || item.getID() == "weapon.warscythe" || item.getID() == "weapon.legend_halberd" || item.getID() == "weapon.legend_military_voulge" || item.getID() == "weapon.legend_voulge" || item.getID() == "weapon.legend_named_halberd" || item.getID() == "weapon.legend_named_voulge")
			{
			_properties.MeleeSkill += 3;
			_properties.DamageArmorMult += 0.08;
			}
		}
	}

});
