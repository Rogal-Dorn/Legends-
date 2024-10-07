::mods_hookExactClass("skills/traits/tough_trait", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Excluded.extend([
			"trait.legend_light",
			"trait.legend_frail"
		]);
	}
});
