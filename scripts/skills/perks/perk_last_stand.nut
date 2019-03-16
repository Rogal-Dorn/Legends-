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

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		local maxHP = this.getContainer().getActor().getHitpointsMax();
		local percentHP = maxHP / 100;
		local currentHP = this.getContainer().getActor().getHitpoints();
		local ratio = currentHP / percentHP;
		local ratioPoint = ratio / 100;
		local bonus = 2.0 - ratioPoint;
		_properties.MeleeDefenseMult *= bonus;
		_properties.RangedDefenseMult *= bonus;
	}

});
