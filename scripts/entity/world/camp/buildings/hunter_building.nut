this.hunter_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {},
    function create()
    {
        this.camp_building.create();
        this.m.ID = "camp.hunter";
        this.m.Slot = "hunter";
        this.m.Name = "Hunting";
        this.m.Description = "Send out a hunting party for food provisions"
		this.m.UIImage = "ui/settlements/crowd_01";
		this.m.UIImageNight = "ui/settlements/crowd_01";
    }

	function onClicked( _campScreen )
	{
        _campScreen.showHunterDialog();
        this.camp_building.onClicked(_campScreen);
	}
});