this.fletcher_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
		Base = 1.0,
		Items = [],
		AmmoAdded = 0
	},
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
		this.m.CanEnter = false;
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

    function init()
    {
		this.m.AmmoAdded = 0;
		this.m.Items = [];
    }

    function getModifiers()
    {
        local ret = 
        {
            Craft = 0.0,
            Assigned = 0,
            Modifiers = []
        }
		local roster = this.World.getPlayerRoster().getAll();
        foreach( bro in roster )
        {
            if (bro.getCampAssignment() != this.m.ID)
            {
                continue
            }

            local rm = (this.m.Base + this.m.Base * this.Const.LegendMod.getFletcherModifier(bro.getBackground().getID()))
            ret.Craft += rm
            ++ret.Assigned
			ret.Modifiers.push([rm, bro.getName(), bro.getBackground().getNameOnly()]);	
        }
        return ret;
    }

	function getResults()
    {
		local res = []
		local id = 50;
		if (this.m.AmmoAdded > 0)
		{
			res.push({
		 		id = id,
		 		icon = "ui/buttons/asset_ammo_up.png",
		 		text = "You created " + this.m.AmmoAdded + " units of ammo"
			})
			++id;
		}
        return res;
    }
	
	function getAssignedBros()
    {
        local mod = this.getModifiers();
        return mod.Assigned;
    }

    function completed()
    {
		local item = null
		if (this.World.Assets.getAmmo() >= this.World.Assets.getMaxAmmo())
		{
			return
		}

		local mod = this.getModifiers();
		local points = this.Math.floor(mod.Craft * this.m.Camp.getCampTimeHours());
		if (points == 0)
		{
			return;
		}

		this.m.AmmoAdded = this.Math.min(this.World.Assets.getMaxAmmo(), (this.Math.floor(points / 2.0)))
		this.World.Assets.addAmmo(this.m.AmmoAdded);
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