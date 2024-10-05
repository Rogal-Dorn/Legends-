::mods_hookExactClass("skills/effects/riposte_effect", function(o) {
	
	o.getDescription = function()
	{
		return "This character is prepared to immediately counter-attack on any failed attempt to attack them in melee.";
	}
});