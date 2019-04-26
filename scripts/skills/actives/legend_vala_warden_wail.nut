this.legend_vala_warden_wail <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_vala_warden_wail";
		this.m.Name = "Wail";
		this.m.Description = "";
		this.m.KilledString = "Frightened to death";
		this.m.Icon = "skills/active_41.png";
		this.m.IconDisabled = "skills/active_41.png";
		this.m.Overlay = "active_41";
		this.m.SoundOnUse = [
			"sounds/combat/legend_vala_warden_wail.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.DirectDamageMult = 1.0;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 10;
		this.m.MinRange = 2;
		this.m.MaxRange = 3;
	}


	function isUsable()
	{
		return !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
	}


	function onUse( _user, _targetTile )
	{
		return this.attackEntity(_user, _targetTile.getEntity());
	}


	function onUpdate( _properties )
	{
		_properties.RangedAttackBlockedChanceMult = 0.0;
	}


	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			local bonus = 0;
			local scaling = this.getContainer().getActor().getSkills().getSkillByID("special.legend_vala_warden_damage");

			if (scaling != null)
			{
				bonus = scaling.getDamageBonus() / 20.0;
			}

			if (_skill.isAttack() && _targetEntity != null && _targetEntity.getID() != this.getContainer().getActor().getID() && _targetEntity.getFaction() == this.getContainer().getActor().getFaction())
			{
				_properties.DamageRegularMin = 0;
				_properties.DamageRegularMax = 0;
				_properties.IsIgnoringArmorOnAttack = false;
			}
			else
			{
				_properties.DamageRegularMin += 10 + this.Math.round(bonus * 0.67);
				_properties.DamageRegularMax += 15 + this.Math.round(bonus);
				_properties.IsIgnoringArmorOnAttack = true;
				_properties.HitChanceAdditionalWithEachTile -= 2;
			}
		}
	}
});
