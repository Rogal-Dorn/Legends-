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

//determine action points
		local horseAP = this.getHorse().getActionPoints();
		local riderAP = this.getRider().getActionPoints();
		local totalAP = (horseAP + riderAP) / 2;


		b.ActionPoints = totalAP;

//determine hitpoints
		local horseHP = this.getHorse().getHitpoints();
		local riderHP = this.getRider().getHitpoints();
		local totalHP = (horseHP + riderHP) / 2;
		b.Hitpoints = totalHP;

//determine resolve
		local horseBravery = this.getHorse().getBravery();
		local riderBravery = this.getRider().getBravery();
		local totalBravery = (horseBravery + riderBravery) / 2;
		
		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_liberty"))
		{
		totalBravery += riderBravery * 0.25;
		}

		b.Bravery = totalBravery;

//determine fatigue 
		local horseFatigue = this.getHorse().getFatigue();
		local riderFatigue = this.getRider().getFatigue();
		local totalFatigue = (horseFatigue + riderFatigue) / 2;
		b.Stamina = totalFatigue;

//determine melee skill 
		local horseMeleeSkill  = this.getHorse().getMeleeSkill ();
		local riderMeleeSkill  = this.getRider().getMeleeSkill ();
		local totalMeleeSkill  = (horseMeleeSkill  + riderMeleeSkill ) / 2;

		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_desensitization"))
		{
		totalMeleeSkill += riderMeleeSkill * 0.25;
		}

		b.MeleeSkill = totalMeleeSkill;

//determine ranged skill 
		local horseRangedSkill  = this.getHorse().getRangedSkill ();
		local riderRangedSkill  = this.getRider().getRangedSkill ();
		local totalRangedSkill  = (horseRangedSkill  + riderRangedSkill ) / 2;

		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_parthian_shot"))
		{
		totalRangedSkill += riderRangedSkill * 0.25;
		}

		b.RangedSkill = totalRangedSkill;

//determine melee defense
		local horseMeleeDefense  = this.getHorse().getMeleeDefense ();
		local riderMeleeDefense  = this.getRider().getMeleeDefense ();
		local totalMeleeDefense  = (horseMeleeDefense  + riderMeleeDefense ) / 2;

		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_bitting"))
		{
		totalMeleeDefense += riderMeleeDefense * 0.25;
		}

		b.MeleeDefense = totalMeleeDefense;

//determine ranged defense
		local horseRangedDefense  = this.getHorse().getRangedDefense ();
		local riderRangedDefense  = this.getRider().getRangedDefense ();
		local totalRangedDefense  = (horseRangedDefense  + riderRangedDefense ) / 2;
		b.RangedDefense = totalRangedDefense;

//determine initiative
		local horseInitiative = this.getHorse().getInitiative();
		local riderInitiative = this.getRider().getInitiative();
		local totalInitiative = (horseInitiative + riderInitiative) / 2;
		b.Initiative = totalInitiative;

//determine name
		local horseName = this.getHorse().getName();
		local riderName = this.getRider().getName();
		local newName = riderName + " and " + horseName;
		this.setName(newName);

		local background = this.new("scripts/skills/backgrounds/legend_horserider");
		background.setScenarioOnly(true);
		this.m.Skills.add(background);

//add horse skills
		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_movement") && !this.getHorse().getSkills().hasSkill("perk.legend_horse_passage"))
		{
		this.getSkills().add(this.new("scripts/skills/perks/perk_legend_horse_movement"));
		}
		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_passage"))
		{
		this.getSkills().add(this.new("scripts/skills/perks/perk_legend_horse_passage"));
		}
		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_pirouette"))
		{
		this.getSkills().add(this.new("scripts/skills/perks/perk_legend_horse_pirouette"));
		}
		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_charge"))
		{
		this.getSkills().add(this.new("scripts/skills/perks/perk_legend_horse_charge"));
		}

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