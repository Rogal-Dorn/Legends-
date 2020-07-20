::mods_hookBaseClass("ai/tactical/agent", function(o) {
	while(!("StrategyGenerator" in o.m)) o = o[o.SuperName]; // find the base class
    if(!("_mod_legend" in o))
    {
        o._mod_legend <- true;// only override the methods once per base instance
		o.m.PriorityTarget <- null;
    }

	o.setPriorityTarget <- function(_entity)
	{
		this.m.PriorityTarget = _entity;
	}

	o.getPriorityTarget <- function ()
	{
		return this.m.PriorityTarget;
	}


});