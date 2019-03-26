this.gatherer_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
		Base = 1.0,
		Points = 0.0,
		Items = [],
		MedsAdded = 0
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

    function init()
    {
		this.m.Points = 0;
		this.m.MedsAdded = 0;
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

            local rm = (this.m.Base + this.m.Base * this.Const.LegendMod.getGatheringModifier(bro.getBackground().getID()))
            ret.Craft += rm
            ++ret.Assigned
			ret.Modifiers.push([rm, bro.getName(), bro.getBackground().getNameOnly()]);	
        }
        return ret;
    }

	function getResults()
    {
		local res = []
		local id = 60;
		if (this.m.MedsAdded > 0)
		{
			res.push({
		 		id = id,
		 		icon = "ui/buttons/asset_medicine_up.png",
		 		text = "You gathered " + this.m.MedsAdded + " units of medicine"
			})
			++id;
		}
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
		local item = null
		if (this.World.Assets.getMedicine() >= this.World.Assets.getMaxMedicine())
		{
			return
		}

		this.m.MedsAdded = this.Math.min(this.World.Assets.getMaxMedicine(), (this.Math.floor(this.m.Points / 2.0)))
		this.World.Assets.addMedicine(this.m.MedsAdded);

		if (this.Stash.getNumberOfEmptySlots() == 0)
		{
			return
		}

		local secondary = [
			"scripts/items/misc/miracle_drug_item",
			"scripts/items/misc/mysterious_herbs_item",
			"scripts/items/misc/happy_powder_item"
		];

		//this can be upgrade system
		if (this.Math.rand(1, 100) <= this.m.Camp.getCampTimeHours())
		{
			local item = this.new(secondary[this.Math.rand(0, secondary.len()-1)]);
			this.m.Items.push(item);
			this.Stash.add(item);				
		}

    }
    
	function update ()
    {
        local modifiers = this.getModifiers();
		this.m.Points += modifiers.Craft;
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