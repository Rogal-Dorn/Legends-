this.scout_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
		Base = 0.1,
		Radius = 0,
		Rate = 0
	},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Scout;
        this.m.Slot = "scout";
        this.m.Name = "Patrol";
        this.m.Description = "Send out a patrol to keep an eye on the surrounding terrain";
		this.m.UIImage = "ui/settlements/scout_day_empty";
		this.m.UIImageNight = "ui/settlements/scout_night_empty";
		this.m.UIImageFull = "ui/settlements/scout_day_full";
		this.m.UIImageNightFull = "ui/settlements/scout_night_full";
    }

	function getVisionRadius()
	{
		return this.m.Radius;
	}

    function init()
    {
		this.m.Radius = 0;
		local mod = this.getModifiers()
		this.m.Rate = mod.Craft;
    }

    function getModifiers()
    {
        local ret = 
        {
            Craft = 0.0,
            Assigned = 0,
            Modifiers = []
        }
		local roster = this.World.getPlayerRoster().getAll();
        foreach( bro in roster )
        {
            if (bro.getCampAssignment() != this.m.ID)
            {
                continue
            }

            local rm = (this.m.Base + this.m.Base * this.Const.LegendMod.getScoutModifier(bro.getBackground().getID()))
            ret.Craft += rm
            ++ret.Assigned
			ret.Modifiers.push([rm, bro.getName(), bro.getBackground().getNameOnly()]);	
        }
        return ret;
    }

	function getAssignedBros()
    {
        local mod = this.getModifiers();
        return mod.Assigned;
    }

    
	function updateTick ( _hours )
    {
		this.m.Radius = this.Math.pow(this.m.Rate, 0.5) * 300.0 * this.Math.pow(_hours, 0.5 - (0.1 * this.m.Rate));
    }

	function onClicked( _campScreen )
	{
        _campScreen.showScoutDialog();
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