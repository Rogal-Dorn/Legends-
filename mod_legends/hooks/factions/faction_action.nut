::mods_hookBaseClass("factions/faction_action", function ( o )
{
	while("SuperName" in o) o=o[o.SuperName];

	o.m.DifficultyMult <- 1.0;

	o.getDifficultyMult <- function()
	{
		return this.m.DifficultyMult;
	}
});
