this.crafting_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Crafting;
        this.m.Slot = "crafting";
        this.m.Name = "Craft";
        this.m.Description = "Craft items"
		this.m.UIImage = "ui/settlements/camp_taxidermist_full_day";
		this.m.UIImageNight = "ui/settlements/camp_taxidermist_full_night";
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