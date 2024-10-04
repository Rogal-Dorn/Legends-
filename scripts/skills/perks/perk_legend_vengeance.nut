this.perk_legend_vengeance <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_vengeance";
		this.m.Name = this.Const.Strings.PerkName.LegendVengeance;
		this.m.Description = this.Const.Strings.PerkDescription.LegendVengeance;
		this.m.Icon = "ui/perks/vengeance_circle.png";
		this.m.IconDisabled = "ui/perks/vengeance_circle_bw.png"
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		local actor = this.getContainer().getActor();

		if (_attacker != null && !_attacker.isAlliedWith(actor) && !actor.getSkills().hasSkill("effect.legend_vengeance"))
		{
			actor.getSkills().add(this.new("scripts/skills/effects/legend_vengeance_effect"));
		}
	}

});

