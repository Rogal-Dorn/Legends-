this.hunter_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
		Base = 6.5,
		Items = []
	},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Hunter;
        this.m.Slot = "hunter";
        this.m.Name = "Hunting";
        this.m.Description = "Send out a hunting party for food provisions"
		this.m.BannerImage = "ui/buttons/banner_hunt.png"
		this.m.UIImage = "ui/settlements/hunter_day_empty";
		this.m.UIImageNight = "ui/settlements/hunter_night_empty";
		this.m.UIImageFull = "ui/settlements/hunter_day_full";
		this.m.UIImageNightFull = "ui/settlements/hunter_night_full";
		this.m.CanEnter = false
		this.m.Sounds = [
			{
				File = "ambience/camp/hunter_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/hunter_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			}
		];
		this.m.SoundsAtNight = [
		{
				File = "ambience/camp/hunter_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/hunter_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			}
		];
    }

    function init()
    {
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

            local rm = (this.m.Base + this.m.Base * this.Const.LegendMod.getHuntingModifier(bro.getBackground().getID()))
            ret.Craft += rm
            ++ret.Assigned
			ret.Modifiers.push([rm, bro.getName(), bro.getBackground().getNameOnly()]);	
        }
        return ret;
    }

	function getResults()
    {
		local res = []
		local id = 80;
		foreach (b in this.m.Items)
		{
			res.push({
		 		id = id,
		 		icon = "ui/items/" + b.getIcon(),
		 		text = "You gained " + b.getName()
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
		local mod = this.getModifiers();
		local points = this.Math.floor(mod.Craft * this.m.Camp.getCampTimeHours());
		this.logInfo("HUNTER " + mod.Craft + " : " + this.m.Camp.getCampTimeHours());		
		if (points == 0)
		{
			return;
		}


		local item = null
		while (points > 0)
		{
			if (this.Stash.getNumberOfEmptySlots() == 0)
			{
				return
			}

			local r = this.Math.rand(1, 4);
			local item = null;
			local secondary = [];
			if (r == 1 || r == 2)
			{
				item = this.new("scripts/items/supplies/strange_meat_item");
				secondary = [
					"scripts/items/misc/adrenaline_gland_item",
					"scripts/items/misc/poison_gland_item",
					"scripts/items/misc/spider_silk_item",
					"scripts/items/misc/werewolf_pelt_item",
					"scripts/items/accessory/spider_poison_item"
				];
			}
			else if (r == 3)
			{
				item = this.new("scripts/items/supplies/roots_and_berries_item");
				secondary = [
					"scripts/items/accessory/berserker_mushrooms_item"
				];
			}
			else if (r == 4)
			{
				item = this.new("scripts/items/supplies/cured_venison_item");
			}

			if (points < item.m.Value)
			{
				return
			}

			points -= item.m.Value;
			item.randomizeAmount();
			item.randomizeBestBefore();
			this.m.Items.push(item);
			this.Stash.add(item);

			if (secondary.len() == 0)
			{
				continue;
			}

			//this can be upgrade system
			if (this.Math.rand(1, 100) <= this.m.Camp.getCampTimeHours())
			{
				item = this.new(secondary[this.Math.rand(0, secondary.len()-1)]);
				this.m.Items.push(item);
				this.Stash.add(item);				
			}

		}

    }
    
	function onClicked( _campScreen )
	{
        _campScreen.showHunterDialog();
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