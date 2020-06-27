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
		if (this.getContainer().getActor().getAlignment() != null)
        	this.m.Icon = "ui/traits/trait_alignment_0" + this.getContainer().getActor().getAlignment() + ".png";
    }

	function getTooltip()
	{
		local alignment = this.getContainer().getActor().getAlignment();
		local alignmin = this.getContainer().getActor().getAlignmentMin();
		local alignmax = this.getContainer().getActor().getAlignmentMax()
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
				text = "Alignment: " + this.Const.LegendMod.AlignmentNames[alignment] + " (" + alignment + ")" +
                "\nMinimum Happy Alignment: " + this.Const.LegendMod.AlignmentNames[alignmin] + " (" + alignmin + ")" +
                "\nMaximum Happy Alignment: " + this.Const.LegendMod.AlignmentNames[alignmax] + " (" + alignmax + ")"
			}
		];
	}

});

