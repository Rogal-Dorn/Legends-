::mods_hookExactClass("skills/traits/fainthearted_trait", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Excluded.extend([
			"trait.legend_hate_nobles",
			"trait.legend_aggressive",
			"trait.legend_pragmatic",
			"trait.legend_ambitious",
			"trait.legend_natural"
		]);
	}
});
