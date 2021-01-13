this.hand_to_hand <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.hand_to_hand";
		this.m.Name = "Hand-to-Hand Attack";
		this.m.Description = "Let them fly! Use your limbs to inflict damage on your enemy. Damage depends on training.";
		this.m.KilledString = "Pummeled to death";
		this.m.Icon = "skills/active_08.png";
		this.m.IconDisabled = "skills/active_08_sw.png";
		this.m.Overlay = "active_08";
		this.m.SoundOnUse = [
			"sounds/combat/hand_01.wav",
			"sounds/combat/hand_02.wav",
			"sounds/combat/hand_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/hand_hit_01.wav",
			"sounds/combat/hand_hit_02.wav",
			"sounds/combat/hand_hit_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsSerialized = false;
		this.m.InjuriesOnBody = this.Const.Injury.BluntBody;
		this.m.InjuriesOnHead = this.Const.Injury.BluntHead;
		this.m.DirectDamageMult = 0.1;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 10;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local actor = this.getContainer().getActor();

		local bodyHealth = actor.getHitpoints();
		local initiative = actor.getInitiative();
		local average = (initiative + bodyHealth) * 0.25;

		local damageMin = average - 10;
		local damageMax = average + 10;

		if (this.getContainer().hasSkill("background.brawler") || this.getContainer().hasSkill("background.legend_commander_berserker") || this.getContainer().hasSkill("background.legend_berserker") || this.getContainer().hasSkill("background.legend_druid_commander") || this.getContainer().hasSkill("background.legend_druid") )
		{
			damageMin = damageMin * 1.25;
			damageMax = damageMax * 1.25;
		}

		if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_muscularity"))
		{
			local muscularity = this.Math.floor(bodyHealth * 0.1);
			damageMin += muscularity;
			damageMax += muscularity;
		}

            damageMin = this.Math.floor(damageMin);
			damageMax = this.Math.floor(damageMax);

		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				text = this.getCostString()
			}
		];
		
		if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_unarmed_training"))
		{
			ret.push({
				id = 4,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "Unarmed Training inflicts half the average of your hitpoints and initiative. This will deal [color=" + this.Const.UI.Color.DamageValue + "]" + damageMin + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damageMax + "[/color] damage"
			});
					
		}
		if (!this.getContainer().getActor().getSkills().hasSkill("perk.legend_unarmed_training"))
		{
			ret.push({
				id = 4,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + 5 + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + 10 + "[/color] damage"
			});
		}
		
		if (this.getContainer().hasSkill("background.brawler") || this.getContainer().hasSkill("background.legend_commander_berserker") || this.getContainer().hasSkill("background.legend_berserker") || this.getContainer().hasSkill("background.legend_druid_commander") || this.getContainer().hasSkill("background.legend_druid") )
		{		
			if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_unarmed_training"))
			{
			ret.push({
				id = 5,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "Includes +25% damage due to background"
			});
			}
		}	
		if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_muscularity"))		
		{		
			if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_unarmed_training"))
			{
		
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "Includes [color=" + this.Const.UI.Color.DamageValue + "]+10%[/color] of your hitpoints as damage due to Muscularity"
			});
			}
		}	

		return ret;
	}

	function isUsable()
	{
		local mainhand = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		return (mainhand == null || this.getContainer().hasSkill("effects.disarmed")) && this.skill.isUsable();
	}

	function isHidden()
	{
		local mainhand = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		return mainhand != null && !this.getContainer().hasSkill("effects.disarmed") || this.skill.isHidden() || this.m.Container.getActor().isStabled() || this.getContainer().hasSkill("effect.legend_transformed_bear") || this.getContainer().hasSkill("effect.legend_transformed_wolf") || this.getContainer().hasSkill("effect.legend_transformed_tree");
	}

	function onUpdate( _properties )
	{
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			local actor = this.getContainer().getActor();
			local bodyHealth = actor.getHitpoints();
			local intiative = actor.getInitiative()
			local average = (intiative + bodyHealth) * 0.25;
			local damageMin = average - 10;
			local damageMin = average + 10;


			if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_muscularity"))
			{
				local muscularity = this.Math.floor(bodyHealth * 0.1);
				damageMax += muscularity;
			}

			if (this.getContainer().hasSkill("background.brawler") || this.getContainer().hasSkill("background.legend_commander_berserker" || this.getContainer().hasSkill("background.legend_berserker")) )
			{
				damageMin *= 1.25;
				damageMax *= 1.25;
			}
			
            damageMin = this.Math.floor(damageMin);
			damageMax = this.Math.floor(damageMax);			
			
			if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_unarmed_training"))
			{
			_properties.DamageRegularMin += this.Math.floor(damageMin);
			_properties.DamageRegularMax += this.Math.floor(damageMax);
			}
			
			if (!this.getContainer().getActor().getSkills().hasSkill("perk.legend_unarmed_training"))
			{
			_properties.DamageRegularMin = 5;
			_properties.DamageRegularMax = 10;
			_properties.DamageArmorMult = 0.5;			
			}
		}
	}

	function onAfterUpdate( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInFists ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
		this.m.ActionPointCost = _properties.IsSpecializedInFists ? 3 : 4;

	}

	function onUse( _user, _targetTile )
	{
		return this.attackEntity(_user, _targetTile.getEntity());
	}

});

