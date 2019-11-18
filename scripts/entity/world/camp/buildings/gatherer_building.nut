this.gatherer_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
		Items = [],
		MedsAdded = 0,
		NumBros = 0,
		Craft = 0
	},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Gatherer;
		this.m.ModName = "Gathering";
		this.m.BaseCraft = 1.0;
        this.m.Slot = "gather";
        this.m.Name = "Gatherer";
        this.m.Description = "Forgage for herbs and medicine";
		this.m.BannerImage = "ui/buttons/banner_gather.png";
        this.m.CanEnter = false
    }

	function getTitle()
	{
		if (this.getUpgraded())
		{
			return this.m.Name + " *Upgraded*"
		} 
		return this.m.Name +  " *Not Upgraded*"
	}

	function getDescription()
	{
		local desc = "";
		desc += "Cuts, scrapes, bruises, missing limbs and other body parts - all part of the job. "
		desc += "Make sure you always have enough medicines on hand to keep the company patched up and in fighting condition. "
		desc += "Brothers assigned to this task will go out and forage for herbs and plants of medicinal quality. The more people assigned, the more medicine gathered. "
		desc += "\n\n"
		desc += "The Gathering tent can be upgraded by purchasing a crafting cart from a settlement merchant. An upgraded tent has a 15% increase in gathering speed. "
		desc += "Additionally, there's a chance that some more potent and useful medicines will be discovered."
		return desc;
	}

	function getModifierToolip()
    {
		local mod = this.getModifiers();
		local ret = [			
			{
				id = 5,
				type = "text",
				icon = "ui/buttons/asset_medicine_up.png",
				text = "Produces [color=" + this.Const.UI.Color.PositiveValue + "]" + mod.Craft / 3.0 + "[/color] units of medicine per hour."
			}
		];
		local id = 6;
		foreach (bro in mod.Modifiers)
		{
			ret.push({
				id = id,
				type = "hint",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + bro[0] / 3.0 + "[/color] units/hour " + bro[1] + " (" + bro[2] + ")"
			})
			++id;
		}
		return ret;
	}


	function isHidden()
	{
		return !this.World.Tags.get("HasLegendCampGathering")
	}	

	function getUpgraded()
	{
        return this.Stash.hasItem("tent.gather_tent");
	}

	function getLevel()
	{
		local pro = "dude";
		if (this.getUpgraded())
		{
			pro = "tent";
		}

		local sub = "empty";
		
		if (this.getAssignedBros() > 0) {
			sub =  "full";
		}
		return pro + "_" + sub;
	}

    function init()
    {
		this.m.MedsAdded = 0;
		this.m.Items = [];
		local mod = this.getModifiers();
        this.m.NumBros = mod.Assigned;
		this.m.Craft = mod.Craft;
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
		 		text = "You gathered " + this.Math.floor(this.m.MedsAdded) + " units of medicine"
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

	function update()
	{
		if (this.m.NumBros == 0)
		{
			return null
		}

		if (this.World.Assets.getMedicine() + this.m.MedsAdded >= this.World.Assets.getMaxMedicine())
		{
			return "Gathered ... " + this.Math.floor(this.m.MedsAdded) + " meds";
		}

		local points = this.Math.floor(this.m.Craft * this.m.Camp.getElapsedHours());
		this.m.MedsAdded = this.Math.min(this.World.Assets.getMaxMedicine(), (points / 3.0));
		return "Gathered ... " + this.Math.floor(this.m.MedsAdded) + " meds";
	}

	function getApocatheryLevel()
	{
	local roster = this.World.getPlayerRoster().getAll();
	local apocatheryLevel = 0;
        foreach( bro in roster )
        {
            if (bro.getCampAssignment() != this.m.ID)
            {
                continue
            }

			if (bro.getBackground().getID() == "background.legend_apocathery" || bro.getBackground().getID() == "background.legend_vala_background" || bro.getBackground().getID() == "background.legend_vala"  || bro.getBackground().getID() == "background.legend_vala_commander")
			{
              	local apocatheryLevel += bro.getLevel()
            }
			
		
			if (bro.getBackground().getSkills().hasskill("perk.legend_gatherer")
			{
               local apocatheryLevel += bro.getLevel()
            }

			return apocatheryLevel;

        }

	}

	function getBrewerLevel()
	{
	local roster = this.World.getPlayerRoster().getAll();
	local brewerLevel = 0;
        foreach( bro in roster )
        {
            if (bro.getCampAssignment() != this.m.ID)
            {
                continue
            }

			if (bro.getBackground().getSkills().hasskill("perk.legend_potion_brewer")
			{
               local brewerLevel += bro.getLevel()
            }

			return brewerLevel;

        }

	}

    function completed()
    {
		local item = null
		if (this.m.MedsAdded > 0)
		{
			this.World.Assets.addMedicine(this.Math.floor(this.m.MedsAdded));
		}

		if (!this.getUpgraded())
		{
			return 
		}

		if (this.Stash.getNumberOfEmptySlots() == 0)
		{
			return
		}

		local secondary = [
			"scripts/items/misc/roots_and_berries_item",
			"scripts/items/misc/mysterious_herbs_item",
			"scripts/items/misc/medicine_small_item"
		];

		//check for apocatheries
		local apocatherylevels = this.getApocatheryLevel();
		local brewerlevels = this.getBrewerLevel();
		if (apocatherylevels => 1 && apocatherylevels < 10)
		{	
			local secondary = [
			"scripts/items/accessory/berserker_mushrooms_item",
			"scripts/items/accessory/legend_apocathery_mushrooms_item",
			"scripts/items/misc/antidote_item",
			"scripts/items/misc/poison_item",
			"scripts/items/misc/medicine_item",
			];
		}
		if (apocatherylevels => 10 && brewerlevels < 1)
		{	
			local secondary = [
			"scripts/items/misc/miracle_drug_item",
			"scripts/items/accessory/berserker_mushrooms_item",
			"scripts/items/accessory/legend_apocathery_mushrooms_item",
			"scripts/items/accessory/spider_poison_item",
			"scripts/items/misc/antidote_item",
			"scripts/items/misc/poison_item",
			"scripts/items/misc/medicine_item",
			"scripts/items/misc/happy_powder_item"
			];
		}

		if (apocatherylevels => 10 && brewerlevels => 1)
		{	
			local secondary = [
			"scripts/items/misc/miracle_drug_item",
			"scripts/items/accessory/berserker_mushrooms_item",
			"scripts/items/accessory/legend_apocathery_mushrooms_item",
			"scripts/items/accessory/spider_poison_item",
			"scripts/items/misc/antidote_item",
			"scripts/items/misc/poison_item",
			"scripts/items/misc/medicine_item",
			"scripts/items/misc/lionheart_potion_item",
			"scripts/items/misc/ironwill_potion_item",
			"scripts/items/misc/recovery_potion_item",
			"scripts/items/misc/cat_potion_item",
			"scripts/items/misc/happy_powder_item"
			];
		}

			if (apocatherylevels => 60 && brewerlevels => 20 )
		{	
			local secondary = [
			"scripts/items/misc/miracle_drug_item",
			"scripts/items/accessory/berserker_mushrooms_item",
			"scripts/items/accessory/legend_apocathery_mushrooms_item",
			"scripts/items/accessory/spider_poison_item",
			"scripts/items/misc/antidote_item",
			"scripts/items/misc/poison_item",
			"scripts/items/misc/medicine_item",
			"scripts/items/misc/lionheart_potion_item",
			"scripts/items/misc/ironwill_potion_item",
			"scripts/items/misc/recovery_potion_item",
			"scripts/items/misc/cat_potion_item",
			"scripts/items/misc/potion_of_oblivion_item",
			"scripts/items/misc/potion_of_knowledge_item",
			"scripts/items/misc/happy_powder_item"
			];
		}

		local secondarychance = 100 - apocatherylevels;
		if (this.Math.rand(1, secondarychance) <= this.m.Camp.getCampTimeHours())
		{
			local item = this.new(secondary[this.Math.rand(0, secondary.len()-1)]);
			this.m.Items.push(item);
			this.Stash.add(item);				
		}

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