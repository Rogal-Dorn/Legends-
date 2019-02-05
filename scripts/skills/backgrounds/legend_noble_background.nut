this.legend_noble_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_noble";
		this.m.Name = "Runaway Noble";
		this.m.Icon = "ui/backgrounds/background_58.png";
		this.m.BackgroundDescription = "Runaway Nobles tend to have high resolve and shrewed bargaining, but often neglect combat skills.";
		this.m.GoodEnding = "Adventurousness never leaves the soul of a woman like %name%. {Instead of following the traditions of her noble family, she headed east to start slay a fearsome beast. Word has it she returned to town with the head of what looked like a giant lizard, but you don\'t believe such fantastical tripe. | She journeyed with %companyname% and ventured west, sailing across the oceans to unseen lands. There\'s no telling where she is these days, but you\'ve little doubt that she\'ll be coming back with stories to tell. | She retired from the %companyname% and, instead of returning to her noble family, headed south. Word has it she fought in a great noble civil war, killed an orc warlord, climbed the highest mountain in the land, and is currently writing an epic about her travels. | The noblewoman left the %companyname% and, preferring the life of adventure to noble boredom, she headed north. Word has it that she\'s currently marching a troop of explorers to the furthest reaches of the world.}";
		this.m.BadEnding = "%name% departed the %companyname% and continued her adventuring elsewhere. {She headed east, hoping to discover the source of the greenskins, but has not been heard from since. | She headed north into the snowy wastes. Word has it she was seen a week ago, marching south this time, looking rather pale and shuffling moreso than walking. | She headed south into brutal marshlands. Word has it that a mysterious flame appeared in the fog and she walked toward it. The men who saw this said she disappeared into the mist and never returned. | She headed west and sailed the open sea. Despite having no experience at sea, she saw fit to make herself captain of the boat. They say pieces of her ship and dead sailors kept washing ashore for weeks.}";
		this.m.HiringCost = 150;
		this.m.DailyCost = 5;
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
		this.m.Faces = "bust_head_20";
		this.m.Hairs = "hair_blonde_21";
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = null;
		this.m.Body = "bust_naked_body_03";
		this.m.Level = this.Math.rand(1, 3);
		this.m.IsCombatBackground = true;
		this.m.IsNoble = true;
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
		return "{Daughter of a minor noble | Last of her bloodline | A young and fiery noble | A strong willed heiress}, %name%\  {had been promised in marriage to a tyrant | was bored with endless studying of court etiquette and family lineage | longed to see the world beyong her cloister | was lured by tales of adventures, battles, fearsome beasts to vanquish and handsome princes}. {Leaving her betrothed at the altar | Sneaking out in the dead of night | Escaping with the help of her handmaidens | Despite her parents pleading}, %name% rode out to {prove herself | find a new life in the world |  make her own way | forge another path} and {live life to its fullest as she imagined it from behind the castle walls | see all the wonders and exotic places of the world | earn her place in the world | create her own legacy | become famous and loved in all the known world | become infamous and feared in all the known world}.";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				0,
				0
			],
			Bravery = [
				25,
				20
			],
			Stamina = [
				10,
				5
			],
			MeleeSkill = [
				5,
				0
			],
			RangedSkill = [
				5,
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
				10,
				5
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();
		actor.setName(this.Const.Strings.CharacterNamesFemale[this.Math.rand(0, this.Const.Strings.CharacterNamesFemale.len() - 1)]);
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/arming_sword"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/weapons/crossbow"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/shortbow"));
		}
		
		r = this.Math.rand(0, 3);

		if (r == 0)
		{
			items.addToBag(this.new("scripts/items/loot/signet_ring_item"));
		}
		else if (r == 1)
		{
			items.addToBag(this.new("scripts/items/loot/signet_ring_item"));
		}
		else if (r == 2)
		{
			items.addToBag(this.new("scripts/items/loot/white_pearls_item"));
		}
		else if (r == 3)
		{
			items.addToBag(this.new("scripts/items/loot/jeweled_crown_item"));
		}


		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.addToBag(this.new("scripts/items/supplies/medicine_item"));
			items.addToBag(this.new("scripts/items/supplies/preserved_mead_item"));
		}
		else if (r == 1)
		{
			items.addToBag(this.new("scripts/items/supplies/medicine_item"));
			items.addToBag(this.new("scripts/items/supplies/wine_item"));
		}
	
		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.addToBag(this.new("scripts/items/trade/dies_item"));
		}
		else if (r == 1)
		{
			items.addToBag(this.new("scripts/items/trade/uncut_gems_item"));
		}
		else if (r == 1)
		{
			items.addToBag(this.new("scripts/items/trade/amber_shards_item"));
		}


	

		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/noble_tunic"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/noble_gear"));
		}


		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/noble_headgear"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/feathered_hat"));
		}
	}

});
