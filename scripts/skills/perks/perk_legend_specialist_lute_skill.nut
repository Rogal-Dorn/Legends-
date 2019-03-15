this.perk_legend_specialist_lute_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_lute_skill";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistLuteSkill;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistLuteSkill;
		this.m.Icon = "ui/perks/lute_02.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		if (!this.m.Container.hasSkill("actives.legend_pull") && this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand).getID() == "weapon.lute")
		{
			_properties.MeleeSkill += 15;
			this.m.Container.add(this.new("scripts/skills/actives/legend_pull"));
		}
		else if (this.m.Container.hasSkill("actives.legend_pull") && !this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand).getID() == "weapon.lute")
		{
			this.m.Container.removeByID("actives.legend_pull");
		}
	}

});
