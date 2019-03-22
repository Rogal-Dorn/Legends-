
this.camp_repair_dialog_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		Title = "Repairs",
		Description = "Items in the queue will be repaired from left to right, top to bottom. Assign workers to repair items in the commanders tent.",
		InventoryFilter = this.Const.Items.ItemFilter.All
		Tent = null
	},
	function create()
	{
		this.m.ID = "CampRepairDialogModule";
		this.m.Tent = this.World.Camp.getBuildingByID(this.Const.World.CampBuildings.Repair);
		this.ui_module.create();
	}

	function destroy()
	{
		this.ui_module.destroy();
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
			Stash = [],
			Repairs = [],
			Capacity = this.m.Tent.getCapacity()
		};
		this.UIDataHelper.convertRepairItemsToUIData(this.m.Tent.getRepairs(), result.Repairs, this.Const.UI.ItemOwner.Shop);
		this.UIDataHelper.convertRepairItemsToUIData(this.m.Tent.getStash(), result.Stash, this.Const.UI.ItemOwner.Stash, this.m.InventoryFilter);
		return result;
	}

	function assetsInformation()
	{
		return {
			Supplies = this.World.Assets.getArmorParts(),
			SuppliesMax  = this.World.Assets.getMaxArmorParts(),
			SuppliesRequired = this.m.Tent.getRequiredSupplies(),
			Time = this.m.Tent.getRequiredTime(),
			Brothers = this.m.Tent.getAssignedBros()
		};
	}

	function loadStashList()
	{
		local result = this.queryLoad()
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

		this.m.Tent.onInit();
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

	function onFilterBro()
	{
		if (this.m.InventoryFilter != 99)
		{
			this.m.InventoryFilter = 99;
			this.loadStashList();
		}
	}

	function onAssignAll()
	{
		this.m.Tent.assignAll();
		this.loadStashList();
	}

	function onRemoveAll()
	{
		this.m.Tent.removeAll();
		this.loadStashList();
	}

	function onSwapItem( _data )
	{
		local sourceItemIdx = _data[0];
		local sourceItemOwner = _data[1];
		local targetItemIdx = _data[2];
		local targetItemOwner = _data[3];
		this.m.Tent.swapItems(sourceItemOwner, sourceItemIdx, targetItemOwner, targetItemIdx)
		return this.queryLoad();
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
