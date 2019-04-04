this.vazl_vala_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.vazl_vala";
		this.m.Name = "Vala";
		this.m.Icon = "ui/backgrounds/vazl_vala.png";
		this.m.BackgroundDescription = "A Vala is a travelling seer, shaman and sorceress.";
		this.m.GoodEnding = null;
		this.m.BadEnding = null;
		this.m.HiringCost = 240;
		this.m.DailyCost = 24;
		this.m.Excluded = [
			"trait.asthmatic",
			"trait.clumsy",
			"trait.cocky",
			"trait.craven",
			"trait.dastard",
			"trait.fainthearted",
			"trait.insecure"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.Hitpoints,
			this.Const.Attributes.MeleeSkill,
			this.Const.Attributes.RangedSkill,
			this.Const.Attributes.MeleeDefense,
			this.Const.Attributes.RangedDefense
		];
		this.m.Titles = [
			"the Vala"
		];
		this.m.Faces = this.Const.Faces.AllFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = null;
		this.m.BeardChance = 0;
		this.m.Body = this.Const.Bodies.AllFemale[this.Math.rand(0, this.Const.Bodies.AllFemale.len() - 1)];
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
		return "{%name% is a travelling seer, shaman and sorceress.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [-4, -6],
			Bravery = [8, 12],
			Stamina = [6, 9],
			MeleeSkill = [0, 0],
			RangedSkill = [0, 0],
			MeleeDefense = [0, 0],
			RangedDefense = [0, 0],
			Initiative = [10, 15]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();
		actor.setName(this.Const.Strings.CharacterNamesFemaleNorse[this.Math.rand(0, this.Const.Strings.CharacterNamesFemaleNorse.len() - 1)]);
		actor.setTitle("the Vala");
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();

		items.equip(this.new("scripts/items/weapons/legend_staff_vala"));
		local r = this.Math.rand(0, 1);
		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/legend_vala_cloak"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/legend_vala_dress"));
		}

	}
});
