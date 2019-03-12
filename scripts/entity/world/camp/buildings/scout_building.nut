this.scout_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {},
    function create()
    {
        this.camp_building.create();
        this.m.ID = "camp.scout";
        this.m.Slot = "scout";
        this.m.Name = "Scouting";
        this.m.Description = "Send out a scouting party"
		this.m.UIImage = "ui/settlements/crowd_01";
		this.m.UIImageNight = "ui/settlements/crowd_01";
    }

	function onClicked( _campScreen )
	{
        _campScreen.showScoutDialog();
        this.camp_building.onClicked(_campScreen);
	}

});