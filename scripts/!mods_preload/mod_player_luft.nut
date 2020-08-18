::mods_hookBaseClass("entity/tactical/player", function(o) {
    while(!("LevelUps" in o.m)) o = o[o.SuperName]; // find the base class
    if(!("_mod_legend" in o))
    {
        o._mod_legend <- true;// only override the methods once per base instance
    }


	// local ifn = o.onInit
	// o.onInit = function ()
	// {
	// 	ifn();
	// 	// this.m.Skills.add(this.new("scripts/skills/active/legend_good_boy"));
	// }

});