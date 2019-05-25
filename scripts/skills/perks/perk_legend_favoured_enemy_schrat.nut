this.perk_legend_favoured_enemy_schrat <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_favoured_enemy_schrat";
		this.m.Name = this.Const.Strings.PerkName.LegendFavouredEnemySchrat;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFavouredEnemySchrat;
		this.m.Icon = "ui/perks/favoured_schratt_01.png";
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


		if ( targetID == this.Const.EntityType.Schrat || targetID == this.Const.EntityType.SchratSmall )
			{
		_properties.MeleeSkill += 10;
		_properties.RangedSkill += 10;
		_properties.DamageRegularMax *= 1.1;
			}
		}
	}
});

