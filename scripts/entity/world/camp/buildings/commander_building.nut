this.commander_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {},
    function create()
    {
        this.camp_building.create();
        this.m.ID = "camp.commander";
        this.m.Slot = "commander";
        this.m.Name = "Commanders Tent";
        this.m.Description = "Assign company members to different tasks while encamped"
		this.m.UIImage = "ui/settlements/camp_commander_day";
		this.m.UIImageNight = "ui/settlements/camp_commander_night";
        this.m.InCommanderTent = false;
    }

	function onClicked( _campScreen )
	{
        _campScreen.showCommanderDialog();
        this.camp_building.onClicked(_campScreen);
	}

});