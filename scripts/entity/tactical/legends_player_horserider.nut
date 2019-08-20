this.legends_player_horserider <- this.inherit("scripts/entity/tactical/player", {
	m = {
		Rider = null,
		Horse = null
	},
	function setRider( _a )
	{
		this.m.Rider = this.WeakTableRef(_a);
	}

	function getRider()
	{
		return this.m.Rider
	}

	function setHorse( _a )
	{
		this.m.Horse = this.WeakTableRef(_a);
	}

	function getHorse()
	{
		return this.m.Horse;
	}

	function getItems()
	{
		if (this.m.Rider == null)
		{
			return this.m.Items
		}
		return this.m.Rider.getItems()
	}

	function onCombatStart()
	{
		this.getBackground().onSetAppearance();

	}

	function setScenarioValues()
	{
// 		foreach(k,v in this)
// 		{
// 			this.logInfo("k = " + k + " : v = " + v)
// 		}
// 		this.logInfo("PLAYER")
// 		foreach(k,v in this.player)
// 		{
// 			this.logInfo("k = " + k + " : v = " + v)
// 		}
// this.logInfo("HUMAN")
// 		foreach(k,v in this.player.human)
// 		{
// 			this.logInfo("k = " + k + " : v = " + v)
// 		}

// this.logInfo("ACTOR")
// 		foreach(k,v in this.player.human.actor)
// 		{
// 			this.logInfo("k = " + k + " : v = " + v)
// 		}

// this.logInfo("ENTITY")
// 		foreach(k,v in this.player.human.actor.entity)
// 		{
// 			this.logInfo("k = " + k + " : v = " + v)
// 		}


		local b = this.m.BaseProperties;
		b.ActionPoints = 9;
		b.Hitpoints = 60;
		b.Bravery = this.Math.rand(45, 55);
		b.Stamina = 120;
		b.MeleeSkill = 65;
		b.RangedSkill = 65;
		b.MeleeDefense = 10;
		b.RangedDefense = 10;
		b.Initiative = 115;
		this.setName(this.Const.Tactical.Common.getRandomPlayerName());
		local background = this.new("scripts/skills/backgrounds/legend_horserider");
		background.setScenarioOnly(true);
		this.m.Skills.add(background);
		background.buildDescription();
		local c = this.m.CurrentProperties;
		this.m.ActionPoints = c.ActionPoints;
		this.m.Hitpoints = c.Hitpoints;
		this.m.Talents.resize(this.Const.Attributes.COUNT, 0);
		this.fillAttributeLevelUpValues(this.Const.XP.MaxLevelWithPerkpoints - 1);
	}

	function getPlaceInFormation()
	{
		return this.m.Horse.getPlaceInFormation()
	}
});