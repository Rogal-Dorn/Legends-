this.legend_witch_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_witch";
		this.m.Icon = "ui/backgrounds/seer_02.png";
		local r = this.Math.rand(0, 4);

		if (r == 0)
		{
			this.m.Name = "Conjourer";
		}
		else if (r == 1)
		{
			this.m.Name = "Witch";
		}
		else if (r == 2)
		{
			this.m.Name = "Wise Woman";
		}
		else if (r == 3)
		{
			this.m.Name = "Soothsayer";
		}
		else if (r == 4)
		{
			this.m.Name = "Seer";
		}

		this.m.HiringCost = 20000;
		this.m.DailyCost = 20;
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
			"trait.tough",
			"trait.disloyal",
			"trait.loyal"
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


		if (this.Const.LegendMod.Configs.LegendGenderEnabled())
		{
			local r = this.Math.rand(0, 1);
			if (r == 0)
			{
				this.m.Faces = this.Const.Faces.AllMale;
				this.m.Hairs = this.Const.Hair.CommonMale;
				this.m.HairColors = this.Const.HairColors.All;
				this.m.Beards = this.Const.Beards.All;
				this.m.Body = "bust_naked_body_01";
				this.m.IsFemaleBackground = false;
			}
		}

		this.m.IsEducatedBackground = true;
		this.m.IsUntalented = true;
		this.m.Level = 1;

		this.m.Modifiers.Meds = this.Const.LegendMod.ResourceModifiers.Meds[3];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[1];
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[2];
		this.m.Modifiers.Injury = this.Const.LegendMod.ResourceModifiers.Injury[2];
		this.m.Modifiers.MedConsumption = this.Const.LegendMod.ResourceModifiers.MedConsumption[3];

		if (!this.Const.LegendMod.Configs.LegendMagicEnabled())
		{
			this.m.CustomPerkTree = [
				[
					this.Const.Perks.PerkDefs.FastAdaption,
					this.Const.Perks.PerkDefs.CripplingStrikes,
					this.Const.Perks.PerkDefs.BagsAndBelts,
					this.Const.Perks.PerkDefs.NineLives,
					this.Const.Perks.PerkDefs.LegendAlert,
					this.Const.Perks.PerkDefs.Student,
					this.Const.Perks.PerkDefs.Recover,
					this.Const.Perks.PerkDefs.LegendDaze,
				],
				[
					this.Const.Perks.PerkDefs.CoupDeGrace,
					this.Const.Perks.PerkDefs.Bullseye,
					this.Const.Perks.PerkDefs.Dodge,
					this.Const.Perks.PerkDefs.FortifiedMind,
					this.Const.Perks.PerkDefs.HoldOut,
					this.Const.Perks.PerkDefs.Gifted,
					this.Const.Perks.PerkDefs.LegendStunned,
				],
				[
					this.Const.Perks.PerkDefs.Backstabber,
					this.Const.Perks.PerkDefs.Anticipation,
					this.Const.Perks.PerkDefs.Rotation,
					this.Const.Perks.PerkDefs.RallyTheTroops,
					this.Const.Perks.PerkDefs.Taunt,
					this.Const.Perks.PerkDefs.LegendHorrify,
					this.Const.Perks.PerkDefs.LegendSpecStaffSkill,

				],
				[
					this.Const.Perks.PerkDefs.SpecDagger,
					this.Const.Perks.PerkDefs.SpecThrowing,
					this.Const.Perks.PerkDefs.LegendMasteryStaves,
					this.Const.Perks.PerkDefs.LegendEntice,
					this.Const.Perks.PerkDefs.LegendSpecBandage,
					this.Const.Perks.PerkDefs.LegendPush,
				],
				[
					this.Const.Perks.PerkDefs.LoneWolf,
					this.Const.Perks.PerkDefs.Overwhelm,
					this.Const.Perks.PerkDefs.Footwork,
					this.Const.Perks.PerkDefs.LegendAlert,
					this.Const.Perks.PerkDefs.LegendMedIngredients
					this.Const.Perks.PerkDefs.LegendSpecStaffStun,
				],
				[
					this.Const.Perks.PerkDefs.Nimble,
					this.Const.Perks.PerkDefs.LegendRelax,
					this.Const.Perks.PerkDefs.Rebound,
					this.Const.Perks.PerkDefs.LegendClarity,
					this.Const.Perks.PerkDefs.LegendMindOverBody,
					this.Const.Perks.PerkDefs.Ballistics,
					this.Const.Perks.PerkDefs.LegendDrumsOfWar,
					this.Const.Perks.PerkDefs.LegendScry
				],
				[
					this.Const.Perks.PerkDefs.BattleFlow,
					this.Const.Perks.PerkDefs.LegendFavouredEnemyHexen,
					this.Const.Perks.PerkDefs.LegendFreedomOfMovement,
					this.Const.Perks.PerkDefs.PerfectFocus,
					this.Const.Perks.PerkDefs.LegendSleep,
					this.Const.Perks.PerkDefs.LegendTeacher,
					this.Const.Perks.PerkDefs.LegendFieldTriage,
					this.Const.Perks.PerkDefs.LegendFirefield,
				],
				[],
				[],
				[],
				[]
			];

		}
		else
		{
			this.m.CustomPerkTree = [
				[
					this.Const.Perks.PerkDefs.FastAdaption,
					this.Const.Perks.PerkDefs.CripplingStrikes,
					this.Const.Perks.PerkDefs.BagsAndBelts,
					this.Const.Perks.PerkDefs.NineLives,
					this.Const.Perks.PerkDefs.Student,
					this.Const.Perks.PerkDefs.Recover,
					this.Const.Perks.PerkDefs.LegendSummonCat,
					this.Const.Perks.PerkDefs.LegendDaze,
				],
				[
					this.Const.Perks.PerkDefs.CoupDeGrace,
					this.Const.Perks.PerkDefs.Bullseye,
					this.Const.Perks.PerkDefs.Dodge,
					this.Const.Perks.PerkDefs.FortifiedMind,
					this.Const.Perks.PerkDefs.HoldOut,
					this.Const.Perks.PerkDefs.Gifted,
					this.Const.Perks.PerkDefs.LegendStunned,
				],
				[
					this.Const.Perks.PerkDefs.Backstabber,
					this.Const.Perks.PerkDefs.Anticipation,
					this.Const.Perks.PerkDefs.Rotation,
					this.Const.Perks.PerkDefs.RallyTheTroops,
					this.Const.Perks.PerkDefs.Taunt,
					this.Const.Perks.PerkDefs.LegendHorrify,
					this.Const.Perks.PerkDefs.LegendSpecStaffSkill,

				],
				[
					this.Const.Perks.PerkDefs.SpecDagger,
					this.Const.Perks.PerkDefs.SpecThrowing,
					this.Const.Perks.PerkDefs.LegendMasteryStaves,
					this.Const.Perks.PerkDefs.LegendEntice,
					this.Const.Perks.PerkDefs.LegendSpecBandage,
					this.Const.Perks.PerkDefs.LegendPush,
				],
				[
					this.Const.Perks.PerkDefs.LoneWolf,
					this.Const.Perks.PerkDefs.Overwhelm,
					this.Const.Perks.PerkDefs.Footwork,
					this.Const.Perks.PerkDefs.LegendAlert,
					this.Const.Perks.PerkDefs.LegendChainLightning,
					this.Const.Perks.PerkDefs.LegendMedIngredients
					this.Const.Perks.PerkDefs.LegendSpecStaffStun,
				],
				[
					this.Const.Perks.PerkDefs.Nimble,
					this.Const.Perks.PerkDefs.LegendRelax,
					this.Const.Perks.PerkDefs.Rebound,
					this.Const.Perks.PerkDefs.LegendClarity,
					this.Const.Perks.PerkDefs.Ballistics,
					this.Const.Perks.PerkDefs.LegendMindOverBody,
					this.Const.Perks.PerkDefs.LegendDrumsOfWar,
					this.Const.Perks.PerkDefs.LegendLevitate,
					this.Const.Perks.PerkDefs.LegendScry
				],
				[
					this.Const.Perks.PerkDefs.BattleFlow,
					this.Const.Perks.PerkDefs.LegendFavouredEnemyHexen,
					this.Const.Perks.PerkDefs.PerfectFocus,
					this.Const.Perks.PerkDefs.LegendSleep,
					this.Const.Perks.PerkDefs.LegendTeacher,
					this.Const.Perks.PerkDefs.LegendFieldTriage,
					this.Const.Perks.PerkDefs.LegendTeleport,
					this.Const.Perks.PerkDefs.LegendFirefield
				],
				[],
				[],
				[],
				[]
			];
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
		if (this.m.IsFemaleBackground == true)
		{
			return "{ %name% is a practicioner of the dark arts. |  %name% carries a slumped posture, as if weighted by otherworldly knowledge. | %name%\'s face is transformed from its natural withered form | Not much is known about %name%, but strange rumors of sorcery and dark arts follow. | Wherever animals mysteriously begin to die, %name% makes an appearance. | The brooches on %name%\'s cloak seem to swirl and dance like midnight in a jug. | %name%\'s hands are rare to see, only coming out as if to portray the feelings of a face which lies hidden deep in its hood. | %name%\'s eyes could be mistaken for a cat\'s one day and for a blind man\'s the next.} {Little is known of their history | their past i but a mystery to most. | Some say they traveled deep into the northern foothills, returning with unspoken knowledge. | Ostensibly, the dark arts are their heritage, or so it seems. | Their past is kept from all. Maybe it\'s just uninteresting, or maybe just the opposite. | One rumor  says she traveled the land as a spellweaver. | Rumors of magic surround the woman, though some incredulous cynics are hardly impressed. | One rumor is that she was a conman, and another is that she\'s a sorcerer. You\'re not sure which you prefer. | With rumors of dark arts being practiced once more, the woman\'s magical proclamation just might be true. | Some say she eats toads for breakfast and black cats for dinner.} {You ask %name% a lot of questions, but through some handwaves and nods, you realize you have forgotten her answers. Or did you ask the questions at all? | %name% produces a dove from her sleeve. An old trick that fancies no one - until it turns in the air, returning to her as a crow. | %name% has shown the ability to shoot smoke from her mouth. It\'s not fire, but it\'s close, and has people talking in hushed tones. | %name% floats a gold coin into the air. An amazing display that leaves the woman too tired to attempt it again. | Predictions of the weather are common, but %name% is unusually accurate with her own. | %name% asks to read your palms. You decline. Her presence alone is as close as you\'re willing to go. | %name% suggests that the stars are a roadmap to another world. She seems to know a lot about the heavens above. | %name% suggests that the heavens above are in fact just endless streams of beings, continuing on for eons. What a jest! | %name% points to one star in the sky and seems to suggest that is where she came from. You don\'t ask for a clarification on the matter.}";
		}
		else
		{
			return "{ %name% is a practicioner of the dark arts. |  %name% carries a slumped posture, as if weighted by otherworldly knowledge. | %name%\'s face is transformed from its natural withered form | Not much is known about %name%, but strange rumors of sorcery and dark arts follow. | Wherever animals mysteriously begin to die, %name% makes an appearance. | The brooches on %name%\'s cloak seem to swirl and dance like midnight in a jug. | %name%\'s hands are rare to see, only coming out as if to portray the feelings of a face which lies hidden deep in its hood. | %name%\'s eyes could be mistaken for a cat\'s one day and for a blind man\'s the next.} {Little is known of their history | their past i but a mystery to most. | Some say they traveled deep into the northern foothills, returning with unspoken knowledge. | Ostensibly, the dark arts are their heritage, or so it seems. | Their past is kept from all. Maybe it\'s just uninteresting, or maybe just the opposite. | One rumor  says he traveled the land as a spellweaver. | Rumors of magic surround the man, though some incredulous cynics are hardly impressed. | One rumor is that he was a conman, and another is that he\'s a sorcerer. You\'re not sure which you prefer. | With rumors of dark arts being practiced once more, the man\'s magical proclamation just might be true. | Some say he eats toads for breakfast and black cats for dinner.} {You ask %name% a lot of questions, but through some handwaves and nods, you realize you have forgotten his answers. Or did you ask the questions at all? | %name% produces a dove from his sleeve. An old trick that fancies no one - until it turns in the air, returning to him as a crow. | %name% has shown the ability to shoot smoke from his mouth. It\'s not fire, but it\'s close, and has people talking in hushed tones. | %name% floats a gold coin into the air. An amazing display that leaves the man too tired to attempt it again. | Predictions of the weather are common, but %name% is unusually accurate with his own. | %name% asks to read your palms. You decline. His presence alone is as close as you\'re willing to go. | %name% suggests that the stars are a roadmap to another world. He seems to know a lot about the heavens above. | %name% suggests that the heavens above are in fact just endless streams of beings, continuing on for eons. What a jest! | %name% points to one star in the sky and seems to suggest that is where he came from. You don\'t ask for a clarification on the matter.}";
		}
	}


	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				-5,
				-5
			],
			Bravery = [
				5,
				5
			],
			Stamina = [
				15,
				15
			],
			MeleeSkill = [
				-5,
				-5
			],
			RangedSkill = [
				15,
				15
			],
			MeleeDefense = [
				-5,
				-5
			],
			RangedDefense = [
				-5,
				-5
			],
			Initiative = [
				25,
				25
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		this.m.Container.add(this.new("scripts/skills/perks/perk_legend_daze"));
		this.m.Container.add(this.new("scripts/skills/perks/perk_student"));
		this.m.Container.add(this.new("scripts/skills/traits/loyal_trait"));
		if (this.Const.LegendMod.Configs.LegendMagicEnabled())
		{
			this.m.Container.add(this.new("scripts/skills/perks/perk_legend_magic_missile"));
		}

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
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Fatigue] = 3;
		this.getContainer().getActor().fillTalentValues(2, true);
		local items = this.getContainer().getActor().getItems();
		items.equip(this.new("scripts/items/armor/legend_seer_robes"));
		items.equip(this.new("scripts/items/weapons/legend_mystic_staff"));
		items.equip(this.new("scripts/items/helmets/legend_seer_hat"));
		local stash = this.World.Assets.getStash()
		stash.removeByID("supplies.ground_grains");
		stash.removeByID("supplies.ground_grains");
		stash.add(this.new("scripts/items/supplies/black_marsh_stew_item"));
	}

	function onAddLegendEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Fatigue] = 3;
		this.getContainer().getActor().fillTalentValues(2, true);
		local items = this.getContainer().getActor().getItems();
		items.equip(this.new("scripts/items/legend_armor/armor/legend_armor_seer_robes"));
		items.equip(this.new("scripts/items/weapons/legend_mystic_staff"));
		items.equip(this.new("scripts/items/helmets/legend_seer_hat"));
		local stash = this.World.Assets.getStash()
		stash.removeByID("supplies.ground_grains");
		stash.removeByID("supplies.ground_grains");
		stash.add(this.new("scripts/items/supplies/black_marsh_stew_item"));
	}

});
