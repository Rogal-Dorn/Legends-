this.legend_alignment_07 <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.alignment_07";
		this.m.Name = "Good";
		this.m.Icon = "ui/traits/trait_alignment_07.png";
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
				text = this.getContainer().getActor().getName() + " doesn\'t have a bad word to say about anyone, and no one else can think of one for them. "
			}
		];
	}

});

