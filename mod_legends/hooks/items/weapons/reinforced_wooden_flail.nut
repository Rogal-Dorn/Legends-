::mods_hookExactClass("items/weapons/reinforced_wooden_flail", function(o) {
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded | this.Const.Items.ItemType.Cultist;
	}
});
