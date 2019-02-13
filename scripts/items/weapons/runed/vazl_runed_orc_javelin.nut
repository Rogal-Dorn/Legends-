this.vazl_runed_orc_javelin <- this.inherit("scripts/items/weapons/runed/vazl_runed_weapon", {
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
		this.m.ID = "weapon.vazl_runed_orc_javelin";
		this.m.Name = "Bundle of Crude Javelins";
		this.m.Description = "A bunch of crudely made javelins intended for throwing at targets. Have limited range and are exhausting to throw, but may inflict devastating injuries. Can also inflict minor damage to shields if those are hit instead.";
		this.m.Categories = "Throwing Weapon, One-Handed";
		this.m.IconLarge = "weapons/ranged/orc_javelins.png";
		this.m.Icon = "weapons/ranged/orc_javelins_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon | this.Const.Items.ItemType.Ammo | this.Const.Items.ItemType.Defensive;
		this.m.EquipSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.AddGenericSkill = true;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_javelin_01";
		this.m.Value = 150;
		this.m.Ammo = 5;
		this.m.AmmoMax = 5;
		this.m.RangeMin = 1;
		this.m.RangeMax = 4;
		this.m.RangeIdeal = 4;
		this.m.StaminaModifier = -8;
		this.m.RegularDamage = 30;
		this.m.RegularDamageMax = 40;
		this.m.ArmorDamageMult = 0.7;
		this.m.DirectDamageMult = 0.45;
		this.m.ShieldDamage = 0;
		this.m.IsDroppedAsLoot = true;
	}

	function onEquip()
	{
		this.vazl_runed_weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/throw_javelin"));
	}

	function setAmmo( _a )
	{
		this.vazl_runed_weapon.setAmmo(_a);

		if (this.m.Ammo > 0)
		{
			this.m.ShowArmamentIcon = true;
		}
		else
		{
			this.m.ShowArmamentIcon = false;
		}

		this.updateAppearance();
	}

});
