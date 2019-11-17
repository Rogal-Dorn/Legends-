this.perk_legend_specialist_cult_armor <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_cult_armor";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistCultArmor;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistCultArmor;
		this.m.Icon = "ui/perks/penance_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
		local healthMissing = actor.getHitpointsMax() - actor.getHitpoints();
		if (item != null)
		{
			if(item.getID() == "armor.body.leather_wraps" || item.getID() == "armor.body.cultist_leather_robe" || item.getID() == "armor.body.sackcloth" || item.getID() == "armor.body.tattered_sackcloth" || item.getID() == "armor.body.armor_of_davkul")
			{
			_properties.Bravery += healthMissing / 10;
			_properties.Bravery += healthMissing / 10;
			}
		}
	}

});
