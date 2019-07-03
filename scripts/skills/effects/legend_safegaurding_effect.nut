this.legend_safegaurding_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_safegaurding";
		this.m.Name = "Safegaurding";
		this.m.Description = "This character\'s gaurd is down while safegaurding";
		this.m.Icon = "ui/perks/safegaurd_circle.png";
		this.m.IconMini = "mini_safegaurd_circle";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}
	
	function onUpdate( _properties )
	{
		_properties.MeleeDefense -= 15;
		_properties.RangedDefense -= 15;
	}


	function onTurnStart()
	{
		this.removeSelf();
	}

});
