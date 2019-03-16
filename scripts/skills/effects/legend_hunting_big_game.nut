this.legend_hunting_big_game <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_hunting_big_game";
		this.m.Name = "Hunting big game";
		this.m.Icon = "skills/vengeance_square.png";
		this.m.IconMini = "status_effect_01_mini";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = false;
	}

	function getDescription()
	{
		return "if an enemy has more health than you, deal damage equal to their hitpoints divided by your hitpoints";
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{

		local targetHP = _targetEntity.getHitpoints();
		local ourHP =  _user.getHitpoints();
		local HPratio = targetHP / ourHP;

		if ( HPratio > 1 )
			{
		_properties.DamageRegularMult += HPratio; 

			}
	}

});
