this.workshop_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
	},
    function create()
    {
        this.camp_building.create();
        this.m.ID = "camp.workshop";
        this.m.Slot = "workshop";
        this.m.Name = "Workshop";
        this.m.Description = "Turn scrap into useable parts";
		this.m.UIImageNight =  "ui/settlements/camp_scrap_full_night";
		this.m.UIImage = "ui/settlements/camp_scrap_full_day";
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