this.vazl_shieldmaiden_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.vazl_shieldmaiden";
		this.m.Name = "Shieldmaiden";
		this.m.Icon = "ui/backgrounds/vazl_shieldmaiden.png";
		this.m.BackgroundDescription = "Shieldmaidens are female warriors.";
		this.m.GoodEnding = null;
		this.m.BadEnding = null;
		this.m.HiringCost = 180;
		this.m.DailyCost = 18;
		this.m.Excluded = [
			"trait.asthmatic",
			"trait.clumsy",
			"trait.cocky",
			"trait.fragile",
			"trait.tiny"
		];
		this.m.ExcludedTalents = [
			this.Const.Attributes.Bravery,
			this.Const.Attributes.Initiative
		];
		this.m.Titles = [
			"the Shieldmaiden"
		];
		this.m.Faces = this.Const.Faces.AllFemale;
		this.m.Hairs = this.Const.Hair.AllFemale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.AllFemale;
		this.m.BeardChance = 0;
		this.m.Body = this.Const.Bodies.AllFemale[this.Math.rand(0, this.Const.Bodies.AllFemale.len() - 1)];
		this.m.Level = this.Math.rand(1, 2);
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
		return "{%name% fights as well as any man.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [5, 10],
			Bravery = [4, 8],
			Stamina = [6, 12],
			MeleeSkill = [3, 6],
			RangedSkill = [4, 8],
			MeleeDefense = [0, 0],
			RangedDefense = [0, 0],
			Initiative = [-10, -15]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();
		actor.setName(this.Const.Strings.CharacterNamesFemaleNorse[this.Math.rand(0, this.Const.Strings.CharacterNamesFemaleNorse.len() - 1)]);
		actor.setTitle("the Shieldmaiden");
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;

		r = this.Math.rand(0, 3);
		if (r == 0)
		{
			items.equip(this.new("scripts/items/armor/leather_tunic"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/armor/padded_surcoat"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/armor/ragged_surcoat"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/armor/gambeson"));
		}

		r = this.Math.rand(0, 3);
		if (r == 0)
		{
			items.equip(this.new("scripts/items/helmets/open_leather_cap"));
		}
		else if (r == 1)
		{
			items.equip(this.new("scripts/items/helmets/aketon_cap"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/helmets/full_leather_cap"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/helmets/full_aketon_cap"));
		}

		r = this.Math.rand(0, 2);
		if (r <= 1)
		{
			items.equip(this.new("scripts/items/shields/wooden_shield"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/shields/buckler_shield"));
		}

		r = this.Math.rand(0, 3);
		if (r <= 1)
		{
			items.equip(this.new("scripts/items/weapons/militia_spear"));
		}
		else if (r == 2)
		{
			items.equip(this.new("scripts/items/weapons/shortsword"));
		}
		else if (r == 3)
		{
			items.equip(this.new("scripts/items/weapons/hatchet"));
		}
	}
});
