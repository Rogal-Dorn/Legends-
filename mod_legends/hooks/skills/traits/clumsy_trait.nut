::mods_hookExactClass("skills/traits/clumsy_trait", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Description = "This character can be as dangerous to themself as to his opponent.";
		this.m.Excluded.push("trait.legend_aggressive");
	}
});
