this.legend_specialist_shovel_skill <- this.inherit("scripts/skills/skill", {
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
		if (!this.m.Container.hasSkill("actives.knock_out") && this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand).getID() = "weapon.legend_shovel")
		{
			_properties.MeleeSkill += 15;
			this.m.Container.add(this.new("scripts/skills/actives/knock_out"));
		}
		else if (this.m.Container.hasSkill("actives.knock_out") && !this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand).getID() = "weapon.legend_shovel")
		{
			this.m.Container.removeByID("actives.knock_out");
		}
	}

});
