this.legend_cascade_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_cascade";
		this.m.Name = "Triple Strike";
		this.m.Description = "Let loose a cascade of three striking shots on your opponent. Will strike over or around shield cover.";
		this.m.KilledString = "Pin cushioned";
		this.m.Icon = "skills/triplestrike_square.png";
		this.m.IconDisabled = "skills/triplestrike_square_bw.png";
		this.m.Overlay = "triplestrike_square";
		this.m.SoundOnUse = [
			"sounds/combat/tripleshot_01.wav",
			"sounds/combat/tripleshot_02.wav",
			"sounds/combat/tripleshot_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/tripleshot_hit_01.wav",
			"sounds/combat/tripleshot_hit_02.wav",
			"sounds/combat/tripleshot_hit_03.wav"
		];
		this.m.SoundOnMiss = [
			"sounds/combat/arrow_miss_01.wav",
			"sounds/combat/arrow_miss_02.wav",
			"sounds/combat/arrow_miss_03.wav"
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
		this.m.IsShowingProjectile = true;
		this.m.IsShieldRelevant = false;
		this.m.IsShowingProjectile = true;
		this.m.Delay = 250;
		this.m.InjuriesOnBody = this.Const.Injury.PiercingBody;
		this.m.InjuriesOnHead = this.Const.Injury.PiercingHead;
		this.m.DirectDamageMult = 0.3;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 25;
		this.m.MinRange = 1;
		this.m.MaxRange = 8;
		this.m.ChanceDecapitate = 0;
		this.m.ChanceDisembowel = 0;
		this.m.ChanceSmash = 50;
		this.m.MaxLevelDifference = 4;
		this.m.ProjectileType = this.Const.ProjectileType.Arrow;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		ret.extend([
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Will make three separate strikes for one half of the weapon\'s damage each"
			},
			{
				id = 8,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Ignores the bonus to Defense granted by shields"
			}
		]);
		return ret;
	}


		function isUsable()
	{
		if (!this.getContainer().getActor().isArmedWithRangedWeapon()) 
		{
			return false
		}
		return !this.Tactical.isActive() || this.skill.isUsable() && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
	}


	function onUse( _user, _targetTile )
	{
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectChop);
		local target = _targetTile.getEntity();
		this.attackEntity(_user, target);
		this.m.IsDoingAttackMove = false;
		this.getContainer().setBusy(true);
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 100, function ( _skill )
		{
			if (target.isAlive())
			{
				_skill.attackEntity(_user, target);
			}
		}.bindenv(this), this);
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 200, function ( _skill )
		{
			if (target.isAlive())
			{
				_skill.attackEntity(_user, target);
			}

			_skill.m.IsDoingAttackMove = true;
			_skill.getContainer().setBusy(false);
		}.bindenv(this), this);
		return true;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.DamageTotalMult *= 0.5;
			_properties.DamageTooltipMaxMult *= 3.0;
		}
	}

});
