this.legend_dodging_incoming <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_dodging_incoming";
		this.m.Name = "Dodging incoming projectiles";
		this.m.Description = "Heads down! An inspirational leader has encouraged this character to defend.";
		this.m.Icon = "ui/perks/incoming_circle.png";
		this.m.IconMini = "mini_incoming_circle";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}
	


	function onUpdate( _properties )
	{
		_properties.RangedDefense += 10;
	}


	function onTurnEnd()
	{
		this.removeSelf();
	}

});
