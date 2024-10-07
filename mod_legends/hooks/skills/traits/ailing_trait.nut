::mods_hookExactClass("skills/traits/ailing_trait", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Description = "This character has developed a substance addiction. If not provided with a regular supply, they may suffer symptoms of withdrawal.";
		this.m.Excluded = [
			"trait.tough",
			"trait.iron_jaw",
			"trait.survivor",
			"trait.strong",
			"trait.athletic",
			"trait.iron_lungs",
			"trait.lucky",
			"trait.clubfooted",
			"trait.legend_firm"
		];
	}
});
