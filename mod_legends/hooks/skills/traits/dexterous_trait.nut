::mods_hookExactClass("skills/traits/dexterous_trait", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Description = "A dexterous character has an easier time hitting an opponent in melee.";
		this.m.Excluded.push("trait.legend_predictable");
	}
});
