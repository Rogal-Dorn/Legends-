this.legend_witch_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_witch";
		this.m.Icon = "ui/backgrounds/background_62.png";
		local r = this.Math.rand(0, 3);

		if (r == 0)
		{
			this.m.Name = "Enchanter";
		}
		else if (r == 1)
		{
			this.m.Name = "Mesmer";
		}
		else if (r == 2)
		{
			this.m.Name = "Hypnotist";
		}
		else if (r == 3)
		{
			this.m.Name = "Seer";
		}

		this.m.HiringCost = 250;
		this.m.DailyCost = 0;
		this.m.Excluded = [
			"trait.brave",
			"trait.athletic",
			"trait.brute",
			"trait.dexterous",
			"trait.eagleyes",
			"trait.fearless",
			"trait.huge",
			"trait.loyal",
			"trait.quick",
			"trait.swift",
			"trait.suser_footing",
			"trait.tough"
		];
		this.m.Titles = [
			"the Enthralling",
			"the Fascinating",
			"the Speaker",
			"the Dreamer",
			"the Clairvoyant",
			"the Diviner"
		];
		this.m.Faces = this.Const.Faces.AllFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = null;
		this.m.Body = "bust_naked_body_03";
		this.m.IsFemaleBackground = true;
		this.m.Level = 1;
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
		return "{ %name% is a practicioner of the dark arts. |  %name% carries a slumped posture, as if weighted by otherworldly knowledge. | %name%\'s face is transformed from its natural withered form | Not much is known about %name%, but strange rumors of sorcery and dark arts follow. | Wherever animals mysteriously begin to die, %name% makes an appearance. | The brooches on %name%\'s cloak seem to swirl and dance like midnight in a jug. | %name%\'s hands are rare to see, only coming out as if to portray the feelings of a face which lies hidden deep in its hood. | %name%\'s eyes could be mistaken for a cat\'s one day and for a blind man\'s the next.} {Little is known of their history | their past i but a mystery to most. | Some say they traveled deep into the northern foothills, returning with unspoken knowledge. | Ostensibly, the dark arts are their heritage, or so it seems. | Their past is kept from all. Maybe it\'s just uninteresting, or maybe just the opposite. | One rumor  says he traveled the land as a spellweaver. | Rumors of magic surround the man, though some incredulous cynics are hardly impressed. | One rumor is that he was a conman, and another is that he\'s a sorcerer. You\'re not sure which you prefer. | With rumors of dark arts being practiced once more, the woman\'s magical proclamation just might be true. | Some say she eats toads for breakfast and black cats for dinner.} {You ask %name% a lot of questions, but through some handwaves and nods, you realize you have forgotten her answers. Or did you ask the questions at all? | %name% produces a dove from his sleeve. An old trick that fancies no one - until it turns in the air, returning to her as a crow. | %name% has shown the ability to shoot smoke from her mouth. It\'s not fire, but it\'s close, and has people talking in hushed tones. | %name% floats a gold coin into the air. An amazing display that leaves the woman too tired to attempt it again. | Predictions of the weather are common, but %name% is unusually accurate with her own. | %name% asks to read your palms. You decline. His presence alone is as close as you\'re willing to go. | %name% suggests that the stars are a roadmap to another world. She seems to know a lot about the heavens above. | %name% suggests that the heavens above are in fact just endless streams of beings, continuing on for eons. What a jest! | %name% points to one star in the sky and seems to suggest that is where she came from. You don\'t ask for a clarification on the matter.}";
	}
	

		function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				-10,
				-5
			],
			Bravery = [
				0,
				0
			],
			Stamina = [
				10,
				10
			],
			MeleeSkill = [
				-10,
				-10
			],
			RangedSkill = [
				10,
				5
			],
			MeleeDefense = [
				-10,
				-5
			],
			RangedDefense = [
				-5,
				0
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
		this.m.Container.add(this.new("scripts/skills/perks/perk_legend_daze"));
	}

	function onAddEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Fatigue] = 3;
		local items = this.getContainer().getActor().getItems();
		items.equip(this.new("scripts/items/armor/wizard_robe"));
		items.equip(this.new("scripts/items/helmets/wizard_hat"));
		items.equip(this.new("scripts/items/weapons/legend_mystic_staff"));
		local stash = this.World.Assets.getStash()
		stash.removeByID("supplies.ground_grains");
		stash.removeByID("supplies.ground_grains");
		stash.add(this.new("scripts/items/supplies/black_marsh_stew_item"));
		stash.add(this.new("scripts/items/supplies/medicine_item"));
	}

});
