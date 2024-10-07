::mods_hookExactClass("skills/traits/weasel_trait", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Description = "This character is swift as a weasel. Unfortunately, they seem to only be able to call on this ability when running to save their own hide.";
		this.m.Excluded.extend([
			"trait.legend_hate_beasts",
			"trait.legend_hate_nobles",
			"trait.legend_aggressive",
			"trait.legend_ambitious",
			"trait.legend_natural"
		]);
	}
});
