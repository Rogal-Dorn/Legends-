this.legend_safegaurded_effect <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_safegaurded";
		this.m.Name = "Safegaurded";
		this.m.Description = "This character is being safegaurded";
		this.m.Icon = "ui/perks/safegaurd_circle.png";
		this.m.IconMini = "mini_safegaurd_circle";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}
	


	function onUpdate( _properties )
	{
		_properties.MeleeDefense += 20;
		_properties.RangedDefense += 20;
	}


	function onTurnEnd()
	{
		this.removeSelf();
	}

});
