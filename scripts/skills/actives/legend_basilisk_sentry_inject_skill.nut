this.legend_basilisk_sentry_inject_skill <- this.inherit("scripts/skills/skill", {
	m = {
		DamageArmorMult = 1.85,
	},

//add inject skill //also for skill sounds use snake bite - Inject: 1-2 range attack with snake bite stats, inflicts basilisk poison, reduced hit at close range. Melee skill.
	function create()
	{
		this.m.ID = "actives.legend_basilisk_sentry_inject";
		this.m.Name = "Inject"; //check
		this.m.Description = "no touch poison birb";
		this.m.KilledString = "Pecked to death"; //check
		this.m.Icon = "skills/sentry_inject.png";
		this.m.IconDisabled = "skills/sentry_inject.png";
		this.m.Overlay = "sentry_inject";
		this.m.SoundOnUse = [
			"sounds/enemies/dlc6/snake_attack_01.wav",
			"sounds/enemies/dlc6/snake_attack_02.wav",
			"sounds/enemies/dlc6/snake_attack_03.wav",
			"sounds/enemies/dlc6/snake_attack_04.wav"
		];
		this.m.SoundOnHit = [
			"sounds/enemies/dlc6/snake_attack_hit_01.wav",
			"sounds/enemies/dlc6/snake_attack_hit_02.wav",
			"sounds/enemies/dlc6/snake_attack_hit_03.wav",
			"sounds/enemies/dlc6/snake_attack_hit_04.wav"
		];
		this.m.SoundVolume = 1.1;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		// this.m.IsTooCloseShown = true;
		// this.m.IsWeaponSkill = true;
		this.m.InjuriesOnBody = this.Const.Injury.BluntBody;
		this.m.InjuriesOnHead = this.Const.Injury.BluntHead; //check below
		this.m.DirectDamageMult = 0.5; //ignore armour multi.
		this.m.HitChanceBonus = 0;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.ChanceDecapitate = 0;
		this.m.ChanceDisembowel = 0;
		this.m.ChanceSmash = 50;
	}

	function getExpectedDamage( _target )
	{
		local ret = this.skill.getExpectedDamage(_target);
		ret.HitpointDamage = this.Math.max(10, ret.HitpointDamage);
		ret.TotalDamage = this.Math.max(10, ret.TotalDamage);
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectBash);
		local target = _targetTile.getEntity();
		return this.attackEntity(_user, target);
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.DamageMinimum = this.Math.max(_properties.DamageMinimum, 10);
			_properties.DamageRegularMin += 50;
			_properties.DamageRegularMax += 75;
			_properties.DamageArmorMult *= this.m.DamageArmorMult;
		}
	}

});

