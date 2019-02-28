::mods_hookBaseClass("entity/tactical/enemies/zombie", function(o) {
    while(!("ResurrectWithScript" in o.m)) o = o[o.SuperName]; // find the base class
    if(!("_mod_legend" in o))
    {
        o._mod_legend <- true;// only override the methods once per base instance
    }
        //
    local onDeath = o.onDeath;
    o.onDeath = function ( _killer, _skill, _tile, _fatalityType )
    {
        this.getItems().dropAll(null, null, false);
        onDeath( _killer, _skill, _tile, _fatalityType);
        if (_tile == null)
        {
            return
        }
        local corpse = _tile.Properties.get("Corpse");
        if (corpse == null)
        {
            return
        }
        corpse.isHuman = 2;
        _tile.Properties.set("Corpse", corpse);
        _tile.Properties.set("IsSummons", true);
    }

});

::mods_hookBaseClass("entity/tactical/skeleton", function(o) {
    while(!("ResurrectWithScript" in o.m)) o = o[o.SuperName]; // find the base class
    if(!("_mod_legend" in o))
    {
        o._mod_legend <- true;// only override the methods once per base instance
        o.m.IsResurrectingOnFatality <- true;
    }

    local onDeath = o.onDeath;
    o.onDeath = function ( _killer, _skill, _tile, _fatalityType )
    {
        this.getItems().dropAll(null, null, false);
        onDeath( _killer, _skill, _tile, _fatalityType);
        if (_tile == null)
        {
            return
        }
        local corpse = _tile.Properties.get("Corpse");
        if (corpse == null)
        {
            return
        }
        corpse.IsResurrectable = this.m.IsResurrectingOnFatality && _fatalityType != this.Const.FatalityType.Decapitated;
        corpse.isHuman = 3;
        _tile.Properties.set("Corpse", corpse);
        _tile.Properties.set("IsSummons", true);
    }

});