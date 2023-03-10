this.legend_throw_knife <- this.inherit("scripts/skills/skill", {
	m = {
		AdditionalAccuracy = 20,
		AdditionalHitChance = -10,
		AmmoPerUse = 2.0 //resource taken for every throw
	},
	function create()
	{
		this.m.ID = "actives.legend_throw_knife";
		this.m.Name = "Throw Knife";
		this.m.Description = "Throw a knife at an enemy. Costs " + this.m.AmmoPerUse + " per use. Cannot be used while engaged in melee.";
		this.m.Icon = "skills/active_87.png"; //To do
		this.m.IconDisabled = "skills/active_87_sw.png"; //to do
		this.m.Overlay = "active_87"; //to do
		this.m.SoundOnUse = [ //need new sounds ideally
			"sounds/combat/throw_axe_01.wav",
			"sounds/combat/throw_axe_02.wav",
			"sounds/combat/throw_axe_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/throw_axe_hit_01.wav",
			"sounds/combat/throw_axe_hit_02.wav",
			"sounds/combat/throw_axe_hit_03.wav"
		];
		this.m.SoundOnHitDelay = -150;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.Delay = 750;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = true;
		this.m.IsWeaponSkill = true;
		this.m.IsDoingForwardMove = false;
		this.m.InjuriesOnBody = this.Const.Injury.CuttingBody;
		this.m.InjuriesOnHead = this.Const.Injury.CuttingHead;
		this.m.DirectDamageMult = 0.1;
		this.m.ActionPointCost = 2;
		this.m.FatigueCost = 10;
		this.m.MinRange = 2;
		this.m.MaxRange = 3;
		this.m.MaxLevelDifference = 4;
		this.m.ProjectileType = this.Const.ProjectileType.Axe;
		this.m.ProjectileTimeScale = 1.5;
		this.m.IsProjectileRotated = false;
	}

	function getTooltip()
	{
		local ret = this.getRangedTooltip(this.getDefaultTooltip());

		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/asset_money.png",
			text = "You have [color=" + this.Const.UI.Color.PositiveValue +"]" + this.Math.floor(this.World.Assets.getAmmo()) + "[/color] ammo."
		});

		if (this.Tactical.isActive() && this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()))
		{
			ret.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Cannot be used when this character is engaged in melee[/color]"
			});
		}

		return ret;
	}

	function onUpdate( _properties )
	{
		_properties.DamageRegularMin += 2;
		_properties.DamageRegularMax += 12;
		_properties.DamageArmorMult *= 0.1;
	}

	// function isUsable()
	// {
	// 	return !this.Tactical.isActive() || this.skill.isUsable() && this.getAmmo() > 0 && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
	// }

	function isUsable()
	{
		if (!this.Tactical.isActive() || this.skill.isUsable() && this.World.Assets.getAmmo() < 2 && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()))
		{
			return false;
		}

		// if (!this.skill.isUsable())
		// {
		// 	return false
		// }

		// if (this.World.Assets.getAmmo() < 2) //less than 2 = cannot use
		// {
		// 	return false
		// }

		return true
	}

	function onUse( _user, _targetTile )
	{
		local AmmoPerUse = this.World.Assets.getAmmo();
		local ret = this.attackEntity(_user, _targetTile.getEntity());
		this.consumeAmmo();
		return ret;

		local effect = this.new("scripts/skills/effects/legend_baffled_effect");
		if (_user.getFaction() == this.Const.Faction.Player )
		{
			effect.setActor(this.getContainer().getActor());
		}
	}

	function onAfterUpdate( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInThrowing ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
		this.m.AdditionalAccuracy = 20 + this.m.getAdditionalAccuracy();
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.RangedSkill += this.m.AdditionalAccuracy;
			_properties.HitChanceAdditionalWithEachTile += this.m.AdditionalHitChance;
		}
	}

});

