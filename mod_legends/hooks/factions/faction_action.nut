::mods_hookExactClass("factions/faction_action", function(o) 
{
	o.m.DifficultyMult <- 1.0;
	
	o.getDifficultyMult <- function()
	{
		return this.m.DifficultyMult;
	}
});