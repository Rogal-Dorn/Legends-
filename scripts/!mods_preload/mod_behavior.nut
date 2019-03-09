::mods_hookBaseClass("scripts/ai/tactical/behavior.nut", function(o) {
    while(!("IsShieldwallAvailable" in o.m)) o = o[o.SuperName]; // find the base class
    if(!("_mod_legend" in o))
    {
        o._mod_legend <- true;// only override the methods once per base instance
    }

    local fn = o.isRangedUnit;
    o.isRangedUnit = function( _entity)
	{
        if (_entity == null)
        {
            return false
        }
        if (!("hasRangedWeapon" in _entity))
        {
            return false
        }
        return fn(_entity)
	}
});