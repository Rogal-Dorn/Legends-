this.vazl_glass_eye <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.vazl_glass_eye";
		this.m.Name = "Glass Eye";
		this.m.Icon = "ui/traits/vazl_glass_eye.png";
		this.m.Description = "My, what pretty eyes! This one seems a bit off, however.";
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
				icon = "ui/icons/ranged_skill.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50%[/color] Ranged Skill"
			},
			{
				id = 11,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-2[/color] Vision"
			}
			{
				id = 12,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+7[/color] Resolve"
			}
		];
	}

	function onUpdate (_properties)
	{
		_properties.RangedSkillMult *= 0.5;
		_properties.Vision -= 2;
		_properties.Bravery += 7;
	}
});
