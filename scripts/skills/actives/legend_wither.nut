this.legend_wither <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_wither";
		this.m.Name = "Wither";
		this.m.Icon = "skills/wither56_skill.png";
		this.m.IconDisabled = "skills/wither56_skill_bw.png";
		this.m.Overlay = "perk_34_active";
		this.m.SoundOnHit = [
			"sounds/enemies/necromancer_01.wav",
			"sounds/enemies/necromancer_02.wav",
			"sounds/enemies/necromancer_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsVisibleTileNeeded = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 8;
		this.m.MaxLevelDifference = 4;
	}

	function getDescription()
	{
		return "Debilitate a target for one turn, reducing their ability to inflict damage by [color=" + this.Const.UI.Color.NegativeValue + "]-50%[/color].";
	}

	function getTooltip()
	{
		return this.skill.getDefaultUtilityTooltip();
	}

	function isUsable()
	{
		return this.skill.isUsable() && !this.getContainer().getActor().getSkills().hasSkill("effects.debilitating_attack");
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return true;
	}

	function onUse( _user, _targetTile )
	{
		this.m.Container.add(this.new("scripts/skills/effects/debilitating_attack_effect"));
		return true;
	}

	function onRemoved()
	{
		this.m.Container.removeByID("effects.debilitating_attack");
	}

});
