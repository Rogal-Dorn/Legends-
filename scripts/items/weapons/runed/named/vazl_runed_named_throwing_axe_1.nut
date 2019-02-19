this.vazl_runed_named_throwing_axe_1 <- this.inherit("scripts/items/weapons/runed/vazl_runed_weapon", {
	m = {},
	function isAmountShown()
	{
		return true;
	}

	function getAmountString()
	{
		return this.m.Ammo + "/" + this.m.AmmoMax;
	}

	function create()
	{
		this.vazl_runed_weapon.create();
		this.m.Ammo = 5;
		this.m.AmmoMax = 5;
		this.m.ID = "weapon.vazl_runed_named_throwing_axe_1";
		this.m.Description = "Small axes to be thrown in an overhand motion towards a target. These ones are especially well-balanced and hardy enough to inflict serious damage to armor and shields from range.";
		this.m.Categories = "Throwing Weapon, One-Handed";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon | this.Const.Items.ItemType.Ammo | this.Const.Items.ItemType.Defensive;
		this.m.AddGenericSkill = true;
		this.m.ShowArmamentIcon = true;
		this.m.IsDroppedAsLoot = true;
		this.m.Value = 800;
		this.m.RangeMin = 2;
		this.m.RangeMax = 4;
		this.m.RangeIdeal = 4;
		this.m.StaminaModifier = -4;
		this.m.RegularDamage = 25;
		this.m.RegularDamageMax = 40;
		this.m.ArmorDamageMult = 1.1;
		this.m.DirectDamageMult = 0.25;
		this.m.ShieldDamage = 0;
		this.m.ChanceToHitHead = 5;
		this.m.IconLarge = "weapons/melee/throwing_axes_01_named_01.png";
		this.m.Icon = "weapons/melee/throwing_axes_01_named_01_70x70.png";
		this.m.ArmamentIcon = "icon_named_throwing_axes_01";
	}


	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/throw_axe"));
	}

	function setAmmo( _a )
	{
		this.weapon.setAmmo(_a);

		if (this.m.Ammo > 0)
		{
			this.m.IconLarge = "weapons/melee/throwing_axes_01_named_01.png";
			this.m.Icon = "weapons/melee/throwing_axes_01_named_01_70x70.png";
			this.m.ArmamentIcon = "icon_named_throwing_axes_01";
			this.m.ShowArmamentIcon = true;
		}
		else
		{
			this.m.IconLarge = "weapons/ranged/throwing_axes_01_bag.png";
			this.m.Icon = "weapons/ranged/throwing_axes_01_bag_70x70.png";
			this.m.ArmamentIcon = "icon_named_throwing_axes_01";
			this.m.ShowArmamentIcon = false;
		}
	}

});
