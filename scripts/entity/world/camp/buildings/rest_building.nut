this.rest_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
	},
    function create()
    {
        this.camp_building.create();
        this.m.ID = "camp.rest";
    }

    function destroy()
    {
    }

    function init()
    {
    }
    
    function getResults()
    {
        // return [{
		// 		id = 10,
		// 		icon = "ui/icons/asset_supplies.png",
		// 		text = "You used [color=" + this.Const.UI.Color.NegativeEventValue + "]" + this.m.ToolsUsed + "[/color] units of tools and repaired [color=" + this.Const.UI.Color.PositiveEventValue + "]" + this.m.PointsRepaired + "[/color] points of armor."
		// 	}];
        return [];
    }


    function getModifiers()
    {
        local ret = 
        {
            Modifier = 1.0
            Consumption = 1.0
        }
		local roster = this.World.getPlayerRoster().getAll();
        foreach( bro in roster )
        {
            if (bro.getCampAssignment() != "camp.healing")
            {
                continue
            }

            //Bros assigned to the healing activity improve the heal rate for everyone
            ret.Modifier += this.Const.LegendMod.getHealingModifier(bro.getBackground().getID());
            local v = this.Math.maxf(0.50, ret.Consumption - this.Const.LegendMod.getMedsConsumptionModifier(bro.getBackground().getID()));
            ret.Consumption = v;
        }
        return ret;
    }

    function update ()
    {
        local modifiers = this.getModifiers();
        foreach( bro in roster )
        {
            local d = bro.getHitpointsMax() - bro.getHitpoints();
            if (d <= 0)
            {
                continue;
            }

            //Any bro that is resting heals quicker
            local heal = 1.0;
            if (bro.getCampAssignment() == this.m.ID)
            {
                heal = 2.0;
            }

            bro.setHitpoints(this.Math.minf(bro.getHitpointsMax(), bro.getHitpoints() + this.Const.World.Assets.HitpointsPerHour * heal * modifiers.Modifier));
        }
    }
});