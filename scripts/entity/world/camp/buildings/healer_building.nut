this.healer_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
	},
    function create()
    {
        this.camp_building.create();
        this.m.ID = "camp.healer";
        this.m.Slot = "healer";
        this.m.Name = "Healer";
        this.m.Description = "Heal wounds and speed up recovery";
		this.m.UIImageNight =  "ui/settlements/building_03";
		this.m.UIImage = "ui/settlements/building_03";
    }

	function onClicked( _campScreen )
	{
	}

});