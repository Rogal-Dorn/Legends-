this.fletcher_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Fletcher;
        this.m.Slot = "fletcher";
        this.m.Name = "Fletcher";
        this.m.Description = "Make some ammo"
		this.m.UIImage = "ui/settlements/fletcher_day_empty";
		this.m.UIImageNight = "ui/settlements/fletcher_night_empty";
		this.m.UIImageFull = "ui/settlements/fletcher_day_full";
		this.m.UIImageNightFull = "ui/settlements/fletcher_night_full";
		this.m.Sounds = [
			{
				File = "ambience/camp/camp_fletcher_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_fletcher_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_fletcher_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_fletcher_04.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_fletcher_05.wav",
				Volume = 1.0,
				Pitch = 1.0
			}
		];
		this.m.SoundsAtNight = [];
    }

	function onClicked( _campScreen )
	{
        _campScreen.showFletcherDialog();
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