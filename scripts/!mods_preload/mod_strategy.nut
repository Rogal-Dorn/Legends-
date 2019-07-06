::mods_hookNewObject("ai/tactical/strategy", function(o) {
    o.compileKnownOpponents = function ()
	{
		local instances = this.Tactical.Entities.getAllInstances();

		for( local f = 0; f != instances.len(); f = ++f )
		{
			if (this.Tactical.State.isScenarioMode())
			{
				if (this.Const.FactionAlliance[this.m.Faction].find(f) != null)
				{
					continue;
				}
			}
			else if (this.World.FactionManager.isAllied(this.m.Faction, f))
			{
				continue;
			}

			for( local p = 0; p != instances[f].len(); p = ++p )
			{
				if (instances[f][p].getTile().IsHidingEntity && !instances[f][p].isVisibleToEntity() && !instances[f][p].isHidden())
				{
                    continue;
				}

				this.onOpponentSighted(instances[f][p]);
				
			}
		}
	}

})