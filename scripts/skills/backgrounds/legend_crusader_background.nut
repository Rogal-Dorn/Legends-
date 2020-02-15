this.legend_crusader_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_crusader";
		this.m.Name = "Holy Crusader";
		this.m.Icon = "ui/backgrounds/crusader.png";
		this.m.HiringCost = 20000;
		this.m.DailyCost = 20;
		this.m.Excluded = [
			"trait.weasel",
			"trait.fear_undead",
			"trait.paranoid",
			"trait.night_blind",
			"trait.swift",
			"trait.ailing",
			"trait.brute",
			"trait.bloodthirsty",
			"trait.greedy",
			"trait.gluttonous",
			"trait.dumb",
			"trait.clubfooted",
			"trait.irrational",
			"trait.hesitant",
			"trait.disloyal",
			"trait.tiny",
			"trait.fragile",
			"trait.clumsy",
			"trait.fainthearted",
			"trait.craven",
			"trait.bleeder",
			"trait.dastard",
			"trait.insecure",
			"trait.asthmatic",
			"trait.disloyal",
			"trait.loyal"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.RangedSkill,
			this.Const.Attributes.RangedDefense
		];
		this.m.Faces = this.Const.Faces.SmartMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.Body = "bust_naked_body_02";

		this.m.Level = 1;
		this.m.IsCombatBackground = true;
		this.m.IsOffendedByViolence = true;
		this.m.IsUntalented = true;
		this.m.Modifiers.Healing = this.Const.LegendMod.ResourceModifiers.Healing[1];
		this.m.Modifiers.Salvage = this.Const.LegendMod.ResourceModifiers.Salvage[1];
		this.m.Modifiers.Repair = this.Const.LegendMod.ResourceModifiers.Repair[2];
		this.m.Modifiers.ArmorParts = this.Const.LegendMod.ResourceModifiers.ArmorParts[2];
		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[2];
		this.m.Modifiers.ToolConsumption = this.Const.LegendMod.ResourceModifiers.ToolConsumption[2];
		this.m.Modifiers.Training = this.Const.LegendMod.ResourceModifiers.Training[2];
		this.m.PerkTreeDynamic = {
			Weapon = [
				this.Const.Perks.GreatSwordTree,
				this.Const.Perks.FlailTree,
				this.Const.Perks.HammerTree,
				this.Const.Perks.MaceTree,
				this.Const.Perks.CrossbowTree
			],
			Defense = [
				this.Const.Perks.ShieldTree,
				this.Const.Perks.HeavyArmorTree
			],
			Traits = [
				this.Const.Perks.TrainedTree,
				this.Const.Perks.LargeTree,
				this.Const.Perks.IndestructibleTree,
				this.Const.Perks.MartyrTree,
				this.Const.Perks.InspirationalTree
				this.Const.Perks.FitTree
			],
			Enemy = [
					this.Const.Perks.ZombieTree,
					this.Const.Perks.SkeletonTree
					],
			Class = [this.Const.Perks.FaithClassTree]
		}

	}

	//Default Male
	function setGender(_gender = -1)
	{
		local r = _gender;
		if (_gender == -1)
		{
			r = 0;
			if (this.Const.LegendMod.Configs.LegendGenderEnabled())
			{
				r = this.Math.rand(0, 1);
			}
		}

		if (r != 1)
		{
			return
		}
		this.m.Faces = this.Const.Faces.PrettyFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.Young;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Body = "bust_naked_body_03";
		this.m.IsFemaleBackground = true;
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
			return "%name% lives to fight the undead scourge. Little is known about her and she almost never talks save for the occasional grunt while swinging her sword. Her language seems to be codified into one simple structure: killing creatures of evil.";
		}
		else
		{
			return "%name% lives to fight the undead scourge. Little is known about him and he almost never talks save for the occasional grunt while swinging his sword. His language seems to be codified into one simple structure: killing creatures of evil.";
		}
	}

	function onSetAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");
		local tattoo_head = actor.getSprite("tattoo_head");

		if (this.Math.rand(1, 100) <= 25)
		{
			local body = actor.getSprite("body");
			tattoo_body.setBrush("scar_02_" + body.getBrush().Name);
			tattoo_body.Visible = true;
		}

		if (this.Math.rand(1, 100) <= 25)
		{
			tattoo_head.setBrush("scar_02_head");
			tattoo_head.Visible = true;
		}
	}

	function updateAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");

		if (tattoo_body.HasBrush)
		{
			local body = actor.getSprite("body");
			tattoo_body.setBrush("scar_02_" + body.getBrush().Name);
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
				10,
				10
			],
			Stamina = [
				5,
				5
			],
			MeleeSkill = [
				10,
				10
			],
			RangedSkill = [
				-10,
				-10
			],
			MeleeDefense = [
				15,
				15
			],
			RangedDefense = [
				-10,
				-10
			],
			Initiative = [
				-10,
				-10
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();
		actor.setTitle("the Crusader");
		this.m.Container.add(this.new("scripts/skills/traits/loyal_trait"));
		this.m.Container.add(this.new("scripts/skills/traits/legend_undead_killer_trait"));
		//this.m.Container.add(this.new("scripts/skills/perks/perk_rebound"));

		if(this.m.IsFemaleBackground == true)
		{
			actor.setName(this.Const.Strings.LadyNames[this.Math.rand(0, this.Const.Strings.LadyNames.len() - 1)]);
		}
		else
		{
			actor.setName(this.Const.Strings.KnightNames[this.Math.rand(0, this.Const.Strings.KnightNames.len() - 1)]);
		}
	}

	function onAddEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.MeleeDefense] = 3;
		this.getContainer().getActor().fillTalentValues(2, true);
		local items = this.getContainer().getActor().getItems();
		local stash =this.World.Assets.getStash()
		local r;
		stash.removeByID("supplies.ground_grains");
		stash.removeByID("supplies.ground_grains");
		stash.add(this.new("scripts/items/supplies/armor_parts_item"));
		stash.add(this.new("scripts/items/supplies/medicine_item"));
		items.equip(this.new("scripts/items/weapons/legend_crusader_sword"));;
		items.equip(this.new("scripts/items/armor/legend_crusader_armor"));
		items.equip(this.new("scripts/items/helmets/closed_flat_top_helmet"));
	}

	function onAddLegendEquipment()
	{
		local talents = this.getContainer().getActor().getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.MeleeDefense] = 3;
		this.getContainer().getActor().fillTalentValues(2, true);
		local items = this.getContainer().getActor().getItems();
		local stash =this.World.Assets.getStash()
		local r;
		stash.removeByID("supplies.ground_grains");
		stash.removeByID("supplies.ground_grains");
		stash.add(this.new("scripts/items/supplies/armor_parts_item"));
		stash.add(this.new("scripts/items/supplies/medicine_item"));
		items.equip(this.new("scripts/items/weapons/legend_crusader_sword"));;
		items.equip(this.new("scripts/items/legend_armor/armor/legend_armor_crusader"));
		items.equip(this.new("scripts/items/helmets/closed_flat_top_helmet"));
	}

});
