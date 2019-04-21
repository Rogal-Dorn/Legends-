this.legend_vala_warden_pale_touch <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_vala_warden_pale_touch";
		this.m.Name = "Pale Touch";
		this.m.Description = "";
		this.m.KilledString = "Frightened to death";
		this.m.Icon = "skills/active_42.png";
		this.m.IconDisabled = "skills/active_42.png";
		this.m.Overlay = "active_42";
		this.m.SoundOnUse = [
			"sounds/combat/legend_vala_warden_pale_touch.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.DirectDamageMult = 1.0;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 10;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}


	function onUse( _user, _targetTile )
	{
		return this.attackEntity(_user, _targetTile.getEntity());
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

			_properties.DamageRegularMin += 10 + this.Math.round(bonus * 0.67);
			_properties.DamageRegularMax += 15 + this.Math.round(bonus);
			_properties.IsIgnoringArmorOnAttack = true;
		}
	}
});
