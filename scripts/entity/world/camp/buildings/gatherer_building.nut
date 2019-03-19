this.gatherer_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
	},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Gatherer;
        this.m.Slot = "gatherer";
        this.m.Name = "Gatherer";
        this.m.Description = "Forgage for herbs and medicine";
		this.m.UIImage = "ui/settlements/gatherer_day_empty";
		this.m.UIImageNight =  "ui/settlements/gatherer_night_empty";
		this.m.UIImageFull = "ui/settlements/gatherer_day_full";
		this.m.UIImageNightFull =  "ui/settlements/gatherer_night_full";
        this.m.CanEnter = false
    }

	function onClicked( _campScreen )
	{
        _campScreen.showGathererDialog();
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