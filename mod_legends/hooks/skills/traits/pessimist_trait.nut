::mods_hookExactClass("skills/traits/pessimist_trait", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Excluded.extend(
		[
			"trait.legend_aggressive",
			"trait.legend_pragmatic",
			"trait.legend_ambitious",
			"trait.legend_unpredictable",
			"trait.legend_natural",
			"trait.legend_gift_of_people"
		]);
	}
});
