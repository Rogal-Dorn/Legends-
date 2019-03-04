this.sleeping_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsSleeping = 0,
		TurnApplied = 0
	},
	function getTurnsSleeping()
	{
		return this.m.TurnsSleeping;
	}

	function getTurnApplied()
	{
		return this.m.TurnApplied;
	}

	function create()
	{
		this.m.ID = "effects.sleeping";
		this.m.Name = "Sleeping";
		this.m.Icon = "skills/status_effect_82.png";
		this.m.IconMini = "status_effect_82_mini";
		this.m.Overlay = "status_effect_82";
		this.m.SoundOnUse = [
			"sounds/enemies/sleeping_01.wav",
			"sounds/enemies/sleeping_02.wav",
			"sounds/enemies/sleeping_03.wav",
			"sounds/enemies/sleeping_04.wav",
			"sounds/enemies/sleeping_05.wav",
			"sounds/enemies/sleeping_06.wav",
			"sounds/enemies/sleeping_07.wav",
			"sounds/enemies/sleeping_08.wav",
			"sounds/enemies/sleeping_09.wav",
			"sounds/enemies/sleeping_10.wav"
		];
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		local wakeUpChance = this.Math.floor(this.getContainer().getActor().getCurrentProperties().getBravery() * 0.25) + this.m.TurnsSleeping * 10;
		return "This character has fallen into unnatural sleep and is unable to act. There is a [color=" + this.Const.UI.Color.PositiveValue + "]" + wakeUpChance + "%[/color] chance each turn based on this character\'s resolve and how long they\'ve been asleep that they will wake up on their own. The character will also wake up when taking damage, or when forcibly awoken by nearby allies.\n\nThe higher a character\'s resolve, the higher the chance to resist the urge to sleep.";
	}

	function getTooltip()
	{
		return [
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
				id = 9,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-300[/color] Initiative"
			}
		];
	}

	function onAdded()
	{
		this.m.TurnApplied = this.Time.getRound();
		local actor = this.m.Container.getActor();
		this.m.Container.removeByID("effects.shieldwall");
		this.m.Container.removeByID("effects.spearwall");
		this.m.Container.removeByID("effects.riposte");
		this.m.Container.removeByID("effects.return_favor");
		local actor = this.getContainer().getActor();
		actor.getTags().set("Sleeping", true);
		this.Tactical.TurnSequenceBar.pushEntityBack(this.getContainer().getActor().getID());

		if (this.m.SoundOnUse.len() != 0 && this.Math.rand(1, 100) <= 33)
		{
			this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.0, this.getContainer().getActor().getPos());
		}
	}

	function onBeforeActivation()
	{
		local wakeUpChance = this.Math.floor(this.getContainer().getActor().getCurrentProperties().getBravery() * 0.25) + this.m.TurnsSleeping * 10;
		local everyoneSleeping = true;
		local allies = this.Tactical.Entities.getInstancesOfFaction(this.getContainer().getActor().getFaction());

		foreach( a in allies )
		{
			if (a.getID() == this.getContainer().getActor().getID())
			{
				continue;
			}

			if (!a.getSkills().hasSkill("effects.sleep") && !a.getSkills().hasSkill("effects.nightmare"))
			{
				everyoneSleeping = false;
				break;
			}
		}

		if (everyoneSleeping && allies.len() >= 3 || this.Math.rand(1, 100) < wakeUpChance)
		{
			this.removeSelf();
		}

		++this.m.TurnsSleeping;
	}

	function onTurnStart()
	{
		local actor = this.getContainer().getActor();
		actor.setActionPoints(0);

		if (this.m.SoundOnUse.len() != 0 && this.Math.rand(1, 100) <= 50)
		{
			this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.0, this.getContainer().getActor().getPos());
		}
	}

	function onResumeTurn()
	{
		this.onTurnStart();
	}

	function onRemoved()
	{
		local actor = this.getContainer().getActor();

		if (actor.hasSprite("status_stunned"))
		{
			actor.getSprite("status_stunned").Visible = false;
		}

		if (actor.hasSprite("closed_eyes"))
		{
			actor.getSprite("closed_eyes").Visible = false;
		}

		actor.getTags().set("Sleeping", false);

		if ("setEyesClosed" in actor.get())
		{
			actor.setEyesClosed(false);
		}

		actor.setDirty(true);

		if (actor.isPlacedOnMap())
		{
		}
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		_properties.IsStunned = true;
		_properties.Initiative -= 300;

		if (actor.hasSprite("status_stunned"))
		{
			actor.getSprite("status_stunned").setBrush("bust_sleep");
			actor.getSprite("status_stunned").Visible = true;

			if (actor.hasSprite("closed_eyes"))
			{
				actor.getSprite("closed_eyes").Visible = true;
			}

			if ("setEyesClosed" in actor.get())
			{
				actor.setEyesClosed(true);
			}

			actor.setDirty(true);
		}
	}

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		if (_damageHitpoints > 0)
		{
			this.removeSelf();
		}
	}

});

