this.legend_pushing_forward <- this.inherit("scripts/skills/effects/legend_commander_abstract_effect", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_pushing_forward";
		this.m.Name = "Pushing Forward";
		this.m.Description = "Into the Breach! An inspirational leader is guiding this character/'s attacks.";
		this.m.Icon = "skills/spears_square.png";
		this.m.IconMini = "mini_spears_circle";
		this.m.Type = this.Const.SkillType.StatusEffect | this.Const.SkillType.Special;;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}
	
	function onUpdate( _properties )
	{
		_properties.MeleeSkill += 10;
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
		ret.push({
			id = 11,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] Melee Attack"
		});
		return ret;
	}

});
