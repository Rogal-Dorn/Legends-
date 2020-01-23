this.legend_alignment_08 <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.alignment_08";
		this.m.Name = "Chivalrous";
		this.m.Icon = "ui/traits/trait_alignment_08.png";
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
				text = this.getContainer().getActor().getName() + " will always stand up to defend those without a voice. Doing \'the right thing\' comes naturally to them, and they find causing hurt to those who don\'t deserve it to be incredibly difficult to reconcile with their beliefs."
			}
		];
	}

});

