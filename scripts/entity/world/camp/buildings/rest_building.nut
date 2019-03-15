this.rest_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
	},
    function create()
    {
        this.camp_building.create();
        this.m.ID = "camp.rest";
        this.m.Slot = "rest";
        this.m.Name = "Rest";
        this.m.Description = "Company personnel who have not been assigned a task will rest and relax here. Brothers who are relaxing will heal healthpoint twice as fast as others. The mood of anyone relaxing is sure to increase as well.";
		this.m.UIImageNight =  "ui/settlements/camp_fire_night";
		this.m.UIImage = "ui/settlements/camp_fire_day";
        this.m.CanEnter = false
    }


	function destroy()
	{
		this.ui_module.destroy();
	}

    function init()
    {
        local roster = this.World.getPlayerRoster().getAll();
        foreach( bro in roster )
        {
            bro.setCampHealing(0);
        }
    }

    function completed()
    {
        local roster = this.World.getPlayerRoster().getAll();

        if (this.m.Camp.getCampTimeHours() < 4)
        {
            return;
        }

        local mood = 1.0;
        if (this.m.Camp.getCampTimeHours() >= 8)
        {
            mood = 2.0;
        }

        foreach( b in roster )
        {
            if (b.getCampAssignment() != this.m.ID)
            {
                continue
            }

			if (b.getLastCampTime() == 0 || this.Time.getVirtualTimeF() - b.getLastCampTime() > this.World.getTime().SecondsPerDay)
			{
				b.improveMood(mood, "Was able to rest in camp");
                b.setLastCampTime(this.m.Camp.getLastCampTime());
			}
        }
    }
    
    function getResults()
    {
        local res = [];
        local roster = this.World.getPlayerRoster().getAll();
        foreach( b in roster )
        {
            if (b.getCampHealing() > 0)
            {
                res.push({
                    id = 11,
                    icon = "ui/icons/health.png",
                    text = b.getName() + " healed [color=" + this.Const.UI.Color.PositiveEventValue + "]" + b.getCampHealing() + "[/color] points."
                })
            }
            if (b.getLastCampTime() == this.m.Camp.getLastCampTime())
            {
                res.push({
                    id = 12,
                    icon =  this.Const.MoodStateIcon[b.getMoodState()],
                    text = b.getName() + this.Const.MoodStateEvent[b.getMoodState()]
                })
            }
        }
        return res;
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
        local roster = this.World.getPlayerRoster().getAll();
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

            local points =  this.Const.World.Assets.HitpointsPerHour * heal * modifiers.Modifier;
            bro.setCampHealing(bro.getCampHealing() + points);
            bro.setHitpoints(this.Math.minf(bro.getHitpointsMax(), bro.getHitpoints() + points));
        }
    }

	function onClicked( _campScreen )
	{
        _campScreen.showRestDialog();
        this.camp_building.onClicked(_campScreen);
	}

    
	function onSerialize( _out )
	{
		this.camp_building.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.camp_building.onDeserialize(_in);
	}
    
});