this.legend_alignment_04 <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.alignment_04";
		this.m.Name = "Neutral Evil";
		this.m.Icon = "ui/traits/trait_alignment_04.png";
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
				text = this.getContainer().getActor().getName() + " gets into minor scuffles often and enjoys some petty thievery from time to time."
			}
		];
	}

});

