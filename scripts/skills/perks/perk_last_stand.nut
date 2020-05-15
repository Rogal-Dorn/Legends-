this.perk_last_stand <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.last_stand";
		this.m.Name = this.Const.Strings.PerkName.LastStand;
		this.m.Description = this.Const.Strings.PerkDescription.LastStand;
		this.m.Icon = "ui/perks/laststand_circle.png";
		this.m.IconDisabled = "ui/perks/laststand_circle_bw.png"
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		local maxHP = this.getContainer().getActor().getHitpointsMax();
		local percentHP = maxHP / 100;
		local currentHP = this.getContainer().getActor().getHitpoints();
		local currentPercent = currentHP / percentHP;
		local missingPercent = (100 - currentPercent);
		local bonus = 0;
		
		if( missingPercent >= 34)
		{
			bonus = this.Math.floor(missingPercent - 34) / 2;
		}

		if( missingPercent >= 66)
		{
			_properties.IsAffectedByFreshInjuries = false;
			_properties.IsAffectedByLosingHitpoints = false;
		}
	

		_properties.MeleeDefense += bonus;
		_properties.RangedDefense += bonus;
	}

});

