::mods_hookExactClass("skills/traits/cocky_trait", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Description = "This character can be as dangerous to themself as to his opponent.";
		this.m.Excluded.extend([
			"trait.legend_fear_nobles",
			"trait.legend_pragmatic",
			"trait.legend_seductive"
		]);
	}
});
