::mods_hookExactClass("items/weapons/named/named_throwing_axe", function(o) {

	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Variants = [1,2,3]
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() -1)];
		this.m.Categories = "Throwing Weapon, Axe, One-Handed";
		this.m.ArmorDamageMult = 1.3;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon | this.Const.Items.ItemType.Ammo | this.Const.Items.ItemType.Defensive | this.Const.Items.ItemType.OneHanded;
	}

	o.setAmmo = function ()
	{
		this.named_weapon.setAmmo(_a);
		this.updateVariant();
		this.updateAppearance();
	}
});
