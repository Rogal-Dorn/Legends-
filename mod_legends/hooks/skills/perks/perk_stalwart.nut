::mods_hookExactClass("skills/perks/perk_stalwart", function(o) {
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Icon = "skills/passive_03.png";
	}
});
