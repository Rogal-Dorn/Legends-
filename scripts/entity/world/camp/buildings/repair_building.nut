this.repair_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
	},
    function create()
    {
        this.camp_building.create();
        this.m.ID = "camp.repair";
    }

    function destroy()
    {
    }

    function init()
    {
    }

    function getModifiers()
    {
        local ret = {
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
        foreach( bro in roster )
        {
            local items = bro.getItems().getAllItems();
            local updateBro = false;

            foreach( item in items )
            {
                if (item.getCondition() < item.getConditionMax())
                {
                    local d = this.Math.minf(this.Const.World.Assets.ArmorPerHour * modifiers.Repair, item.getConditionMax() - item.getCondition());
                    item.setCondition(item.getCondition() + d);
                    updateBro = true;

                    if (this.World.Assets.isConsumingAssets())
                    {
                        local consumed = this.Math.maxf(0, this.World.Assets.getArmorParts() - d * this.Const.World.Assets.ArmorPartsPerArmor * modifiers.Consumption);
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
                item.setCondition(item.getCondition() + d);

                if (this.World.Assets.isConsumingAssets())
                {
                    local consumed = this.Math.maxf(0, this.World.Assets.getArmorParts() - d * this.Const.World.Assets.ArmorPartsPerArmor * modifiers.Consumption);
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
    
}