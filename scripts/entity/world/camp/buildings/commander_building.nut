this.commander_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {},
    function create()
    {
        this.camp_building.create();
        this.m.ID = "camp.commander";
        this.m.Slot = "commander";
        this.m.Name = "Commanders Tent";
        this.m.Description = "Assign company members to different tasks while encamped"
		this.m.UIImage = "ui/settlements/building_06";
		this.m.UIImageNight = "ui/settlements/building_06";
    }

	function onClicked( _campScreen )
	{
        _campScreen.showCommanderDialog();
        this.camp_building.onClicked(_campScreen);
	}

});