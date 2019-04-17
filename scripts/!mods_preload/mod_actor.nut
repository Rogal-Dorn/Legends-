::mods_hookBaseClass("entity/tactical/actor", function(o) {
    while(!("BloodSaturation" in o.m)) o = o[o.SuperName]; // find the base class
    if(!("_mod_legend" in o))
    {
        o._mod_legend <- true;// only override the methods once per base instance
        o.m.BloodSaturation = 1.5;
        o.m.DeathBloodAmount = 1.5;
        o.m.BloodPoolScale = 1.25;
    }
    local fn = o.onMovementFinish;
    o.onMovementFinish = function (_tile)
    {
        fn(_tile);
        this.m.Skills.MovementCompleted();
    }

    o.isArmedWithMagicStaff <- function()
	{
		local item = this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand);
		return item != null && item.isItemType(this.Const.Items.ItemType.MagicStaff);
	}

	o.onSerialize = function ( _out )
	{
		this.entity.onSerialize(_out);
		this.m.BaseProperties.onSerialize(_out);
		this.m.Skills.onSerialize(_out);
		this.m.Items.onSerialize(_out);
		_out.writeString(this.m.Name);
		_out.writeString(this.m.Title);
		_out.writeF32(this.getHitpointsPct());
		_out.writeI32(this.m.XP);
	}

	o.onDeserialize = function ( _in )
	{
		this.entity.onDeserialize(_in);
		this.m.BaseProperties.onDeserialize(_in);

		if (_in.getMetaData().getVersion() >= 55)
		{
            this.m.Skills.onDeserialize(_in);
            this.m.Items.onDeserialize(_in);
		} 
        else 
        {
            this.m.Items.onDeserialize(_in);
            this.m.Skills.onDeserialize(_in);
        }
		this.m.Name = _in.readString();
		this.m.Title = _in.readString();
		this.setHitpointsPct(this.Math.maxf(0.0, _in.readF32()));
		this.m.XP = _in.readI32();
	}
        //
    // local onResurrected = o.onResurrected;
    // o.onResurrected = function ( _info ) 
    // {
    //     onResurrected(_info);
    //     this.World.getPlayerRoster().add(_info);
    // }
    // local onInit = o.onInit;
    // o.onInit = function ()
    // {
    //     o.onInit();
    //     o.m.BloodSaturation = 1.5;
    //     o.m.DeathBloodAmount = 1.5;
    //     o.m.BloodPoolScale = 1.25;
    //     o.m.BloodSplatterOffset = this.createVec(-1, -1);
    // }
    // }
});