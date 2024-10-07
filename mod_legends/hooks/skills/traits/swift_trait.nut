::mods_hookExactClass("skills/traits/swift_trait", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Excluded.push("trait.legend_predictable");
	}
});
