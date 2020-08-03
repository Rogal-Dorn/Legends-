this.madness_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TurnsLeft = 2,
		OriginalFaction = 0,
		OriginalSocket = null,
		MasterFaction = 0,
	},
	function setMasterFaction( _f )
	{
		this.m.MasterFaction = _f;
	}

	function create()
	{
		this.m.ID = "effects.madness";
		this.m.Name = "Madness";
		this.m.Icon = "skills/status_effect_107.png";
		this.m.IconMini = "status_effect_107_mini";
		this.m.Overlay = "status_effect_107";
		this.m.SoundOnUse = [
			"sounds/enemies/orc_rage_01.wav",
			"sounds/enemies/orc_rage_02.wav",
			"sounds/enemies/orc_rage_03.wav",
			"sounds/enemies/orc_rage_04.wav",
			"sounds/enemies/orc_rage_05.wav",
			"sounds/enemies/orc_rage_06.wav"
		];
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character is drown in madness. He no longer has any control over his actions and will attack anyone nearby ruthlessly. Wears off in [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.TurnsLeft + "[/color] turn(s).\n\nThe higher a character\'s resolve, the higher the chance to resist being charmed.";
	}

	function addTurns( _t )
	{
		this.m.TurnsLeft += _t;
	}

	function onAdded()
	{
		this.m.TurnsLeft = this.Math.max(1, 2 + this.getContainer().getActor().getCurrentProperties().NegativeStatusEffectDuration);
		local actor = this.getContainer().getActor();
		this.m.OriginalFaction = actor.getFaction();
		this.m.OriginalSocket = actor.getSprite("socket").getBrush().Name;
		if (this.m.SoundOnUse.len() != 0)
		{
			this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.Skill * 1.0, actor.getPos());
			if (this.m.OriginalFaction = this.m.MasterFaction)
			{
				actor.setFaction(this.World.FactionManager.getFactionOfType(this.Const.FactionType.Barbarians).getID());
			}
			else
			{
				actor.setFaction(this.m.MasterFaction);
			}
		}
		actor.getSprite("socket").setBrush("bust_base_beasts");
		actor.setDirty(true);
	}

	function onRemoved()
	{
		local actor = this.getContainer().getActor();

		if (this.m.SoundOnUse.len() != 0)
		{
			this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.Skill * 1.0, actor.getPos());
		}

		actor.setFaction(this.m.OriginalFaction);
		actor.getSprite("socket").setBrush(this.m.OriginalSocket);
		actor.setDirty(true);
	}

	function onDeath()
	{
		this.onRemoved();
	}

	function onTurnEnd()
	{
		local actor = this.getContainer().getActor();

		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
		}
	}

	function onCombatFinished()
	{
		local actor = this.getContainer().getActor();

		if (this.Tactical.Entities.getInstancesNum(this.Const.Faction.Player) == 0)
		{
			actor.kill(null, null, this.Const.FatalityType.Suicide);
		}

		this.skill.onCombatFinished();
	}

});

