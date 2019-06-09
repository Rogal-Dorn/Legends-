this.legend_hunting_big_game <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "effects.legend_hunting_big_game";
		this.m.Name = "Hunting big game";
		this.m.Icon = "ui/perks/BigGameHunterPerk.png";
		this.m.IconMini = "mini_big_game_hunter";
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
		if (_targetEntity == null)
		{
			return
		}
	
		local actor = this.getContainer().getActor();
		local targetHP = _targetEntity.getHitpoints()
		local ourHP =  actor.getHitpoints();
		local HPratio = targetHP / ourHP;

		if ( HPratio > 1 )
		{
			_properties.DamageRegularMult += HPratio; 
		}
	}

});
