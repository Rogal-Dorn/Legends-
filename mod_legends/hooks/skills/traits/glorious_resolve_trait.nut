::mods_hookExactClass("skills/traits/glorious_resolve_trait", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Description = "Forged in the arenas of the south, this character has fought man and beast alike, and it takes a lot to break their resolve. This fabulous lifestyle demands high pay, but they\'ll never desert you  and can\'t be dismissed. If all three original members should die, your campaign ends.";
	}
});
