this.legend_noble_2h <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_noble_2h";
		this.m.Name = "Noble House Warrior";
		this.m.Icon = "ui/traits/trait_icon_32.png";
		this.m.HiringCost = 200;
		this.m.DailyCost = 8;
		this.m.DailyCostMult = 1.0;
		this.m.Excluded = [
			"trait.hate_undead",
			"trait.hate_beasts",
			"trait.hate_greenskins",
			"trait.weasel",
			"trait.fear_undead",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.paranoid",
			"trait.night_blind",
			"trait.ailing",
			"trait.impatient",
			"trait.asthmatic",
			"trait.greedy",
			"trait.clubfooted",
			"trait.drunkard",
			"trait.disloyal",
			"trait.tiny",
			"trait.fragile",
			"trait.clumsy",
			"trait.fainthearted",
			"trait.craven",
			"trait.bleeder",
			"trait.dastard",
			"trait.insecure",
			"trait.dexterous"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.RangedSkill,
			this.Const.Attributes.RangedDefense
		];
		this.m.GoodEnding = "Supporting your cause from the start, %name%, and he was with you in retirement, leaving the company not long after you did. Though he was a lowly peasant, he proved himself in battle after battle and slowly became as trusted and valued a friend as one can have in a mercenary company.";
		this.m.BadEnding = "A supporter from the start, %name% was as loyal as he was talented. He stayed with the company for a time before eventually leaving to forge out a path for himself. The other day, you received a letter from the mercenary stating that he had started his own company and was in dire need of help. Unfortunately, the message was dated to nearly a full year ago. When you investigated the existence of his company, you learned that it had been completely annihilated in a battle between nobles.";
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Raider;
		this.m.Body = "bust_naked_body_01";
		this.m.IsUntalented = true;
		this.m.IsCombatBackground = true;
		this.m.IsUntalented = true;

		this.m.Modifiers.Ammo = this.Const.LegendMod.ResourceModifiers.Ammo[1];
		this.m.Modifiers.ArmorParts = this.Const.LegendMod.ResourceModifiers.ArmorParts[1];
		this.m.Modifiers.Meds = this.Const.LegendMod.ResourceModifiers.Meds[1];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[2];
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[1];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[1];
		this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Barter[1];
		this.m.Modifiers.ToolConsumption = this.Const.LegendMod.ResourceModifiers.ToolConsumption[1];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[1];
		this.m.PerkTreeDynamic = {
			Weapon = [			
				this.Const.Perks.GreatSwordTree,
				this.Const.Perks.AxeTree,
				this.Const.Perks.HammerTree
			],
			Defense = [
				this.Const.Perks.HeavyArmorTree
			],
			Traits = [
				this.Const.Perks.ViciousTree,
				this.Const.Perks.TrainedTree,
				this.Const.Perks.FitTree,
				this.Const.Perks.LargeTree
			],
			Enemy = [],
			Class = []
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
		return "Brooding and at times suicidal, it\'s no surprise that %name% is frequently found diving into battle with nothing more than a large two-hander. {Clothed in murderous intent, you once saw him cleave a man in two - top to bottom. | It is said that he once cleaved a warrior orc in two, leaving the trunk of its legs still standing. | The man is known to ignore the fragility of his own mortality just to end the life of another. | He thrives being in the thick of battle where he can swing his weapons with little regard for safety or accuracy. | Supposedly, he once won a jousting tournament, but had to flee after bedding a watching nobleman\'s wife. | The man is not a murderer, but he would have made a fine one. | Seemingly unstoppable at times, you are glad to have the man on your side. | In a fit of bloodthirsty rage he once impaled two goblins on one pike. | A strong brute, you once saw %name% kill someone just on his backswing.} He\'ll use any weapon you give him, but %name% has a proclivity towards those that can make calamitous ruin out of a man\'s body.";
	}

	function onPrepareVariables( _vars )
	{
		_vars.extend(this.World.Assets.getFounderNames());
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				10,
				5
			],
			Bravery = [
				5,
				5
			],
			Stamina = [
				5,
				5
			],
			MeleeSkill = [
				7,
				3
			],
			RangedSkill = [
				-5,
				-10
			],
			MeleeDefense = [
				2,
				0
			],
			RangedDefense = [
				2,
				0
			],
			Initiative = [
				-5,
				0
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();

		if (this.Math.rand(0, 3) == 3)
		{
			local actor = this.getContainer().getActor();
			actor.setTitle(this.Const.Strings.SellswordTitles[this.Math.rand(0, this.Const.Strings.SellswordTitles.len() - 1)]);
		}
	}

	function onAddEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.MeleeSkill] = 2;
		talents[this.Const.Attributes.MeleeDefense] = 1;
		talents[this.Const.Attributes.Bravery] = 1;
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 0);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/woodcutters_axe"));
		}

		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/linen_tunic"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/leather_tunic"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/thick_tunic"));
		}

		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/hood"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/headscarf"));
		}
	}

});
