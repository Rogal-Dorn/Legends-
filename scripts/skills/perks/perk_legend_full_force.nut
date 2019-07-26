this.perk_legend_full_force <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_full_force";
		this.m.Name = this.Const.Strings.PerkName.FullForce;
		this.m.Description = this.Const.Strings.PerkDescription.FullForce;
		this.m.Icon = "ui/perks/fullforce_circle.png";
		this.m.IconDisabled = "ui/perks/fullforce_circle_bw.png"
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
			local actor = this.getContainer().getActor();
			local bodyArmor = actor.getArmor(this.Const.BodyPart.Body);
			_properties.DamageRegularMax += this.Math.floor(bodyArmor * 0.05);

	}

});
