::mods_hookExactClass("items/weapons/oriental/nomad_sling", function(o) {
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Categories = "Sling, Two-Handed";
	}
});
