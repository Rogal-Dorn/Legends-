this.perk_legend_favoured_enemy_hexen <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_favoured_enemy_hexen";
		this.m.Name = this.Const.Strings.PerkName.LegendFavouredEnemyHexen;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFavouredEnemyHexen;
		this.m.Icon = "ui/perks/favoured_ghoul_01.png";
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

		local targetID = _targetEntity.getType()

		if ( targetID == this.Const.EntityType.Hexen)
			{
		_properties.MeleeSkill += 10;
		_properties.RangedSkill += 10;
		
			}
		}
	}

	function onUpdate( _properties )
	{
		local targets = this.Tactical.Entities.getAllInstances();
		foreach (tar in targets)
			{
				foreach (t in tar)
				{
					if (t.getType() == this.Const.EntityType.Hexen)
					{
						_properties.BraveryMult *= 1.5;
					}
				}
			}
	}
});

