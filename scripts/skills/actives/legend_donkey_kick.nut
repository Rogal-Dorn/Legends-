this.legend_donkey_kick <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_donkey_kick";
		this.m.Name = "Donkey Kick";
		this.m.Description = "The main attack of a donkey, more for defense than attack";
		this.m.KilledString = "Kicked to death";
		this.m.Icon = "skills/horse_kick.png";
		this.m.IconDisabled = "skills/horse_kick_bw.png";
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
		this.m.FatigueCost = 5;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local actor = this.getContainer().getActor()
		local p = actor.getCurrentProperties();
		local mult = 1.0;

		if (this.getContainer().hasSkill("background.brawler"))
		{
			mult = 2.0;
		}
		local Avg = (actor.getInitiative() +  actor.getHitpointsMax()) / 2;
		local DamageMin = this.Math.floor(Avg - 100);
		local DamageMax = this.Math.floor(Avg - 80);

		local damage_regular_min = DamageMin * p.DamageRegularMult * p.DamageTotalMult * mult;
		local damage_regular_max = DamageMax * p.DamageRegularMult * p.DamageTotalMult * mult;
		local damage_Armor_min = DamageMin * p.DamageArmorMult * p.DamageTotalMult * mult;
		local damage_Armor_max = DamageMax * p.DamageArmorMult * p.DamageTotalMult * mult;
		local damage_direct_max = this.Math.floor(DamageMax * this.m.DirectDamageMult);
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
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "Inflicts damage based on hitpoints and initiative [color=" + this.Const.UI.Color.DamageValue + "]" + damage_regular_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_regular_max + "[/color] damage, of which [color=" + this.Const.UI.Color.DamageValue + "]0[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_direct_max + "[/color] can ignore armor"
		});

		if (damage_Armor_max > 0)
		{
			ret.push({
				id = 5,
				type = "text",
				icon = "ui/icons/armor_damage.png",
				text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + damage_Armor_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_Armor_max + "[/color] armor damage"
			});
		}

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/hitchance.png",
			text = "Has [color=" + this.Const.UI.Color.NegativeValue + "]-10%[/color] chance to hit"
		});
		return ret;
	}

	function isUsable()
	{
		local mainhand = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		return mainhand == null && this.skill.isUsable();
	}

	function isHidden()
	{
		local mainhand = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		return mainhand != null || this.skill.isHidden();
	}

	function onUpdate( _properties )
	{
		if (!this.isHidden())
		{
			_properties.DamageArmorMult *= 0.5;
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			local actor = this.getContainer().getActor();
			local Avg = (actor.getInitiative() +  actor.getHitpointsMax()) / 2;
			_properties.DamageRegularMin += this.Math.floor(Avg - 100);
			_properties.DamageRegularMax += this.Math.floor(Avg - 80);
			_properties.MeleeSkill -= 10;
		}
	}

	function onUse( _user, _targetTile )
	{
		return this.attackEntity(_user, _targetTile.getEntity());
	}

});
