this.legend_frenemies <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.frenemies";
		this.m.Name = "Frenemies";
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
				text = this.getContainer().getActor().getActiveRelationshipsTraitText()
			}
		];
	}

});

