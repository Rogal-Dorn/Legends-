this.training_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Training;
        this.m.Slot = "training";
        this.m.Name = "Training Grounds";
        this.m.Description = "Training"
		this.m.UIImage = "ui/settlements/training_day_empty";
		this.m.UIImageNight = "ui/settlements/training_night_empty";
		this.m.UIImageFull = "ui/settlements/training_day_full";
		this.m.UIImageNightFull = "ui/settlements/training_night_full";
    }

	function onClicked( _campScreen )
	{
        _campScreen.showTrainingDialog();
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