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
		if (item == null || item.getID() != "weapon.legend_shovel")
		{
			if (actor.getSkills().hasSkill("actives.knock_out"))
			{
				actor.getSkills().removeByID("actives.knock_out");
			}
			return;
		}

		if (!actor.getSkills().hasSkill("actives.knock_out"))
		{
			actor.getSkills().add(this.new("scripts/skills/actives/knock_out"));
		}

		_properties.MeleeSkill += 15;

		return;
	}

});
