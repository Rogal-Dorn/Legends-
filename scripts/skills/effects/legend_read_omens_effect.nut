this.legend_read_omens_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_read_omens";
		this.m.Name = "Omens Foretold";
		this.m.Icon = "ui/perks/omens_circle.png"; //todo: iconmini
		this.m.IconMini = "omens_circle_mini";
		this.m.Overlay = "omens_circle";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character has had its future foretold and has a [color=" + this.Const.UI.Color.PositiveValue + "]10%[/color] chance to have any attacker require two successful attack rolls in order to hit";
	}

	function onUpdate( _properties )
	{		
		_properties.RerollDefenseChance += 10;
	}
});

