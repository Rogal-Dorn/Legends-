::mods_hookExactClass("skills/traits/determined_trait", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Excluded.extend(
		[
			"trait.legend_fear_nobles",
			"trait.legend_double_tongued"
		]);
	}
});
