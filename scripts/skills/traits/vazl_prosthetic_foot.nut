this.vazl_prosthetic_foot <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.vazl_prosthetic_foot";
		this.m.Name = "Prosthetic Foot";
		this.m.Icon = "ui/traits/vazl_prosthetic_foot.png";
		this.m.Description = "Not quite as comfortable as your old healthy foot, but definitely better than your old maimed one.";
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
				text = this.getDescription()
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Builds up [color=" + this.Const.UI.Color.NegativeValue + "]3[/color] more fatigue for each tile travelled"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10%[/color] Initiative"
			}
		];
	}

	function onUpdate (_properties)
	{
		_properties.MovementFatigueCostAdditional += 3;
		_properties.InitiativeMult *= 0.9;
	}
});
