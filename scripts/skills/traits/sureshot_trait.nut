this.sureshot_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.sureshot";
		this.m.Name = "Sureshot";
		this.m.Icon = "ui/traits/sureshot_trait.png";
		this.m.Description = "Has a knack for hitting hitting targets";
		this.m.Titles = [
			"Sureshot",
			"the Patient"
		];
		this.m.Excluded = [
			"trait.irrational",
			"trait.impatient",
			"trait.quick"
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
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Ranged Skill"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.RangedSkill += 5;
	}

});

