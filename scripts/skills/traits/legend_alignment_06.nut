this.legend_alignment_06 <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.alignment_06";
		this.m.Name = "Kind";
		this.m.Icon = "ui/traits/trait_alignment_06.png";
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
				text = "It\'s rare to see " + this.getContainer().getActor().getName() + " without a smile on their face, or lending a helping hand to those that need one."
			}
		];
	}

});

