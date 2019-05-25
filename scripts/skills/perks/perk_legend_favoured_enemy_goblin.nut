this.perk_legend_favoured_enemy_goblin <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_favoured_enemy_goblin";
		this.m.Name = this.Const.Strings.PerkName.LegendFavouredEnemyGoblin;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFavouredEnemyGoblin;
		this.m.Icon = "ui/perks/favoured_goblin_01.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
	if (_targetEntity != null)
		{
		local actor = this.getContainer().getActor();
		local targetID = _targetEntity.getType()


		if ( targetID == this.Const.EntityType.GoblinFighter || targetID == this.Const.EntityType.GoblinAmbusher || targetID == this.Const.EntityType.GoblinLeader || targetID == this.Const.EntityType.GoblinShaman || targetID == this.Const.EntityType.GoblinShaman || targetID == this.Const.EntityType.GoblinWolfrider)
			{
		_properties.MeleeSkill += 10;
		_properties.RangedSkill += 10;
		_properties.DamageRegularMax *= 1.1;
			}
		}
	}
});

