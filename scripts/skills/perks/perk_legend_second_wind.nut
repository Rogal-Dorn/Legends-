this.perk_legend_second_wind <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_second_wind";
		this.m.Name = this.Const.Strings.PerkName.LegendSecondWind;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSecondWind;
		this.m.Icon = "ui/perks/SecondWindPerk.png";
		this.m.IconDisabled = "ui/perks/SecondWindPerk_bw.png"
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		local maxHP = actor.getHitpointsMax();
		local percentHP = maxHP / 100;
		local currentHP = actor.getHitpoints();
		local ratio = currentHP / percentHP;
		if (ratio < 0.5)
		{
			actor.setFatigue(actor.getFatigueMax());
		}
	}

});
