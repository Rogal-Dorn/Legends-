this.legend_alignment <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.alignment";
		this.m.Name = "Alignment Information";
		this.m.Icon = "ui/traits/trait_alignment_05.png";
	}

    function onUpdate( _properties  )
    {
        this.m.Icon = "ui/traits/trait_alignment_0" + this.getContainer().getActor().getAlignment() + ".png";
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
				text = this.getContainer().getActor().getName() + " has some flavor text that mwah didn't add"
			},
			{
				id = 3,
				type = "text",
				text = "Alignment: " + this.Const.LegendMod.AlignmentNames[this.getContainer().getActor().getAlignment()] +
                "\nMinimum Happy Alignment: " + this.Const.LegendMod.AlignmentNames[this.getContainer().getActor().getAlignmentMin()] + 
                "\nMaximum Happy Alignment: " + this.Const.LegendMod.AlignmentNames[this.getContainer().getActor().getAlignmentMax()]
			}
		];
	}

});

