::mods_hookExactClass("skills/perks/perk_stalwart", function(o) {
	local ws_create = o.create;
	o.create = function ()
	{
		ws_create();
		this.m.Icon = "skills/passive_03.png";
	}
});