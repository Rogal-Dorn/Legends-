this.workshop_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
	},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Workshop;
        this.m.Slot = "workshop";
        this.m.Name = "Workshop";
        this.m.Description = "Turn scrap into useable parts";
		this.m.UIImage = "ui/settlements/scrap_day_empty";
		this.m.UIImageNight =  "ui/settlements/scrap_night_empty";
		this.m.UIImageFull = "ui/settlements/scrap_day_full";
		this.m.UIImageNightFull =  "ui/settlements/scrap_night_full";
        this.m.CanEnter = false
    }

	function onClicked( _campScreen )
	{
        _campScreen.showWorkshopDialog();
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