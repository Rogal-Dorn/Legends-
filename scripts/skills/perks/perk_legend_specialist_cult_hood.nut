this.perk_legend_specialist_cult_hood <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_cult_hood";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecialistCultHood;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecialistCultHood;
		this.m.Icon = "ui/perks/dedication_circle.png";
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
		local resolve = actor.getBaseProperties().Bravery;
		if (item != null)
		{
			if(item.getID() == "armor.head.cultist_hood" || item.getID() == "armor.head.cultist_leather_hood" || item.getID() == "armor.head.leather_helmet" || item.getID() == "armor.head.decayed_closed_flat_top_with_sack" || item.getID() == "armor.head.mask_of_davkul")
			{
			_properties.MeleeDefense += resolve / 10;
			_properties.RangedDefense += resolve / 10;
			}
		}
	}

});
