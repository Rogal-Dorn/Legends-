::mods_hookExactClass("items/weapons/oriental/qatal_dagger", function(o) {
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Value = 750;
	}
});
