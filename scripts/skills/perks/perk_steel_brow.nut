this.perk_steel_brow <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.steel_brow";
		this.m.Name = this.Const.Strings.PerkName.SteelBrow;
		this.m.Description = this.Const.Strings.PerkDescription.SteelBrow;
		this.m.Icon = "ui/perks/perk_09.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

			//if (effect) -> remove and replace with diff. effect
	function onUpdate( _entity ) //Should be onupdate? Not all stuns will proc with ondamagedrecieved
	{
		local actor = this.getContainer().getActor();

		if ("effects.stunned")
		{
			_entity.getSkills().removeByID("effects.stunned");
			_entity.getSkills().add("effects.dazed");
		}
	}

	// function onUpdate( _properties )
	// {
	// 	local currentPercent = this.getContainer().getActor().getHitpointsPct();
	// 	if (currentPercent < 0.66)
	// 	{
	// 		local bonus = this.Math.floor(100 * (0.66 - currentPercent) / 2.0);
	// 		_properties.MeleeDefense += bonus;
	// 		_properties.RangedDefense += bonus;

	// 		if (currentPercent < 0.33)
	// 		{
	// 			_properties.IsAffectedByFreshInjuries = false;
	// 			_properties.IsAffectedByLosingHitpoints = false;
	// 		}
	// 	}
	// }


});

