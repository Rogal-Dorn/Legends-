this.deserter_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.deserter";
		this.m.Name = "Deserter";
		this.m.Icon = "ui/backgrounds/background_07.png";
		this.m.BackgroundDescription = "Deserters have received some martial training, but usually aren\'t eager to put it to use.";
		this.m.GoodEnding = "%name% the deserter continued fighting for the %companyname%, ever striving to redeem his name. Word has it that during a brutal fight with orcs, he dove headfirst into a crowd of greenskins, surfing across the top of their shocked heads. His heroism rallied the men to an incredible victory and he lives out his days getting toasted in every bar he enters.";
		this.m.BadEnding = "You heard %name% the deserter actually renewed his title and fled a battle the %companyname% had with some greenskins. Goblins caught him out in the woods and turned his head into a goblet for an orc warlord.";
		this.m.HiringCost = 100;
		this.m.DailyCost = 11;
		this.m.Excluded = [
			"trait.teamplayer",
			"trait.impatient",
			"trait.clubfooted",
			"trait.fearless",
			"trait.sure_footing",
			"trait.brave",
			"trait.loyal",
			"trait.deathwish",
			"trait.cocky",
			"trait.determined",
			"trait.fragile",
			"trait.optimist",
			"trait.bloodthirsty"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.Bravery
		];
		this.m.Titles = [
			"the Deserter",
			"Turncloak",
			"the Betrayer",
			"the Runner",
			"the Dog",
			"the Worm"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;

		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Merciless;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Good;
		this.m.Bodies = this.Const.Bodies.Skinny;
		this.m.Level = this.Math.rand(1, 2);
		this.m.IsCombatBackground = true;
		this.m.IsLowborn = true;
		this.m.IsOutlawBackground = true;
		this.m.Modifiers.Repair = this.Const.LegendMod.ResourceModifiers.Repair[1];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[1];
		this.m.PerkTreeDynamicMins.Defense = 3;
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.SpearTree,
				this.Const.Perks.MaceTree,
				this.Const.Perks.CrossbowTree
			],
			Defense = [
				this.Const.Perks.ShieldTree,
				this.Const.Perks.HeavyArmorTree
			],
			Traits = [
				this.Const.Perks.FitTree,
				this.Const.Perks.LargeTree,
				this.Const.Perks.TrainedTree,
				this.Const.Perks.DeviousTree
			],
			Enemy = [
					this.Const.Perks.BanditTree,
					this.Const.Perks.NoblesTree
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
			if (this.World.LegendsMod.Configs().LegendGenderEnabled())
			{
				r = this.Math.rand(0, 1);
			}
		}

		if (r == 0)
		{
			return;
		}
		this.m.Faces = this.Const.Faces.AllFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Bodies = this.Const.Bodies.AllFemale;
		this.m.IsFemaleBackground = true;
		this.m.GoodEnding = "%name% the deserter continued fighting for the %companyname%, ever striving to redeem her name. Word has it that during a brutal fight with orcs, she dove headfirst into a crowd of greenskins, surfing across the top of their shocked heads. Her heroism rallied the mercenaries to an incredible victory and she lives out her days getting toasted in every bar she enters.";
		this.m.BadEnding = "You heard %name% the deserter actually renewed her title and fled a battle the %companyname% had with some greenskins. Goblins caught her out in the woods and turned her head into a goblet for an orc warlord.";

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
			},
			{
				id = 16,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Is always content with being in reserve"
			}
		];
	}

	function onBuildDescription()
	{
		if(this.m.IsFemaleBackground == true)
		{
			return "{%name% used to be a common soldier in a lord\'s army, but suffering loss after loss, | Once a watchwoman on the outskirts of %randomtown%, %name% watched all her friends die to the beasts that lurk there. After so many losses | When two lords quarreled over a petty matter of who owned a local pond, %name% was conscripted to help settle the matter. Being a nobody, it was clear her life was of little value. One slaughter later, | While employed in a lord\'s professional army, a horrible disease fell upon %name% and her comrades. Fearing its wrath, | While on a lengthy military campaign, %name% felt that there was too much marching and too little spoils to be had. So} she {stuck her weapons in the ground and walked off. | waited until night to desert her outfit. | and several others disbanded in protest. | volunteered for a patrol and, at the first opening, abandoned her soldiering career.} {It is no secret that deserters are widely despised - and %name% keeps her head hung low to stay out of others\' eyes. | Most deserters spend the rest of their days avoiding the noose, and %name% is no different. | Donning the garb of the common folk, %name% has, for a time, avoided the deserter\'s punishment. | By total luck, %name% has, thus far, gotten away with her crime.} {But now broke and penniless, she seeks a return to his former field. | Perhaps compelled by lawmen closing in, she now finds herself joining another fighting force. | Unfortunately, she is not a smart woman. Lacking the imagination to pursue a safer career, %name% once again returns to fighting. | Feeling guilty about deserting her comrades in the field, she now seeks redemption in fighting for another outfit. But who is to say she won\'t flee again? | With an empty coin purse from drinking her memories away, she now considers any opportunity to make a living.}";
		}
		else
		{
			return "{%name% used to be a common soldier in a lord\'s army, but suffering loss after loss, | Once a watchman on the outskirts of %randomtown%, %name% watched all his friends die to the beasts that lurk there. After so many losses | When two lords quarreled over a petty matter of who owned a local pond, %name% was conscripted to help settle the matter. Being a nobody, it was clear his life was of little value. One slaughter later, | While employed in a lord\'s professional army, a horrible disease fell upon %name% and his comrades. Fearing its wrath, | While on a lengthy military campaign, %name% felt that there was too much marching and too little spoils to be had. So} he {stuck his weapons in the ground and walked off. | waited until night to desert his outfit. | and several others disbanded in protest. | volunteered for a patrol and, at the first opening, abandoned his soldiering career.} {It is no secret that deserters are widely despised - and %name% keeps his head hung low to stay out of others\' eyes. | Most deserters spend the rest of their days avoiding the noose, and %name% is no different. | Donning the garb of the everyman, %name% has, for a time, avoided the deserter\'s punishment. | By total luck, %name% has, thus far, gotten away with his crime.} {But now broke and penniless, he seeks a return to his former field. | Perhaps compelled by lawmen closing in, he now finds himself joining another fighting force. | Unfortunately, he is not a smart man. Lacking the imagination to pursue a safer career, %name% once again returns to fighting. | Feeling guilty about deserting his brothers in the field, he now seeks redemption in fighting for another outfit. But who is to say he won\'t flee again? | With an empty coin purse from drinking his memories away, he now considers any opportunity to make a living.}";
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
				-15,
				-10
			],
			Stamina = [
				0,
				0
			],
			MeleeSkill = [
				5,
				5
			],
			RangedSkill = [
				7,
				0
			],
			MeleeDefense = [
				3,
				5
			],
			RangedDefense = [
				3,
				5
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

		if(this.m.IsFemaleBackground == true)
		{
			actor.setName(this.Const.Strings.CharacterNamesFemale[this.Math.rand(0, this.Const.Strings.CharacterNamesFemale.len() - 1)]);
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
		r = this.Math.rand(1, 4);

		if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/bludgeon"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/militia_spear"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/weapons/hatchet"));
		}
		else if (r == 4)
		{
			items.equip(this.new("scripts/items/weapons/short_bow"));
			items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		}

		r = this.Math.rand(0, 3);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/shields/wooden_shield"));
		}

		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/padded_surcoat"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/leather_tunic"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/gambeson"));
		}

		items.equip(this.Const.World.Common.pickHelmet([
			[1, "hood"],
			[1, "open_leather_cap"],
			[1, "aketon_cap"],
			[1, "full_aketon_cap"],
			[2, ""]
		]));
	}

	function onAddLegendEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(1, 4);

		if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/bludgeon"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/militia_spear"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/weapons/hatchet"));
		}
		else if (r == 4)
		{
			items.equip(this.new("scripts/items/weapons/short_bow"));
			items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		}

		r = this.Math.rand(0, 3);

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
			[1, "hood"],
			[1, "open_leather_cap"],
			[1, "aketon_cap"],
			[1, "full_aketon_cap"],
			[2, ""]
		]));
	}
	function onUpdate( _properties )
	{
		this.character_background.onUpdate(_properties);
		_properties.IsContentWithBeingInReserve = true;
	}

});

