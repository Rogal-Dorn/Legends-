::mods_hookExactClass("skills/traits/superstitious_trait", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Description = "This character is exceptionally muscled and capable of impressive feats of strength";
		this.m.Excluded.extend([
			"trait.legend_light",
			"trait.legend_frail"
		]);
	}
});
