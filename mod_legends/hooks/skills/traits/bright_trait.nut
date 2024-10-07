::mods_hookExactClass("skills/traits/bright_trait", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Excluded.extend([
			"trait.legend_predictable"
		]);
	}
});
