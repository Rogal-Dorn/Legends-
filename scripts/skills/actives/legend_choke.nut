this.legend_choke <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_choke";
		this.m.Name = "Choke";
		this.m.Description = "A well-placed attack at the opponent\'s neck. Ignores all armor but is harder to hit with and can not land critical hits for additional damage, nor inflict additional damage with double grip.";
		this.m.KilledString = "Choked";
		this.m.Icon = "skills/active_27.png";
		this.m.IconDisabled = "skills/active_27_sw.png";
		this.m.Overlay = "active_27";
		this.m.SoundOnUse = [
			"sounds/combat/puncture_01.wav",
			"sounds/combat/puncture_02.wav",
			"sounds/combat/puncture_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/puncture_hit_01.wav",
			"sounds/combat/puncture_hit_02.wav",
			"sounds/combat/puncture_hit_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsWeaponSkill = true;
		this.m.InjuriesOnBody = this.Const.Injury.PiercingBody;
		this.m.InjuriesOnHead = this.Const.Injury.PiercingHead;
		this.m.HitChanceBonus = -25;
		this.m.DirectDamageMult = 1.0;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 20;
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
		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/hitchance.png",
			text = "Has [color=" + this.Const.UI.Color.NegativeValue + "]-25%[/color] chance to hit"
		});
		ret.extend([
			{
				id = 7,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = "Hit chance determined by your targets fatigue, 0% if they are fresh and 100% if they are exhausted. If your target is dazed or parried hitchance is increaded by +10%.  If they are stunned or netted you gain +25%. If they are grappled or sleeping you gain +50%. Unarmed mastery doubles your chance to hit. These bonuses stack up to 100%.  "
			},
			{
				id = 8,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Completely ignores armor"
			}
		]);
		return ret;
	}

	function isUsable()
	{
		local mainhand = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		local offhand = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
		return ((offhand == null || mainhand == null) || this.getContainer().hasSkill("effects.disarmed")) && this.skill.isUsable();
	}

	function isHidden()
	{
		local mainhand = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		local offhand = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
		return mainhand != null && offhand != null && !this.getContainer().hasSkill("effects.disarmed") || this.skill.isHidden() || this.m.Container.getActor().isStabled();
	}
	function getHitChance(_targetEntity)
	{
		if (_targetEntity == null)
		{
			return 0;
		}
		local mod = 0;
		if (_targetEntity.getSkills().hasSkill("effects.legend_dazed"))
		{
		mod += 10;
		}
		if (_targetEntity.getSkills().hasSkill("effects.legend_parried"))
		{
		mod += 10;
		}
		if (_targetEntity.getSkills().hasSkill("effects.legend_grappled"))
		{
		mod += 50;
		}
		if (_targetEntity.getSkills().hasSkill("effects.stunned"))
		{
		mod += 25;
		}
		if (_targetEntity.getSkills().hasSkill("effects.sleeping"))
		{
		mod += 50;
		}
		if (_targetEntity.getSkills().hasSkill("effects.net"))
		{
		mod += 25;
		}
		local chance = (1.0 - _targetEntity.getFatiguePct()) * 50;
		return mod - this.Math.round(chance);
	}

	function onAfterUpdate( _properties )
	{
		if (_properties.IsSpecializedInFists)
		{
			this.m.FatigueCostMult = this.Const.Combat.WeaponSpecFatigueMult;
			this.m.ActionPointCost = 3;
		}
	}

	function onUse( _user, _targetTile )
	{
		return this.attackEntity(_user, _targetTile.getEntity());
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			local actor = this.getContainer().getActor();
			local bodyHealth = actor.getHitpointsMax();
			local average = (actor.getInitiative() +  bodyHealth) * 0.25;
			local damageMin = average - 10;
			local damageMin = average + 10;



			if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_muscularity"))
			{
				local muscularity = this.Math.floor(bodyHealth * 0.1);
				damageMax += muscularity;
			}

			if (this.getContainer().hasSkill("background.brawler") || this.getContainer().hasSkill("background.legend_commander_berserker" || this.getContainer().hasSkill("background.legend_berserker")) )
			{
				damageMin = damageMin * 1.25;
				damageMax = damageMax * 1.25;
			}
			_properties.DamageRegularMin += this.Math.floor(damageMin);
			_properties.DamageRegularMax += this.Math.floor(damageMax);
			_properties.MeleeSkill += _properties.IsSpecializedInFists ? 10 : -10;


			this.m.DirectDamageMult = _properties.IsSpecializedInFists ? 0.5 : 0.1;
			local chance = this.getHitChance(_targetEntity);
			if (_properties.IsSpecializedInFists)
			{
				chance += 15;
			}
			_properties.MeleeSkill += chance;
			_properties.DamageArmorMult *= 0.0;
			_properties.IsIgnoringArmorOnAttack = true;
			_properties.HitChanceMult[this.Const.BodyPart.Head] = 0.0;

		}
	}

});

