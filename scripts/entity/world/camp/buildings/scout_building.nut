this.scout_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Scout;
        this.m.Slot = "scout";
        this.m.Name = "Scouting";
        this.m.Description = "Send out a scouting party"
		this.m.UIImage = "ui/settlements/camp_scout_full_day";
		this.m.UIImageNight = "ui/settlements/camp_scout_full_night";
    }

	function onClicked( _campScreen )
	{
        _campScreen.showScoutDialog();
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