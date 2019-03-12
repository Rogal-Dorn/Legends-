this.training_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {},
    function create()
    {
        this.camp_building.create();
        this.m.ID = "camp.training";
        this.m.Slot = "training";
        this.m.Name = "Training Grounds";
        this.m.Description = "Training"
		this.m.UIImage = "ui/settlements/building_07";
		this.m.UIImageNight = "ui/settlements/building_07";
    }

	function onClicked( _campScreen )
	{
        _campScreen.showTrainingDialog();
        this.camp_building.onClicked(_campScreen);
	}

});