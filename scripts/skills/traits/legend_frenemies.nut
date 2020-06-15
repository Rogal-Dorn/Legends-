this.legend_frenemies <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.frenemies";
		this.m.Name = "Relationships";
		this.m.Icon = "ui/traits/trait_relationships.png";
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

	function getBonus( _bro )
	{

	}

	function onUpdate( _properties )
	{

	if (this.getContainer().getActor().getPlaceInFormation())
		{
			local spot = this.getContainer().getActor().getPlaceInFormation();
			foreach ( b in this.World.getPlayerRoster().getAll() )
			{
				switch (b.getPlaceInFormation())
				{
					case spot - 1:
					case spot + 1:
					case spot + 7:
					case spot + 8:
					case spot - 6:
					case spot - 7:				
					this.getBonus( b )

					break;
				}
			}
		}
	}

});

