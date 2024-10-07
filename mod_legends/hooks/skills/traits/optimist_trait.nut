::mods_hookExactClass("skills/traits/optimist_trait", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Excluded.extend(
		[
			"trait.irrational",
			"trait.legend_double_tongued"
		]);
	}
});
