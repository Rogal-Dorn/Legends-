this.vazl_runed_three_headed_flail <- this.inherit("scripts/items/weapons/runed/vazl_runed_weapon", {
	m = {
		LastSkillUse = 0
	},
	function create()
	{
		this.vazl_runed_weapon.create();
		this.m.ID = "weapon.vazl_runed_three_headed_flail";
		this.m.Description = "An very rare weapon built from valuable and strong materials. Despite its ceremonial look it makes for a terrifying tool of destruction.";
		this.m.Categories = "Flail, One-Handed";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.ItemProperty = this.Const.Items.Property.IgnoresShieldwall;
		this.m.IsDoubleGrippable = true;
		this.m.IsAgainstShields = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.Value = 3200;
		this.m.ShieldDamage = 0;
		this.m.Condition = 60.0;
		this.m.ConditionMax = 60.0;
		this.m.StaminaModifier = -10;
		this.m.RegularDamage = 21;
		this.m.RegularDamageMax = 66;
		this.m.ArmorDamageMult = 1.0;
		this.m.DirectDamageMult = 0.3;
		this.m.ChanceToHitHead = 10;
	}

	function updateVariant()
	{
	}

	function onEquip()
	{
		this.vazl_runed_weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/cascade_skill"));
		this.addSkill(this.new("scripts/skills/actives/hail_skill"));
	}

	function onDamageDealt( _target, _skill, _hitInfo )
	{
		local actor = this.getContainer().getActor();

		if (actor == null || actor.isNull() || this.m.LastSkillUse == this.Const.SkillCounter)
		{
			return;
		}

		if (actor.isPlayerControlled() && _skill.getDirectDamage() < 1.0 && !_skill.isRanged() && this.m.ConditionMax > 1)
		{
			this.m.LastSkillUse = this.Const.SkillCounter;

			if (_target.getArmorMax(_hitInfo.BodyPart) >= 50 && _hitInfo.DamageInflictedArmor >= 5 || this.m.ConditionMax == 2)
			{
				this.lowerCondition();
			}
		}
	}

});
