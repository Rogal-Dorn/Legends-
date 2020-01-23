this.legend_alignment_00 <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.alignment_00";
		this.m.Name = "Dreaded";
		this.m.Icon = "ui/traits/trait_alignment_00.png";
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
				text = this.getContainer().getActor().getName() + " is a horrific sadist, known far and wide for spreading pain, suffering and death – as much as they can, whenever they can."
			}
		];
	}

});

