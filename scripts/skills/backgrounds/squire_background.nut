this.squire_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.squire";
		this.m.Name = "Squire";
		this.m.Icon = "ui/backgrounds/background_03.png";
		this.m.BackgroundDescription = "Squires usually have received some training in warfare, and often have a high resolve to excel in what they do.";
		this.m.GoodEnding = "%name% the squire eventually left the %companyname%. You\'ve heard that he\'s since been knighted. No doubt he is sitting happy as a plum wherever he is.";
		this.m.BadEnding = "The squire, %name%, eventually departed the %companyname%. He intended to return home and become knighted, fulfilling his lifelong dream. Cruel politics got in the way and not only was he not knighted, he was stripped of his squire duties. Word has it he hanged himself from a barn\'s rafters.";
		this.m.HiringCost = 320;
		this.m.DailyCost = 30;
		this.m.Excluded = [
			"trait.weasel",
			"trait.fear_undead",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.clubfooted",
			"trait.irrational",
			"trait.disloyal",
			"trait.fat",
			"trait.fainthearted",
			"trait.craven",
			"trait.dastard",
			"trait.fragile",
			"trait.insecure",
			"trait.asthmatic",
			"trait.clumsy",
			"trait.pessimist",
			"trait.greedy",
			"trait.bleeder"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.YoungMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.Tidy;


		this.m.Bodies = this.Const.Bodies.Muscular;
		this.m.IsCombatBackground = true;
		this.m.IsRangerRecruitBackground = true;
		this.m.IsCrusaderRecruitBackground = true;
		this.m.IsEducatedBackground = true;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.NeutralMax; //Neutral-good essentially
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Chivalrous;
		this.m.Modifiers.Ammo = this.Const.LegendMod.ResourceModifiers.Ammo[1];
		this.m.Modifiers.ArmorParts = this.Const.LegendMod.ResourceModifiers.ArmorParts[1];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[1];
		this.m.Modifiers.Repair = this.Const.LegendMod.ResourceModifiers.Repair[2];
		this.m.Modifiers.Salvage = this.Const.LegendMod.ResourceModifiers.Salvage[2];
		this.m.Modifiers.Fletching = this.Const.LegendMod.ResourceModifiers.Fletching[2];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[1];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.SwordTree,
				this.Const.Perks.PolearmTree,
				this.Const.Perks.HammerTree,
				this.Const.Perks.CrossbowTree
			],
			Defense = [
				this.Const.Perks.HeavyArmorTree,
			],
			Traits = [
				this.Const.Perks.IntelligentTree,
				this.Const.Perks.TrainedTree,
				this.Const.Perks.FitTree,
				this.Const.Perks.FastTree
			],
			Enemy = [],
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
			if (this.World.LegendsMod.Configs().LegendGenderEnabled())
			{
				r = this.Math.rand(0, 1);
			}
		}

		if (r != 1)
		{
			return
		}
		this.m.Faces = this.Const.Faces.PrettyFemale;
		this.m.Beards = null;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.BeardChance = 0;
		this.m.Bodies = this.Const.Bodies.AllFemale;
		this.m.IsFemaleBackground = true;
		this.m.GoodEnding = "%name% the squire eventually left the %companyname%. You\'ve heard that she\'s since been knighted. No doubt she is sitting happy as a plum wherever she is.";
		this.m.BadEnding = "The squire, %name%, eventually departed the %companyname%. She intended to return home and become knighted, fulfilling her lifelong dream. Cruel politics got in the way and not only was she not knighted, she was stripped of her squire duties. Word has it she hanged herself from a barn\'s rafters.";

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
			return "{A young squire, %name% dutifully accompanied her knight to many battles. | Squire to a harsh knight, %name% spent her days running errands for her lordship. | Although a squire, %name%\'s life largely meant guarding prisoners of war, much to her chagrin. | Squire to a knight, sure, but %name% mostly cleaned latrines, fed dogs, and got far too much use out of a shinebox.} {One night, strange, shuffling men silhouetted the moonlit horizon. Alarm bells met their moans and an hour later half of %townname% lay in ruin. | While traveling, brigands attacked her lordship\'s wagon-train. Swords were drawn, heads were halved, and when it was all said and done the squire had failed: everyone she was supposed to protect lay dead. | But one evening a horde of ferocious, furred creatures came down upon her lord\'s keep. In desperation, %name% let a group of prisoners free, hoping they would aid her in combat. Instead, they slew her lordship and ran off into the night. The squire, bravely, managed to survive, a dozen husky corpses at her feet, but the battle left her alone and without purpose. | Angered by a horrible crime in %townname%, she took matters into her own hands, personally slaying the criminal. A just act, but also an improper one. The young squire was banished for her insubordination. | When a devilish red knight came to %townname% for a duel, %name%\'s knight proved far too sick to fight. After downing a mug of liquid confidence, %name% donned her lordship\'s armor and faced the red knight herself. With a sword slash so fast it rang the very air, %name% slew her opponent down.} {Now there was only one task left for her - to attain knighthood. | Now the squire seeks the company of good folk with which to again prove herself worthy of being a knight. | As war ravages the land, there is now plenty of opportunity to put her skills to use. | Though a bit too earnest, there is no doubt the world needs women like %name%.}";
		}
		else
		{
			return "{A young squire, %name% dutifully accompanied his knight to many battles. | Squire to a harsh knight, %name% spent his days running errands for his lordship. | Although a squire, %name%\'s life largely meant guarding prisoners of war, much to his chagrin. | Squire to a knight, sure, but %name% mostly cleaned latrines, fed dogs, and got far too much use out of a shinebox.} {One night, strange, shuffling men silhouetted the moonlit horizon. Alarm bells met their moans and an hour later half of %townname% lay in ruin. | While traveling, brigands attacked his lordship\'s wagon-train. Swords were drawn, heads were halved, and when it was all said and done the squire had failed: everyone he was supposed to protect lay dead. | But one evening a horde of ferocious, furred creatures came down upon his lord\'s keep. In desperation, %name% let a group of prisoners free, hoping they would aid him in combat. Instead, they slew his lordship and ran off into the night. The squire, bravely, managed to survive, a dozen husky corpses at his feet, but the battle left him alone and without purpose. | Angered by a horrible crime in %townname%, he took matters into his own hands, personally slaying the criminal. A just act, but also an improper one. The young squire was banished for his insubordination. | When a devilish red knight came to %townname% for a duel, %name%\'s knight proved far too sick to fight. After downing a mug of liquid confidence, %name% donned his lordship\'s armor and faced the red knight himself. With a sword slash so fast it rang the very air, %name% slew his opponent down.} {Now there was only one task left for him - to attain knighthood. | Now the squire seeks the company of good folk with which to again prove himself worthy of being a knight. | As war ravages the land, there is now plenty of opportunity to put his skills to use. | Though a bit too earnest, there is no doubt the world needs men like %name%.}";
		}
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				0,
				0
			],
			Bravery = [
				12,
				12
			],
			Stamina = [
				7,
				5
			],
			MeleeSkill = [
				7,
				5
			],
			RangedSkill = [
				7,
				8
			],
			MeleeDefense = [
				1,
				3
			],
			RangedDefense = [
				1,
				3
			],
			Initiative = [
				0,
				0
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
			actor.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
		}
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 3);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/shortsword"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/hatchet"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/winged_mace"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/weapons/boar_spear"));
		}

		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/shields/wooden_shield"));
		}

		r = this.Math.rand(0, 3);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/padded_leather"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/padded_surcoat"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/gambeson"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/armor/leather_tunic"));
		}

		items.equip(this.Const.World.Common.pickHelmet([
			[1, "nasal_helmet"],
			[1, "full_aketon_cap"],
			[1, "aketon_cap"],
			[1, "open_leather_cap"]
		]));

	}

	function onAddLegendEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 3);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/shortsword"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/hatchet"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/winged_mace"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/weapons/boar_spear"));
		}

		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/shields/wooden_shield"));
		}


		local cloths = [
            [0, ""],
			[1, "cloth/legend_gambeson"],
			[0, "cloth/legend_gambeson_plain"],
			[0, "cloth/legend_gambeson_wolf"],
			[1, "cloth/legend_padded_surcoat"],
			[0, "cloth/legend_robes"],
			[0, "cloth/legend_apron_butcher"],
			[0, "cloth/legend_robes_nun"],
			[0, "cloth/legend_apron_smith"],
			[0, "cloth/legend_robes_wizard"],
			[0, "cloth/legend_sackcloth"],
			[0, "cloth/legend_sackcloth_patched"],
			[0, "cloth/legend_sackcloth_tattered"],
			[0, "cloth/legend_tunic"],
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
                [1, ""],
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
				[1, "plate/legend_armor_leather_padded"],
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
			[1, "nasal_helmet"],
			[1, "full_aketon_cap"],
			[1, "aketon_cap"],
			[1, "open_leather_cap"]
		]));

	}
});

