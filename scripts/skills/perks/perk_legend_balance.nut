this.perk_legend_balance <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_balance";
		this.m.Name = this.Const.Strings.PerkName.LegendBalance;
		this.m.Description = this.Const.Strings.PerkDescription.LegendBalance;
		this.m.Icon = "ui/perks/balance.png";
		this.m.IconDisabled = "ui/perks/balance_bw.png"
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		local body = actor.getArmorMax(this.Const.BodyPart.Body);
		local initiative = actor.getInitiative();
		local diff = this.Math.abs(body - initiative);
		local bonus = this.Math.max(5, (50 - diff));
		_properties.MeleeDefenseMult += bonus;
		_properties.RangedDefenseMult += bonus;
	}

});

