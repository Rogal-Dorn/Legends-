this.legend_magic_missile <- this.inherit("scripts/skills/skill", {
	m = {
		AdditionalAccuracy = 10,
		AdditionalHitChance = 10
	},
	function create()
	{
		this.m.ID = "actives.legend_magic_missile";
		this.m.Name = "Missile";
		this.m.Description = "A burst of force, leaping forward into a foe.";
		this.m.KilledString = "Shot";
		this.m.Icon = "skills/missile_square.png";
		this.m.IconDisabled = "skills/missile_square_bw.png";
		this.m.Overlay = "missile_square";
		this.m.SoundOnUse = [
			"sounds/combat/magic_missile_01.wav",
			"sounds/combat/magic_missile_02.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/arrow_hit_01.wav",
			"sounds/combat/arrow_hit_02.wav",
			"sounds/combat/arrow_hit_03.wav"
		];
		this.m.SoundOnHitShield = [
			"sounds/combat/shield_hit_arrow_01.wav",
			"sounds/combat/shield_hit_arrow_02.wav",
			"sounds/combat/shield_hit_arrow_03.wav"
		];
		this.m.SoundOnMiss = [
			"sounds/combat/arrow_miss_01.wav",
			"sounds/combat/arrow_miss_02.wav",
			"sounds/combat/arrow_miss_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.Delay = 100;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.InjuriesOnBody = this.Const.Injury.PiercingBody;
		this.m.InjuriesOnHead = this.Const.Injury.PiercingHead;
		this.m.DirectDamageMult = 0.8;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 6;
		this.m.MaxLevelDifference = 8;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		ret.extend([
			{
				id = 6,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.getMaxRange() + "[/color] tiles on even ground, more if shooting downhill"
			}
		]);

		if (this.m.AdditionalAccuracy >= 0)
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.AdditionalAccuracy + "%[/color] chance to hit, and [color=" + this.Const.UI.Color.NegativeValue + "]" + (-4 + this.m.AdditionalHitChance) + "%[/color] per tile of distance"
			});
		}
		else
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = "Has [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.AdditionalAccuracy + "%[/color] chance to hit, and [color=" + this.Const.UI.Color.NegativeValue + "]" + (-4 + this.m.AdditionalHitChance) + "%[/color] per tile of distance"
			});
		}



		return ret;
	}

	function isUsable()
	{
		return !this.Tactical.isActive() || this.skill.isUsable() && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
	}


	function onAfterUpdate( _properties )
	{
		this.m.MaxRange = this.m.Item.getRangeMax() - 1 + (_properties.IsSpecializedInStaves ? 1 : 0);
		this.m.AdditionalAccuracy = this.m.Item.getAdditionalAccuracy();
		this.m.FatigueCostMult = _properties.IsSpecializedInStaves ? this.Const.Combat.WeaponSpecFatigueMult : 0.8;
		this.m.ActionPointCost = _properties.IsSpecializedInStaves ? 5 : 6;
	}

	function onUse( _user, _targetTile )
	{
		return this.attackEntity(_user, _targetTile.getEntity());
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.MeleeSkill += this.m.AdditionalAccuracy;
			_properties.HitChanceAdditionalWithEachTile += -4 + this.m.AdditionalHitChance;
		}
	}

});
