this.perk_legend_specialist_cult_armor <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_cult_armor";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecCultArmor;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecCultArmor;
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
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
		local healthMissing = actor.getHitpointsMax() - actor.getHitpoints();
		if (item != null)
		{
			switch (item.getID())
			{
				case "armor.body.leather_wraps":
				case "armor.body.cultist_leather_robe":
				case "armor.body.sackcloth":
				case "armor.body.tattered_sackcloth":
				case "armor.body.armor_of_davkul":'
				case "armor.body.reinforced_animal_hide_armor":
				case "armor.body.hide_and_bone_armor":
				case "armor.body.animal_hide_armor":
				case "legend.armor.body.patched_sackcloth":
				case "legend.armor.body.tattered_sackcloth":
				case "legend.armor.body.sackcloth":
				case "legend_armor.body.cultist_leather_robe":
				case "legend.armor.body.monk_robes":
				case "legend_armor.body.animal_hide_armor":
				case "legend_armor.body.legend_hide_and_bone_armor":
				case "legend_armor.body.reinforced_animal_hide_armor":
					_properties.Bravery += this.Math.floor(healthMissing * 0.5);
					break;
			}
		}
	}

});
