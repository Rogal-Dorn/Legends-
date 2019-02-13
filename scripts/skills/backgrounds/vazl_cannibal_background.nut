this.vazl_cannibal_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.vazl_cannibal";
		this.m.Name = "Cannibal";
		this.m.Icon = "ui/backgrounds/vazl_cannibal.png";
		this.m.BackgroundDescription = "Cannibals have a thing for human flesh.";
		this.m.GoodEnding = null;
		this.m.BadEnding = null;
		this.m.HiringCost = 60;
		this.m.DailyCost = 6;
		this.m.Excluded = [
			"trait.asthmatic"
		];
		this.m.Titles = [
			"the Cannibal"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.Body = this.Const.Bodies.AllMale[this.Math.rand(0, this.Const.Bodies.AllMale.len() - 1)];
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
		return "{Cannibal.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [0, 0],
			Bravery = [0, 0],
			Stamina = [0, 0],
			MeleeSkill = [0, 0],
			RangedSkill = [0, 0],
			MeleeDefense = [0, 0],
			RangedDefense = [0, 0],
			Initiative = [0, 0]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();
		actor.setTitle("the Cannibal");
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();

		items.equip(this.new("scripts/items/armor/tattered_sackcloth"));
		items.equip(this.new("scripts/items/weapons/butchers_cleaver"));
	}
});
