this.legend_rotten_flesh <- this.inherit("scripts/skills/injury_permanent/permanent_injury", {
	m = {},
	function create()
	{
		this.permanent_injury.create();
		this.m.ID = "injury.legend_rotten_flesh";
		this.m.Name = "Rotting Flesh";
		this.m.Description = "Flesh is pale and gaunt, rotting away and leaving the stench of undeath";
		this.m.Icon = "ui/injury/injury_icon_25.png";
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
				id = 7,
				type = "text",
				icon = "ui/icons/days_wounded.png",
				text = "-3 AP. Heals at 10% normal rate. Requires no food."
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/damage_received.png",
				text = "Immune to bleeding, poison, and fresh injuries."
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Affected by fatigue and experience at 10% of the normal rate."
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/morale.png",
				text = "Not affected by morale, or allies fleeing or dying. Requires no pay."
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "Not affected by night."
			}
		];
		this.addTooltipHint(ret);
		return ret;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		actor.m.MoraleState = this.Const.MoraleState.Ignore;

		_properties.IsImmuneToBleeding = true;
		_properties.IsImmuneToPoison = true;
		_properties.IsAffectedByNight = false;
		_properties.IsAffectedByFleeingAllies = false;
		_properties.IsAffectedByDyingAllies = false;
		_properties.IsAffectedByFreshInjuries = false;
		_properties.ActionPoints -= 3;
		_properties.MoraleEffectMult = 0.1;
		_properties.FatigueEffectMult = 0.1;
		_properties.HitpointsRecoveryRateMult = 0.1;
		_properties.MovementFatigueCostMult = 0.1;
		_properties.DailyWageMult = 0;
		_properties.DailyFood = 0;
	}

	function onApplyAppearance()
	{
		local actor = this.getContainer().getActor();

		local hairColor = this.Const.HairColors.Zombie[this.Math.rand(0, this.Const.HairColors.Zombie.len() - 1)];
		local sprite = actor.getSprite("head");
		sprite.Color = this.createColor("#fbffff");
		sprite.varyColor(0.05, 0.05, 0.05);
		sprite.varySaturation(0.1);
		local body = actor.getSprite("body");
		body.Color = sprite.Color;
		body.Saturation = sprite.Saturation;

		local sprite = actor.getSprite("hair");
		if (hairColor != "grey")
		{
			sprite.varyColor(0.1, 0.1, 0.1);
		}
		else
		{
			sprite.varyBrightness(0.1);
		}
	
		local beard = actor.getSprite("beard");
		beard.Color = actor.getSprite("hair").Color;
		local beard_top = actor.getSprite("beard_top");
		beard_top.Color = actor.getSprite("hair").Color;
		
	}


function onCombatStarted()
	{
		local actor = this.getContainer().getActor();
		actor.m.MoraleState = this.Const.MoraleState.Ignore;
		actor.m.BloodType = this.Const.BloodType.Dark;
		actor.m.Sound[this.Const.Sound.ActorEvent.NoDamageReceived] = [
			"sounds/enemies/zombie_idle_14.wav",
			"sounds/enemies/zombie_idle_15.wav",
			"sounds/enemies/zombie_idle_16.wav"
		];
		actor.m.Sound[this.Const.Sound.ActorEvent.DamageReceived] = [
			"sounds/enemies/zombie_hurt_01.wav",
			"sounds/enemies/zombie_hurt_02.wav",
			"sounds/enemies/zombie_hurt_03.wav",
			"sounds/enemies/zombie_hurt_04.wav",
			"sounds/enemies/zombie_hurt_05.wav",
			"sounds/enemies/zombie_hurt_06.wav",
			"sounds/enemies/zombie_hurt_07.wav"
		];
		actor.m.Sound[this.Const.Sound.ActorEvent.Death] = [
			"sounds/enemies/zombie_death_01.wav",
			"sounds/enemies/zombie_death_02.wav",
			"sounds/enemies/zombie_death_03.wav",
			"sounds/enemies/zombie_death_04.wav",
			"sounds/enemies/zombie_death_05.wav",
			"sounds/enemies/zombie_death_06.wav"
		];
		actor.m.Sound[this.Const.Sound.ActorEvent.Fatigue] = [
			"sounds/enemies/zombie_bite_01.wav",
			"sounds/enemies/zombie_bite_02.wav",
			"sounds/enemies/zombie_bite_03.wav"
		];
		actor.m.Sound[this.Const.Sound.ActorEvent.Flee] = [
			"sounds/enemies/zombie_bite_01.wav",
			"sounds/enemies/zombie_bite_02.wav",
			"sounds/enemies/zombie_bite_03.wav"
		];
		actor.m.Sound[this.Const.Sound.ActorEvent.Idle] = [
			"sounds/enemies/zombie_idle_01.wav",
			"sounds/enemies/zombie_idle_02.wav",
			"sounds/enemies/zombie_idle_03.wav",
			"sounds/enemies/zombie_idle_04.wav",
			"sounds/enemies/zombie_idle_05.wav",
			"sounds/enemies/zombie_idle_06.wav",
			"sounds/enemies/zombie_idle_07.wav",
			"sounds/enemies/zombie_idle_08.wav",
			"sounds/enemies/zombie_idle_09.wav",
			"sounds/enemies/zombie_idle_10.wav",
			"sounds/enemies/zombie_idle_11.wav",
			"sounds/enemies/zombie_idle_12.wav",
			"sounds/enemies/zombie_idle_13.wav"
		];
		actor.m.Sound[this.Const.Sound.ActorEvent.Move] = [
			"sounds/enemies/zombie_bite_01.wav",
			"sounds/enemies/zombie_bite_02.wav",
			"sounds/enemies/zombie_bite_03.wav"
		];
	
	}

});

