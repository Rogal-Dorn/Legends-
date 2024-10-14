::mods_hookExactClass("items/weapons/throwing_spear", function(o) {
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Categories = "Throwing Weapon, Spear, One-Handed";
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon | this.Const.Items.ItemType.Ammo | this.Const.Items.ItemType.Defensive | this.Const.Items.ItemType.OneHanded;
		this.m.Value = 400;
		this.m.Ammo = 1;
		this.m.AmmoMax = 1;
		this.m.AmmoCost = 6;
	}

	o.getTooltip = function ()
	{
		local result = this.weapon.getTooltip();
		// result.push({
		// 	id = 4,
		// 	type = "text",
		// 	icon = "ui/icons/special.png",
		// 	text = "Is destroyed on use"
		// });
		return result;
	}

	o.isAmountShown <- function ()
	{
		return true;
	}

	o.getAmountString <- function ()
	{
		return this.m.Ammo + "/" + this.m.AmmoMax;
	}

	o.setAmmo <- function ( _a )
	{
		this.weapon.setAmmo(_a);

		if (this.m.Ammo > 0)
		{
			this.m.Name = "Throwing Spear";
			this.m.IconLarge = "weapons/ranged/throwing_spear_01.png";
			this.m.Icon = "weapons/ranged/throwing_spear_01_70x70.png";
			this.m.ShowArmamentIcon = true;
		}
		else
		{
			this.m.Name = "Throwing Spear (Used)";
			this.m.IconLarge = "weapons/ranged/javelins_01_bag.png";
			this.m.Icon = "weapons/ranged/javelins_01_bag_70x70.png";
			this.m.ShowArmamentIcon = false;
		}

		this.updateAppearance();
	}
});
