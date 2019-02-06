this.vazl_prosthetic_hand <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.vazl_prosthetic_hand";
		this.m.Name = "Prosthetic Hand";
		this.m.Icon = "ui/traits/vazl_prosthetic_hand.png";
		this.m.Description = "Fancy! Good as new again. Almost.";
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
				icon = "ui/icons/melee_defense.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15%[/color] Melee Defense when using a shield"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/ranged_defense.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15%[/color] Ranged Defense when using a shield"
			},
			{
				id = 12,
				type = "text",
				icon = "ui/icons/melee_skill.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15%[/color] Melee Skill when NOT using a shield"
			},
			{
				id = 13,
				type = "text",
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-15%[/color] Ranged Skill when NOT using a shield"
			}
		];
	}

	function newhandShield()
	{
		local shield = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
		return shield != null && shield.isItemType(this.Const.Items.ItemType.Shield);
	}

	function onUpdate( _properties )
	{
		if (this.newhandShield())
		{
			_properties.MeleeDefenseMult *= 0.85;
			_properties.RangedDefenseMult *= 0.85;
		}
		if (!this.newhandShield())
		{
			_properties.MeleeSkillMult *= 0.85;
			_properties.RangedSkillMult *= 0.85;
		}
	}
});
