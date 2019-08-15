this.legend_ranger_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_ranger";
		this.m.Name = "Ranger";
		this.m.Icon = "ui/backgrounds/ranger_01.png";
		this.m.BackgroundDescription = "Rangers are expert trackers and marksman, used to hunting prey of any kind";
		this.m.GoodEnding = "While the %companyname% continued on with great success, %name% the ranger eventually saw fit to leave it all behind. He returned to the forests and fields, hunting deer and small game. He rarely showed the grim reality of hunting humans, but you have to imagine he\'d just rather stop doing it. As far as you know, he\'s doing well for himself these days. He purchased a bit of land and helps guide nobles on pricy hunting trips.";
		this.m.BadEnding = "With the decline of the %companyname% readily obvious, %name% the ranger departed from the company and returned to game hunting. Unfortunately, a hunting trip with a nobleman went awry when the lord was gored through both cheeks by a boar. The hunter, feeling he\'d be blamed, shot by the nobleman and his guard and fled through the forests on his own. He has not been seen since.";
		this.m.HiringCost = 20000;
		this.m.DailyCost = 20;
		this.m.Excluded = [
			"trait.weasel",
			"trait.fear_undead",
			"trait.fear_beasts",
			"trait.hate_beasts",
			"trait.night_blind",
			"trait.clubfooted",
			"trait.brute",
			"trait.short_sighted",
			"trait.fat",
			"trait.clumsy",
			"trait.gluttonous",
			"trait.asthmatic",
			"trait.craven",
			"trait.dastard",
			"trait.drunkard",
			"trait.disloyal",
			"trait.loyal"
		];
		this.m.Titles = [
			"the Deerhunter",
			"Woodstalker",
			"the Woodsman",
			"the Hunter",
			"True-Shot",
			"One Shot",
			"Eagle Eye"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.Untidy;
		this.m.Body = "bust_naked_body_01";

		if (this.World.Assets.isLegendGenderEquality())
		{
			local r;
			r = this.Math.rand(0, 1);
		
			if (r == 0)
			{
				this.m.Faces = this.Const.Faces.PrettyFemale;
				this.m.Hairs = this.Const.Hair.AllFemale;
				this.m.HairColors = this.Const.HairColors.Young;
				this.m.Beards = null;
				this.m.BeardChance = 0;
				this.m.Body = "bust_naked_body_03";
				this.m.IsFemaleBackground = true;
			}
		}

		this.m.Level = 1;
		this.m.IsCombatBackground = true;
		this.m.IsUntalented = true;
		this.m.IsRangerRecruitBackground = true;
		this.m.Modifiers.Ammo = this.Const.LegendMod.ResourceModifiers.Ammo[3];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[1];
		this.m.Modifiers.Hunting = this.Const.LegendMod.ResourceModifiers.Hunting[2];
		this.m.Modifiers.Fletching = this.Const.LegendMod.ResourceModifiers.Fletching[2];
		this.m.Modifiers.Scout = this.Const.LegendMod.ResourceModifiers.Scout[3];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[1];
		this.m.Modifiers.Terrain = [
			0.0, // ?
			0.0, //ocean
			0.0,//plains
			0.0, //swamp
			0.0, //hills
			0.05, //forest
			0.05, //forest
			0.05, //forest_leaves
			0.05, //autumn_forest
			0.0, //mountains
			0.0, // ?
			0.0, //farmland
			0.01, // snow
			0.01, // badlands
			0.01, //highlands
			0.0, //stepps
			0.0 //ocean
		];	
		this.m.CustomPerkTree = [
			[
				this.Const.Perks.PerkDefs.CripplingStrikes,
				this.Const.Perks.PerkDefs.FastAdaption,
				this.Const.Perks.PerkDefs.BagsAndBelts,
				this.Const.Perks.PerkDefs.Student,
				this.Const.Perks.PerkDefs.Recover,
				this.Const.Perks.PerkDefs.Pathfinder,
				this.Const.Perks.PerkDefs.Lookout,
				this.Const.Perks.PerkDefs.LegendMarkTarget,
				this.Const.Perks.PerkDefs.LegendBackToBasics,
				this.Const.Perks.PerkDefs.LegendAlert
			],
			[
				this.Const.Perks.PerkDefs.CoupDeGrace,
				this.Const.Perks.PerkDefs.Bullseye,
				this.Const.Perks.PerkDefs.Dodge,
				this.Const.Perks.PerkDefs.QuickHands,
				this.Const.Perks.PerkDefs.Gifted,
				this.Const.Perks.PerkDefs.LegendNightvision,
				this.Const.Perks.PerkDefs.Debilitate,
				this.Const.Perks.PerkDefs.Sprint,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyDirewolf,
				this.Const.Perks.PerkDefs.LegendFavouredEnemySpider,
				this.Const.Perks.PerkDefs.LegendOnslaught
			],
			[
				this.Const.Perks.PerkDefs.Backstabber,
				this.Const.Perks.PerkDefs.Anticipation,
				this.Const.Perks.PerkDefs.Rotation,
				this.Const.Perks.PerkDefs.Feint,
				this.Const.Perks.PerkDefs.Relentless,
				this.Const.Perks.PerkDefs.DoubleStrike,
				this.Const.Perks.PerkDefs.LegendAmmoBinding,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyDirewolf,
				this.Const.Perks.PerkDefs.DevastatingStrikes
			],
			[
				this.Const.Perks.PerkDefs.SpecAxe,
				this.Const.Perks.PerkDefs.SpecSword,
				this.Const.Perks.PerkDefs.SpecDagger,
				this.Const.Perks.PerkDefs.SpecCrossbow,
				this.Const.Perks.PerkDefs.SpecBow,
				this.Const.Perks.PerkDefs.LegendMasteryNets,
				this.Const.Perks.PerkDefs.LegendSpecPoison,
				this.Const.Perks.PerkDefs.SpecThrowing
			],
			[
				this.Const.Perks.PerkDefs.Overwhelm,
				this.Const.Perks.PerkDefs.LoneWolf,
				this.Const.Perks.PerkDefs.Footwork,
				this.Const.Perks.PerkDefs.CloseCombatArcher,
				this.Const.Perks.PerkDefs.Ballistics,
				this.Const.Perks.PerkDefs.LegendLithe,
				this.Const.Perks.PerkDefs.LegendAmmoBundles,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyOrk,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyGoblin
			],
			[
				this.Const.Perks.PerkDefs.Berserk,
				this.Const.Perks.PerkDefs.HeadHunter,
				this.Const.Perks.PerkDefs.Nimble,
				this.Const.Perks.PerkDefs.Rebound,
				this.Const.Perks.PerkDefs.LegendCascade,
				this.Const.Perks.PerkDefs.LegendPiercingShot,
				this.Const.Perks.PerkDefs.LegendMatchingSet,
				this.Const.Perks.PerkDefs.LegendSecondWind,
				this.Const.Perks.PerkDefs.LegendBlendIn,
				this.Const.Perks.PerkDefs.LegendFavouredEnemySchrat

			],
			[
				this.Const.Perks.PerkDefs.KillingFrenzy,
				this.Const.Perks.PerkDefs.PerfectFocus,
				this.Const.Perks.PerkDefs.BattleFlow,
				this.Const.Perks.PerkDefs.LegendCoordinatedVolleys,
				this.Const.Perks.PerkDefs.LegendEvasion,
				this.Const.Perks.PerkDefs.LegendBalance,
				this.Const.Perks.PerkDefs.LegendHidden,
				this.Const.Perks.PerkDefs.LegendBigGameHunter,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyUnhold,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyLindwurm
				this.Const.Perks.PerkDefs.LegendFreedomOfMovement,
				this.Const.Perks.PerkDefs.LegendFavouredEnemyUnhold,
				this.Const.Perks.PerkDefs.LegendBigGameHunter
			],
			[],
			[],
			[],
			[]
		];	
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
		return " {Without a father around, %name%\'s mother taught how to shoot a bow, and how to feed the rest of the family. | Born in the hinterlands of %randomtown%, %name% has spent life stalking the beasts amongst the trees. | %name% once took a bet to shoot an apple off a pig\'s head. The shot missed. A belly full of bacon, determined to never miss again - unless it meant more bacon, of course. | Early in life, %name% liked to traipse about the forests. When a rabid fox attacked, %name% learned to take a bow. When a devilish eagle clawed %name\'s face, the pain taught how to shoot it.} {Once employed by local royalty, a disastrous boar hunt ended with a gored baron and all the blame - and blood - on %name%\'s hands. | The hunter hid the thought well, but for the longest time wondered what it would be like to hunt the ultimate game: man. | Sadly, a bad game of peasant-roulette forced the deer hunter into seeking other means of income. | Unfortunately, the ranger is not nearly as good at cooking deer as shooting them. A dinner consisting of undercooked meats poisoned %name%\'s entire family. Desperation for a new life is understandable. | After an arduous trip to town to sell meats and leathers, %name% followed the call of mercenary work. | War drove the game out of the forests, and the hunt out of %name%. Now it has driven %name% to seek another line of work. | When %name%\'s partner fell in, the wounds could not be healed with hunted meat. Needing to earn crowns to pay for treatment, %name% took up the vocation of sellswords - or sellbows, as it were.} {Any outfit could use a deadeye such as this ranger. | Not entirely without faults, %name% is a professional archer nonetheless. | A quick demonstration is offered: %name% shoots one arrow high into the sky, and with another knocks it out. Impressive. | %name% has the look of someone with something to prove - just make sure it is proved at range. When first given a sword, h%name% grabbed it at the wrong end. Yes, that end. | The hunter wields a bow like another limb, and shoots arrows like a preacher does words.}";
	}




	function onChangeAttributes()
	{
			
		local c = {
			Hitpoints = [
				-5,
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
				5,
				5
			],
			RangedSkill = [
				20,
				20
			],
			MeleeDefense = [
				5,
				5
			],
			RangedDefense = [
				5,
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

		this.m.Container.add(this.new("scripts/skills/perks/perk_pathfinder"));
		this.m.Container.add(this.new("scripts/skills/perks/perk_footwork"));
		this.m.Container.add(this.new("scripts/skills/traits/loyal_trait"));
	}	



	function onAddEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.RangedSkill] = 3;
		talents[this.Const.Attributes.Fatigue] = 2;
		this.getContainer().getActor().fillTalentValues(1, true);
		local items = this.getContainer().getActor().getItems();


		local r;
		items.equip(this.new("scripts/items/weapons/hunting_bow"));
		items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));

		local stash =this.World.Assets.getStash()
		stash.add(this.new("scripts/items/ammo/quiver_of_arrows"));
		stash.add(this.new("scripts/items/supplies/cured_venison_item"));
		stash.add(this.new("scripts/items/accessory/wardog_item"));
		stash.removeByID("supplies.ground_grains");
		stash.removeByID("supplies.ground_grains");


		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.addToBag(this.new("scripts/items/weapons/knife"));
		}
		if (r == 1)
		{
			items.addToBag(this.new("scripts/items/weapons/bludgeon"));
		}

		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/ragged_surcoat"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/thick_tunic"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/leather_tunic"));
		}

		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/hood"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/hunters_hat"));
		}
	}

});
