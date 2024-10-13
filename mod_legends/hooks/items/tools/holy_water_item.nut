::mods_hookExactClass("items/tools/holy_water_item", function(o) {
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.ID = "weapon.holy_water";
	}
});