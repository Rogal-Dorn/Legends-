::mods_hookExactClass("skills/traits/hesitant_trait", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Excluded.extend(
		[
			"trait.legend_light",
			"trait.legend_aggressive",
			"trait.legend_ambitious",
			"trait.legend_unpredictable",
			"trait.legend_natural"
		]);
	}
});
