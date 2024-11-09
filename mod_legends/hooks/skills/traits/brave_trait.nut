::mods_hookExactClass("skills/traits/brave_trait", function(o)
{
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Excluded = [
			"trait.weasel",
			"trait.insecure",
			"trait.craven",
			"trait.hesitant",
			"trait.dastard",
			"trait.fainthearted",
			"trait.fearless",
			"trait.paranoid",
			"trait.fear_beasts",
			"trait.fear_undead",
			"trait.fear_greenskins",
			"trait.legend_fear_nobles",
			"trait.legend_slack"
		];
	}
});
