this.legend_baker_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_baker";
		this.m.Name = "Baker";
		this.m.Icon = "ui/backgrounds/baker.png";
		this.m.BackgroundDescription = "Bakers are used to manual labor.";
		this.m.GoodEnding = "Mercenary work is a tough business, which is probably why a baker like %name% felt right at home in it. While an outstanding fighter, you hear that he still has problems with the war dogs in the party and has been repeatedly caught trying to slaughter them. Eventually, if not desperately, the company gave the man an adorable puppy to raise as his own. From what you know of, the little runt\'s glowy doe eyes converted the dog hater into a lover. Now he goes into an insatiable bloodlust whenever a wardog is harmed and his little mongrel grew up to be the fiercest beast in the company!";
		this.m.BadEnding = "%name% the baker eventually left the declining company. He joined up with another outfit, but was caught slaughtering one of their war dogs. Apparently, he had been feeding the mercenaries dogmeat from all their mongrels that had gone \'missing\'. They did not take this news kindly, stripped the butcher, and fed him to the beasts.";
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
			"the Baker",
			"the Loaf",
			"Buckwheat"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.Body = "bust_naked_body_02";
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Notorious;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Saintly;
		this.m.Modifiers.Meds = this.Const.LegendMod.ResourceModifiers.Meds[1];
		this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Barter[1];
		this.m.Modifiers.Gathering = this.Const.LegendMod.ResourceModifiers.Gather[1];
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
		return "{After his father\'s death, %name% took over the family butcher shop in %randomtown%. | Growing up poor, %name% quickly learned to kill and strip animals, eventually founding a butcher\'s shop. | With droughts ruining the farmlands, %name%\'s butcher shop took off in %randomtown%. | Always a strange boy, %name% took to butchering not only for profit, but for pleasure. | Grinning ear to ear, %name% never looked so happy as when his shop opened and he got his first order of live pigs in stock. | As a butcher, %name% has spent years squishing guts out of dead rabbits and lopping heads off sometimes-dead fish.} {But rumors of animal torture eventually drove the cleaver-swinger from his business. | Given the terrible rumors of dark arts already going around, it wasn\'t long until people began questioning the source of his meats and drove him out of business. | But killing animals, for one reason or another, didn\'t quite excite him anymore. He sought something new. | After a human finger was found in one of his deer wrappings, the man was driven from his business. | Some say he most enjoyed butchering for soldiers during the orc invasions and wishes to return to that experience once more. | Unfortunately, the war drove through his shop, leaving behind a number of carcasses he wouldn\'t dare butcher. | Living in a city under siege, he provided meat for the hungry. When it was found out where that meat came from, he was handed over to the besiegers who, unwittingly, let him live. | The man\'s friendliness with poachers caught up with him, ultimately leaving him on the road with a retinue of the local lords\'s men on his tail. | Butchering a tiny pig became a scandal when it turned out to be a nobleman\'s pet. He fled to save his own bacon.} {Something about blood and guts sits just right with %name%. In that case, welcome to the battlefield. | %name% looks at everything as a potential meat sale with breathing, moving packaging. | Many are disturbed by %name%\'s mere presence and all-too-wide eyes. | %name% is known to bite his tongue and savor the blood. | %name%\'s ears perk whenever a pig squeals. The same thing happens when a man screams. Interesting. | %name%\'s a butcher, but apparently has little interest in actually feeding the outfit.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				4,
				7
			],
			Bravery = [
				0,
				3
			],
			Stamina = [
				4,
				7
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
			items.equip(this.new("scripts/items/weapons/wooden_stick"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/knife"));
		}

		r = this.Math.rand(0, 0);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/linen_tunic"));
		}
	}

	function onAddLegendEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 2);

		if (r <= 1)
		{
			items.equip(this.new("scripts/items/weapons/wooden_stick"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/knife"));
		}

		items.equip(this.new("scripts/items/legend_armor/cloth/legend_tunic"));
	}
});
