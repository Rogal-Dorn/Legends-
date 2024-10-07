::mods_hookExactClass("skills/traits/dastard_trait", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Description = "This character will turn tail on the first possible occasion. Better have an eye on them!";
		this.m.Excluded.extend([
			"trait.legend_hate_nobles",
			"trait.legend_aggressive",
			"trait.legend_pragmatic",
			"trait.legend_ambitions",
			"trait.legend_natural",
			"trait.legend_gift_of_people"
		]);
	}
});
