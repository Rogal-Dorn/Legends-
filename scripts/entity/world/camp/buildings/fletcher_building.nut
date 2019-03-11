this.fletcher_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {},
    function create()
    {
        this.camp_building.create();
        this.m.ID = "camp.fletcher";
        this.m.Slot = "fletcher";
        this.m.Name = "Fletcher";
        this.m.Description = "Make some ammo"
		this.m.UIImage = "ui/settlements/building_11";
		this.m.UIImageNight = "ui/settlements/building_11";
    }

	function onClicked( _campScreen )
	{
	}

});