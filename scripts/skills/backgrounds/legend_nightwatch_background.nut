this.legend_nightwatch_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_nightwatch";
		this.m.Name = "Night Watch";
		this.m.Icon = "ui/backgrounds/background_nightwatch.png";
		this.m.BackgroundDescription = "The night watch are an unlucky few chosen to break up fights and keep towns lawful at the worst time of the day.";
		this.m.GoodEnding = "The former farmhand, %name%, retired from the %companyname%. The money he made was put toward purchasing a bit of land. He spends the rest of his days happily farming and starting a family with way too many children.";
		this.m.BadEnding = "The former farmhand, %name%, soon left the %companyname%. He purchased a bit of land out {south | north | east | west} and was doing quite well for himself - until noble soldiers hanged him from a tree for refusing to hand over all his crops.";
		this.m.HiringCost = 95;
		this.m.DailyCost = 13;
		this.m.Excluded = [
			"trait.weasel",
			"trait.fear_undead",
			"trait.hate_undead",
			"trait.night_blind",
			"trait.clubfooted",
			"trait.asthmatic",
			"trait.unpredictable"
		];

		this.m.Faces = this.Const.Faces.AllWhiteMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;

		this.m.AlignmentMin = this.Const.LegendMod.Alignment.NeutralMax;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Saintly;
		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.BackgroundType = this.Const.BackgroundType.Lowborn;
		this.m.Modifiers.Scout = this.Const.LegendMod.ResourceModifiers.Scout[2];
		this.m.Modifiers.Terrain = [
				0.0, // ?
				0.0, //ocean
				0.015,//plains
				0.0, //swamp
				0.01, //hills
				0.0, //forest
				0.0, //forest
				0.0, //forest_leaves
				0.0, //autumn_forest
				0.0, //mountains
				0.0, // ?
				0.015, //farmland
				0.0, // snow
				0.01, // badlands
				0.01, //highlands
				0.0, //stepps
				0.0, //ocean
				0.0, //desert
				0.0 //oasis
			];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.PolearmTree,
				this.Const.Perks.StavesTree,
				this.Const.Perks.CrossbowTree,			
				this.Const.Perks.SlingsTree
			],
			Defense = [
				this.Const.Perks.MediumArmorTree
			],
			Traits = [
				this.Const.Perks.FitTree,
				this.Const.Perks.LargeTree,
				this.Const.Perks.IndestructibleTree,
				this.Const.Perks.SturdyTree
			],
			Enemy = [
				this.Const.Perks.LegendFavouredEnemyAlps
			],
			Class = [],
			Magic = []
		}
	}

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
		this.m.Faces = this.Const.Faces.AllWhiteFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = null;
		this.m.BeardChance = 1;
		this.m.Bodies = this.Const.Bodies.AllFemale;
		this.addBackgroundType(this.Const.BackgroundType.Female);
		this.m.GoodEnding = "The former farmhand, %name%, retired from the %companyname%. The money she made was put toward purchasing a bit of land. she spends the rest of her days happily farming and starting a family with way too many children.";
		this.m.BadEnding = "The former farmhand, %name%, soon left the %companyname%. She purchased a bit of land out {south | north | east | west} and was doing quite well for herself - until noble soldiers hanged her from a tree for refusing to hand over all her crops.";

	}

	function onBuildDescription()
	{
		if (this.isBackgroundType(this.Const.BackgroundType.Female))
		{
			return "{Tilling the soil is hard work, requiring the blood and sweat of sturdier women. | Every farm in the land needs a stable of hardy folk to work the fields.  | A woman puts her sweat into the earth to feed herself, and she feeds herself to put her sweat into the Earth another day. | No matter the weather, a farm needs working. | Pigsties, stables, and ungated pens, these are the dreams and nightmares of farming women. | While some women earn their keep by killing, others look below their own two feet, wondering what crops the soil may hold. | A special breed of women comes out of ranchers and farmers. Sturdy, resolute, hard-working. | With food so needed, there\'s little wonder why farmers are the most common sort of woman in all the land. | A farm wife hates to see her land fertilized in blood, but that\'s becoming more and more common these days. | In war, farms are hotspots for armies. Not just to feed themselves, but to recruit from the stable of strong women who work those lands. | As cities grow and distance themselves from the hinterland, citizens often forget to whom their full bellies owe gratitude.} %name% {is a burly, sweat-sculpted farmhand. | hails from the outskirts of %randomtown% where she drove ploughs and broke horses. | knows a couple kinds of hoes, all of which the farmhand can swing with ease. | grew up on one of the land\'s many farms. | spent many years harvesting the crops that feed everyone in the land. | worked as a farmhand for a simple homestead. | fell into farming after her father\'s boating business went under. | became a farmhand to help feed his dozen kids and layabout husband. | took up farming as a means to a belly-filled end. | carries the stocky frame best used for planting, harvesting, and surviving winters.} {Unfortunately, it didn\'t take war and turmoil long to find her farm. | But poor harvests have driven her from the farms. | Sadly, her farm was one of the first to be attacked during these trying times. | Word of coming violence, however, drove her from the peaceful vocation of farming. | Droughts, poorly-timed as ever, have now driven the woman from her work. | Unpaid for her labor, she eventually abandoned the farm life. | With more crowns than ever in the killing businesses, the woman was easily drawn away from her motley crops. | One day, she realized her strong body had more value chopping heads than milking cows. | After raiders pillaged his crops, she\'d had enough, leaving the farm life for good. | After the weather soured her harvest, the farmer decided to choose a vocation not wholly based on the whims of Mother Nature. | Word has it she really did sleep with the farmer\'s son. What a surprise she\'s no longer on the farm.} {Cornfed and barnbred, %name% stands before you as fit a woman you\'ve ever seen. | She misses the cows, true, but %name% should take to the mercenary\'s tough life with ease. | Growing up on a farm gives a woman all the nutrients she\'d ever need, and %name% certainly took advantage. | %name% once took a mule kick to the face. Its foot broken, they had to put the animal down. | If women were trees, %name% would never fall down. Or something gracious like that. | Don\'t let her simple past fool you, %name% could fit right in with any wrestler or fighter. | %name% shares a lot in common with draught animals. Just point her the right way. | Judging by her size, there must have been a lot of meat in that corn %name% spent all her life eating. | %name% is big enough to wring a guy\'s neck like it was a cow\'s udder.}";
		}
		else
		{
			return "{Tilling the soil is hard work, requiring the blood and sweat of sturdier men. | Every farm in the land needs a stable of hardy men to work the fields.  | Man puts his sweat into the earth to feed himself, and he feeds himself to put his sweat into the Earth another day. | No matter the weather, a farm needs working. | Pigsties, stables, and ungated pens, these are the dreams and nightmares of farming men. | While some men earn their keep by killing, others look below their own two feet, wondering what crops the soil may hold. | A special breed of men comes out of ranchers and farmers. Sturdy, resolute, hard-working. | With food so needed, there\'s little wonder why farmers are the most common sort of man in all the land. | A farmer hates to see his land fertilized in blood, but that\'s becoming more and more common these days. | In war, farms are hotspots for armies. Not just to feed themselves, but to recruit from the stable of strong men who work those lands. | As cities grow and distance themselves from the hinterland, citizens often forget to whom their full bellies owe gratitude.} %name% {is a burly, sweat-sculpted farmhand. | hails from the outskirts of %randomtown% where he drove ploughs and broke horses. | knows a couple kinds of hoes, all of which the farmhand can swing with ease. | grew up on one of the land\'s many farms. | spent many years harvesting the crops that feed everyone in the land. | worked as a farmhand for a simple homestead. | fell into farming after his boating business went under. | became a farmhand to help feed his dozen kids and two wives. | took up farming as a means to a belly-filled end. | carries the stocky frame best used for planting, harvesting, and surviving winters.} {Unfortunately, it didn\'t take war and turmoil long to find his farm. | But poor harvests have driven him from the farms. | Sadly, his farm was one of the first to be attacked during these trying times. | Word of coming violence, however, drove him from the peaceful vocation of farming. | Droughts, poorly-timed as ever, have now driven the man from his work. | Unpaid for his labor, he eventually abandoned the farm life. | With more crowns than ever in the killing businesses, the man was easily drawn away from his motley crops. | One day, he realized his strong body had more value chopping heads than milking cows. | After raiders pillaged his crops, he\'d had enough, leaving the farm life for good. | After the weather soured his harvest, the farmer decided to choose a vocation not wholly based on the whims of Mother Nature. | Word has it he really did sleep with the farmer\'s daughter. What a surprise he\'s no longer on the farm.} {Cornfed and barnbred, %name% stands before you as fit a man you\'ve ever seen. | He misses the cows, true, but %name% should take to the mercenary\'s tough life with ease. | Growing up on a farm gives a man all the nutrients he\'d ever need, and %name% certainly took advantage. | %name% once took a mule kick to the face. Its foot broken, they had to put the animal down. | If men were trees, %name% would never fall down. Or something gracious like that. | Don\'t let his simple past fool you, %name% could fit right in with any wrestler or fighter. | %name% shares a lot in common with draught animals. Just point him the right way. | Judging by his size, there must have been a lot of meat in that corn %name% spent all his life eating. | %name% is big enough to wring a guy\'s neck like it was a cow\'s udder.}";
		}

	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				4,
				8
			],
			Bravery = [
				6,
				8
			],
			Stamina = [
				8,
				12
			],
			MeleeSkill = [
				0,
				4
			],
			RangedSkill = [
				0,
				8
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

	function onAdded() // always has night owl
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();
		this.m.Container.add(this.new("scripts/skills/traits/night_owl"));
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 3);

		if (r == 0)
		{
		items.equip(this.new("scripts/items/weapons/wooden_stick"));
		}
		else if (r == 1)
		{
		items.equip(this.new(""));
		}
		else if (r == 2)
		{
		items.equip(this.new("scripts/items/weapons/hatchet"));
		}
		else if (r == 3)
		{
		items.equip(this.new("scripts/items/weapons/legend_staff"));
		}
		else if (r == 4)
		{
		items.equip(this.new("scripts/items/weapons/legend_sling"));
		}

		items.equip(this.Const.World.Common.pickArmor([
			[1, "sackcloth"],
			[1, "linen_tunic", this.Math.rand(6, 7)]
		]));

		items.equip(this.Const.World.Common.pickHelmet([
			[1, "hood"],
			[2, "aketon_cap"]
		]));
	}
});

