this.camp_screen <- {
	m = {
		JSHandle = null,
		MainDialogModule = null,
		CommanderDialogModule = null,
		BarberDialogModule = null,
		CraftingDialogModule = null,
		EnchanterDialogModule = null,
		FletcherDialogModule = null,
		HealerDialogModule = null,
		HunterDialogModule = null,
		RepairDialogModule = null,
		RestDialogModule = null,
		ScoutDialogModule = null,
		TrainingDialogModule = null,
		GathererDialogModule = null,
		WorkshopDialogModule = null,
		Visible = null,
		Animating = false,
		LastActiveModule = null,
		OnConnectedListener = null,
		OnDisconnectedListener = null,
		OnBrothersButtonPressedListener = null,
		OnModuleClosedListener = null
		OnCampListener = null
	},
	function isVisible()
	{
		return this.m.Visible != null && this.m.Visible == true;
	}

	function isAnimating()
	{
		return this.m.Animating == true || this.m.MainDialogModule.isAnimating() || this.m.CommanderDialogModule.isAnimating();
	}

	function getMainDialogModule()
	{
		return this.m.MainDialogModule;
	}

	function getBarberDialogModule()
	{
		return this.m.BarberDialogModule;
	}

	function getCommanderDialogModule()
	{
		return this.m.CommanderDialogModule;
	}

	function getCraftingDialogModule()
	{
		return this.m.CraftingDialogModule;
	}

	function getEnchanterDialogModule()
	{
		return this.m.EnchanterDialogModule;
	}

	function getFletcherDialogModule()
	{
		return this.m.FletcherDialogModule;
	}

	function getHealerDialogModule()
	{
		return this.m.HealerDialogModule;
	}

	function getHunterDialogModule()
	{
		return this.m.HunterDialogModule;
	}

	function getRepairDialogModule()
	{
		return this.m.RepairDialogModule;
	}

	function getRestDialogModule()
	{
		return this.m.RestDialogModule;
	}

	function getScoutDialogModule()
	{
		return this.m.ScoutDialogModule;
	}

	function getTrainingDialogModule()
	{
		return this.m.TrainingDialogModule;
	}

	function getGathererDialogModule()
	{
		return this.m.GathererDialogModule;
	}

	function getWorkshopDialogModule()
	{
		return this.m.WorkshopDialogModule;
	}

	function setOnConnectedListener( _listener )
	{
		this.m.OnConnectedListener = _listener;
	}

	function setOnDisconnectedListener( _listener )
	{
		this.m.OnDisconnectedListener = _listener;
	}

	function setOnBrothersPressedListener( _listener )
	{
		this.m.OnBrothersButtonPressedListener = _listener;
	}

	function setOnModuleClosedListener( _listener )
	{
		this.m.OnModuleClosedListener = _listener;
	}

	function setOnCampListener( _listener )
	{
		this.m.OnCampListener = _listener;
	}

	function clearEventListener()
	{
		this.m.OnConnectedListener = null;
		this.m.OnDisconnectedListener = null;
		this.m.OnBrothersButtonPressedListener = null;
		this.m.OnModuleClosedListener = null;
		this.m.OnCampListener = null;
	}

	function create()
	{
		this.m.Visible = false;
		this.m.Animating = false;
		this.m.JSHandle = this.UI.connect("CampScreen", this);
		this.m.MainDialogModule = this.new("scripts/ui/screens/world/modules/camp_screen/camp_main_dialog_module");
		this.m.MainDialogModule.setParent(this);
		this.m.MainDialogModule.connectUI(this.m.JSHandle);
		this.m.CommanderDialogModule = this.new("scripts/ui/screens/world/modules/camp_screen/camp_commander_dialog_module");
		this.m.CommanderDialogModule.setParent(this);
		this.m.CommanderDialogModule.connectUI(this.m.JSHandle);
		this.m.BarberDialogModule = this.new("scripts/ui/screens/world/modules/camp_screen/camp_barber_dialog_module");
		this.m.BarberDialogModule.setParent(this);
		this.m.BarberDialogModule.connectUI(this.m.JSHandle);
		this.m.CraftingDialogModule = this.new("scripts/ui/screens/world/modules/camp_screen/camp_crafting_dialog_module");
		this.m.CraftingDialogModule.setParent(this);
		this.m.CraftingDialogModule.connectUI(this.m.JSHandle);
		this.m.EnchanterDialogModule = this.new("scripts/ui/screens/world/modules/camp_screen/camp_enchanter_dialog_module");
		this.m.EnchanterDialogModule.setParent(this);
		this.m.EnchanterDialogModule.connectUI(this.m.JSHandle);
		this.m.FletcherDialogModule = this.new("scripts/ui/screens/world/modules/camp_screen/camp_fletcher_dialog_module");
		this.m.FletcherDialogModule.setParent(this);
		this.m.FletcherDialogModule.connectUI(this.m.JSHandle);			
		this.m.HealerDialogModule = this.new("scripts/ui/screens/world/modules/camp_screen/camp_healer_dialog_module");
		this.m.HealerDialogModule.setParent(this);
		this.m.HealerDialogModule.connectUI(this.m.JSHandle);
		this.m.HunterDialogModule = this.new("scripts/ui/screens/world/modules/camp_screen/camp_hunter_dialog_module");
		this.m.HunterDialogModule.setParent(this);
		this.m.HunterDialogModule.connectUI(this.m.JSHandle);	
		this.m.RepairDialogModule = this.new("scripts/ui/screens/world/modules/camp_screen/camp_repair_dialog_module");
		this.m.RepairDialogModule.setParent(this);
		this.m.RepairDialogModule.connectUI(this.m.JSHandle);
		this.m.RestDialogModule = this.new("scripts/ui/screens/world/modules/camp_screen/camp_rest_dialog_module");
		this.m.RestDialogModule.setParent(this);
		this.m.RestDialogModule.connectUI(this.m.JSHandle);
		this.m.ScoutDialogModule = this.new("scripts/ui/screens/world/modules/camp_screen/camp_scout_dialog_module");
		this.m.ScoutDialogModule.setParent(this);
		this.m.ScoutDialogModule.connectUI(this.m.JSHandle);
		this.m.TrainingDialogModule = this.new("scripts/ui/screens/world/modules/camp_screen/camp_training_dialog_module");
		this.m.TrainingDialogModule.setParent(this);
		this.m.TrainingDialogModule.connectUI(this.m.JSHandle);
		this.m.GathererDialogModule = this.new("scripts/ui/screens/world/modules/camp_screen/camp_gatherer_dialog_module");
		this.m.GathererDialogModule.setParent(this);
		this.m.GathererDialogModule.connectUI(this.m.JSHandle);
		this.m.WorkshopDialogModule = this.new("scripts/ui/screens/world/modules/camp_screen/camp_workshop_dialog_module");
		this.m.WorkshopDialogModule.setParent(this);
		this.m.WorkshopDialogModule.connectUI(this.m.JSHandle);		
	}

	function destroy()
	{
		this.clearEventListener();
		this.m.MainDialogModule.destroy();
		this.m.MainDialogModule = null;
		this.m.CommanderDialogModule.destroy();
		this.m.CommanderDialogModule = null;
		this.m.BarberDialogModule.destroy();
		this.m.CraftingDialogModule.destroy();
		this.m.EnchanterDialogModule.destroy();
		this.m.FletcherDialogModule.destroy();
		this.m.HealerDialogModule.destroy();
		this.m.HunterDialogModule.destroy();		
		this.m.RepairDialogModule.destroy();	
		this.m.RestDialogModule.destroy();
		this.m.ScoutDialogModule.destroy();
		this.m.TrainingDialogModule.destroy();
		this.m.GathererDialogModule.destroy();
		this.m.WorkshopDialogModule.destroy();
		this.m.BarberDialogModule = null;
		this.m.CraftingDialogModule = null;
		this.m.EnchanterDialogModule = null;
		this.m.FletcherDialogModule = null;
		this.m.HealerDialogModule = null;
		this.m.HunterDialogModule = null;
		this.m.RepairDialogModule = null;
		this.m.RestDialogModule = null;
		this.m.ScoutDialogModule = null;
		this.m.TrainingDialogModule = null;
		this.m.GathererDialogModule = null;
		this.m.WorkshopDialogModule = null;		

		this.m.JSHandle = this.UI.disconnect(this.m.JSHandle);
	}

	function clear()
	{
		this.m.MainDialogModule.clear();
		this.m.CommanderDialogModule.clear();
		this.m.BarberDialogModule.clear();
		this.m.CraftingDialogModule.clear();
		this.m.EnchanterDialogModule.clear();
		this.m.FletcherDialogModule.clear();
		this.m.HealerDialogModule.clear();
		this.m.HunterDialogModule.clear();		
		this.m.RepairDialogModule.clear();	
		this.m.RestDialogModule.clear();
		this.m.ScoutDialogModule.clear();
		this.m.TrainingDialogModule.clear();
		this.m.GathererDialogModule.clear();
		this.m.WorkshopDialogModule.clear();
	}

	function show()
	{
		if (this.m.JSHandle != null)
		{
			this.m.LastActiveModule = null;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("show", this.queryCampInformation());
		}
	}

	function hide()
	{
		if (this.m.JSHandle != null)
		{
			this.m.LastActiveModule = null;
			this.m.JSHandle.asyncCall("hide", null);
			this.Tooltip.hide();
		}
	}

	function hideAllDialogs()
	{
		if (this.m.JSHandle != null)
		{
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("hideAllDialogs", null);
		}
	}

	function refresh()
	{
		if (this.m.JSHandle != null)
		{
			this.m.LastActiveModule = null;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("refresh", this.queryCampInformation());
		}
	}

	function showLastActiveDialog()
	{
		if (this.m.LastActiveModule == this.m.HireDialogModule)
		{
			this.showHireDialog();
		}
		else if (this.m.LastActiveModule == this.m.ShopDialogModule)
		{
			this.showShopDialog();
		}
		else if (this.m.LastActiveModule == this.m.TravelDialogModule)
		{
			this.showTravelDialog();
		}
		else if (this.m.LastActiveModule == this.m.BarberDialogModule)
		{
			this.showBarberDialog();
		}
		else if (this.m.LastActiveModule == this.m.TavernDialogModule)
		{
			this.showTavernDialog();
		}
		else if (this.m.LastActiveModule == this.m.TempleDialogModule)
		{
			this.showTempleDialog();
		}
		else if (this.m.LastActiveModule == this.m.TrainingDialogModule)
		{
			this.showTrainingDialog();
		}
		else if (this.m.LastActiveModule == this.m.TaxidermistDialogModule)
		{
			this.showTaxidermistDialog();
		}
		else
		{
			this.showMainDialog();
		}
	}

	function showMainDialog()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.LastActiveModule = null;
			this.Tooltip.hide();
		function showCommanderDialog()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.LastActiveModule = this.m.CommanderDialogModule;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("showCommanderDialog", null)//this.m.CommanderDialogModule.queryHireInformation());
		}
	}		this.m.JSHandle.asyncCall("showMainDialog", this.queryAssetsInformation());
		}
	}

	function showCommanderDialog()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.LastActiveModule = this.m.CommanderDialogModule;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("showCommanderDialog", null)//this.m.CommanderDialogModule.queryHireInformation());
		}
	}

	function showBarberDialog()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.LastActiveModule = this.m.BarberDialogModule;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("showBarberDialog", null)//this.m.CommanderDialogModule.queryHireInformation());
		}
	}

	function showCraftingDialog()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.LastActiveModule = this.m.CraftingDialogModule;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("showCraftingDialog", null)//this.m.CommanderDialogModule.queryHireInformation());
		}
	}

	function showEnchanterDialog()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.LastActiveModule = this.m.EnchanterDialogModule;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("showEnchanterDialog", null)//this.m.CommanderDialogModule.queryHireInformation());
		}
	}

	function showFletcherDialog()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.LastActiveModule = this.m.FletcherDialogModule;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("showFletcherDialog", null)//this.m.CommanderDialogModule.queryHireInformation());
		}
	}

	function showHunterDialog()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.LastActiveModule = this.m.HunterDialogModule;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("showHunterDialog", null)//this.m.CommanderDialogModule.queryHireInformation());
		}
	}

	function showRepairDialog()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.LastActiveModule = this.m.RepairDialogModule;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("showRepairDialog", null)//this.m.CommanderDialogModule.queryHireInformation());
		}
	}

	function showRestDialog()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.LastActiveModule = this.m.RestDialogModule;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("showRestDialog", null)//this.m.CommanderDialogModule.queryHireInformation());
		}
	}

	function showScoutDialog()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.LastActiveModule = this.m.ScoutDialogModule;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("showScoutDialog", null)//this.m.CommanderDialogModule.queryHireInformation());
		}
	}

	function showTrainingDialog()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.LastActiveModule = this.m.TrainingDialogModule;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("showTrainingDialog", null)//this.m.CommanderDialogModule.queryHireInformation());
		}
	}

	function showGathererDialog()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.LastActiveModule = this.m.GathererDialogModule;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("showGathererDialog", null)//this.m.CommanderDialogModule.queryHireInformation());
		}
	}

	function showWorkshopDialog()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.LastActiveModule = this.m.WorkshopDialogModule;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("showWorkshopDialog", null)//this.m.CommanderDialogModule.queryHireInformation());
		}
	}

	function updateAssets()
	{
		this.m.JSHandle.asyncCall("loadAssetData", this.queryAssetsInformation());
	}

	function onScreenConnected()
	{
		if (this.m.OnConnectedListener != null)
		{
			this.m.OnConnectedListener();
		}
	}

	function onScreenDisconnected()
	{
		if (this.m.OnDisconnectedListener != null)
		{
			this.m.OnDisconnectedListener();
		}
	}

	function onScreenShown()
	{
		this.m.Visible = true;
		this.m.Animating = false;
	}

	function onScreenHidden()
	{
		this.m.Visible = false;
		this.m.Animating = false;
	}

	function onScreenAnimating()
	{
		this.m.Animating = true;
	}

	function onBrothersButtonPressed()
	{
		if (this.m.OnBrothersButtonPressedListener != null)
		{
			this.m.OnBrothersButtonPressedListener();
		}
	}

	function onModuleClosed()
	{
		if (this.m.OnModuleClosedListener != null)
		{
			this.m.OnModuleClosedListener();
		}
		if (this.m.OnCampListener != null)
		{
			this.m.OnCampListener();
		}
	}

	function onSlotClicked( _data )
	{
		if (this.isAnimating())
		{
			return;
		}

		local building = this.World.Camp.getBuildingByID(_data);
		if (building == null)
		{
			return;
		}

		building.onClicked(this);
	}

	function getTimeRequired()
	{
		return "No camp tasks have been scheduled..."
	}

	function getUITerrain()
	{
		local tile = this.World.State.getPlayer().getTile();
		local terrain = [];
		terrain.resize(this.Const.World.TerrainType.COUNT, 0);

		for( local i = 0; i < 6; i = ++i )
		{
			if (!tile.hasNextTile(i))
			{
				continue;
			}
			++terrain[tile.getNextTile(i).Type];
		}

		terrain[this.Const.World.TerrainType.Plains] = this.Math.max(0, terrain[this.Const.World.TerrainType.Plains] - 1);

		if (terrain[this.Const.World.TerrainType.Steppe] != 0 && this.Math.abs(terrain[this.Const.World.TerrainType.Steppe] - terrain[this.Const.World.TerrainType.Hills]) <= 2)
		{
			terrain[this.Const.World.TerrainType.Steppe] += 2;
		}

		if (terrain[this.Const.World.TerrainType.Snow] != 0 && this.Math.abs(terrain[this.Const.World.TerrainType.Snow] - terrain[this.Const.World.TerrainType.Hills]) <= 2)
		{
			terrain[this.Const.World.TerrainType.Snow] += 2;
		}

		local highest = 0;

		for( local i = 0; i < this.Const.World.TerrainType.COUNT; i = ++i )
		{
			if (i == this.Const.World.TerrainType.Ocean || i == this.Const.World.TerrainType.Shore)
			{
				continue;
			}
			
			if (terrain[i] >= terrain[highest])
			{
				highest = i;
			}
		}

		return highest

		return this.Const.World.TerrainSettlementImages[highest].Background;
		// this.m.UIRamp = this.Const.World.TerrainSettlementImages[highest].Ramp;
		// this.m.UIForeground = this.m.HousesMax < 5 ? this.Const.World.TerrainSettlementImages[highest].Foreground : "ui/settlements/foreground_04";
		// this.m.UIMood = this.Const.World.TerrainSettlementImages[highest].Mood;
		// this.World.createRoster(this.getID());
		// this.registerThinker();
		// local body = this.addSprite("body");
		// body.setBrush(this.m.Sprite);
		// local light = this.addSprite("lighting");
		// this.setSpriteColorization("lighting", false);

		// if (this.m.Lighting != "")
		// {
		// 	light.setBrush(this.m.Lighting);
		// }

		// light.IgnoreAmbientColor = true;
		// light.Alpha = 0;
	}

	function queryCampInformation()
	{

		return this.getUIInformation();
	}

	function queryAssetsInformation()
	{
		return this.UIDataHelper.convertAssetsInformationToUIData();
	}

	function getUIInformation()
	{
		local night = !this.World.getTime().IsDaytime;
		local highest = this.getUITerrain();
		local foreground = this.Const.World.TerrainCampImages[highest].Foreground;
		local result = {
			Title = this.World.Assets.getName() + " Camp",
			SubTitle = this.getTimeRequired(),
			Assets = this.queryAssetsInformation(),
			HeaderImagePath = null,
			Background =  this.Const.World.TerrainCampImages[highest].Background + (night ? "_night" : "") + ".jpg",
			Mood =this.Const.World.TerrainCampImages[highest].Mood  + ".png",
			Foreground = foreground != null ? foreground + (night ? "_night" : "") + ".png" : null,
			Slots = [],
			Situations = []
		};

		foreach( building in this.World.Camp.getBuildings())
		{
			if (building == null || building.isHidden())
			{
				result.Slots.push(null);
			}
			else
			{
				local b = {
					Image = building.getUIImage(),
					Tooltip = building.getTooltipID(),
					Slot = building.getSlot(),
					CanEnter = building.canEnter()
				};
				result.Slots.push(b);
			}
		}
		return result;
	}

};
