this.new_legend_campaign_menu_module <- this.inherit("scripts/ui/screens/ui_module", {
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
		this.m.ID = "NewLegendCampaignModule";
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

	function onStartButtonPressed( _settings )
	{
		this.logInfo("**** _SETTINGS 9 " + _settings[9] )
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
			Campaign = _settings[9]
		};

		this.logInfo("**** _SETTINGS 9 " + settings.Campaign )

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
