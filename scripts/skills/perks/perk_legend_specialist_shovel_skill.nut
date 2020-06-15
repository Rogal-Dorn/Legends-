this.perk_legend_specialist_shovel_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_shovel_skill";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistShovelSkill;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistShovelSkill;
		this.m.Icon = "ui/perks/shovel_02.png";
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
			if(item.getID() == "weapon.legend_shovel")
			{
				_properties.MeleeSkill += 12;
			}
		
			if(item.getID() == "weapon.two_handed_mace" || item.getID() == "weapon.two_handed_flanged_mace" || 
				item.getID() == "weapon.named_two_handed_mace" || item.getID() == "weapon.named_two_handed_spiked_mace" || 
				item.getID() == "weapon.goedendag" || item.getID() == "weapon.legend_military_goedendag" || 
				item.getID() == "weapon.legend_two_handed_club" || item.getID() == "weapon.two_handed_spiked_mace")
			{
				_properties.MeleeSkill += 3;
			}
		}
	}

});
