this.fear_greenskins_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.fear_greenskins";
		this.m.Name = "Fear of Greenskins";
		this.m.Icon = "ui/traits/trait_icon_49.png";
		this.m.Description = "Some past event or particularly convincing story in this character\'s life has left them scared of what greenskins are capable of, making this character less reliable when facing greenskins on the battlefield.";
		this.m.Excluded = [
			"trait.fearless",
			"trait.brave",
			"trait.determined",
			"trait.cocky",
			"trait.bloodthirsty",
			"trait.hate_greenskins",
			"trait.aggressive",
			"trait.pragmatic",
			"trait.ambitious",
			"trait.natural"
		];
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
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-10[/color] Resolve when in battle with greenskins"
			}
		];
	}

	function onUpdate( _properties )
	{
		if (!this.getContainer().getActor().isPlacedOnMap())
		{
			return;
		}

		if (this.Tactical.Entities.getInstancesNum(this.World.FactionManager.getFactionOfType(this.Const.FactionType.Orcs).getID()) != 0 || this.Tactical.Entities.getInstancesNum(this.World.FactionManager.getFactionOfType(this.Const.FactionType.Goblins).getID()) != 0)
		{
			_properties.Bravery -= 10;
		}
	}

});

