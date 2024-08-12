this.perk_trophy_hunter <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.trophy_hunter";
		this.m.Name = this.Const.Strings.PerkName.TrophyHunter;
		this.m.Description = this.Const.Strings.PerkDescription.TrophyHunter;
		this.m.Icon = "skills/passive_03.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		local kills = actor.getLifetimeStats().Kills;
		if (kills != null && kills > 0)
		{
			local bonus = this.Math.max(10, this.Math.floor(kills / 25));
			_properties.Bravery += bonus;
			_properties.Hitpoints += bonus;
		}
	}
});

