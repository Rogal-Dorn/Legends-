this.arena_invictus_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {
		LastFrameApplied = 0,
		LastEnemyAppliedTo = 0,
		SkillCount = 0
	},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.arena_invictus";
		this.m.Name = "Invictus";
		this.m.Icon = "ui/traits/trait_icon_75.png";
		this.m.Order = this.Const.SkillOrder.Trait - 1;
	}

	function getDescription()
	{
		local actor = this.getContainer().getActor();
		return "With a single fist raised, " + actor.getName() + " stops the crowd cheering. With both raised, they shout " + actor.getPronoun("their") + " name from the stands. Gladiators rather wrestle a Lindwum than fight " + actor.getPronoun("them") + " in the arena.";
	}

	function getTooltip()
	{
		local matches = this.getContainer().getActor().getFlags().getAsInt("ArenaFights");
		local won = this.getContainer().getActor().getFlags().getAsInt("ArenaFightsWon");

		if (won == matches)
		{
			won = "all";
		}

		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription() + " So far, this character has fought in " + matches + " matches and won " + won + " of them."
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+18[/color] Resolve"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/health.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Hitpoints"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5%[/color] Damage"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Has a [color=" + this.Const.UI.Color.PositiveValue + "]75%[/color] chance to survive if struck down and not killed by a fatality"
			}
		];
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (this.getContainer().getActor().hasSkill("perk.fearsome")) return;

		if (_targetEntity == null || !_targetEntity.isAlive()) return;

		if (_targetEntity.getMoraleState() == this.Const.MoraleState.Ignore) return;

		if ((this.Time.getFrame() == this.m.LastFrameApplied || this.m.SkillCount == this.Const.SkillCounter) && _targetEntity.getID() == this.m.LastEnemyAppliedTo)
		{
			if (_damageInflictedHitpoints >= this.Const.Morale.OnHitMinDamage)
			{
				this.spawnIcon("perk_28", _targetEntity.getTile());
			}
			return;
		}

		if (_damageInflictedHitpoints >= 1) this.spawnIcon("perk_28", _targetEntity.getTile());

		this.m.LastFrameApplied = this.Time.getFrame();
		this.m.LastEnemyAppliedTo = _targetEntity.getID();
		this.m.SkillCount = this.Const.SkillCounter;

		if (_damageInflictedHitpoints >= 1 && _damageInflictedHitpoints < this.Const.Morale.OnHitMinDamage)
		{
			_targetEntity.checkMorale(-1, this.Const.Morale.OnHitBaseDifficulty * (1.0 - _targetEntity.getHitpoints() / _targetEntity.getHitpointsMax()) - this.getContainer().getActor().getCurrentProperties().ThreatOnHit);
		}
	}

	function onUpdate( _properties )
	{
		_properties.Bravery += 18;
		_properties.Hitpoints += 10;
		_properties.DamageTotalMult *= 1.05;
		_properties.SurviveWithInjuryChanceMult *= 2.27;
	}
	
	function onAfterUpdate( _properties )
	{
		local won = this.getContainer().getActor().getFlags().getAsInt("ArenaFightsWon");
		_properties.ThreatOnHit += this.Math.min(10, won * 0.1);
	}

	function onCombatStarted()
	{
		this.m.SkillCount = 0;
		this.m.LastEnemyAppliedTo = 0;
		this.m.LastFrameApplied = 0;
	}

	function onCombatFinished()
	{
		this.skill.onCombatFinished();
		this.m.SkillCount = 0;
		this.m.LastEnemyAppliedTo = 0;
		this.m.LastFrameApplied = 0;
	}

});

