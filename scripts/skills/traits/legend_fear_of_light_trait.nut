this.legend_fear_of_light_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.legend_fear_of_light";
		this.m.Name = "Heliophobia";
		this.m.Icon = "ui/traits/trait_fearofday.png";
		this.m.Description = "Look I ain\'t feelin\' so good — can we wait untul the sun goes down? Please?";
		this.m.Excluded = [
			"trait.fearless",
			"trait.brave",
			"trait.legend_fear_of_dark"
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
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10[/color] Resolve during Daytime"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-20[/color] Resolve when attacked by mental effects during Daytime"
			}
		];
	}

	function onUpdate( _properties )
	{
		if (this.getContainer().hasSkill("special.night") && _properties.IsDaytime == true)
		{
			_properties.Bravery -= 10;
			this.character_background.onUpdate(_properties);
			_properties.MoraleCheckBravery[1] -= 20;
		}
	}

});

