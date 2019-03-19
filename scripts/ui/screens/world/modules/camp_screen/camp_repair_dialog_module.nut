
this.camp_repair_dialog_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		Title = "Repar Tent",
		Description = "Items in the queue will be repaired from left to right, top to bottom. Assign workers to repair items in the commanders tent.",
		InventoryFilter = this.Const.Items.ItemFilter.All
	},
	function create()
	{
		this.m.ID = "CampRepairDialogModule";
		this.ui_module.create();
	}

	function destroy()
	{
		this.ui_module.destroy();
	}

	function onShow()
	{
		local tent = this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Repair);
		tent.onInit();
		return this.queryLoad();
	}

	function queryLoad()
	{
		local tent = this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Repair)
		local result = {
			Title = this.m.Title,
			SubTitle = this.m.Description,
			Assets = this.m.Parent.queryAssetsInformation(),
			Stash = [],
			Repairs = [],
			Capacity = tent.getCapacity()
		};
		this.UIDataHelper.convertRepairItemsToUIData(tent.getRepairs(), result.Repairs, this.Const.UI.ItemOwner.Shop);
		this.UIDataHelper.convertRepairItemsToUIData(tent.getStash(), result.Stash, this.Const.UI.ItemOwner.Stash, this.m.InventoryFilter);
		return result;
	}

	function loadStashList()
	{
		local tent = this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Repair)
		local result = {
			Stash = [],
			Capacity = tent.getCapacity()
		};
		this.UIDataHelper.convertRepairItemsToUIData(tent.getStash(), result.Stash, this.Const.UI.ItemOwner.Stash, this.m.InventoryFilter);
		this.m.JSHandle.asyncCall("loadFromData", result);
	}

	function onSortButtonClicked()
	{
		if (this.Tactical.isActive())
		{
			this.getroottable().Stash.sort();
		}
		else
		{
			this.World.Assets.getStash().sort();
		}

		this.loadStashList();
	}

	function onFilterAll()
	{
		if (this.m.InventoryFilter != this.Const.Items.ItemFilter.All)
		{
			this.m.InventoryFilter = this.Const.Items.ItemFilter.All;
			this.loadStashList();
		}
	}

	function onFilterWeapons()
	{
		if (this.m.InventoryFilter != this.Const.Items.ItemFilter.Weapons)
		{
			this.m.InventoryFilter = this.Const.Items.ItemFilter.Weapons;
			this.loadStashList();
		}
	}

	function onFilterArmor()
	{
		if (this.m.InventoryFilter != this.Const.Items.ItemFilter.Armor)
		{
			this.m.InventoryFilter = this.Const.Items.ItemFilter.Armor;
			this.loadStashList();
		}
	}

	function onFilterMisc()
	{
		if (this.m.InventoryFilter != this.Const.Items.ItemFilter.Misc)
		{
			this.m.InventoryFilter = this.Const.Items.ItemFilter.Misc;
			this.loadStashList();
		}
	}

	function onFilterUsable()
	{
		if (this.m.InventoryFilter != this.Const.Items.ItemFilter.Usable)
		{
			this.m.InventoryFilter = this.Const.Items.ItemFilter.Usable;
			this.loadStashList();
		}
	}

	function onSwapItem( _data )
	{
		local tent = this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Repair)
		local sourceItemIdx = _data[0];
		local sourceItemOwner = _data[1];
		local targetItemIdx = _data[2];
		local targetItemOwner = _data[3];
		tent.swapItems(sourceItemOwner, sourceItemIdx, targetItemOwner, targetItemIdx)
		return this.queryLoad();
	}

	function onLeaveButtonPressed()
	{
		this.m.Parent.onModuleClosed();
	}


});
