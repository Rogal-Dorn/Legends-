this.healer_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
	},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Healer;
        this.m.Slot = "healer";
        this.m.Name = "Healer";
        this.m.Description = "Heal wounds and speed up recovery";
		this.m.UIImageNight =  "ui/settlements/camp_med_full_night";
		this.m.UIImage = "ui/settlements/camp_med_full_day";
    }

	function onClicked( _campScreen )
	{
        _campScreen.showHealerDialog();
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