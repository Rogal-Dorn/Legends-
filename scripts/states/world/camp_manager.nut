this.camp_manager <- {
	m = {
        IsCamping = false,
        LastHourUpdated = 0,
        Buildings = []
	},
    function create()
    {
        this.addBuilding(this.new("scripts/entity/world/camp/buildings/repair_building"));
    }

    function destroy()
    {
        foreach(b in this.m.Buildings)
        {
            b.destroy();
        }
        this.m.Buildings = [];
    }

    function init()
    {
        foreach(b in this.m.Buildings)
        {
            b.init();
        }
    }

    function update ( _worldState )
    {
		if (this.World.getTime().Hours == this.m.LastHourUpdated
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