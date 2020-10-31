this.legend_peaceful_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.legend_peaceful";
		this.m.Name = "Peaceful";
		this.m.Icon = "ui/traits/trait_icon_38.png";
		this.m.Description = "This character is not fond of fighting, and will prefer to be in reserve. Consumes half rations while in reserve. Mood will occassionally improve while in reserve.";
		this.m.Titles = [
			"the Peaceful",
			"the Content",
			"the Calm"
		];
		this.m.Excluded = [
			"trait.bloodthirsty",
			"trait.deathwish",
			"trait.brute",
			"trait.hard_boiled",
			"trait.cocky",
			"trait.hate_greenskins",
			"trait.hate_undead",
			"trait.hate_beasts",
			"trait.hate_nobles"
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
				id = 16,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Is always content with being in reserve"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.IsContentWithBeingInReserve = true;
	}

});

