
this.camp_healer_dialog_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		Title = "Heal/Reserves",
		Description = "Tend to wounded brothers and place them in reserve status",
		Tent = null
	},
	function create()
	{
		this.m.ID = "CampHealerDialogModule";
		this.m.Tent = this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Healer);
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
			Roster = this.m.Tent.getRoster(),
			Queue = this.m.Tent.getQueue()
		};
		return result;
	}

	function queryQueue()
	{
		local result = {
			Assets = this.assetsInformation(),
			Queue = this.m.Tent.getQueue()
		};
		return result;
	}

	function assetsInformation()
	{
		return {
			Meds = this.World.Assets.getMedicine(),
			MedsMax  = this.World.Assets.getMaxMedicine(),
			MedsRequired = this.m.Tent.getRequiredMeds(),			
			Time = this.m.Tent.getRequiredTime(),
			Brothers = this.m.Tent.getAssignedBros()
		};
	}

	function loadQueueList()
	{
		local result = this.queryQueue()
		this.m.JSHandle.asyncCall("loadFromData", result);
	}

	function onSwap ( _data )
	{
		this.m.Tent.onSwap( _data[0], _data[1] );
		this.loadQueueList();
	}

	function onRemove ( _idx)
	{
		local res = this.m.Tent.onRemove( _idx );
		local result = this.queryLoad()
		this.m.JSHandle.asyncCall("loadFromData", result);
	}

	function onAdd( _data )
	{
		local res = this.m.Tent.onAdd( _data[0], _data[1] );
		local result = this.queryLoad()
		this.m.JSHandle.asyncCall("loadFromData", result);
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
