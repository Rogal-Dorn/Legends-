this.killer_on_the_run_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.killer_on_the_run";
		this.m.Name = "Killer on the Run";
		this.m.Icon = "ui/backgrounds/background_02.png";
		this.m.BackgroundDescription = "A killer on the run may kill again, and he knows where to aim.";
		this.m.GoodEnding = "Always a risk taker, you accepted %name% into the %companyname%\'s ranks despite him being a killer on the run. It worked in your favor as he proved himself an able and brave sellsword. As far as you know, he is still with the company, thoroughly enjoying every \'business\' opportunity it affords him.";
		this.m.BadEnding = "While many doubted the risk of hiring a killer on the run such as %name%, the man did prove himself a very capable sellsword. Unfortunately, an old life never trails far behind and bounty hunters kidnapped him in the night. You can find his skeleton squatting in a gibbet fifty feet in the air.";
		this.m.HiringCost = 60;
		this.m.DailyCost = 6;
		this.m.Excluded = [
			"trait.teamplayer",
			"trait.hate_undead",
			"trait.lucky",
			"trait.clubfooted",
			"trait.cocky",
			"trait.clumsy",
			"trait.loyal",
			"trait.hesitant",
			"trait.bright",
			"trait.brave",
			"trait.determined",
			"trait.deathwish",
			"trait.fainthearted",
			"trait.craven",
			"trait.fearless",
			"trait.optimist"
		];
		this.m.Titles = [
			"Darkhearted",
			"Backblade",
			"Throatslash",
			"on the Run",
			"the Wanted",
			"the Murderer"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Untidy;

		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Dreaded;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Notorious;
		this.m.Bodies = this.Const.Bodies.Skinny;
		this.m.IsCombatBackground = true;
		this.m.IsOutlawBackground = true;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.Dreaded;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Notorious;
		this.m.Modifiers.Hunting = this.Const.LegendMod.ResourceModifiers.Hunting[1];
		this.m.Modifiers.Scout = this.Const.LegendMod.ResourceModifiers.Scout[2];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.DaggerTree,
				this.Const.Perks.SwordTree,
				this.Const.Perks.PolearmTree,
				this.Const.Perks.CrossbowTree
			],
			Defense = [
				this.Const.Perks.LightArmorTree
			],
			Traits = [
				this.Const.Perks.ViciousTree,
				this.Const.Perks.DeviousTree,
				this.Const.Perks.LargeTree,
				this.Const.Perks.FastTree
			],
			Enemy = [
				this.Const.Perks.NoblesTree,
				this.Const.Perks.MercenaryTree
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
			r = this.Math.rand(0, 9);
			if (this.World.LegendsMod.Configs().LegendGenderEnabled())
			{
				r = this.Math.rand(0, 1);
			}
		}

		if (r != 1)
		{
			return
		}
		this.m.Faces = this.Const.Faces.AllFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Bodies = this.Const.Bodies.AllFemale;
		this.m.IsFemaleBackground = true;
		this.m.GoodEnding = "Always a risk taker, you accepted %name% into the %companyname%\'s ranks despite her being a killer on the run. It worked in your favor as she proved herself an able and brave sellsword. As far as you know, she is still with the company, thoroughly enjoying every \'business\' opportunity it affords her.";
		this.m.BadEnding = "While many doubted the risk of hiring a killer on the run such as %name%, the woman did prove herself a very capable sellsword. Unfortunately, an old life never trails far behind and bounty hunters kidnapped her in the night. You can find her skeleton squatting in a gibbet fifty feet in the air.";

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
				id = 11,
				type = "text",
				icon = "ui/icons/chance_to_hit_head.png",
				text = "Higher Chance To Hit Head"
			}
		];
	}

	function onBuildDescription()
	{
		if (this.m.IsFemaleBackground == true)
		{
			return "{%fullname% has a face that no one desires - one fit for a wanted poster. | With blood on her hands, %name% resembles a woman recently described to you by bounty hunters. | %name% looks about ready to join any outfit - or disappear into its ranks. | Upon meeting people, %name% stammers out her name as if reluctant to part with it.} {Recognizing %name% is no hard feat: this woman is a known-murderer, the blood of both her cuckolding husband and his lover on her hands. | Her eyes are dark and shifting. There is a crime behind them, but also a sense of humanity, as if she knows she has done wrong and is looking to make amends. | Mud stands up to her legs. She\'s been running for a long time. Her hands tremble, too, for her legs run from what her hands have done. | They say she killed her newborn daughter, having always wanted a son instead. | Some believe she struck down a man in self-defense. | Being blackmailed with scandalous information, it\'s hard to blame the woman for what she has done.} {Even if she has done wrong, a party of killers could use a woman such as she. But can the woman be trusted? | %name%\'s eyes skirt from yours. When you ask how she is with a weapon, she mumbles about only having to hit \'the man\' once. | A woman of %name%\'s physique could be useful, but how much can you depend upon a woman whose former life was one of being on the run? | The woman chamfers on her fingernails like a beaver would a tree. She\'s jumpy, but maybe that\'s a good thing in this world. | Mercenary bands are just the thing for a woman like her.}";
		}
		else
		{
			return "{%fullname% has a face that no one desires - one fit for a wanted poster. | With blood on his hands, %name% resembles a man recently described to you by bounty hunters. | %name% looks about ready to join any outfit - or disappear into its ranks. | Upon meeting people, %name% stammers out his name as if reluctant to part with it.} {Recognizing %name% is no hard feat: this man is a known-murderer, the blood of both his cuckolding wife and her lover on his hands. | His eyes are dark and shifting. There is a crime behind them, but also a sense of humanity, as if he knows he has done wrong and is looking to make amends. | Mud stands up to his legs. He\'s been running for a long time. His hands tremble, too, for his legs run from what his hands have done. | They say he killed his newborn daughter, having always wanted a son instead. | Some believe he struck down a man in self-defense. | Being blackmailed with scandalous information, it\'s hard to blame the man for what he has done.} {Even if he has done wrong, a party of killers could use a man such as he. But can the man be trusted? | %name%\'s eyes skirt from yours. When you ask how he is with a weapon, he mumbles about only having to hit \'the man\' once. | A man of %name%\'s physique could be useful, but how much can you depend upon a man whose former life was one of being on the run? | The man chamfers on his fingernails like a beaver would a tree. He\'s jumpy, but maybe that\'s a good thing in this world. | Mercenary bands are just the thing for a man like him.}";
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
				-5,
				-5
			],
			Stamina = [
				0,
				0
			],
			MeleeSkill = [
				4,
				0
			],
			RangedSkill = [
				2,
				3
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
				5
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
		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/dagger"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/knife"));
		}

		r = this.Math.rand(1, 2);

		if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/linen_tunic"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/leather_tunic"));
		}

		items.equip(this.Const.World.Common.pickHelmet([
			[1, "hood"]
		]));
	}

	function onAddLegendEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/dagger"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/knife"));
		}


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
			[1, "hood"]
		]));
	}
	function onUpdate( _properties )
	{
		this.character_background.onUpdate(_properties);
		_properties.HitChance[this.Const.BodyPart.Head] += 10;
	}
});

