this.perk_full_force <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.full_force";
		this.m.Name = this.Const.Strings.PerkName.FullForce;
		this.m.Description = this.Const.Strings.PerkDescription.FullForce;
		this.m.Icon = "ui/perks/perk_18.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		if (this.getContainer().getActor().isArmedWithMeleeWeapon())
		{
			local bodyArmor = this.getContainer().getActor().getArmor(this.Const.BodyPart.Body);
			_properties.DamageRegularMax += this.Math.floor(bodyArmor * 0.1);
		}
	}

});
