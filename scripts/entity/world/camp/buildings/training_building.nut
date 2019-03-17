this.training_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Training;
        this.m.Slot = "training";
        this.m.Name = "Training Grounds";
        this.m.Description = "Training"
		this.m.UIImage = "ui/settlements/camp_training_full_day";
		this.m.UIImageNight = "ui/settlements/camp_training_full_night";
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