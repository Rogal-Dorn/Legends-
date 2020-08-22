::mods_hookBaseClass("entity/tactical/enemies/ghoul", function(o) {
    while(!("ScaleStartTime" in o.m)) o = o[o.SuperName]; // find the base class
    if(!("_mod_legend" in o))
    {
        o._mod_legend <- true;// only override the methods once per base instance
    }


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
		e.getFlags().set("Devoured", false);
        if (e.getFlags().has("IsSummoned"))
        {
            return
        }
		local slime = e.getSprite("dirt");
		slime.setBrush("bust_slime");
		slime.Visible = true;
	}

});