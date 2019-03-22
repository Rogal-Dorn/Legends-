
this.camp_crafting_dialog_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		Title = "Crafting",
		Description = "While encamped, craft all manner of useful items from ingrediedents you have collected."	,
		Tent = null
	},
	function create()
	{
		this.m.ID = "CampCraftingDialogModule";
		this.m.Tent = this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Crafting);
		this.ui_module.create();
	}
	
	function onShow()
	{
		this.m.Tent.onInit();
		return this.queryLoad();
	}

	function queryLoad()
	{
		local result = {
			Title = this.m.Title,
			SubTitle = this.m.Description,
			Assets = this.assetsInformation(),
			Blueprints = this.World.Crafting.getQualifiedBlueprintsForUI(),
			Queue = this.m.Tent.getQueue()
		};
		return result;
	}

	function assetsInformation()
	{
		return {
			Time = this.m.Tent.getRequiredTime(),
			Brothers = this.m.Tent.getAssignedBros()
		};
	}

	function loadCraftList()
	{
		local result = this.queryLoad()
		this.m.JSHandle.asyncCall("loadFromData", result);
	}

	function destroy()
	{
		this.ui_module.destroy();
	}

	function onSwap ( _data )
	{
		this.m.Tent.onSwap( _data[0], _data[1] );
		this.loadCraftList();
	}

	function onRemove ( _idx)
	{
		this.m.Tent.onRemove( _idx );
		this.loadCraftList();
	}

	function onAdd( _blueprintID )
	{
		this.m.Tent.onAdd( _blueprintID );
		this.loadCraftList();
	}

	function onLeaveButtonPressed()
	{
		this.m.Parent.onModuleClosed();
	}

	function onBrothersButtonPressed()
	{
		this.m.Parent.onCommanderButtonPressed();
	}


});
