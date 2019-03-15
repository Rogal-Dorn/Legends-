this.fletcher_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {},
    function create()
    {
        this.camp_building.create();
        this.m.ID = "camp.fletcher";
        this.m.Slot = "fletcher";
        this.m.Name = "Fletcher";
        this.m.Description = "Make some ammo"
		this.m.UIImage = "ui/settlements/camp_fletcher_full_day";
		this.m.UIImageNight = "ui/settlements/camp_fletcher_full_night";
    }

	function onClicked( _campScreen )
	{
        _campScreen.showFletcherDialog();
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