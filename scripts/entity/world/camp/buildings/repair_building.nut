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

    function update ()
    {
    }
    
}