this.legend_fear_of_dark_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.legend_fear_of_dark";
		this.m.Name = "Nyctophobia";
		this.m.Icon = "ui/traits/trait_fearofnight.png";
		this.m.Description = "Did those shadows just move? Are you sure?";
		this.m.Excluded = [
			"trait.fearless",
			"trait.brave",
			"trait.night_owl",
			"trait.legend_fear_of_light"
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
				icon = "ui/icons/vision.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10[/color] Resolve during Nighttime"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-20[/color] Resolve when attacked by mental effects during Nighttime"
			}
		];
	}

	function onUpdate( _properties )
	{
		if (this.getContainer().hasSkill("special.night") && _properties.IsAffectedByNight == true)
		{
			_properties.Bravery -= 10;
			this.character_background.onUpdate(_properties);
			_properties.MoraleCheckBravery[1] -= 20;
		}
	}

});

