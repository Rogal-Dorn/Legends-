this.repair_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
        BaseRepair = 100,
        ToolsUsed = 0,
        PointsRepaired = 0,
        Stash = null,
        Repairs = null,
        Capacity = 0
	},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Repair;
        this.m.Slot = "repair";
        this.m.Name = "Repair Tent";
        this.m.Description = "Manage the repair of company items"
		this.m.UIImage = "ui/settlements/blacksmith_day_empty_large";
		this.m.UIImageNight = "ui/icons/buildings/blacksmith_night_empty_large"; 
		this.m.UIImageFull = "ui/settlements/blacksmith_day_full_large";
		this.m.UIImageNightFull = "ui/icons/buildings/blacksmith_night_full_large";   
    }

    function destroy()
    {
    }

    function init()
    {
        this.m.ToolsUsed = 0;
        this.m.PointsRepaired = 0;
    }

    function onInit()
    {
        local items = this.getListOfItemsNeedingRepair()
        this.m.Stash = items.Stash;
        if (this.m.Repairs == null)
        {
            this.m.Repairs = items.Items;
        }
        else 
        {
            local repairs = [];
            foreach ( r in this.m.Repairs)
            {
                if (r == null)
                {
                    continue
                }
                repairs.push(r);
            }
            this.m.Repairs = repairs;
        }
        local capacity =  this.m.Repairs.len() + this.m.Stash.len();
        this.m.Capacity = capacity;
        while (this.m.Stash.len() < capacity)
        {
            this.m.Stash.push(null);
        }
        while (this.m.Repairs.len() < capacity)
        {
            this.m.Repairs.push(null);
        }
    }

    function getStash()
    {
        return this.m.Stash;
    }

    function getRepairs()
    {
        return this.m.Repairs;
    }

    function getCapacity()
    {
        return this.m.Capacity;
    }
    
    function getResults()
    {
        return [{
				id = 10,
				icon = "ui/icons/asset_supplies.png",
				text = "You used [color=" + this.Const.UI.Color.NegativeEventValue + "]" + this.m.ToolsUsed + "[/color] units of tools and repaired [color=" + this.Const.UI.Color.PositiveEventValue + "]" + this.m.PointsRepaired + "[/color] pieces of equipment."
			}];
    }

    function getModifiers()
    {
        local ret = 
        {
            Repair = this.m.BaseRepair,
            Consumption = 0.01
        }
		local roster = this.World.getPlayerRoster().getAll();
        foreach( bro in roster )
        {
            if (bro.getCampAssignment() != this.m.ID)
            {
                continue
            }

            ret.Repair += (this.m.BaseRepair + this.m.BaseRepair * this.Const.LegendMod.getRepairModifier(bro.getBackground().getID()))
            //local v = this.Math.maxf(0.50, ret.Consumption - this.Const.LegendMod.getToolConsumptionModifier(bro.getBackground().getID()));
            //ret.Consumption = v;
        }
        return ret;
    }

    function update ()
    {
        if (this.World.Assets.getArmorParts() == 0)
        {
            return
        }

        if (this.m.Repairs == null)
        {
            return
        }

        local modifiers = this.getModifiers();
        foreach (i, r in this.m.Repairs)
        {
            local needed = r.Item.getConditionMax() - r.Item.getCondition()
            if (modifiers.Repair < needed)
            {
                needed = modifiers.Repair;
            }
            r.Item.setCondition(r.Item.getCondition() + needed);
            modifiers.Repair -= needed;

            // if (r.Bro != null)
            // {
            //     bro.getSkills().update();
            // }

            if (this.World.Assets.isConsumingAssets())
            {
                local consumed = this.Math.maxf(0, this.World.Assets.getArmorParts() - needed * modifiers.Consumption);
                this.m.ToolsUsed += consumed;
                this.World.Assets.setArmorParts(consumed)
            }

            if (r.Item.getCondition() >= r.Item.getConditionMax())
            {
                this.m.PointsRepaired += 1
                this.swapItems("camp-screen-repair-dialog-module.shop", i, "camp-screen-repair-dialog-module.stash", null);
            }

            if (modifiers.Repair <= 0) 
            {
                break
            }

            if ( this.World.Assets.getArmorParts() == 0)
            {
                break;
            }
        }
    }

    function getListOfItemsNeedingRepair()
    {
        local items = [];
        local stash = [];
        local roster = this.World.getPlayerRoster().getAll()
        foreach( bro in roster)
        {
			local bitems = bro.getItems().getAllItems();
			foreach( item in bitems )
			{
                if (item == null)
                {
                    continue
                }

                if (item.getCondition() >= item.getConditionMax())
                {
                    continue;
                }

                if (item.isToBeRepaired())
                {
                    items.push({
                        Bro = bro.getID(),
                        Item = item
                    });
                }
                else 
                {
                    stash.push({
                        Bro = bro.getID(),
                        Item = item
                    });
                }
            }
        }
        local stashItems = this.Stash.getItems();
        foreach( item in stashItems)
        {
            if (item == null)
            {
                continue;
            }

            if (item.getCondition() >= item.getConditionMax())
            {
                continue
            }

            if (item.isToBeRepaired())
            {
                items.push({
                    Bro = null,
                    Item = item
                });
            }
            else 
            {
                stash.push({
                    Bro = null,
                    Item = item
                });
            }
        }
        return {Items = items, Stash = stash};
    }

	function swapItems( sourceItemOwner, sourceItemIdx, targetItemOwner, targetItemIdx )
	{
		if (targetItemOwner == null)
		{
			this.logError("onSwapItem #1");
			return false;
		}

        if (sourceItemOwner == targetItemOwner && sourceItemIdx == targetItemIdx)
        {
            return false
        }

        local sourceList = null;
        local targetList = null;
        local isRepair = false
		switch(sourceItemOwner)
		{
		case "camp-screen-repair-dialog-module.stash":
            sourceList = this.m.Stash
            if (sourceItemOwner == targetItemOwner)
            {
                targetList = this.m.Stash;
            }
            else 
            {
                targetList = this.m.Repairs;
                isRepair = true;
            }
            break;

		case "camp-screen-repair-dialog-module.shop":
            sourceList = this.m.Repairs
            if (sourceItemOwner == targetItemOwner)
            {
                targetList = this.m.Repairs;
                isRepair = true
            }
            else 
            {
                targetList = this.m.Stash;
            }
            break;
        }

        local sourceItem = sourceList[sourceItemIdx];

        if (sourceItem == null)
        {
            this.logError("onSwapItem(stash) #2");
            return false;
        }

        sourceItem.Item.setToBeRepaired(isRepair);
        //We've picked a spot to drop it
        if (targetItemIdx != null)
        {
            //Make sure array is big enough for target spot
            while (targetItemIdx > targetList.len() - 1)
            {
                targetList.push(null)
            }
            sourceList[sourceItemIdx] = targetList[targetItemIdx];
            targetList[targetItemIdx] = sourceItem;
            sourceItem.Item.playInventorySound(this.Const.Items.InventoryEventType.PlacedInBag)
            return true
        }

        //didn't pick a spot to drop, find the first null spot
        foreach (i,r in targetList)
        {
            if (r != null)
            {
                continue
            }
            targetList[i] = sourceItem;
            sourceList[sourceItemIdx] = null;
            sourceItem.Item.playInventorySound(this.Const.Items.InventoryEventType.PlacedInBag)
            return true
        }
        
        //No null spot, push to the end
        targetList.push(sourceItem);
        sourceList[sourceItemIdx] = null;
        sourceItem.Item.playInventorySound(this.Const.Items.InventoryEventType.PlacedInBag)
        return true
	}

	function onRepairInventoryItem( _data )
	{
        local item = this.Stash.getItemByInstanceID(_data).item;
        if (item == null)
        {
            return false;
        }
        this.onInit();
        local res = item.setToBeRepaired(!item.isToBeRepaired());
        
        local sourceItemOwner = "camp-screen-repair-dialog-module.shop";
        local targetItemOwner = "camp-screen-repair-dialog-module.stash";
        local sourceList = this.m.Repairs;
        //Came from stash
        if (item.isToBeRepaired())
        {
            sourceItemOwner = "camp-screen-repair-dialog-module.stash";
            targetItemOwner = "camp-screen-repair-dialog-module.shop"
            sourceList = this.m.Stash;
        }

        local sourceItemIdx = -1;
        foreach (i,slot in sourceList)
        {
            if (slot == null)
            {
                continue
            }
            if (slot.Item.getInstanceID() != _data)
            {
                continue
            }
            sourceItemIdx = i;
            this.swapItems( sourceItemOwner, sourceItemIdx, targetItemOwner, null )
            break;
        }

        return res;
	}

	function onClicked( _campScreen )
	{
        _campScreen.showRepairDialog();
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