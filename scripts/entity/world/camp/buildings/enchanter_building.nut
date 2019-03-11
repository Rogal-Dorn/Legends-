this.enchanter_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {},
    function create()
    {
        this.camp_building.create();
        this.m.ID = "camp.enchanter";
        this.m.Slot = "enchanter";
        this.m.Name = "Enchanter";
        this.m.Description = "Oooo.. Pretty glowing things..."
		this.m.UIImage = "ui/settlements/building_13";
		this.m.UIImageNight = "ui/settlements/building_13";
    }

	function onClicked( _campScreen )
	{
	}

});