::mods_hookExactClass("skills/traits/fear_beasts_trait", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Description = "Some past event or particularly convincing story in this character\'s life has left them scared of what the monstrous beasts of the wild are capable of, making this character less reliable when facing beasts on the battlefield.";
		this.m.Excluded.extend([
			"trait.legend_aggressive",
			"trait.legend_pragmatic",
			"trait.legend_ambitious",
			"trait.legend_natural"
		]);
	}
});
