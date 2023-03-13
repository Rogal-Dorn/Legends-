this.legend_throw_knife <- this.inherit("scripts/skills/skill", {
	m = {
		AdditionalAccuracy = 5,
		AdditionalHitChance = -10,
		AmmoPerUse = 2.0,
		AmmoMax = 3,
        Ammo = 3

	},
	function create()
	{
		this.m.ID = "actives.legend_throw_knife";
		this.m.Name = "Throw Knife";
		this.m.Description = "Throw a knife at an enemy. Costs " + this.m.AmmoPerUse + " ammo per use and has a [color=" + this.Const.UI.Color.PositiveValue + "]+15%[/color] chance to hit the head.\nCannot be used while engaged in melee.";
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
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
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
		this.m.ActionPointCost = 3;
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
        //test start
        //if (this.m.Ammo > 0)
        ret.push({
			id = 5,
			type = "text",
			icon = "ui/tooltips/warning.png",
			text = "You can use [color=" + this.Const.UI.Color.PositiveValue + "]3[/color] time per battle and will consume two ammo assets for each use"
		}); //test end
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/asset_ammo.png",
			text = "You have [color=" + this.Const.UI.Color.PositiveValue +"]" + this.getAmmo() + "[/color] ammo."
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

	function isUsable()
	{
		return this.Tactical.isActive() || !this.skill.isUsable() && this.getAmmo() < 0 && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
		if (this.m.AmmoMax <= 0)
		{
			return false;
		}

		return true;
	}

	/*function isUsable()
	{
		return this.skill.isUsable() && this.m.Ammo == 0;
		if (this.m.AmmoMax <= 0)
		{
			return false;
		}

		return true;
	}*/

	function isHidden()
	{
	   if (this.m.AmmoMax > 0)
	   {
	     return false;
	   }

	    return true;
	}


	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill != this)
		{
			return;
		}

		local mainhand = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		_properties.DamageRegularMin *= 0.0;
		_properties.DamageRegularMax *= 0.0;
		_properties.DamageArmorMult = 0.0;

		local actor = this.getContainer().getActor();
		_properties.DamageRegularMin += 2;
		_properties.DamageRegularMax += 12;
		_properties.DamageArmorMult = 0.1;

		if (this.m.Container.hasSkill("effects.disarmed"))
		{
			local mhand = actor.getMainhandItem();
			if (mhand != null)
			{
				_properties.DamageRegularMin -= mhand.m.RegularDamage;
				_properties.DamageRegularMax -= mhand.m.RegularDamageMax;
			}
		}
	}

	function getAmmo()
	{
		return this.m.Ammo;
	}

	function consumeAmmo()
	{
        if(this.m.Ammo == 0) {
            return 0;
        }
        this.m.Ammo = this.m.Ammo - 1;
	}


     function onCombatFinished()
    {
    	//this.m.AmmoMax = 3;
        this.skill.onCombatFinished();
        this.m.AmmoMax = 3;
       this.m.Ammo = this.m.AmmoMax;
    }

	function onUse( _user, _targetTile )
	{
		this.m.AmmoMax = this.m.AmmoMax - 1
		local Ammo = this.getAmmo();
        this.consumeAmmo();
		this.World.Assets.addAmmo(0 - this.m.AmmoPerUse);

		local ret = this.attackEntity(_user, _targetTile.getEntity());
		return ret;

		local effect = this.new("scripts/skills/effects/legend_baffled_effect");
		if (_user.getFaction() == this.Const.Faction.Player )
		{
			effect.setActor(this.getContainer().getActor());
		}
		this.m.Ammo = 2;
	}

	function onAfterUpdate( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInThrowing ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
	}
});

