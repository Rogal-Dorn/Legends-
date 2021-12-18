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

	//constant passive
	function getDescription()
	{
		local bonus = this.getBonus() * 100;
		return "This character gains [color=" + this.Const.UI.Color.PositiveValue + "]" + bonus + "%[/color] maximum damage because of adjacent opponents.";
	}

	function isOpponent( _actor, _tag )
	{
		if (this.Math.abs(_actor.getTile().Level - _tag.Actor.getTile().Level) > 1)
		{
			return;
		}

		if (!_actor.isAlliedWithPlayer())
		{
			++_tag.Opponents;
		}
	}

	function getBonus()
	{
		return this.getContainer().getActor().getActorsWithinDistanceAsArray(1, this.Const.FactionRelation.Enemy).len() * 0.05;
	}

	function onUpdate( _properties )
	{
		this.m.IsHidden = this.getBonus() == 0.0;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		_properties.DamageRegularMax += this.getBonus();
	}


	//equipment check
	function onAfterUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
		local healthMissing = actor.getHitpointsMax() - actor.getHitpoints();

		if (item != null)
		{
			switch(item.getID())
			{
				//case "armor.body.leather_wraps":
				case "armor.body.cultist_leather_robe":
				//case "armor.body.sackcloth":
				//case "armor.body.tattered_sackcloth":
				case "armor.body.armor_of_davkul":
				case "armor.body.reinforced_animal_hide_armor":
				case "armor.body.hide_and_bone_armor":
				case "armor.body.animal_hide_armor":
				//case "legend_armor.body.legend_sackcloth_patched":
				//case "legend_armor.body.legend_sackcloth_tattered":
				//case "legend_armor.body.legend_sackcloth":
				case "legend_armor.body.cultist_leather_robe":
				case "legend_armor.body.legend_armor_warlock_cloak":
				case "legend_armor.body.legend_named_warlock_cloak":
				//case "legend_armor.body.legend_robes":
					_properties.Bravery += this.Math.floor(healthMissing * 0.75);
					return;
			}

			if (this.LegendsMod.Configs().LegendArmorsEnabled())
			{
				local validLayers = [
					"legend_armor.body.legend_animal_hide_armor",
					"legend_armor.body.legend_hide_and_bone_armor",
					"legend_armor.body.legend_reinforced_animal_hide_armor",
					"legend_armor.body.legend_armor_cult_armor",
				];

				foreach (l in item.getUpgradeIDs())
				{
					if (validLayers.find(l) != null)
					{
						_properties.Bravery += this.Math.floor(healthMissing * 0.5);
						return;
					}
				}
			}
		}
	}

});

