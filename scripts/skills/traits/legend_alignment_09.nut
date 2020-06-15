this.legend_alignment_09 <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.alignment_09";
		this.m.Name = "Saintly";
		this.m.Icon = "ui/traits/trait_alignment_09.png";
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
				text = "A morally faultless person. It feels like one day, priests will point to " + this.getContainer().getActor().getName() + " as an example of the best values and morals of humankind that are lacking in wider society – even among \'better\' folks. Their patience is enviable, the charitable depths of their pockets immense, and respect for others unwavering. "
			}
		];
	}

});

