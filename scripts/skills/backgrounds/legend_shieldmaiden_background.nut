this.legend_shieldmaiden_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_shieldmaiden";
		this.m.Name = "Shieldmaiden";
		this.m.Icon = "ui/backgrounds/legend_shieldmaiden.png";
		this.m.BackgroundDescription = "Shieldmaidens are fierce female warriors from the northern settlements.";
		this.m.GoodEnding = null;
		this.m.BadEnding = null;
		this.m.HiringCost = 600;
		this.m.DailyCost = 36;
		this.m.Excluded = [
			"trait.asthmatic",
			"trait.clumsy",
			"trait.cocky",
			"trait.fragile",
			"trait.tiny"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.Initiative
		];
		this.m.Titles = [
			"the Shieldmaiden"
		];
		this.m.Faces = this.Const.Faces.AllFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Body = this.Const.Bodies.AllFemale[this.Math.rand(0, this.Const.Bodies.AllFemale.len() - 1)];
		this.m.Level = this.Math.rand(1, 2);
		this.m.IsCombatBackground = true;
		this.m.IsFemaleBackground = true;
		this.m.IsCrusaderRecruitBackground = true;
		this.m.AlignmentMin = this.Const.LegendMod.Alignment.NeutralMax;
		this.m.AlignmentMax = this.Const.LegendMod.Alignment.Saintly;
		this.m.Modifiers.Repair = this.Const.LegendMod.ResourceModifiers.Repair[2];
		this.m.Modifiers.Salvage = this.Const.LegendMod.ResourceModifiers.Salvage[1];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[2];
		this.m.PerkTreeDynamicMins.Defense = 3;
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.SpearTree,
				this.Const.Perks.AxeTree,
				this.Const.Perks.ThrowingTree
			],
			Defense = [
				this.Const.Perks.ShieldTree,
				this.Const.Perks.HeavyArmorTree,
			],
			Traits = [
				this.Const.Perks.SturdyTree,
				this.Const.Perks.TrainedTree,
				this.Const.Perks.FitTree,
				this.Const.Perks.IndestructibleTree,
				this.Const.Perks.LargeTree,
				this.Const.Perks.FastTree
			],
			Enemy = [this.Const.Perks.BarbarianTree],
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
//		return "{%name% fights as well as any man.}";
		return "{%name% was born to a family with a long history of feminine warriors. | %name% hails from the distant north, where ideas about the fairer sex tend to be far rougher. | %name% claims to have once been the personal protector of a great jarl, but was exiled from her home for reasons that she seems hesitant to speak of. | %name% caught your eye by flexing her scarred bicep, and she claims that every cut is another man killed. | %name% talks of distant climes and frozen lands that, from her description, you can hardly imagine man could be cursed to walk. | You met %name% in a local tavern, drinking enough to kill most men and challenging anyone who passed to a fight. | %name% has the farthest thing you can imagine from a pretty face, but she makes up for that with a spear and shield that have both clearly seen their share of war.} {Despite whatever hangups many have about women warriors, %name% speaks of a thousand battles you’ve never heard of yet sound plenty dangerous to you, and she bears enough scars to confirm their veracity. | She proudly displays an old shield that seems more crack than wood, and claims that it was gifted to her from a great warrior that she had killed herself. | When a local bruiser challenged her he decided to spend the first moments of the fight gloating to his friends, only to receive a swift punch leading to a broken jaw. | She doesn’t say much, but those few words she does say speak thousands about the strange places she’s seen and the stranger things she’s killed there.} {%name% spits on the ground as she sees a merchant claiming to be selling the hides of Unhold, and says she’s killed baby ones at twice the size. | You have no idea how many of her stories are fabricated, but %name% seems to know how to swing a sword well enough. | When one of your men made a pass on her it took two others to drag her off of the nearly unconscious mercenary. | When you ask her to demonstrate her skill, she grabs one of your men and pulls him to the ground in a headlock before you can stop her. She’s brave, at least. | You’re not sure if the woman’s entirely all there, but she seems like she knows a shieldwall well enough. | You met her in the tavern after a brawl. It was a bad one, but %name% was the only one—besides you—left standing. | You can tell by the look in her eyes that this woman has seen her fair share of war.}";
	}


	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [7, 10],
			Bravery = [6, 8],
			Stamina = [8, 12],
			MeleeSkill = [4, 6],
			RangedSkill = [0, 0],
			MeleeDefense = [10, 15],
			RangedDefense = [10, 15],
			Initiative = [-20, -25]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();
		actor.setName(this.Const.Strings.CharacterNamesFemaleNorse[this.Math.rand(0, this.Const.Strings.CharacterNamesFemaleNorse.len() - 1)]);
		actor.setTitle("the Shieldmaiden");
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;

		r = this.Math.rand(0, 3);
		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/leather_tunic"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/padded_surcoat"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/ragged_surcoat"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/armor/gambeson"));
		}

		r = this.Math.rand(0, 3);
		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/open_leather_cap"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/aketon_cap"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/helmets/full_leather_cap"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/helmets/full_aketon_cap"));
		}

		r = this.Math.rand(0, 3);
		if (r <= 2)
		{
			items.equip(this.new("scripts/items/shields/heater_shield"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/shields/legend_tower_shield"));
		}

		r = this.Math.rand(0, 4);
		if (r <= 2)
		{
			items.equip(this.new("scripts/items/weapons/militia_spear"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/weapons/legend_wooden_spear"));
		}
		else if (r == 4)
		{
			items.equip(this.new("scripts/items/weapons/ancient/ancient_spear"));
		}
	}

	function onAddLegendEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;

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

		r = this.Math.rand(0, 3);
		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/open_leather_cap"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/aketon_cap"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/helmets/full_leather_cap"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/helmets/full_aketon_cap"));
		}

		r = this.Math.rand(0, 3);
		if (r <= 2)
		{
			items.equip(this.new("scripts/items/shields/heater_shield"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/shields/legend_tower_shield"));
		}

		r = this.Math.rand(0, 4);
		if (r <= 2)
		{
			items.equip(this.new("scripts/items/weapons/militia_spear"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/weapons/legend_wooden_spear"));
		}
		else if (r == 4)
		{
			items.equip(this.new("scripts/items/weapons/ancient/ancient_spear"));
		}
	}
});
