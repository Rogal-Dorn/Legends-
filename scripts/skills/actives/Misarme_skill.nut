this.Misarme_skill <- this.inherit("scripts/skills/skill", {
	m = {
		SoundOnLightning = [
			"sounds/enemies/vampire_death_01.wav",
			"sounds/enemies/vampire_death_02.wav",
			"sounds/enemies/vampire_death_03.wav"
		]

		Cooldown = 0,
		StunChance = 75
	},
	function setCooldown( _f )
	{
		this.m.Cooldown = _f;
	}

	function create()
	{
		this.m.ID = "actives.Misarme";
		this.m.Name = "Misarme";
		this.m.Description = "Dark magic making opponents go berserk.";
		this.m.Icon = "skills/active_41.png";
		//this.m.IconDisabled = "skills/active_41_sw.png";
		this.m.Overlay = "active_41";
		this.m.SoundOnHit = [
			"sounds/enemies/dlc2/alp_nightmare_01.wav",
			"sounds/enemies/dlc2/alp_nightmare_02.wav",
			"sounds/enemies/dlc2/alp_nightmare_03.wav",
			"sounds/enemies/dlc2/alp_nightmare_04.wav",
			"sounds/enemies/dlc2/alp_nightmare_05.wav",
			"sounds/enemies/dlc2/alp_nightmare_06.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 1250;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.IsDoingForwardMove = false;
		this.m.IsVisibleTileNeeded = true;
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 17;
		this.m.MinRange = 1;
		this.m.MaxRange = 7;
		this.m.MaxLevelDifference = 4;
		this.m.DirectDamageMult = 0.2;
	}

	function getTooltip()
	{

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
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]5[/color] - [color=" + this.Const.UI.Color.DamageValue + "]10[/color] damage that ignores armor to an opponent for three times."
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/mood_01.png",
				text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]100%[/color] chance causing the opponent to go berserk when the skill hits."
			},
			{
				id = 8,
				type = "text",
				icon = "ui/icons/special.png",
				text = "The skill can initially be used for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.Cooldown + "[/color] times. After all those times are used up, the wearer take one morale attack and restore one use."
			}
		];
		return ret;
	}

	function isUsable()
	{
		return this.m.Cooldown != 0 && this.skill.isUsable();
	}

	function addResources()
	{
		foreach( r in this.m.SoundOnLightning )
		{
			this.Tactical.addResource(r);
		}
	}

	function applyEffect( _data, _delay )
	{
		this.Time.scheduleEvent(this.TimeUnit.Virtual, _delay, function ( _data )
		{
			for( local i = 0; i < this.Const.Tactical.DemonBreathParticles.len(); i = ++i )
			{
				this.Tactical.spawnParticleEffect(true, this.Const.Tactical.MisarmeParticles[i].Brushes,_data.TargetTile, this.Const.Tactical.MisarmeParticles[i].Delay, this.Const.Tactical.MisarmeParticles[i].Quantity, this.Const.Tactical.MisarmeParticles[i].LifeTimeQuantity, this.Const.Tactical.MisarmeParticles[i].SpawnRate, this.Const.Tactical.MisarmeParticles[i].Stages);
			}
		}, _data);

		if (_data.Target == null)
		{
			return;
		}

		this.Time.scheduleEvent(this.TimeUnit.Virtual, _delay + 200, function ( _data )
		{
			local hitInfo = clone this.Const.Tactical.HitInfo;
			hitInfo.DamageRegular = this.Math.rand(5, 10);
			hitInfo.DamageDirect = 1.0;
			hitInfo.BodyPart = this.Const.BodyPart.Body;
			hitInfo.BodyDamageMult = 1.0;
			hitInfo.FatalityChanceMult = 0.0;
			_data.Target.onDamageReceived(_data.User, _data.Skill, hitInfo);
		}, _data);
	}

	function onUse( _user, _targetTile )
	{
		this.m.Cooldown = this.m.Cooldown - 1;
		local actor = this.getContainer().getActor();
		local targetTile = _targetTile;
		local target = _targetTile.getEntity();
		local targets = [];
		this.attackEntity(_user, _targetTile.getEntity());
		local data = {
			Skill = this,
			User = _user,
			TargetTile = targetTile,
			Target = target
		};
		this.applyEffect(data, 100);
		this.m.IsDoingAttackMove = false;
		this.getContainer().setBusy(true);
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 100, function ( _skill )
		{
			if (target.isAlive())
			{
				local data = {
					Skill = this,
					User = _user,
					TargetTile = targetTile,
					Target = target
				};
				this.applyEffect(data, 350);
			}
		}.bindenv(this), this);
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 200, function ( _skill )
		{
			if (target.isAlive())
			{
				local data = {
					Skill = this,
					User = _user,
					TargetTile = targetTile,
					Target = target
				};
				this.applyEffect(data, 550);
			}
			_skill.m.IsDoingAttackMove = true;
			_skill.getContainer().setBusy(false);
		}.bindenv(this), this);
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 970, function ( _skill )
		{
			if (this.Math.rand(1, 75) <= this.m.StunChance && !target.getSkills().hasSkill("effects.madness") && target.isAlive() && !target.getSkills().hasSkill("effects.charmed"))
			{
				local effect = this.Tactical.spawnSpriteEffect("effect_skull_03", this.createColor("#ffffff"), target.getTile(), 0, 40, 1.0, 0.25, 0, 400, 300);
				local madness = this.new("scripts/skills/effects/madness_effect");
				madness.setMasterFaction(target.getFaction());
				target.getSkills().add(madness);
				if (!_user.isHiddenToPlayer() && !target.isHiddenToPlayer())
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " is madness");
				}
			}
		}.bindenv(this), this);
		return true;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.DamageTotalMult *= 0.0;
		}
	}


	function onBeforeActivation()
	{
		if (this.m.Cooldown == 0)
		{
			this.spawnIcon("status_effect_81", this.getContainer().getActor().getTile());
			local actor = this.getContainer().getActor();
			actor.checkMorale(-1, 0, this.Const.MoraleCheckType.MentalAttack);
			this.m.Cooldown = this.m.Cooldown + 1;
		}
	}


	function onCombatStarted()
	{
		local actor = this.getContainer().getActor();
		local Max = this.Math.floor(actor.getLevel() / 3);
		this.m.Cooldown = Max;
	}

	function onCombatFinished()
	{
		local actor = this.getContainer().getActor();
		local Max = this.Math.floor(actor.getLevel() / 3);
		this.m.Cooldown = Max;
	}

});


