this.legend_alignment_01 <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.alignment_01";
		this.m.Name = "Cruel";
		this.m.Icon = "ui/traits/trait_alignment_01.png";
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
				text = "It\'s obvious that " + this.getContainer().getActor().getName() + " doesn\'t care one bit for human life or dignity. Their twisted ways aren\'t an incidental part of the job, they seem to BE the job."
			}
		];
	}

});

