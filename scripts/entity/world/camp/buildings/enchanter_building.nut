this.enchanter_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Enchanter;
        this.m.Slot = "enchanter";
        this.m.Name = "Enchanter";
        this.m.Description = "Oooo.. Pretty glowing things..."
		this.m.UIImage = "ui/settlements/vala_day_empty";
		this.m.UIImageNight = "ui/settlements/vala_night_empty";
		this.m.UIImageFull = "ui/settlements/vala_day_full";
		this.m.UIImageNightFull = "ui/settlements/vala_night_full";
    }

	function onClicked( _campScreen )
	{
        _campScreen.showEnchanterDialog();
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