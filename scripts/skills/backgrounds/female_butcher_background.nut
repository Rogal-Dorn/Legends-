this.female_butcher_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.female_butcher";
		this.m.Name = "Fishwife";
		this.m.Icon = "ui/backgrounds/fishwife.png";
		this.m.BackgroundDescription = "Fishwives are used to spilled guts.";
		this.m.GoodEnding = "Mercenary work is a bloody business, which is probably why a fishwife like %name% felt right at home in it. While an outstanding fighter, you hear that she still has problems with the war dogs in the party and has been repeatedly caught trying to slaughter them. Eventually, if not desperately, the company gave the woman an adorable puppy to raise as her own. From what you know of, the little runt\'s glowy doe eyes converted the dog hater into a lover. Now she goes into an insatiable bloodlust whenever a wardog is harmed and her little mongrel grew up to be the fiercest beast in the company!";
		this.m.BadEnding = "%name% the fishwife eventually left the declining company. She joined up with another outfit, but was caught slaughtering one of their war dogs. Apparently, she had been feeding the mercenaries dogmeat from all their mongrels that had gone \'missing\'. They did not take this news kindly, stripped the butcher, and fed her to the beasts.";
		this.m.HiringCost = 80;
		this.m.DailyCost = 7;
		this.m.Excluded = [
			"trait.weasel",
			"trait.fear_undead",
			"trait.hate_undead",
			"trait.swift",
			"trait.bleeder",
			"trait.bright",
			"trait.clumsy",
			"trait.fainthearted",
			"trait.spartan",
			"trait.iron_lungs",
			"trait.tiny",
			"trait.optimist"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.RangedSkill
		];
		this.m.Titles = [
			"the Sliver",
			"the Cleaver",
			"the Red",
			"Whitemeat",
			"Bloodeye"
		];
		this.m.Faces = this.Const.Faces.AllFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Body = "bust_naked_body_03";
		this.m.IsFemaleBackground = true;
		this.m.Modifiers.Meds = this.Const.LegendMod.ResourceModifiers.Meds[1];		
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[1];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[2];
		this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Barter[1];
		this.m.Modifiers.ToolConsumption = this.Const.LegendMod.ResourceModifiers.ToolConsumption[1];
		this.m.PerkTreeDynamic = {
			Weapon = [			
				this.Const.Perks.DaggerTree,
				this.Const.Perks.CleaverTree
			],
			Defense = [
				this.Const.Perks.MediumArmorTree
			],
			Traits = [
				this.Const.Perks.OrganisedTree,
				this.Const.Perks.IndestructibleTree,
				this.Const.Perks.LargeTree
			],
			Enemy = [],
			Class = [
				this.Const.Perks.ButcherClassTree,
				this.Const.Perks.ChefClassTree
			]
		}
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
			}
		];
	}

	function onBuildDescription()
	{
		return "{After her father\'s death, %name% took over the family fish shop in %randomtown%. | Growing up poor, %name% quickly learned to kill and strip fish, eventually founding a fish shop. | With droughts ruining the farmlands, %name%\'s fish shop took off in %randomtown%. | Always a strange firl, %name% took to butchering not only for profit, but for pleasure. | Grinning ear to ear, %name% never looked so happy as when her shop opened and she got her first order of live octopus in stock. | As a butcher, %name% has spent years squishing guts out of dead hallibut and lopping heads off sometimes-dead fish.} {But rumors of animal torture eventually drove the cleaver-swinger from her business. | Given the terrible rumors of dark arts already going around, it wasn\'t long until people began questioning the source of her meats and drove her out of business. | But killing animals, for one reason or another, didn\'t quite excite her anymore. She sought something new. | After a human finger was found in one of her deer wrappings, the woman was driven from his business. | Some say she most enjoyed butchering for soldiers during the orc invasions and wishes to return to that experience once more. | Unfortunately, the war drove through her shop, leaving behind a number of carcasses she wouldn\'t dare butcher. | Living in a city under siege, she provided meat for the hungry. When it was found out where that meat came from, she was handed over to the besiegers who, unwittingly, let her live. | The woman\'s friendliness with poachers caught up with her, ultimately leaving her on the road with a retinue of the local lords\'s men on her tail. | Butchering a tiny fish became a scandal when it turned out to be a nobleman\'s pet. She fled to save her own scales.} {Something about blood and guts sits just right with %name%. In that case, welcome to the battlefield. | %name% looks at everything as a potential meat sale with breathing, moving packaging. | Many are disturbed by %name%\'s mere presence and all-too-wide eyes. | %name% is known to bite her tongue and savor the blood. | %name%\'s ears perk whenever a pig squeals. The same thing happens when a man screams. Interesting. | %name%\'s a butcher, but apparently has little interest in actually feeding the outfit.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				-5,
				0
			],
			Bravery = [
				7,
				5
			],
			Stamina = [
				5,
				10
			],
			MeleeSkill = [
				3,
				2
			],
			RangedSkill = [
				-3,
				0
			],
			MeleeDefense = [
				0,
				0
			],
			RangedDefense = [
				0,
				0
			],
			Initiative = [
				0,
				0
			]
		};
		return c;
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 2);

		if (r <= 1)
		{
			items.equip(this.new("scripts/items/weapons/butchers_cleaver"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/knife"));
		}

		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/butcher_apron"));
		}		
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/legend_maid_apron"));
		}
	}

});
