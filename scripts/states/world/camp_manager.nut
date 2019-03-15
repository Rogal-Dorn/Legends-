this.camp_manager <- {
	m = {
        IsCamping = false,
        LastHourUpdated = 0,
        StartTime = 0,
        LastCampTime = 0,
        Buildings = []
	},
    function create()
    {
        this.addBuilding(this.new("scripts/entity/world/camp/buildings/commander_building"));
        this.addBuilding(this.new("scripts/entity/world/camp/buildings/rest_building"));
        this.addBuilding(this.new("scripts/entity/world/camp/buildings/repair_building"));
        this.addBuilding(this.new("scripts/entity/world/camp/buildings/crafting_building"));
        this.addBuilding(this.new("scripts/entity/world/camp/buildings/enchanter_building"));          
        this.addBuilding(this.new("scripts/entity/world/camp/buildings/fletcher_building"));
        this.addBuilding(this.new("scripts/entity/world/camp/buildings/gatherer_building"));  
        this.addBuilding(this.new("scripts/entity/world/camp/buildings/healer_building"));
        this.addBuilding(this.new("scripts/entity/world/camp/buildings/hunter_building"));   
        this.addBuilding(this.new("scripts/entity/world/camp/buildings/scout_building"));
        this.addBuilding(this.new("scripts/entity/world/camp/buildings/training_building"));  
        this.addBuilding(this.new("scripts/entity/world/camp/buildings/workshop_building"));
        this.addBuilding(this.new("scripts/entity/world/camp/buildings/barber_building"));        
    }

    function destroy()
    {
        foreach(b in this.m.Buildings)
        {
            b.destroy();
        }
        this.m.Buildings = [];
    }

	function clear()
	{
		this.m.Buildings = [];
	}

    function init()
    {
        foreach(b in this.m.Buildings)
        {
            b.init();
        }
    }

    function completed()
    {
        foreach(b in this.m.Buildings)
        {
            b.completed();
        }
    }

    function getBuildingByID( _id )
    {
        foreach (b in this.m.Buildings)
        {
            if (b.getID() != _id)
            {
                continue
            }
            return b;
        }
        return null;
    }

	function isCamping()
	{
		return this.m.IsCamping;
	}

    function getElapsedTime()
    {
        return this.Time.getVirtualTimeF() - this.m.StartTime;
        // local h = this.Math.max(0, this.World.getTime().Days - this.m.StartDay - 1) * 24;
        // h += (24 - this.Math.abs(this.World.getTime().Hours - this.m.StartHour));
        // return h;
    }

    function getCampTime()
    {
        return this.m.LastCampTime - this.m.StartTime;
    }

    function getCampTimeHours()
    {
        return this.getCampTime() * this.World.getTime().SecondsPerDay * 24;
    }

    function getLastCampTime()
    {
        return this.m.LastCampTime;
    }

    function getResults()
    {
        local L = [];
        foreach(b in this.m.Buildings)
        {
            L.extend(b.getResults())
        }
        return L;
    }

    function getBuildings()
    {
        return this.m.Buildings;
    }

    function onCamp()
    {
		this.m.IsCamping = !this.m.IsCamping;
		this.World.State.getPlayer().setCamping(this.m.IsCamping);

        //Transition to Camping
        if (this.m.IsCamping)
        {
            this.m.LastHourUpdated = 0;
            this.m.StartTime = this.Time.getVirtualTimeF();
            this.init();
        }
         else 
        {
            this.m.LastCampTime = this.Time.getVirtualTimeF();
            this.completed();
            this.World.Events.fire("event.camp_completed");
        }
    }

    function update ( _worldState )
    {
		if (this.World.getTime().Hours == this.m.LastHourUpdated)
        {
            return;
        }

        this.m.LastHourUpdated = this.World.getTime().Hours;
        foreach(b in this.m.Buildings)
        {
            b.update();
        }

    }

	function addBuilding( _building, _slot = null )
	{
        _building.setCamp(this);
        this.m.Buildings.push(_building)
	}

    function onSerialize( _out )
	{
        _out.writeBool(this.m.IsCamping);
		_out.writeU8(this.m.LastHourUpdated);
        _out.writeF32(this.m.StartTime);
        _out.writeF32(this.m.LastCampTime);
        _out.writeU8(this.m.Buildings.len());
		foreach( building in this.m.Buildings )
		{
			if (building == null)
			{
				_out.writeU32(0);
			}
			else
			{
				_out.writeI32(building.ClassNameHash);
				building.onSerialize(_out);
			}
		}
		_out.writeBool(false);
	}

	function onDeserialize( _in )
	{
        this.m.IsCamping = _in.readBool();
		this.m.LastHourUpdated = _in.readU8();
        this.m.StartTime = _in.readF32();
        this.m.LastCampTime = _in.readF32();
		this.m.Buildings = [];
		local numBuildings = _in.readU8();
		for( local i = 0; i < numBuildings; i = ++i )
		{
			local id = _in.readU32();
			if (id != 0)
			{
                local b =  this.new(this.IO.scriptFilenameByHash(id));
                b.setCamp(this);
                b.onDeserialize(_in);
                this.m.Buildings.push(b);
			}
		} 
		_in.readBool();
	}

}