this.legend_holding_the_line <- this.inherit("scripts/skills/effects/legend_commander_abstract_effect", {
	m = {
	},
	function create()
	{
		this.m.ID = "effects.legend_holding_the_line";
		this.m.Name = "Holding the line";
		this.m.Description = "You can hold! An inspirational leader has encouraged this character to defend.";
		this.m.Icon = "ui/perks/holdtheline_circle.png";
		this.m.IconMini = "mini_holdtheline_circle";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
		local ret = this.skill.getTooltip();
		ret.push({
			id = 10,
			type = "text",
			icon = "ui/icons/melee_defense.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+" + 10 + "[/color] Melee Defense"
		});
		return ret;
	}

	function onUpdate( _properties )
	{
		_properties.MeleeDefense += 10;
	}
});
