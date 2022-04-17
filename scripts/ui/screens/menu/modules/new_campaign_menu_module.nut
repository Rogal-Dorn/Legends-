this.new_campaign_menu_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		OnStartButtonPressedListener = null,
		OnCancelButtonPressedListener = null
	},
	function setOnStartButtonPressedListener( _listener )
	{
		this.m.OnStartButtonPressedListener = _listener;
	}

	function setOnCancelButtonPressedListener( _listener )
	{
		this.m.OnCancelButtonPressedListener = _listener;
	}

	function clearEventListener()
	{
		this.m.OnStartButtonPressedListener = null;
		this.m.OnCancelButtonPressedListener = null;
	}

	function create()
	{
		this.m.ID = "NewCampaignModule";
		this.ui_module.create();
	}

	function destroy()
	{
		this.clearEventListener();
		this.ui_module.destroy();
	}

	function show()
	{
		if (!this.isVisible() && !this.isAnimating())
		{
			this.m.JSHandle.asyncCall("show", null);
		}
	}

	function hide()
	{
		if (this.isVisible() && !this.isAnimating())
		{
			this.m.JSHandle.asyncCall("hide", null);
		}
	}

	function setBanners( _banners )
	{
		this.m.JSHandle.asyncCall("setBanners", _banners);
	}

	function setConfigOpts ( _opts )
	{
		this.m.JSHandle.asyncCall("setConfigOpts", _opts);
	}

	function setStartingScenarios( _scenarios )
	{
		this.m.JSHandle.asyncCall("setStartingScenarios", _scenarios);
	}

	function setCrusadeCampaignAvailable( _available )
	{
		this.m.JSHandle.asyncCall("setCrusadeCampaignVisible", _available);
	}

	function onStartButtonPressed( _settings )
	{
		local settings = {
			Name = _settings["Name"],
			Banner = _settings["Banner"],
			Difficulty = _settings["Difficulty"],
			EconomicDifficulty = _settings["EconomicDifficulty"],
			BudgetDifficulty = _settings["BudgetDifficulty"],
			Ironman = _settings["Ironman"],
			GreaterEvil = _settings["GreaterEvil"],
			PermanentDestruction = _settings["PermanentDestruction"],
			Seed = _settings["Seed"],
			LandMassMult = _settings["LandMassMult"],
			WaterConnectivity = _settings["WaterConnectivity"],
			MinLandToWaterRatio = (_settings["MinLandToWaterRatio"] + 10.0) / 10.0,
			Snowline = _settings["Snowline"] / 100.0,
			NumSettlements = _settings["NumSettlements"],
			NumFactions = _settings["NumFactions"],
			FOW = _settings["FOW"],
			ExplorationMode = _settings["ExplorationMode"],
			ForestsMult = _settings["ForestsMult"] / 100.0,
			SwampsMult = _settings["SwampsMult"] / 100.0 ,
			MountainsMult = _settings["MountainsMult"] / 100.0,
			StackCitadels = _settings["StackCitadels"],
			AllTradeLocations = _settings["AllTradeLocations"],
			StartingScenario = _settings["StartingScenario"],
			LegendPerkTrees = _settings["LegendPerkTrees"],
			LegendGenderEquality = _settings["LegendGenderEquality"],
			LegendMagic = _settings["LegendMagic"],
			LegendArmor = _settings["LegendArmor"],
			Debug = _settings["Debug"],
			Autosave = _settings["Autosave"],
			LegendItemScaling = _settings["LegendItemScaling"],
			LegendLocationScaling = _settings["LegendLocationScaling"],
			LegendCampUnlock = _settings["LegendCampUnlock"],
			LegendRecruitScaling = _settings["LegendRecruitScaling"],
			LegendBleedKiller = _settings["LegendBleedKiller"],
			LegendAllBlueprints = _settings["LegendAllBlueprints"],
			LegendRelationship = _settings["LegendRelationship"],
			LegendWorldEconomy = _settings["LegendWorldEconomy"],
			LegendTherian = _settings["LegendTherian"],
			LegendIsHelmet = this.Const.DLC.Unhold ? 1 : 0
		};

		if (this.m.OnStartButtonPressedListener != null)
		{
			this.m.OnStartButtonPressedListener(settings);
		}
	}

	function onCancelButtonPressed()
	{
		if (this.m.OnCancelButtonPressedListener != null)
		{
			this.m.OnCancelButtonPressedListener();
		}
	}

});

