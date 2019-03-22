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
		this.m.UIImage = "ui/settlements/med_day_empty";
		this.m.UIImageNight =  "ui/settlements/med_night_empty";
		this.m.UIImageFull = "ui/settlements/med_day_full";
		this.m.UIImageNightFull =  "ui/settlements/med_night_full";
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