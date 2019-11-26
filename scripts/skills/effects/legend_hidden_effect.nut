this.legend_hidden_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effect.legend_hidden";
		this.m.Name = "Hidden";
		this.m.Description = "This character is hidden in terrain and can not be seen by opponents unless directly adjacent or attacking them first.";
		this.m.Icon = "skills/status_effect_08.png";
		this.m.IconMini = "status_effect_08_mini";
		this.m.Type = this.Const.SkillType.Terrain | this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsHidden = false;
		this.m.IsSerialized = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_assassinate"))
		{
			ret.extend([
				{
					id = 11,
					type = "text",
					icon = "ui/icons/regular_damage.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+100%[/color] Minimum Damage from the Assassinate perk"
				},
				{
					id = 12,
					type = "text",
					icon = "ui/icons/regular_damage.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+100%[/color] Maximum Damage from the Assassinate perk"
				},
			]);
		}


		if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_untouchable"))
		{
			ret.extend([
						{
					id = 13,
					type = "text",
					icon = "ui/icons/melee_defense.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+40[/color] Melee Defense from the Untouchable perk"
				},
				{
					id = 14,
					type = "text",
					icon = "ui/icons/ranged_defense.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]+40[/color] Ranged Defense from the Untouchable perk"
				}
			]);
		}

		return ret;

	}

	function onMovementCompleted( _tile )
	{
		if (_tile.hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()))
		{
			this.getContainer().getActor().setHidden(false);
			this.removeSelf();
			return;
		}

		this.getContainer().getActor().setHidden(true);
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		this.getContainer().getActor().setHidden(false);
		this.removeSelf();
	}

	function onTargetMissed( _skill, _targetEntity )
	{
		this.getContainer().getActor().setHidden(false);
		this.removeSelf();
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		actor.getSprite("armor").Saturation = 0.5;
		actor.getSprite("armor").setBrightness(0.5);
		actor.getSprite("helmet").Saturation = 0.5;
		actor.getSprite("helmet").setBrightness(0.5);
		actor.getSprite("shield_icon").Saturation = 0.5;
		actor.getSprite("shield_icon").setBrightness(0.5);
		actor.getSprite("armor_layer_chain").setBrightness(0.5);
		actor.getSprite("armor_layer_chain").Saturation = 0.5;
		actor.getSprite("armor_layer_plate").setBrightness(0.5);
		actor.getSprite("armor_layer_plate").Saturation = 0.5;
		actor.getSprite("armor_layer_tabbard").setBrightness(0.5);
		actor.getSprite("armor_layer_tabbard").Saturation = 0.5;
		actor.getSprite("armor_layer_cloak").setBrightness(0.5);
		actor.getSprite("armor_layer_cloak").Saturation = 0.5;
		actor.getSprite("head").setBrightness(0.5);
		actor.getSprite("head").Saturation = 0.5;
		actor.getSprite("body").setBrightness(0.5);
		actor.getSprite("body").Saturation = 0.5;
		actor.getSprite("hair").setBrightness(0.5);
		actor.getSprite("hair").Saturation = 0.5;
		actor.getSprite("beard").setBrightness(0.5);
		actor.getSprite("beard").Saturation = 0.5;
	}

	function onRemoved()
	{
		local actor = this.getContainer().getActor();
		actor.getSprite("armor").Saturation = 1.0;
		actor.getSprite("armor").setBrightness(1.0);
		actor.getSprite("helmet").Saturation = 1.0;
		actor.getSprite("helmet").setBrightness(1.0);
		actor.getSprite("shield_icon").Saturation = 1.0;
		actor.getSprite("shield_icon").setBrightness(1.0);
		actor.getSprite("armor_layer_chain").setBrightness(1.0);
		actor.getSprite("armor_layer_chain").Saturation = 1.0;
		actor.getSprite("armor_layer_plate").setBrightness(1.0);
		actor.getSprite("armor_layer_plate").Saturation = 1.0;
		actor.getSprite("armor_layer_tabbard").setBrightness(1.0);
		actor.getSprite("armor_layer_tabbard").Saturation = 1.0;
		actor.getSprite("armor_layer_cloak").setBrightness(1.0);
		actor.getSprite("armor_layer_cloak").Saturation = 1.0;
		actor.getSprite("head").setBrightness(1.0);
		actor.getSprite("head").Saturation = 1.0;
		actor.getSprite("body").setBrightness(1.0);
		actor.getSprite("body").Saturation = 1.0;
		actor.getSprite("hair").setBrightness(1.0);
		actor.getSprite("hair").Saturation = 1.0;
		actor.getSprite("beard").setBrightness(1.0);
		actor.getSprite("beard").Saturation = 1.0;
	}

	function onUpdate( _properties )
	{
		if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_untouchable"))
		{
			_properties.RangedDefense += 40;
			_properties.MeleeDefense += 40;
		}


		if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_assassinate"))
		{
			_properties.DamageRegularMin *= 2;
			_properties.DamageRegularMax *= 2;
		}
	}

});

