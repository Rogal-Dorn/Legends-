this.hunter_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Hunter;
        this.m.Slot = "hunter";
        this.m.Name = "Hunting";
        this.m.Description = "Send out a hunting party for food provisions"
		this.m.UIImage = "ui/settlements/camp_hunter_full_day";
		this.m.UIImageNight = "ui/settlements/camp_hunter_full_night";
    }

	function onClicked( _campScreen )
	{
        _campScreen.showHunterDialog();
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