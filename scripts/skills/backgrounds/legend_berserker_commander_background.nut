this.legend_berserker_commander_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {
		Tattoo = 0
	},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_commander_berserker";
		this.m.Name = "Berserker";
		this.m.Icon = "ui/backgrounds/berserker_01.png";
		// this.m.BackgroundDescription = "Berserkers are used to the hard life of the wild where only the strong prevail. They are less used to the life of cities, where the astute and deceitful rule.";
		// this.m.GoodEnding = "While the %companyname% visited a town for rest and recuperation, a local princess took a shine to %name% the wildman. He was \'purchased\' for a large sum of gold and given to the noblewoman. You went and visited the man recently. For dinner, he sat at a kingly table, grinning goofily and mimicking the nobles around him as best he could. His new and inexplicable wife adored him, and him her. When you said your goodbyes, he offered you a heavy golden crown off the top of his head. It weighed heavy with traditions and ancient histories. You said it\'d be best if he kept it. The wildman shrugged and walked off, spinning the circlet around a finger.";
		// this.m.BadEnding = "%name% the wildman stayed with the fragmenting %companyname% for a time and then, just like that, he was gone. The company went out looking for him in a forest, eventually finding some sort of crude note: an enormous pile of crowns next to a dirt-drawing of the %companyname% and some of its members, all of them being hugged by a big, literal stick figure with a goofy smile on its face. There was also an offering of a dead, half-eaten rabbit.";
		this.m.HiringCost = 10000;
		this.m.DailyCost = 0;
		this.m.Excluded = [
			"trait.weasel",
			"trait.teamplayer",
			"trait.fear_beasts",
			"trait.hate_undead",
			"trait.paranoid",
			"trait.night_blind",
			"trait.ailing",
			"trait.clubfooted",
			"trait.fat",
			"trait.tiny",
			"trait.gluttonous",
			"trait.pessimist",
			"trait.optimist",
			"trait.short_sighted",
			"trait.dexterous",
			"trait.insecure",
			"trait.hesitant",
			"trait.asthmatic",
			"trait.greedy",
			"trait.fragile",
			"trait.fainthearted",
			"trait.craven",
			"trait.bleeder",
			"trait.bright",
			"trait.cocky",
			"trait.dastard",
			"trait.drunkard"
		];
		this.m.Titles = [
			"the Savage",
			"the Outcast",
			"the Wildman",
			"the Feral",
			"the Wild",
			"the Barbarian"
		];
		this.m.Faces = this.Const.Faces.Berserker;
		this.m.Hairs = this.Const.Hair.Berserker;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = this.Const.Beards.Berserker;
		this.m.BeardChance = 100;
		this.m.Body = "bust_naked_body_04";
		this.m.Level = 2;
		this.m.IsCombatBackground = true;
		this.m.IsLowborn = true;
		this.m.IsUntalented = true;
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
				id = 15,
				type = "text",
				icon = "ui/icons/xp_received.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15%[/color] Experience Gain"
			}
		];
	}

	function onBuildDescription()
	{
		return "{For some, the wild is a refuge. | It is said that man is born with the wilderness in him, and that he does wrong by turning his back on it. | Civilization is a stain, one prolonged arming of every next-generation to better battle the ultimate enemy: Mother Nature herself. | In a time of war, it\'s not surprising that many once again seek refuge in the wild. | Some people flee from town to town. Others stop in between, disappearing into the tranquil forests.} {%name% once found a safe register amongst the trees, but that time is over. | Once a mysterious figure to hunters - the famed masskewatsthat - %name% now returns to civilization for reasons unknown. | %name%\'s got the hands of a blacksmith, but the hygiene of a pigsty. | Maybe it was spurned love, or maybe just war, but %name% has spent the last decade far from the rest of mankind. | Possibly a poacher who settled where he hunted, %name%\'s lived amongst the trees for untold years. | With cleverly stitched garb, %name%\'s atavistic appearance perhaps belies a past as a tailor or tanner.} {There is an obvious language barrier with the wildman, but for some reason he seems very willing to fight. Let\'s hope his newfound \'calling\' doesn\'t have a darker purpose behind it. | Colorful and permanent ritual rites circle about his body. When asked why he wishes to join a band of mercenaries, he hoots and, with a crooked finger, replicates one of his fleshen arts across the sky. | Wounds, old and fresh, dot his already mottled body. And they are not superficial - this man had been fighting something fierce in the wild. | One has to wonder if the calamities which chased him into the forests have come to chase him back out. | Judging by his wild grunting, it\'s doubtful he\'s here to rejoin civilization. | Years as a recluse haven\'t made the man forget what a few crowns can get you. The question is, why did he come back? | He has the strength to wrestle a boar - and his many scars makes you wonder if perhaps he did.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				10,
				10
			],
			Bravery = [
				15,
				15
			],
			Stamina = [
				15,
				15
			],
			MeleeSkill = [
				25,
				25
			],
			RangedSkill = [
				-5,
				-5
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
				0,
				0
			]
		};
		return c;
	}

	function onSetAppearance()
	{
		local actor = this.getContainer().getActor();
		local dirt = actor.getSprite("dirt");
		dirt.Visible = true;
		this.m.Tattoo = this.Math.rand(0, 1);
		local tattoo_body = actor.getSprite("tattoo_body");
		local tattoo_head = actor.getSprite("tattoo_head");
		local body = actor.getSprite("body");
		tattoo_body.setBrush((this.m.Tattoo == 0 ? "warpaint_01_" : "scar_02_") + body.getBrush().Name);
		tattoo_body.Visible = true;
		tattoo_head.setBrush(this.m.Tattoo == 0 ? "warpaint_01_head" : "scar_02_head");
		tattoo_head.Visible = true;
	}

	function updateAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");

		if (tattoo_body.HasBrush)
		{
			local body = actor.getSprite("body");
			tattoo_body.setBrush((this.m.Tattoo == 0 ? "warpaint_01_" : "scar_02_") + body.getBrush().Name);
		}
	}

	function onAdded()
	{

		this.character_background.onAdded();
		local actor = this.getContainer().getActor();
		actor.setTitle("The Berserker");
		this.m.Container.add(this.new("scripts/skills/perks/perk_berserk"));
		this.m.Container.add(this.new("scripts/skills/traits/deathwish_trait"));
	}	


	function onAddEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.MeleeSkill] = 3;
		talents[this.Const.Attributes.Fatigue] = 2;
		this.getContainer().getActor().fillTalentValues(1, true);
		local items = this.getContainer().getActor().getItems();
		local stash = this.World.Assets.getStash()
		stash.removeByID("supplies.ground_grains");
		stash.removeByID("supplies.ground_grains");
		stash.add(this.new("scripts/items/accessory/berserker_mushrooms_item"));
		stash.add(this.new("scripts/items/accessory/berserker_mushrooms_item"));
		stash.add(this.new("scripts/items/supplies/roots_and_berries_item"));		
		stash.add(this.new("scripts/items/supplies/roots_and_berries_item"));
		stash.add(this.new("scripts/items/supplies/medicine_item"));
		stash.add(this.new("scripts/items/weapons/throwing_axe"));
		items.equip(this.new("scripts/items/armor/werewolf_hide_armor"));
		local r;


			r = this.Math.rand(0, 4);

			if (r == 0)
			{
				items.equip(this.new("scripts/items/weapons/ancient/rhomphaia"));
			}
			else if (r == 1)
			{
				items.equip(this.new("scripts/items/weapons/warbrand"));
			}
			else if (r == 2)
			{
				items.equip(this.new("scripts/items/weapons/ancient/crypt_cleaver"));
			}

			else if (r == 3)
			{
				items.equip(this.new("scripts/items/weapons/greenskins/orc_flail_2h"));
			}
			else if (r == 4)
			{
				items.equip(this.new("scripts/items/weapons/greenskins/orc_axe_2h"));
			}


	}



	function onSerialize( _out )
	{
		this.character_background.onSerialize(_out);
		_out.writeU8(this.m.Tattoo);
	}

	function onDeserialize( _in )
	{
		this.character_background.onDeserialize(_in);
		this.m.Tattoo = _in.readU8();
	}

});
