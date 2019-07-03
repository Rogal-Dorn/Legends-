this.perk_legend_matching_set <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_matching_set";
		this.m.Name = this.Const.Strings.PerkName.LegendMatchingSet;
		this.m.Description = this.Const.Strings.PerkDescription.LegendMatchingSet;
		this.m.Icon = "ui/perks/matching_set.png";
		this.m.IconDisabled = "ui/perks/matching_set_bw.png"
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		local actor = this.getContainer().getActor();
		local body = actor.getArmorMax(this.Const.BodyPart.Body);
		local head = actor.getArmorMax(this.Const.BodyPart.Head);
		local diff = this.Math.abs(body - head);
		local diffadj = diff / 10;
		local bonus = this.Math.max(1, (5 - diffadj));
		_properties.FatigueRecoveryRate += bonus;
	}

});

