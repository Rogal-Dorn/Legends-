::mods_hookExactClass("skills/traits/paranoid_trait", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Excluded.extend(
		[
			"trait.legend_ambitious",
			"trait.legend_seductive",
			"trait.legend_natural"
		]);
	}
});
