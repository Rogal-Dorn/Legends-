this.crafting_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Crafting;
        this.m.Slot = "crafting";
        this.m.Name = "Craft";
        this.m.Description = "Craft items"
		this.m.UIImage = "ui/settlements/taxidermist_day_empty";
		this.m.UIImageNight = "ui/settlements/taxidermist_night_empty";
		this.m.UIImageFull = "ui/settlements/taxidermist_day_full";
		this.m.UIImageNightFull = "ui/settlements/taxidermist_night_full";
    }

	function onClicked( _campScreen )
	{
        _campScreen.showCraftingDialog();
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