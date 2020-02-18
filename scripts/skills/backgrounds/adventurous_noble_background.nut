this.adventurous_noble_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.adventurous_noble";
		this.m.Name = "Adventurous Noble";
		this.m.Icon = "ui/backgrounds/background_06.png";
		this.m.BackgroundDescription = "Adventurous Nobles tend to have high resolve and melee skills, but often neglect ranged defense.";
		this.m.GoodEnding = "Adventurousness never leaves the soul of a man like %name%. {Instead of returning to his noble family, he left the %companyname% and headed east in search of rare beasts. Word has it he returned to town with the head of what looked like a giant lizard, but you don\'t believe such fantastical tripe. | He departed the %companyname% and ventured west, sailing across the oceans to unseen lands. There\'s no telling where he is these days, but you\'ve little doubt that he\'ll be coming back with stories to tell. | He retired from the %companyname% and, instead of returning to his noble family, headed south. Word has it he fought in a great noble civil war, killed an orc warlord, climbed the highest mountain in the land, and is currently writing an epic about his travels. | The nobleman left the %companyname% and, preferring the life of adventure to noble boredom, he headed north. Word has it that he\'s currently marching a troop of explorers to the furthest reaches of the world.}";
		this.m.BadEnding = "%name% departed the %companyname% and continued his adventuring elsewhere. {He headed east, hoping to discover the source of the greenskins, but the nobleman has not been heard from since. | He headed north into the snowy wastes. Word has it he was seen a week ago, marching south this time, looking rather pale and shuffling moreso than walking. | He headed south into brutal marshlands. Word has it that a mysterious flame appeared in the fog and he walked toward it. The men who saw this said he disappeared into the mist and never returned. | He headed west and sailed the open sea. Despite having no experience at sea, he saw fit to make himself captain of the boat. They say pieces of his ship and dead sailors kept washing ashore for weeks.}";
		this.m.HiringCost = 300;
		this.m.DailyCost = 35;
		this.m.Excluded = [
			"trait.weasel",
			"trait.fear_beasts",
			"trait.clubfooted",
			"trait.irrational",
			"trait.hesitant",
			"trait.drunkard",
			"trait.fainthearted",
			"trait.craven",
			"trait.dastard",
			"trait.fragile",
			"trait.insecure",
			"trait.asthmatic",
			"trait.spartan"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.All;
		this.m.Body = "bust_naked_body_01";

		this.m.Level = this.Math.rand(1, 3);
		this.m.IsCombatBackground = true;
		this.m.IsNoble = true;
		this.m.IsCrusaderRecruitBackground = true;
		this.m.IsEducatedBackground = true;
		this.m.Modifiers.ArmorParts = this.Const.LegendMod.ResourceModifiers.ArmorParts[2];
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[1];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[1];
		this.m.Modifiers.Repair = this.Const.LegendMod.ResourceModifiers.Repair[1];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[2];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.SwordTree,
				this.Const.Perks.PolearmTree,
				this.Const.Perks.DaggerTree,
				this.Const.Perks.CrossbowTree
			],
			Defense = [
				this.Const.Perks.MediumArmorTree
			],
			Traits = [
				this.Const.Perks.InspirationalTree,
				this.Const.Perks.IntelligentTree,
				this.Const.Perks.TrainedTree,
				this.Const.Perks.ViciousTree
			],
			Enemy = [],
			Class = []
		}
	}

	function setGender(_gender = -1)
	{
		local r = _gender;
		if (_gender == -1)
		{
			r = 0;
			if (this.Const.LegendMod.Configs.LegendGenderEnabled())
			{
				r = this.Math.rand(0, 1);
			}
		}

		if (r == 0)
		{
			return;
		}

		this.m.Name = "Adventurous Lady";
		this.m.Faces = this.Const.Faces.PrettyFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Body = "bust_naked_body_03";
		this.m.IsFemaleBackground = true;
		this.m.BackgroundDescription = "Adventurous Nobles tend to have high resolve and melee skills, but often neglect ranged defense.";
		this.m.GoodEnding = "Adventurousness never leaves the soul of a woman like %name%. {Instead of returning to her noble family, she left the %companyname% and headed east in search of rare beasts. Word has it she returned to town with the head of what looked like a giant lizard, but you don\'t believe such fantastical tripe. | She departed the %companyname% and ventured west, sailing across the oceans to unseen lands. There\'s no telling where she is these days, but you\'ve little doubt that she\'ll be coming back with stories to tell. | She retired from the %companyname% and, instead of returning to her noble family, headed south. Word has it she fought in a great noble civil war, killed an orc warlord, climbed the highest mountain in the land, and is currently writing an epic about her travels. | The noblewoman left the %companyname% and, preferring the life of adventure to noble boredom, she headed north. Word has it that she\'s currently marching a troop of explorers to the furthest reaches of the world.}";
		this.m.BadEnding = "%name% departed the %companyname% and continued her adventuring elsewhere. {She headed east, hoping to discover the source of the greenskins, but the noblewoman has not been heard from since. | She headed north into the snowy wastes. Word has it she was seen a week ago, marching south this time, looking rather pale and shuffling moreso than walking. | She headed south into brutal marshlands. Word has it that a mysterious flame appeared in the fog and she walked toward it. The men who saw this said she disappeared into the mist and never returned. | She headed west and sailed the open sea. Despite having no experience at sea, she saw fit to make herself captain of the boat. They say pieces of her ship and dead sailors kept washing ashore for weeks.}";

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
		if(this.m.IsFemaleBackground == true)
		{
			return "{A minor noble | As the third in the line of succession | A young and brash noble | A skilled swordswoman}, %name%\'s life at court {had grown stale for her | was not exciting enough for her with endless studying of court etiquette and family lineage | felt like wasting the best time of her life | was not half as exciting to her as the tales of adventures, battles, fearsome beasts to vanquish and fair maidens to conquer}. {Wearing the family crest proudly | At the encouragement of her brother | To the frustration of her mother | Finally making a decision to change things}, %name% rode out to {prove herself | make a name for herself | earn glory on the battlefield | test her skills in battle} and {live life to its fullest as she imagined it from behind the castle walls | see all the wonders and exotic places of the world | earn her place in the world | be knighted for her valor | become famous and loved in all the known world | become infamous and feared in all the known world}.";
		}
		else
		{
			return "{A minor noble | As the third in the line of succession | A young and brash noble | A skilled swordsman}, %name%\'s life at court {had grown stale for him | was not exciting enough for him with endless studying of court etiquette and family lineage | felt like wasting the best time of his life | was not half as exciting to him as the tales of adventures, battles, fearsome beasts to vanquish and fair maidens to conquer}. {Wearing the family crest proudly | At the encouragement of his brother | To the frustration of his mother | Finally making a decision to change things}, %name% rode out to {prove himself | make a name for himself | earn glory on the battlefield | test his skills in battle} and {live life to its fullest as he imagined it from behind the castle walls | see all the wonders and exotic places of the world | earn his place in the world | be knighted for his valor | become famous and loved in all the known world | become infamous and feared in all the known world}.";
		}
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				4,
				-1
			],
			Bravery = [
				15,
				20
			],
			Stamina = [
				0,
				5
			],
			MeleeSkill = [
				10,
				15
			],
			RangedSkill = [
				0,
				10
			],
			MeleeDefense = [
				3,
				8
			],
			RangedDefense = [
				-10,
				-5
			],
			Initiative = [
				-7,
				-2
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();

		if (this.m.IsFemaleBackground == true)
		{
			actor.setName(this.Const.Strings.LadyNames[this.Math.rand(0, this.Const.Strings.LadyNames.len() - 1)]);
		}
		else
		{
			actor.setName(this.Const.Strings.KnightNames[this.Math.rand(0, this.Const.Strings.KnightNames.len() - 1)]);
		}
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/fencing_sword"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/pike"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/rondel_dagger"));
			items.equip(this.new("scripts/items/weapons/legend_parrying_dagger"));
		}


		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/mail_shirt"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/basic_mail_shirt"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/mail_hauberk"));
		}

		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/nasal_helmet"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/padded_nasal_helmet"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/helmets/nasal_helmet_with_mail"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/helmets/mail_coif"));
		}
	}

	function onAddLegendEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/fencing_sword"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/pike"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/rondel_dagger"));
			items.equip(this.new("scripts/items/weapons/legend_parrying_dagger"));
		}

		local cloths = [
			[2, "cloth/legend_gambeson"],
			[0, "cloth/legend_gambeson_plain"],
			[0, "cloth/legend_gambeson_wolf"],
			[2, "cloth/legend_padded_surcoat"],
			[0, "cloth/legend_robes"],
			[0, "cloth/legend_apron_butcher"],
			[0, "cloth/legend_robes_nun"],
			[0, "cloth/legend_apron_smith"],
			[0, "cloth/legend_robes_wizard"],
			[0, "cloth/legend_sackcloth"],
			[0, "cloth/legend_sackcloth_patched"],
			[0, "cloth/legend_sackcloth_tattered"],
			[2, "cloth/legend_tunic"],
			[1, "cloth/legend_tunic_noble"]
		];
		local armor = this.Const.World.Common.pickLegendArmor(cloths)

		if (armor != null)
		{
			local chains = [
				[0, "chain/legend_armor_ancient_double_mail"],
				[0, "chain/legend_armor_ancient_mail"],
				[1, "chain/legend_armor_basic_mail"],
				[1, "chain/legend_armor_hauberk"],
				[0, "chain/legend_armor_hauberk_full"],
				[1, "chain/legend_armor_hauberk_sleevless"],
				[1, "chain/legend_armor_mail_shirt"],
				[1, "chain/legend_armor_mail_shirt_simple"],
				[1, "chain/legend_armor_reinforced_mail"],
				[1, "chain/legend_armor_reinforced_mail_shirt"],
				[0, "chain/legend_armor_reinforced_rotten_mail_shirt"],
				[0, "chain/legend_armor_reinforced_worn_mail"],
				[0, "chain/legend_armor_reinforced_worn_mail_shirt"],
				[0, "chain/legend_armor_rusty_mail_shirt"],
				[1, "chain/legend_armor_short_mail"]
			]

			local chain = this.Const.World.Common.pickLegendArmor(chains)
			if (chain != null)
			{
				armor.setUpgrade(chain)
			}

			local plates = [
				[0, "plate/legend_armor_leather_brigandine"],
				[0, "plate/legend_armor_leather_brigandine_hardened"],
				[0, "plate/legend_armor_leather_brigandine_hardened_full"],
				[0, "plate/legend_armor_leather_jacket"],
				[0, "plate/legend_armor_leather_jacket_simple"],
				[0, "plate/legend_armor_leather_lamellar"],
				[0, "plate/legend_armor_leather_lamellar_harness_heavy"],
				[0, "plate/legend_armor_leather_lamellar_harness_reinforced"],
				[0, "plate/legend_armor_leather_lamellar_heavy"],
				[0, "plate/legend_armor_leather_lamellar_reinforced"],
				[0, "plate/legend_armor_leather_noble"],
				[0, "plate/legend_armor_leather_padded"],
				[0, "plate/legend_armor_leather_riveted"],
				[0, "plate/legend_armor_leather_riveted_light"],
				[0, "plate/legend_armor_leather_scale"],
				[0, "plate/legend_armor_plate_ancient_chest"],
				[0, "plate/legend_armor_plate_ancient_harness"],
				[0, "plate/legend_armor_plate_ancient_mail"],
				[0, "plate/legend_armor_plate_ancient_scale"],
				[0, "plate/legend_armor_plate_ancient_scale_coat"],
				[0, "plate/legend_armor_plate_ancient_scale_harness"],
				[0, "plate/legend_armor_plate_chest"],
				[0, "plate/legend_armor_plate_chest_rotten"],
				[0, "plate/legend_armor_plate_cuirass"],
				[0, "plate/legend_armor_plate_full"],
				[0, "plate/legend_armor_scale"],
				[0, "plate/legend_armor_scale_coat"],
				[0, "plate/legend_armor_scale_coat_rotten"],
				[0, "plate/legend_armor_scale_shirt"]
			]
			local plate = this.Const.World.Common.pickLegendArmor(plates)
			if (plate != null)
			{
				armor.setUpgrade(plate)
			}

			items.equip(armor);
		}

		r = this.Math.rand(0, 4);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/nasal_helmet"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/padded_nasal_helmet"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/helmets/nasal_helmet_with_mail"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/helmets/mail_coif"));
		}
	}
});

