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
		return "Having just received a blow, this character is determined to fight even harder! The next attack will inflict [color=" + this.Const.UI.Color.PositiveValue + "]+20%[/color] damage to a single target. If multiple targets are hit, only the first one will receive increased damage. If the attack misses, the effect is wasted.";
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
