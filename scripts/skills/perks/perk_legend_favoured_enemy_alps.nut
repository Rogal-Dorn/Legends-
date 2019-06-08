this.perk_legend_favoured_enemy_alps <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_favoured_enemy_alps";
		this.m.Name = this.Const.Strings.PerkName.LegendFavouredEnemyAlps;
		this.m.Description = this.Const.Strings.PerkDescription.LegendFavouredEnemyAlps;
		this.m.Icon = "ui/perks/favoured_alps_01.png";
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

		if (  _targetEntity.getType() == this.Const.EntityType.Alp ||  _targetEntity.getType() == this.Const.EntityType.AlpShadow )
		{
			_properties.MeleeSkill += 10;
			_properties.RangedSkill += 10;
		}
		
	}

	function onUpdate( _properties )
	{
		if (!("Entities" in this.Tactical))
		{
			return;
		}

		local targets = this.Tactical.Entities.getAllInstances();
		foreach (tar in targets)
		{
			foreach (t in tar)
			{
				if (t.getType() == this.Const.EntityType.Alp)
				{
					_properties.BraveryMult *= 1.5;
					return;
				}
			}
		}
	}
});

