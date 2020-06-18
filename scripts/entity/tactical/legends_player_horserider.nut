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
 		foreach(k,v in this)
 		{
 			this.logInfo("k = " + k + " : v = " + v)
 		}
 		this.logInfo("PLAYER")
 		foreach(k,v in this.player)
 		{
 			this.logInfo("k = " + k + " : v = " + v)
 		}
 this.logInfo("HUMAN")
 		foreach(k,v in this.player.human)
 		{
 			this.logInfo("k = " + k + " : v = " + v)
 		}

 this.logInfo("ACTOR")
 		foreach(k,v in this.player.human.actor)
 		{
 			this.logInfo("k = " + k + " : v = " + v)
 		}

 this.logInfo("ENTITY")
 		foreach(k,v in this.player.human.actor.entity)
 		{
 			this.logInfo("k = " + k + " : v = " + v)
 		}


		local b = this.m.BaseProperties;

//determine action points
//		local horseAP = this.getHorse().getActionPoints();
//		this.logInfo("horseAP is " + horseAP)
//		local riderAP = this.getRider().getActionPoints();
//		this.logInfo("riderAP is " + riderAP)
//		local totalAP = this.Math.floor((horseAP + riderAP) - 9);
//		this.logInfo("totalAP is " + totalAP)
//
		b.ActionPoints = 9;

//determine hitpoints
		local horseHP = this.getHorse().getHitpoints();
			this.logInfo("horseHP is " + horseHP)
		local riderHP = this.getRider().getHitpoints();
			this.logInfo("riderHP is " + riderHP)
		local totalHP = this.Math.floor((horseHP + riderHP) / 2);
		b.Hitpoints = totalHP;
			this.logInfo("totalHP is " + b.Hitpoints)

//determine resolve
		local horseBravery = this.getHorse().getBaseProperties().Bravery;
			this.logInfo("horseBravery is " + horseBravery)
		local riderBravery = this.getRider().getBaseProperties().Bravery;
			this.logInfo("riderBravery is " + riderBravery)
		local totalBravery = (horseBravery + riderBravery) / 2;
			
		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_liberty"))
		{
			totalBravery += riderBravery * 0.25;
		}
		this.logInfo("totalBravery is " + totalBravery)
		b.Bravery = totalBravery;

//determine fatigue 
		local horseFatigue = this.getHorse().getBaseProperties().Stamina;
			this.logInfo("horseFatigue is " + horseFatigue)
		local riderFatigue = this.getRider().getBaseProperties().Stamina;
			this.logInfo("riderFatiguee is " + riderFatigue)
		local totalFatigue = (horseFatigue + riderFatigue) / 2;
			this.logInfo("totalFatiguee is " + totalFatigue)
		b.Stamina = totalFatigue;


//determine melee skill 
		local horseMeleeSkill  = this.getHorse().getBaseProperties().MeleeSkill;
		local riderMeleeSkill  = this.getRider().getBaseProperties().MeleeSkill;
		local totalMeleeSkill  = (horseMeleeSkill  + riderMeleeSkill ) / 2;

		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_desensitization"))
		{
			totalMeleeSkill += riderMeleeSkill * 0.25;
		}

		b.MeleeSkill = totalMeleeSkill;

//determine ranged skill 
		local horseRangedSkill  = this.getHorse().getBaseProperties().RangedSkill;
		local riderRangedSkill  = this.getRider().getBaseProperties().RangedSkill;
		local totalRangedSkill  = (horseRangedSkill  + riderRangedSkill ) / 2;

		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_parthian_shot"))
		{
			totalRangedSkill += riderRangedSkill * 0.25;
		}

		b.RangedSkill = totalRangedSkill;

//determine melee defense
		local horseMeleeDefense  = this.getHorse().getBaseProperties().MeleeDefense;
		local riderMeleeDefense  = this.getRider().getBaseProperties().MeleeDefense;
		local totalMeleeDefense  = (horseMeleeDefense  + riderMeleeDefense ) / 2;

		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_bitting"))
		{
			totalMeleeDefense += riderMeleeDefense * 0.25;
		}

		b.MeleeDefense = totalMeleeDefense;

//determine ranged defense
		local horseRangedDefense  = this.getHorse().getBaseProperties().RangedDefense;
		local riderRangedDefense  = this.getRider().getBaseProperties().RangedDefense;
		local totalRangedDefense  = (horseRangedDefense  + riderRangedDefense ) / 2;
		b.RangedDefense = totalRangedDefense;

//determine initiative
		local horseInitiative = this.getHorse().getBaseProperties().Initiative;
		local riderInitiative = this.getRider().getBaseProperties().Initiative;
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
		
		this.m.ActionPointCosts = this.Const.HorseMovementAPCost;
		this.m.FatigueCosts = clone this.Const.HorseMovementFatigueCost;

		this.getSkills().add(this.new("scripts/skills/actives/legend_horse_kick"));
		this.getSkills().add(this.new("scripts/skills/actives/legend_horse_charge"));

		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_movement") && !this.getHorse().getSkills().hasSkill("perk.legend_horse_passage"))
		{
			this.getSkills().add(this.new("scripts/skills/perks/perk_legend_horse_movement"));
		}
		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_passage"))
		{
			this.getSkills().add(this.new("scripts/skills/perks/perk_legend_horse_passage"));
		}
//		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_pirouette"))
//		{
			this.getSkills().add(this.new("scripts/skills/perks/perk_legend_horse_pirouette"));
//		}
//		if (this.getHorse().getSkills().hasSkill("perk.legend_horse_charge"))
//		{
			this.getSkills().add(this.new("scripts/skills/perks/perk_horse_charge"));
//		}

//add rider skills
		if (this.getRider().getSkills().hasSkill("perk.legend_horse_movement") && !this.getHorse().getSkills().hasSkill("perk.legend_horse_passage"))
		{
			this.getSkills().add(this.new("scripts/skills/perks/perk_legend_horse_movement"));
		}

		local items = this.m.Rider.getItems();
		if (items != null) {
			if (items.getItemAtSlot(this.Const.ItemSlot.Mainhand) != null)
			{
				local item = items.getItemAtSlot(this.Const.ItemSlot.Mainhand);
				local itemID = item.getID();
				local pathNum = this.Const.Items.FullItemListIDs.find(itemID);
				local pathToAdd = "scripts/items/" + this.Const.Items.FullItemList[pathNum];
				this.m.Items.equip(this.new(pathToAdd));
			}
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