this.enchanter_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Enchanter;
        this.m.Slot = "enchanter";
        this.m.Name = "Enchanter";
        this.m.Description = "Oooo.. Pretty glowing things..."
		this.m.UIImage = "ui/settlements/camp_vala_full_day";
		this.m.UIImageNight = "ui/settlements/camp_vala_full_night";
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