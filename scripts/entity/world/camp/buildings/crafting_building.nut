this.crafting_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {},
    function create()
    {
        this.camp_building.create();
        this.m.ID = "camp.crafting";
        this.m.Slot = "crafting";
        this.m.Name = "Craft";
        this.m.Description = "Craft items"
		this.m.UIImage = "ui/settlements/building_13";
		this.m.UIImageNight = "ui/settlements/building_13";
    }

	function onClicked( _campScreen )
	{
	}
});