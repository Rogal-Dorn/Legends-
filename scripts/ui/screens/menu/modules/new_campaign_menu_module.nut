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

	function onStartButtonPressed( _settings )
	{
		local settings = {
			Name = _settings[0],
			Banner = _settings[1],
			Difficulty = _settings[2],
			EconomicDifficulty = _settings[3],
			BudgetDifficulty = _settings[4],
			Ironman = _settings[5],
			GreaterEvil = _settings[6],
			PermanentDestruction = _settings[7],
			Seed = _settings[8],
			Width = _settings[9],
			Height = _settings[10],
			LandMassMult = (_settings[11] + 100) / 100.0 ,
			WaterConnectivity = _settings[12] + 34,
			MinLandToWaterRatio = _settings[13],
			Snowline = _settings[14] / 100.0,
			NumSettlements = _settings[15],
			NumFactions = _settings[16],
			//Vision = _settings[17],
			FOW = _settings[17],
			ForestsMult = _settings[18] / 100.0,
			SwampsMult = _settings[19] / 100.0 ,
			MountainsMult = _settings[20] / 100.0,
	//		Debug = _settings[21],
			StackCitadels = _settings[21],
			AllTradeLocations = _settings[22],
			StartingScenario = _settings[23],
			LegendPerkTrees = _settings[24],
			LegendGenderEquality = _settings[25],
			LegendMagic = _settings[26],
			LegendArmor = _settings[27],
			Debug = _settings[28],
			Autosave = _settings[29],
			LegendItemScaling = _settings[30],
			LegendLocationScaling = _settings[31],
			LegendCampUnlock = _settings[32],
			LegendRecruitScaling = _settings[33],
			LegendBleedKiller = _settings[34],
			LegendAllBlueprints = _settings[35],
			LegendRelationship = _settings[36],
			LegendWorldEconomy = _settings[37],
			LegendIsHelmet = this.Const.DLC.Unhold ? 1 : 0
			LegendTherian = _settings[38]
		};

		// local settings = {
		// 	Name = _settings[0],
		// 	Banner = _settings[1],
		// 	Difficulty = _settings[2],
		// 	EconomicDifficulty = _settings[3],
		// 	BudgetDifficulty = _settings[4],
		// 	Ironman = _settings[5],
		// 	GreaterEvil = _settings[6],
		// 	PermanentDestruction = _settings[7],
		// 	Seed = _settings[8],
		// 	StartingScenario = _settings[9]
		// };

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

