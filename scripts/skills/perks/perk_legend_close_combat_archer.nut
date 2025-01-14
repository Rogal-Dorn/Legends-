this.perk_legend_close_combat_archer <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		::Const.Perks.setup(this.m, ::Const.Perks.PerkDefs.LegendCloseCombatArcher);
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

		local rdef = this.getContainer().getActor().getCurrentProperties().getRangedDefense();
		local bonus = 1.0 + (rdef / 100);
		local negbonus = 1.0 - (rdef / 100);

		if (_skill.isRanged())
		{
			if( this.getContainer().getActor().getTile().getDistanceTo(_targetEntity.getTile()) <= 2)
			{
				_properties.DamageRegularMult *= bonus;
				_properties.DamageArmorMult *= bonus;
			}
			if( this.getContainer().getActor().getTile().getDistanceTo(_targetEntity.getTile()) >= 4)
			{
				_properties.DamageRegularMult *= negbonus;
				_properties.DamageArmorMult *= negbonus;
			}
		}
	}

});

