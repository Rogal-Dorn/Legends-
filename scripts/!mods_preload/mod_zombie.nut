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

::mods_hookNewObject("entity/tactical/enemies/ghoul", function(o) {
	o.onAfterDeath = function ( _tile )
	{
		if (this.m.Size < 3)
		{
			return;
		}

		local skill = this.getSkills().getSkillByID("actives.swallow_whole");

		if (skill.getSwallowedEntity() == null)
		{
			return;
		}

		local e = skill.getSwallowedEntity();
		this.Tactical.addEntityToMap(e, _tile.Coords.X, _tile.Coords.Y);
		e.getTags().set("Devoured", false);
        if (e.getTags().has("IsSummoned"))
        {
            return
        }
		local slime = e.getSprite("dirt");
		slime.setBrush("bust_slime");
		slime.Visible = true;
	}

});