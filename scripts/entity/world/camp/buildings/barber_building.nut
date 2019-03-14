this.barber_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {},
    function create()
    {
        this.camp_building.create();
        this.m.ID = "camp.barber";
        this.m.Slot = "barber";
        this.m.Name = "Barber";
        this.m.Description = "or Plastic surgeon.."
		this.m.UIImage = "ui/settlements/camp_barber_full_day";
		this.m.UIImageNight = "ui/settlements/camp_barber_full_night";
        this.m.InCommanderTent = false;
    }

	function onClicked( _campScreen )
	{
        _campScreen.showBarberDialog();
        this.camp_building.onClicked(_campScreen);
	}

});