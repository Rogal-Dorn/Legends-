this.legend_companion_ranged_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_companion_ranged";
		this.m.Name = "Companion";
		this.m.Icon = "ui/traits/trait_icon_32.png";
		this.m.BackgroundDescription = "This one has lost all interest in glory and gold. With nothing else to prove but to themselves.";
		this.m.GoodEnding = "";
		this.m.BadEnding = "";
		this.m.HiringCost = 0;
		this.m.DailyCost = 0;
		this.m.Excluded = [
			"trait.asthmatic",
			"trait.craven",
			"trait.dastard",
			"trait.disloyal",
			"trait.fainthearted",
			"trait.fat",
			"trait.fear_undead",
			"trait.fear_greenskins",
			"trait.fear_beasts",
			"trait.greedy",
			"trait.weasel",
			"trait.fear_nobles",
			"trait.flabby",
			"trait.slack",
			"trait.double_tongued",
			"trait.clumsy"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.MeleeSkill
		];
		this.m.Ethnicity = this.Math.rand(0, 2);
		if (this.m.Ethnicity == 0)
		{
			this.m.Bodies = this.Const.Bodies.Muscular;			
			this.m.Faces = this.Const.Faces.AllWhiteMale;
			this.m.Hairs = this.Const.Hair.CommonMale;
			this.m.HairColors = this.Const.HairColors.All;
			this.m.Beards = this.Const.Beards.All;
			this.m.BeardChance = 60;
		}	
		else if (this.m.Ethnicity == 1)
		{
			this.m.Bodies = this.Const.Bodies.Gladiator;
			this.m.Faces = this.Const.Faces.SouthernMale;
			this.m.Hairs = this.Const.Hair.SouthernMale;
			this.m.HairColors = this.Const.HairColors.Southern;
			this.m.Beards = this.Const.Beards.Southern;
			this.m.BeardChance = 60;
			this.m.Names = this.Const.Strings.SouthernNames;
			this.m.LastNames = this.Const.Strings.SouthernNamesLast;
		}
		else if (this.m.Ethnicity == 2)
		{
			this.m.Bodies = this.Const.Bodies.AfricanGladiator;
			this.m.Faces = this.Const.Faces.AfricanMale;
			this.m.Hairs = this.Const.Hair.SouthernMale;
			this.m.HairColors = this.Const.HairColors.African;
			this.m.Beards = this.Const.Beards.Southern;
			this.m.BeardChance = 60;
			this.m.Names = this.Const.Strings.SouthernNames;
			this.m.LastNames = this.Const.Strings.SouthernNamesLast;
		}

		this.m.Modifiers.Scout = this.Const.LegendMod.ResourceModifiers.Scout[1];
		this.m.Modifiers.Repair = this.Const.LegendMod.ResourceModifiers.Repair[1];
		this.m.Modifiers.Salvage = this.Const.LegendMod.ResourceModifiers.Salvage[1];
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[1];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[1];
		this.m.Modifiers.Crafting = this.Const.LegendMod.ResourceModifiers.Crafting[1];
		this.m.Modifiers.Gathering = this.Const.LegendMod.ResourceModifiers.Gather[1];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[1];
		this.m.Modifiers.Fletching = this.Const.LegendMod.ResourceModifiers.Fletching[1];
		this.m.Modifiers.Hunting = this.Const.LegendMod.ResourceModifiers.Hunting[1];
		

		this.m.PerkTreeDynamic = { //UBER TO DO - RANGED FOCUSED BRO
			Weapon = [
				this.Const.Perks.SwordTree,
				this.Const.Perks.HammerTree,
				this.Const.Perks.CrossbowTree,
				this.Const.Perks.AxeTree
			],
			Defense = [
				this.Const.Perks.MediumArmorTree
			],
			Traits = [
				this.Const.Perks.IndestructibleTree,
				this.Const.Perks.IntelligentTree,
				this.Const.Perks.TrainedTree,
				this.Const.Perks.FastTree
			],
			Enemy = [],
			Class = [],
			Magic = []
		}
	} //UBER TO DO ABOVE

	//Default Male
	function setGender(_gender = -1)
	{
		local r = _gender;
		if (_gender == -1)
		{
			r = 0;
			if (this.LegendsMod.Configs().LegendGenderEnabled())
			{
				r = this.Math.rand(0, 1);
			}
		}

		if (r == 0)
		{
			return;
		}
		this.m.Ethnicity = this.Math.rand(0, 2);
		if (this.m.Ethnicity == 0)
		{
			this.m.Faces = this.Const.Faces.AllWhiteFemale;
			this.m.Hairs = this.Const.Hair.AllFemale;
			this.m.HairColors = this.Const.HairColors.All;
			this.m.Bodies = this.Const.Bodies.AllFemale;
		}	
		else if (this.m.Ethnicity == 1)
		{
			this.m.Faces = this.Const.Faces.SouthernFemale;
			this.m.Hairs = this.Const.Hair.SouthernFemale;
			this.m.HairColors = this.Const.HairColors.Young;
			this.m.Bodies = this.Const.Bodies.SouthernFemaleMuscular;
			this.m.Names = this.Const.Strings.SouthernNames;
			this.m.LastNames = this.Const.Strings.SouthernNamesLast;
		}
		else if (this.m.Ethnicity == 2)
		{
			this.m.Faces = this.Const.Faces.AfricanFemale;
			this.m.Hairs = this.Const.Hair.SouthernFemale;
			this.m.HairColors = this.Const.HairColors.African;
			this.m.Bodies = this.Const.Bodies.AfricanFemaleMuscular;
			this.m.Names = this.Const.Strings.SouthernNames;
			this.m.LastNames = this.Const.Strings.SouthernNamesLast;
		}

		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.addBackgroundType(this.Const.BackgroundType.Female);
	}

	function onBuildDescription()
	{
		return "{One enters the world always looking to be the best they can be, | Mastery of an art is prestigious, | Everybody looks up to the best,} {but no one gets there in an instant. | so what better way to be the best than to learn underneath one? | and it\'s no secret most look toward the masters for help.} {%name% thought the same, taking the role of an apprentice in %townname%. | Believing this to be true, %name% took up an apprenticeship in %townname%. | When %randomtown%\'s college asked for apprentices, %name% was the first to sign up. | Urged by %their% parents to better %their% craft, %name% looked to start %their% career as an apprentice. | Not to be outdone by %their% overachieving brother, %name% began looking for an apprenticeship.} {Unfortunately, %their% master was poorly chosen: an insane carpenter with a penchant for chopping the neckline instead of the treeline. Fleeing the impending doom by association, %name% has ended up in the company of sellswords. | Learning all %they% could, %name% built the greatest work of art possibly ever seen in the field of underwater basket-weaving. His master, though, was a jealous one. Not to be outdone by a pupil, %they% burned the project to ash and eye-watering fumes. It was clear to %name%: %they% could learn fast, but perhaps there were better masters to study beneath. | He had soaked up all there was to learn: masonry, carpentry, blacksmithing, lovemaking. Now %they% turns %their% eyes on the martial arts. While %they% isn\'t exactly a warrior yet, %name% is a fast learner.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [ //THIS BACKGROUND GAINS EXTRA STATS IN RECRUITMENT EVENTS DEPENDING ON PLAYER CHOICES
				5,
				5
			],
			Bravery = [
				5,
				5
			],
			Stamina = [
				3,
				3
			],
			MeleeSkill = [
				-5,
				0
			],
			RangedSkill = [
				10,
				5
			],
			MeleeDefense = [
				-3,
				0
			],
			RangedDefense = [
				5,
				5
			],
			Initiative = [
				10,
				5
			]
		};
		return c;
	}


	function onAddEquipment()
	{
		//---
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.RangedSkill] = 1;
		talents[this.Const.Attributes.RangedDefense] = 1;
		this.getContainer().getActor().fillTalentValues(2, true);
		//---
		local items = this.getContainer().getActor().getItems();
		items.equip(this.Const.World.Common.pickArmor([
			[1, "leather_tunic"],
			[1, "linen_tunic"],
			[1, "apron"]
		]))
	}

	function onUpdate( _properties )
	{
	}

});

