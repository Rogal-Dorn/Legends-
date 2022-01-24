this.legend_holding_the_line <- this.inherit("scripts/skills/effects/legend_commander_abstract_effect", {
	m = {
	},
	function create()
	{
		this.m.ID = "effects.legend_holding_the_line";
		this.m.Name = "Holding the line";
		this.m.Description = "You WILL hold! An inspirational leader has encouraged this character to hold their ground.";
		this.m.Icon = "ui/perks/holdtheline_circle.png";
		this.m.IconMini = "mini_holdtheline_circle";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getTooltip()
	{
		local p = this.getContainer().getActor().getCurrentProperties();
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
				id = 3,
				type = "text",
				text = this.getCostString()
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "Receives only [color=" + this.Const.UI.Color.PositiveValue + "]90%[/color] of any damage."
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/locked_small.png",
				text = "Immune to being knocked back or grabbed."
			},
			{
				id = 6,
				type = "text",
				icon = "ui/icons/melee_defense.png",
				text =  "[color=" + this.Const.UI.Color.PositiveValue + "]+10[/color] melee defense to all allies within [color=" + this.Const.UI.Color.PositiveValue + "]4[/color] tiles for one turn."
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.MeleeDefense += 10;
		_properties.DamageReceivedTotalMult *= 0.9;
		_properties.IsImmuneToKnockBackAndGrab = true;
	}
});
