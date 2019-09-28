::mods_hookBaseClass("factions/faction_action", function(o) {
	while(!("IsRunOnNewCampaign" in o.m)) o = o[o.SuperName]; // find the base class
    if(!("_mod_legend" in o))
    {
        o._mod_legend <- true;// only override the methods once per base instance
    }
	o.m.DifficultyMult <- 1.0;

	o.getDifficultyMult <- function()
	{
		return this.m.DifficultyMult;
	}

});