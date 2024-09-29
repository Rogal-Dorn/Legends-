this.teamplayer_trait <- this.inherit("scripts/skills/traits/character_trait", {
	m = {},
	function create()
	{
		this.character_trait.create();
		this.m.ID = "trait.teamplayer";
		this.m.Name = "Team Player";
		this.m.Icon = "ui/traits/trait_icon_58.png";
		this.m.Description = "This character makes sure to always announce their intentions to his brothers-in-arms. In fact, they\'ll never shut the hell up. At least it reduces the chance of accidents happening.";
		this.m.Titles = [];
		this.m.Excluded = [
			"trait.cocky",
			"trait.bloodthirsty",
			"trait.drunkard",
			"trait.dumb",
			"trait.impatient",
			"trait.slack",
			"trait.double_tongued"
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
				icon = "ui/icons/special.png",
				text = "Has a [color=" + this.Const.UI.Color.PositiveValue + "]50%[/color] lower chance to inflict friendly fire"
			},
			{
				id = 10,
				type = "text",
				icon = "ui/icons/special.png",
				text = format("[color=%s]%s[/color], [color=%s]%s[/color] and [color=%s]%s[/color] skills have [color=%s]%s[/color] chance to hit when targeting an allied character"
					, this.Const.UI.Color.NegativeValue, "Knock Back"
					, this.Const.UI.Color.NegativeValue, "Repel"
					, this.Const.UI.Color.NegativeValue, "Hook"
					, this.Const.UI.Color.PositiveValue, "100%"
				)
			}
		];
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill.isAttack() && _targetEntity != null && _targetEntity.getID() != this.getContainer().getActor().getID() && _targetEntity.getFaction() == this.getContainer().getActor().getFaction())
		{
			_properties.MeleeSkillMult *= 0.5;
			_properties.RangedSkillMult *= 0.5;
		}
	}

});

