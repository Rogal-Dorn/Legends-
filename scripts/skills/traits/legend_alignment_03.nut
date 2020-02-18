this.legend_alignment_03 <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.alignment_03";
		this.m.Name = "Notorious";
		this.m.Icon = "ui/traits/trait_alignment_03.png";
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
				text =  this.getContainer().getActor().getName() + "\'s methods indicate that enacting viscious brutality as part of their day-to-day don\'t cause them any personal grief."
			}
		];
	}

});

