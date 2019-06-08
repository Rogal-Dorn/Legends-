this.perk_legend_favoured_enemy_ork <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_favoured_enemy_ork";
		this.m.Name = this.Const.Strings.PerkName.LegendFavouredEnemyOrk;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFavouredEnemyOrk;
		this.m.Icon = "ui/perks/favoured_ork_01.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity == null)
		{
			return;
		}
		
		local targetID = _targetEntity.getType()
		if ( targetID == this.Const.EntityType.OrcBerserker || targetID == this.Const.EntityType.OrcYoung || targetID == this.Const.EntityType.OrcWarrior || targetID == this.Const.EntityType.OrcWarlord || targetID == this.Const.EntityType.OrcBehemoth || targetID == this.Const.EntityType.OrcElite)
		{
			_properties.MeleeSkill += 10;
			_properties.RangedSkill += 10;
			_properties.DamageRegularMax *= 1.1;
		}
		
	}
});

