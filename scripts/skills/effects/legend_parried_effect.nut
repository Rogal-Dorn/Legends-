this.legend_parried_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_parried";
		this.m.Name = "Parried";
		this.m.Description = "This character\'s guard is down after being parried";
		this.m.Icon = "ui/perks/parried_circle.png";
		this.m.IconMini = "mini_parried_circle";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}
	


	function onUpdate( _properties )
	{
		_properties.MeleeDefense -= 10;
		_properties.RangedDefense -= 10;
	}


	function onTurnEnd()
	{
		this.removeSelf();
	}

});
