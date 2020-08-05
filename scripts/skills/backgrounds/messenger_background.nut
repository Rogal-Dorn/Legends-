this.messenger_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.messenger";
		this.m.Name = "Messenger";
		this.m.Icon = "ui/backgrounds/background_46.png";
		this.m.BackgroundDescription = "Messengers are used to long and tiring travels.";
		this.m.GoodEnding = "The oddity of having %name% the messenger in your band did not seem so strange after he showed himself to be a killer sellsword. As far as you know, he\'s still with the company, preferring the march of a mercenary to that of a messenger. You don\'t blame him: an errand boy must bend the knee to every nobleman he comes across, but in the company of sellswords he\'ll no doubt get the occasional chance to kill one of them bastards. Not a hard trade off to accept!";
		this.m.BadEnding = "%name% the messenger departed the %companyname% and returned to being an errand boy for the letters of lieges. You tried to find out where the man had gone to and eventually tracked him down - or what was left of him. Unfortunately, \'don\'t shoot the messenger\' is not an adage well followed in these fractured lands.";
		this.m.HiringCost = 60;
		this.m.DailyCost = 6;
		this.m.Excluded = [
			"trait.huge",
			"trait.hate_undead",
			"trait.paranoid",
			"trait.clubfooted",
			"trait.asthmatic",
			"trait.cocky",
			"trait.craven",
			"trait.deathwish",
			"trait.dumb",
			"trait.fat",
			"trait.gluttonous",
			"trait.brute"
		];
		this.m.Titles = [
			"the Messenger",
			"the Courier",
			"the Runner"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.Body = "bust_naked_body_00";
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Notorious;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Saintly;
		this.m.Modifiers.Scout = this.Const.LegendMod.ResourceModifiers.Scout[3];
		this.m.Modifiers.Gathering = this.Const.LegendMod.ResourceModifiers.Gather[1];
		this.m.Modifiers.Terrain = [
				0.0, // ?
				0.0, //ocean
				0.1,//plains
				0.03, //swamp
				0.05, //hills
				0.05, //forest
				0.05, //forest
				0.05, //forest_leaves
				0.05, //autumn_forest
				0.03, //mountains
				0.0, // ?
				0.1, //farmland
				0.03, // snow
				0.03, // badlands
				0.07, //highlands
				0.1, //stepps
				0.0 //ocean
			];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.DaggerTree,
				this.Const.Perks.ThrowingTree,
				this.Const.Perks.StavesTree,
				this.Const.Perks.SpearTree
			],
			Defense = [
				this.Const.Perks.LightArmorTree
			],
			Traits = [
				this.Const.Perks.AgileTree,
				this.Const.Perks.OrganisedTree,
				this.Const.Perks.FastTree,
				this.Const.Perks.FitTree
			],
			Enemy = [],
			Class = [],
			Magic = []
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
		return "{Some men are so important that they require other men to carry their words. %name% is such a man - the latter, that is. | %name%\'s shoulders are yoked with bags of mail, the receivers almost certainly dead on arrival. | To escape a life of servitude, %name% took up the vocation of a messenger. | With so many hurrying to find out the status of relatives, %name% has found ample work as a messenger. | %name% once traveled the land as a modest messenger. | Like his father and his father\'s father before him, %name% took messages across the land for royalty and laymen alike. | Picking up a dead messenger\'s bags, %name% soon found himself in the role of a would-be messenger. | Once a refugee, %name% figured he might as well deliver letters if he was already wandering the land.} {But making the rounds gets boring. The mailman seeks a new field of work. | Carrying love letters, the would-be adventurer wondered what the hell he was doing. | Claiming to be a budding hero, %name% now believes the task of delivering mail is beneath him. | Rain or sunshine, sure, snow or sleet, sure, but all out war? Maybe another time. | But after opening a letter that would ruin a goodhearted noble, the messenger decided to leave his post. | When robbers made his life hell, %name% figured he\'d be better off traveling in the company of armed men. | After sleeping with a mayor\'s wife, the messenger had a small army on his heels. He figured he\'d best slip into a different outfit for his own safety.} {%name% has spent years memorizing messages. Now he\'ll have to remember keeping the shield wall as arrows rain down on it. | Ironically, %name% has never written anything in his life. | Rolling up his sleeves, %name% boasts he has one last message to give the world. Everybody look out. | Perhaps his joining mercenaries suggests that, indeed, the pen is not mightier than a sword. | %name% has a tendency to repeat everything said to him. Old messenger habits die hard. | Ironically, the well-traveled messenger has probably seen more horrors on the road than most of the men in the outfit. | Few, if any, of %name%\'s skills make him ready for combat. But he does have some sturdy legs, hopefully just not for running away.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				0,
				0
			],
			Bravery = [
				5,
				0
			],
			Stamina = [
				15,
				10
			],
			MeleeSkill = [
				0,
				0
			],
			RangedSkill = [
				0,
				0
			],
			MeleeDefense = [
				0,
				2
			],
			RangedDefense = [
				3,
				3
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
		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/leather_tunic"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/linen_tunic"));
		}

		items.equip(this.Const.World.Common.pickHelmet([
			[1, ""],
			[1, "hood"],
			[1, "straw_hat"]
		]));

	}

	function onAddLegendEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;

		local cloths = [
            [0, ""],
			[0, "cloth/legend_gambeson"],
			[0, "cloth/legend_gambeson_plain"],
			[0, "cloth/legend_gambeson_wolf"],
			[0, "cloth/legend_padded_surcoat"],
			[0, "cloth/legend_robes"],
			[0, "cloth/legend_apron_butcher"],
			[0, "cloth/legend_robes_nun"],
			[0, "cloth/legend_apron_smith"],
			[0, "cloth/legend_robes_wizard"],
			[0, "cloth/legend_sackcloth"],
			[0, "cloth/legend_sackcloth_patched"],
			[0, "cloth/legend_sackcloth_tattered"],
			[1, "cloth/legend_tunic"],
			[0, "cloth/legend_tunic_noble"]
		];
		local armor = this.Const.World.Common.pickLegendArmor(cloths)

		if (armor != null)
		{
			local chains = [
                [0, ""],
                [0, "chain/legend_armor_mail_shirt"],
				[0, "chain/legend_armor_mail_shirt_simple"],
				[0, "chain/legend_armor_rusty_mail_shirt"],
				[0, "chain/legend_armor_ancient_double_mail"],
				[0, "chain/legend_armor_ancient_mail"],
				[0, "chain/legend_armor_basic_mail"],
				[0, "chain/legend_armor_hauberk"],
				[0, "chain/legend_armor_hauberk_full"],
				[0, "chain/legend_armor_hauberk_sleevless"],
				[0, "chain/legend_armor_reinforced_mail"],
				[0, "chain/legend_armor_reinforced_mail_shirt"],
				[0, "chain/legend_armor_reinforced_rotten_mail_shirt"],
				[0, "chain/legend_armor_reinforced_worn_mail"],
				[0, "chain/legend_armor_reinforced_worn_mail_shirt"],
				[0, "chain/legend_armor_short_mail"]
			]

			local chain = this.Const.World.Common.pickLegendArmor(chains)
			if (chain != null)
			{
				armor.setUpgrade(chain)
			}

			local plates = [
                [2, ""],
				[0, "plate/legend_armor_leather_brigandine"],
				[0, "plate/legend_armor_leather_brigandine_hardened"],
				[0, "plate/legend_armor_leather_brigandine_hardened_full"],
				[1, "plate/legend_armor_leather_jacket"],
				[1, "plate/legend_armor_leather_jacket_simple"],
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

		items.equip(this.Const.World.Common.pickHelmet([
			[1, ""],
			[1, "hood"],
			[1, "straw_hat"]
		]));
	}

});

