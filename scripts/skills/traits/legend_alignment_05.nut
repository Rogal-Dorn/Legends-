this.legend_alignment_05 <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.alignment_05";
		this.m.Name = "Neutral Good";
		this.m.Icon = "ui/traits/trait_alignment_05.png";
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
				text = "A decent sort, " + this.getContainer().getActor().getName() + " can normally be trusted to do right by what wider society deems acceptable."
			}
		];
	}

});

