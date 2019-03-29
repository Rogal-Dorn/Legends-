this.scout_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
		Base = 0.1,
		Radius = 0,
		Rate = 0,
        Results = []
	},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Scout;
        this.m.Slot = "scout";
        this.m.Name = "Patrol";
        this.m.Description = "Send out a patrol to keep an eye on the surrounding terrain";
		this.m.BannerImage = "ui/buttons/banner_scout.png"
        this.m.UIImage = "ui/settlements/scout_day_empty";
		this.m.UIImageNight = "ui/settlements/scout_night_empty";
		this.m.UIImageFull = "ui/settlements/scout_day_full";
		this.m.UIImageNightFull = "ui/settlements/scout_night_full";
        this.m.CanEnter = false;
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
        this.m.Results = [];
    }


	function getResults()
    {
		local res = []
		local id = 110;
		foreach (b in this.m.Results)
		{
			res.push({
		 		id = id,
		 		icon = b.Icon,
		 		text = b.Text
			})
			++id;
		}
        return res;
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

    function completed()
    {
        local mod = this.getModifiers();
        if (mod.Assigned == 0)
        {
            return;
        }

        local r = this.Math.min(75, 10 * this.Math.pow(this.m.Camp.getCampTimeHours(), mod.Craft/2));
		
        if (this.Math.rand(1, 100) > r)
        {
            return;
        }

        local locations = [];
        foreach( s in this.World.EntityManager.getLocations() )
        {
            if (s.isAlliedWithPlayer())
            {
                continue;
            }

            if (s.getLoot().isEmpty())
            {
                continue;
            }

            local d = s.getTile().getDistanceTo(this.World.State.getPlayer().getTile()) - this.Math.rand(1, 10);

            if (d > 20)
            {
                continue;
            }

            locations.push(s);
        }

        if (locations.len() == 0)
        {
            return;
        }

        local location = locations[this.Math.rand(0, locations.len() - 1)];
        local f = this.World.FactionManager.getFaction(location.getFaction());
        local tracks = ""
        if (f.getType() == this.Const.FactionType.Orcs)
        {
            tracks = "Orc"
        }
        else if (f.getType() == this.Const.FactionType.Goblins)
        {
            tracks = "Goblin"
        }
        else if (f.getType() == this.Const.FactionType.Undead)
        {
            tracks = "Undead"
        }
        else
        {
            tracks = "Human"
        }

		local distance = location != null  ? this.World.State.getPlayer().getTile().getDistanceTo(location.getTile()) : 0;
		distance = this.Const.Strings.Distance[this.Math.min(this.Const.Strings.Distance.len() - 1, distance / 30.0 * (this.Const.Strings.Distance.len() - 1))];
        local direction = location != null ? this.Const.Strings.Direction8[this.World.State.getPlayer().getTile().getDirection8To(location.getTile())] : "";
        local bro = mod.Modifiers[this.Math.rand(0, mod.Modifiers.len() - 1)][1];

        this.m.Results.push({
            Icon = "ui/icons/vision.png",
            Text = "While on patrol " + bro + " came across some " + tracks + " tracks. The tracks lead off towards the " + direction + ". The age of the tracks indicate that the group must be " + distance + "."
        });

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