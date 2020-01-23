this.legend_alignment_02 <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.alignment_02";
		this.m.Name = "Merciless";
		this.m.Icon = "ui/traits/trait_alignment_02.png";
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
				text = "A particularly callous person, " + this.getContainer().getActor().getName() + " doesn\'t let little things like \'fairness\' or \'ethics\' get in the way of their goals at all."
			}
		];
	}

});

