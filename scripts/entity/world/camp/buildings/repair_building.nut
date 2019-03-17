this.repair_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
        ToolsUsed = 0,
        PointsRepaired = 0,
        Items = []
	},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Repair;
        this.m.Slot = "repair";
        this.m.Name = "Repair Tent";
        this.m.Description = "Manage the repair of company items"
		this.m.UIImage = "ui/settlements/camp_repair_large_full_day";
		this.m.UIImageNight = "ui/icons/buildings/camp_repair_large_full_night.png";    
    }

    function destroy()
    {
    }

    function init()
    {
        this.m.ToolsUsed = 0;
        this.m.PointsRepaired = 0;
    }
    
    function getResults()
    {
        return [{
				id = 10,
				icon = "ui/icons/asset_supplies.png",
				text = "You used [color=" + this.Const.UI.Color.NegativeEventValue + "]" + this.m.ToolsUsed + "[/color] units of tools and repaired [color=" + this.Const.UI.Color.PositiveEventValue + "]" + this.m.PointsRepaired + "[/color] points of armor."
			}];
    }


    function getModifiers()
    {
        local ret = 
        {
            Repair = 2.0,
            Consumption = 1.0
        }
		local roster = this.World.getPlayerRoster().getAll();
        foreach( bro in roster )
        {
            if (bro.getCampAssignment() != this.m.ID)
            {
                continue
            }

            ret.Repair += this.Const.LegendMod.getRepairModifier(bro.getBackground().getID());
            local v = this.Math.maxf(0.50, ret.Consumption - this.Const.LegendMod.getToolConsumptionModifier(bro.getBackground().getID()));
            ret.Consumption = v;
        }
        return ret;
    }

    function update ()
    {
        if (this.World.Assets.getArmorParts() == 0)
        {
            return
        }

        local modifiers = this.getModifiers();
        local roster = this.World.getPlayerRoster().getAll();
        foreach( bro in roster )
        {
            local items = bro.getItems().getAllItems();
            local updateBro = false;

            foreach( item in items )
            {
                if (item.getCondition() < item.getConditionMax())
                {
                    local d = this.Math.minf(this.Const.World.Assets.ArmorPerHour * modifiers.Repair, item.getConditionMax() - item.getCondition());
                    this.m.PointsRepaired += d;
                    item.setCondition(item.getCondition() + d);
                    updateBro = true;

                    if (this.World.Assets.isConsumingAssets())
                    {
                        local consumed = this.Math.maxf(0, this.World.Assets.getArmorParts() - d * this.Const.World.Assets.ArmorPartsPerArmor * modifiers.Consumption);
                        this.m.ToolsUsed += consumed;
                        this.World.Assets.setArmorParts(consumed)
                    }
                }

                if (item.getCondition() >= item.getConditionMax())
                {
                    item.setToBeRepaired(false);
                }

                if ( this.World.Assets.getArmorParts() == 0)
                {
                    break;
                }
            }

            if (updateBro)
            {
                bro.getSkills().update();
            }
        }

        if (this.World.Assets.getArmorParts() == 0)
        {
            return
        }

        local items = this.Stash.getItems();
        foreach( item in items )
        {
            if (item == null)
            {
                continue;
            }

            if (!item.isToBeRepaired())
            {
                continue
            }

            if (item.getCondition() < item.getConditionMax())
            {
                local d = this.Math.minf(this.Const.World.Assets.ArmorPerHour * modifiers.Repair, item.getConditionMax() - item.getCondition());
                this.m.PointsRepaired += d;
                item.setCondition(item.getCondition() + d);

                if (this.World.Assets.isConsumingAssets())
                {
                    local consumed = this.Math.maxf(0, this.World.Assets.getArmorParts() - d * this.Const.World.Assets.ArmorPartsPerArmor * modifiers.Consumption);
                    this.m.ToolsUsed += consumed;
                    this.World.Assets.setArmorParts(consumed)
                }
            }

            if (item.getCondition() >= item.getConditionMax())
            {
                item.setToBeRepaired(false);
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