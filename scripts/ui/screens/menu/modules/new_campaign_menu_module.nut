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
			WaterConnectivity = _settings[12],
			MinLandToWaterRatio = _settings[13] / 10.0,
			Snowline = _settings[14] / 100.0,
			NumSettlements = _settings[15],
			NumFactions = _settings[16],
			//Vision = _settings[17],
			FOW = _settings[17],
			ForestsMult = _settings[18] / 100.0,
			SwampsMult = _settings[19] / 100.0 ,
			MountainsMult = _settings[20] / 100.0
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
