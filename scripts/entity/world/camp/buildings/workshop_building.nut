this.workshop_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
        Conversion = 15.0,
        BaseSalvage = 50,
        ToolsCreated = 0,
        PointsSalvaged = 0,
		ItemsDestroyed = 0,
        Stash = null,
        Salvage = null,
        Capacity = 0
	},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Workshop;
        this.m.Slot = "workshop";
        this.m.Name = "Workshop";
        this.m.Description = "Turn scrap into useable parts";
        this.m.BannerImage = "ui/buttons/banner_scrap.png";
		this.m.UIImage = "ui/settlements/scrap_day_empty";
		this.m.UIImageNight =  "ui/settlements/scrap_night_empty";
		this.m.UIImageFull = "ui/settlements/scrap_day_full";
		this.m.UIImageNightFull =  "ui/settlements/scrap_night_full";
		this.m.Sounds = [
			{
				File = "ambience/camp/camp_scrap_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_scrap_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_scrap_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_scrap_04.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_scrap_05.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_scrap_06.wav",
				Volume = 1.0,
				Pitch = 1.0
			}
		];
		this.m.SoundsAtNight = [
					{
				File = "ambience/camp/camp_scrap_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_scrap_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_scrap_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_scrap_04.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_scrap_05.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_scrap_06.wav",
				Volume = 1.0,
				Pitch = 1.0
			}
		];
    }

    function init()
    {
        this.m.ToolsCreated = 0;
        this.m.PointsSalvaged = 0;
		this.m.ItemsDestroyed = 0;
    }

    function onInit()
    {
        local items = this.getListOfEquipment()
        this.m.Stash = items.Stash;
        if (this.m.Salvage == null)
        {
            this.m.Salvage = items.Items;
        }
        else 
        {
            local repairs = [];
            foreach ( r in this.m.Salvage)
            {
                if (r == null)
                {
                    continue;
                }

				if (!r.Item.isToBeSalvaged())
				{
					continue;
				}

                repairs.push(r);
            }
            this.m.Salvage = repairs;
        }
        local capacity =  this.m.Salvage.len() + this.m.Stash.len();
        this.m.Capacity = capacity;
        while (this.m.Stash.len() < capacity)
        {
            this.m.Stash.push(null);
        }
        while (this.m.Salvage.len() < capacity)
        {
            this.m.Salvage.push(null);
        }
    }

    function getConversionRate()
    {
        return this.m.Conversion;
    }

    function getStash()
    {
        return this.m.Stash;
    }

    function getRepairs()
    {
        return this.m.Salvage;
    }

    function getCapacity()
    {
        return this.m.Capacity;
    }
    
    function getResults()
    {
        if (this.m.ToolsCreated == 0) 
        {
            return [];
        }

        return [{
				id = 11,
				icon = "ui/icons/asset_supplies.png",
				text = "You created [color=" + this.Const.UI.Color.PositiveEventValue + "]" + this.Math.floor(this.m.ToolsCreated) + "[/color] units of tools and salvaged [color=" + this.Const.UI.Color.NegativeEventValue + "]" + this.m.ItemsDestroyed + "[/color] pieces of equipment."
			}];
    }

    function getModifiers()
    {
        local ret = 
        {
            Salvage = 0,
            Consumption = 1.0 / this.m.Conversion,
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

            local rm = (this.m.BaseSalvage + this.m.BaseSalvage * this.Const.LegendMod.getSalvageModifier(bro.getBackground().getID()))
            ret.Salvage += rm
            ++ret.Assigned
			ret.Modifiers.push([rm, bro.getName(), bro.getBackground().getNameOnly()]);	
            //local v = this.Math.maxf(0.50, ret.Consumption - this.Const.LegendMod.getToolConsumptionModifier(bro.getBackground().getID()));
            //ret.Consumption = v;
        }
        return ret;
    }

    function getRequiredSupplies()
    {
        local points = 0;
        foreach (i, r in this.m.Salvage)
        {
            if (r == null)
            {
                continue;
            }
            
            points += r.Item.getCondition()
        }
        local modifiers = this.getModifiers();
        return this.Math.ceil(points * modifiers.Consumption);
    }

    function getRequiredTime()
    {
        local points = 0;
        if (this.m.Salvage == null)
        {
            return 0;
        }
        
        foreach (i, r in this.m.Salvage)
        {
            if (r == null)
            {
                continue;
            }
            
            points += r.Item.getCondition()
        }
        local modifiers = this.getModifiers();
		if (modifiers.Salvage <= 0)
		{
			return 0;
		}
        return this.Math.ceil(points / modifiers.Salvage);
    }

    function getAssignedBros()
    {
        local mod = this.getModifiers();
        return mod.Assigned;
    }

	function getResourceImage()
	{
		return "ui/buttons/icon_time.png";
	}

	function getResourceCount()
	{
		return this.getRequiredTime();
	}

    function update ()
    {
        if (this.World.Assets.getArmorParts() >= this.World.Assets.getMaxArmorParts())
        {
            return
        }

        if (this.m.Salvage == null)
        {
            return
        }

        local modifiers = this.getModifiers();
        foreach (i, r in this.m.Salvage)
        {
            if (r == null)
            {
                continue;
            }

            if ( this.World.Assets.getArmorParts() >= this.World.Assets.getMaxArmorParts())
            {
                break;
            }

			if (modifiers.Salvage <= 0) 
            {
                break
            }


            local consumed = r.Item.getCondition()
            if (modifiers.Salvage < consumed)
            {
                consumed = modifiers.Salvage;
            }
            r.Item.setCondition(r.Item.getCondition() - consumed);

            modifiers.Salvage -= consumed;
			this.m.PointsSalvaged += consumed;
			local created = consumed * modifiers.Consumption;
			this.m.ToolsCreated += created;   
			this.World.Assets.setArmorParts(this.Math.maxf( this.World.Assets.getMaxArmorParts(), this.World.Assets.getArmorParts() + created))

            if (r.Item.getCondition() <= 0)
            {
                this.m.ItemsDestroyed += 1
				this.World.Assets.getStash().remove(r.Item);
				this.m.Salvage[i] = null;
            }
        }
    }

    function getListOfEquipment()
    {
        local items = [];
        local stash = [];
        local roster = this.World.getPlayerRoster().getAll()
        local stashItems = this.Stash.getItems();
        foreach( item in stashItems)
        {
            if (item == null)
            {
                continue;
            }

			if (item.isIndestructible())
			{
				continue;
			}

            if (item.getCondition() <= 0)
            {
                continue;
            }

            if (item.isToBeRepaired())
            {
				continue;
            }

            if (item.isToBeSalvaged())
            {
                items.push({
                    Bro = null,
                    Item = item
                });
            }
            else if ((item.getItemType() & (this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MagicStaff)) != 0 || (item.getItemType() & this.Const.Items.ItemFilter.Armor) != 0)
            {
                stash.push({
                    Bro = null,
                    Item = item
                });
            }
        }
        return {Items = items, Stash = stash};
    }

    function assignAll()
    {
        local index = 0
        foreach (i, s in this.m.Stash)
        {
            if (s == null)
            {
                continue
            }

            for (index; index < this.m.Salvage.len(); index = ++index)
            {
                if (this.m.Salvage[index] == null)
                {
                    break;
                }
            }

            s.Item.setToBeSalvaged(true);
            if (index >= this.m.Salvage.len())
            {
                this.m.Salvage.push(s);
            } 
            else
            {
                this.m.Salvage[index] = s;
            }
            s.Item.playInventorySound(this.Const.Items.InventoryEventType.PlacedInBag)
            this.m.Stash[i] = null;
        }
    }

    function removeAll()
    {
        local index = 0;
        foreach (i, s in this.m.Salvage)
        {
            if (s == null)
            {
                continue
            }

            for (index; index < this.m.Salvage.len(); index = ++index)
            {
                if (this.m.Stash[index] == null)
                {
                    break;
                }
            }

            s.Item.setToBeSalvaged(false);
            if (index >= this.m.Stash.len())
            {
                this.m.Stash.push(s);
            } 
            else
            {
                this.m.Stash[index] = s;
            }
            s.Item.playInventorySound(this.Const.Items.InventoryEventType.PlacedInBag)
            this.m.Salvage[i] = null;
        }
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
		case "camp-screen-workshop-dialog-module.stash":
            sourceList = this.m.Stash
            if (sourceItemOwner == targetItemOwner)
            {
                targetList = this.m.Stash;
            }
            else 
            {
                targetList = this.m.Salvage;
                isRepair = true;
            }
            break;

		case "camp-screen-workshop-dialog-module.shop":
            sourceList = this.m.Salvage
            if (sourceItemOwner == targetItemOwner)
            {
                targetList = this.m.Salvage;
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

        sourceItem.Item.setToBeSalvaged(isRepair);
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

	function onSalvageInventoryItem( _data, _value )
	{
        local item = this.Stash.getItemByInstanceID(_data).item;
        if (item == null)
        {
            return;
        }

		if (_value == item.isToBeSalvaged())
		{
			return;
		}
		
		this.onInit();
        if (!item.setToBeSalvaged(_value))
		{
			return;
		}

        local sourceItemOwner = "camp-screen-workshop-dialog-module.shop";
        local targetItemOwner = "camp-screen-workshop-dialog-module.stash";
        local sourceList = this.m.Salvage;
        //Came from stash
        if ( _value )
        {
            sourceItemOwner = "camp-screen-workshop-dialog-module.stash";
            targetItemOwner = "camp-screen-workshop-dialog-module.shop"
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

        return
	}

	function onClicked( _campScreen )
	{
        _campScreen.showWorkshopDialog();
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