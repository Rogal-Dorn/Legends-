this.legend_satiated_effect <- this.inherit("scripts/skills/skill", {
	m = {
	},

	function create()
	{
		this.m.ID = "effects.legend_satiated_effect";
		this.m.Name = "Satiated";
		this.m.Icon = "ui/perks/food56.png";
		this.m.IconMini = "mini_food_circle";
		this.m.Overlay = "food_circle";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getDescription()
	{
		return "This character has eaten and drunken enough";
	}


	function onCombatFinished()
	{
		this.removeSelf();
	}
});

