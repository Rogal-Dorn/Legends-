this.legend_deathly_spectre_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.legend_deathly_spectre";
		this.m.Name = "Deathly spectre";
		this.m.Icon = "ui/traits/trait_icon_43.png";
		this.m.Description = "The shadow of undeath follows this character, they will probably be resurrected after death";
		this.m.Titles = [
			"the Doomed",
			"the Forsaken",
			"the Dying"
		];
		this.m.Excluded = [
			"trait.bleeder",
			"trait.pessimist",
			"trait.deathwish",
			"trait.ailing"
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
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Has a [color=" + this.Const.UI.Color.PositiveValue + "]90%[/color] chance to be resurrected as undead when killed"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.SurviveWithInjuryChanceMult *= 2.72;
		_properties.SurvivesAsUndead = true;
	}

});

