this.perk_close_combat_archer <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.close_combat_archer";
		this.m.Name = this.Const.Strings.PerkName.CloseCombatArcher;
		this.m.Description = this.Const.Strings.PerkDescription.CloseCombatArcher;
		this.m.Icon = "ui/perks/perk_19.png";
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


		if (_skill.isRanged() && this.getContainer().getActor().getTile().getDistanceTo(_targetEntity.getTile()) <= 2)
		{
			_properties.DamageRegularMult *= 1.25;
			_properties.DamageArmorMult *= 1.25;
		}
	}

});

