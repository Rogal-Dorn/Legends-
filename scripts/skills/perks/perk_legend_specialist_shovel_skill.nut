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
			local ids = [
				"weapon.legend_shovel",
				"weapon.legend_named_shovel"
			]

			if(item.getID() in ids)
			{
				_properties.MeleeSkill += 12;
			}

			ids = [
				"weapon.two_handed_mace",
				"weapon.two_handed_flanged_mace",
				"weapon.named_two_handed_mace",
				"weapon.named_two_handed_spiked_mace",
				"weapon.goedendag",
				"weapon.legend_military_goedendag",
				"weapon.legend_two_handed_club",
				"weapon.two_handed_spiked_mace"
			]
			if (item.getID() in ids)
			{
				_properties.MeleeSkill += 3;
			}
		}
	}

});
