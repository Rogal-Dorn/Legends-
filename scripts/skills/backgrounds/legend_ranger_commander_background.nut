this.legend_ranger_commander_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_commander_ranger";
		this.m.Name = "Ranger";
		this.m.Icon = "ui/backgrounds/background_59.png";
		this.m.BackgroundDescription = "Rangers are expert trackers and marksman, used to hunting prey of any kind";
		this.m.GoodEnding = "While the %companyname% continued on with great success, %name% the ranger eventually saw fit to leave it all behind. He returned to the forests and fields, hunting deer and small game. He rarely showed the grim reality of hunting humans, but you have to imagine he\'d just rather stop doing it. As far as you know, he\'s doing well for himself these days. He purchased a bit of land and helps guide nobles on pricy hunting trips.";
		this.m.BadEnding = "With the decline of the %companyname% readily obvious, %name% the ranger departed from the company and returned to game hunting. Unfortunately, a hunting trip with a nobleman went awry when the lord was gored through both cheeks by a boar. The hunter, feeling he\'d be blamed, shot by the nobleman and his guard and fled through the forests on his own. He has not been seen since.";
		this.m.HiringCost = 12000;
		this.m.DailyCost = 0;
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
			"trait.drunkard"
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
		this.m.Level = 2;
		this.m.IsCombatBackground = true;
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
		return "{Without his father around, %name%\'s mother taught him how to shoot a bow, and how to feed the rest of his family. | Born in the hinterlands of %randomtown%, %name% has spent much of his life stalking the beasts amongst the trees. | %name% once took a bet to shoot an apple off a pig\'s head. He missed. With a belly full of bacon, he became determined to never miss again - unless it meant more bacon, of course. | Early in his life, %name% liked to traipse about the forests. When a rabid fox attacked him, he learned to take a bow. When a devilish eagle clawed his face, he learned to shoot it.} {Once employed by local royalty, a disastrous boar hunt ended with a gored baron and all the blame - and blood - on %name%\'s hands. | The hunter hid the thought well, but for the longest time he wondered what it would be like to hunt the ultimate game: man. | Sadly, a bad game of peasant-roulette forced the deer hunter into seeking other means of income. | Unfortunately, he is not nearly as good at cooking deer as he is at shooting them. A dinner consisting of undercooked meats poisoned his entire family. His desperation for a new life is understandable. | After an arduous trip to town to sell meats and leathers, he followed the call of mercenary work. | War drove the game out of the forests, and the hunt out of %name%. Now he seeks another line of work. | When his wife fell ill, he could not heal her with hunted meat. Needing to earn crowns to pay for treatment, he took up the vocation of sellswords - or sellbows, as it were.} {Any outfit could use a deadeye such as this man. | Not entirely without faults, %name% is a professional bowman nonetheless. | A quick demonstration is offered: %name% shoots one arrow high into the sky, and with another he knocks it out. Impressive. | %name% looks like he has something to prove - just make sure he does it at range. When first given a sword, he grabbed it at the wrong end. Yes, that end. | The hunter wields his bow like another limb, and shoots his arrows like a preacher does words.}";
	}




	function onChangeAttributes()
	{
			
		local c = {
			Hitpoints = [
				0,
				0
			],
			Bravery = [
				0,
				0
			],
			Stamina = [
				20,
				20
			],
			MeleeSkill = [
				0,
				0
			],
			RangedSkill = [
				25,
				25
			],
			MeleeDefense = [
				0,
				0
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
	}	



	function onAddEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.RangedSkill] = 3;
		talents[this.Const.Attributes.Fatigue] = 2;

		local items = this.getContainer().getActor().getItems();


		local r;
		items.equip(this.new("scripts/items/weapons/hunting_bow"));
		items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));

		local stash =this.World.Assets.getStash()
		stash.add(this.new("scripts/items/ammo/quiver_of_arrows"));
		stash.add(this.new("scripts/items/supplies/cured_venison_item"));
		stash.removeByID("supplies.ground_grains");



		r = this.Math.rand(0, 1);

		if (r == 0)
		{
			items.addToBag(this.new("scripts/items/weapons/dagger"));
		}
		if (r == 1)
		{
			items.addToBag(this.new("scripts/items/weapons/bludgeon"));
		}

		r = this.Math.rand(0, 2);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/gambeson"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/padded_leather"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/padded_surcoat"));
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
