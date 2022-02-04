this.legend_haunted_06_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.legend_haunted_06";
		this.m.Name = "Broken by spirit runes";
		this.m.Icon = "ui/traits/trait_haunted_06.png";
		this.m.Description = "This character is carrying the rune trapped spirits of six dead people. They have lost their mind and no longer fear death. ";
		this.m.Excluded = [
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
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+6[/color] Resolve"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/morale.png",
				text = "No morale check triggered upon allies dying"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/morale.png",
				text = "No morale check triggered upon losing hitpoints"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Is not affected by fresh injuries sustained during the current battle"
			}

		];
	}
	function onTurnEnd()
	{
		this.applyDamage();
	}	
	
	function onUpdate( _properties )
	{
		_properties.Bravery += 6;
		_properties.IsAffectedByDyingAllies = false;
		_properties.IsAffectedByLosingHitpoints = false;	
		_properties.IsAffectedByFreshInjuries = false;
	}


	function onUpdate( _properties )
	{
		_properties.IsAffectedByLosingHitpoints = false;
	}
});

