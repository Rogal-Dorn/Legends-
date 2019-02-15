/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2015
 * 
 *  @Author:		Overhype Studios
 *  @Date:			03.03.2015
 *  @Description:	New Campaign Menu Module JS
 */
"use strict";

var NewLegendCampaignMenuModule = function()
{
    this.mSQHandle = null;

    // event listener
    this.mEventListener = null;

    // generic containers
    this.mContainer = null;
    this.mDialogContainer = null;

	// scenario list container
	this.mListContainer = null;
	this.mListScrollContainer = null;
	this.mDescriptionContainer = null;
	this.mDescriptionScrollContainer = null;

	this.mScenarioPanel = null;
    this.mFirstPanel = null;
    this.mSecondPanel = null;

	// controls
	this.mDifficultyEasyCheckbox = null;
	this.mDifficultyEasyLabel = null;
	this.mDifficultyNormalCheckbox = null;
	this.mDifficultyNormalLabel = null;
	this.mDifficultyHardCheckbox = null;
	this.mDifficultyHardLabel = null;

	this.mEconomicDifficultyEasyCheckbox = null;
	this.mEconomicDifficultyEasyLabel = null;
	this.mEconomicDifficultyNormalCheckbox = null;
	this.mEconomicDifficultyNormalLabel = null;
	this.mEconomicDifficultyHardCheckbox = null;
	this.mEconomicDifficultyHardLabel = null;

	this.mBudgetDifficultyEasyCheckbox = null;
	this.mBudgetDifficultyEasyLabel = null;
	this.mBudgetDifficultyNormalCheckbox = null;
	this.mBudgetDifficultyNormalLabel = null;
	this.mBudgetDifficultyHardCheckbox = null;
	this.mBudgetDifficultyHardLabel = null;

	this.mIronmanCheckbox = null;
	this.mIronmanCheckboxLabel = null;
	this.mCompanyName = null;

	this.mEvilRandomCheckbox = null;
	this.mEvilRandomLabel = null;
	this.mEvilWarCheckbox = null;
	this.mEvilWarLabel = null;
	this.mEvilGreenskinsCheckbox = null;
	this.mEvilGreenskinsLabel = null;
	this.mEvilUndeadCheckbox = null;
	this.mEvilUndeadLabel = null;
	this.mEvilNoneCheckbox = null;
	this.mEvilNoneLabel = null;
	this.mEvilNoDesctructionCheckbox = null;
	this.mEvilPermanentDestructionLabel = null;

	this.mPrevBannerButton = null;
	this.mNextBannerButton = null;
	this.mBannerImage = null;

	this.mSeed = null;

    // buttons
    this.mStartButton = null;
    this.mCancelButton = null;

	// banners
	this.mBanners = null;
	this.mCurrentBannerIndex = 0;

	// difficulty
	this.mDifficulty = 0;
	this.mEconomicDifficulty = 0;
	this.mBudgetDifficulty = 0;
	this.mEvil = 0;

	// Map config
	this.mMapOptions = {
		Width: {
			Control: null,
			Title: null,
			OptionsKey: 'map.width',
			Min: 0,
			Max: 0,
			Value: 0,
			Step: 1
		},
		Height: {
			Control: null,
			Title: null,
			OptionsKey: 'map.height',
			Min: 0,
			Max: 0,
			Value: 0,
			Step: 1
		},
		LandMassMult: {
			Control: null,
			Title: null,
			OptionsKey: 'map.landmassmult',
			Min: 0,
			Max: 0,
			Value: 0,
			Step: 1
		},
		WaterConnectivity: {
			Control: null,
			Title: null,
			OptionsKey: 'map.waterconnectivity',
			Min: 0,
			Max: 0,
			Value: 0,
			Step: 1
		},
		MinLandToWaterRatio: {
			Control: null,
			Title: null,
			OptionsKey: 'map.minlandtowaterratio',
			Min: 0,
			Max: 0,
			Value: 0,
			Step: 1
		},
		Snowline: {
			Control: null,
			Title: null,
			OptionsKey: 'map.snowline',
			Min: 0,
			Max: 0,
			Value: 0,
			Step: 1
		},
		Vision: {
			Control: null,
			Title: null,
			OptionsKey: 'map.vision',
			Min: 0,
			Max: 5000,
			Value: 500,
			Step: 100,
		},		
		NumSettlements: {
			Control: null,
			Title: null,
			OptionsKey: 'map.settlements',
			Min: 0,
			Max: 0,
			Value: 0,
			Step: 1
		},
		NumFactions: {
			Control: null,
			Title: null,
			OptionsKey: 'map.factions',
			Min: 0,
			Max: 0,
			Value: 0,
			Step: 1
		},
		ForestsMult: {
			Control: null,
			Title: null,
			OptionsKey: 'map.forests',
			Min: 0,
			Max: 0,
			Value: 0,
			Step: 1
		},
		SwampsMult: {
			Control: null,
			Title: null,
			OptionsKey: 'map.swamps',
			Min: 0,
			Max: 0,
			Value: 0,
			Step: 1
		},
		MountainsMult: {
			Control: null,
			Title: null,
			OptionsKey: 'map.mountains',
			Min: 0,
			Max: 0,
			Value: 0,
			Step: 1
		},						
		FOW : true,
		Debug: false
	};

	this.mMapConfigOpts = {};

	this.mFogofWarCheckbox = null;
	this.mFogofWarCheckboxLabel = null;
	this.mDebugCheckbox = null;
	this.mDebugCheckboxLabel = null;	
	
    // generics
    this.mIsVisible = false;
};


NewLegendCampaignMenuModule.prototype.isConnected = function ()
{
    return this.mSQHandle !== null;
};

NewLegendCampaignMenuModule.prototype.onConnection = function (_handle)
{
	this.mSQHandle = _handle;

    // notify listener
	if (this.mEventListener !== null && ('onModuleOnConnectionCalled' in this.mEventListener))
	{
        this.mEventListener.onModuleOnConnectionCalled(this);
    }
};

NewLegendCampaignMenuModule.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;

    // notify listener
	if (this.mEventListener !== null && ('onModuleOnDisconnectionCalled' in this.mEventListener))
	{
        this.mEventListener.onModuleOnDisconnectionCalled(this);
    }
};


NewLegendCampaignMenuModule.prototype.createDIV = function (_parentDiv)
{
    var self = this;

    // create: dialog container
    this.mContainer = $('<div class="new-campaign-menu-module display-none"/>');
    _parentDiv.append(this.mContainer);
    this.mDialogContainer = this.mContainer.createDialog('New Legends Campaign', null, null /*Path.GFX + Asset.HEADER_TACTICAL_COMBAT_DIALOG*/, false, 'dialog-800-720-2');


	var contentContainer = this.mContainer.findDialogContentContainer();
    this.mScenarioPanel = $('<div class="l-list-container display-block"></div>');
	contentContainer.append(this.mScenarioPanel);
	

    this.mListContainer = this.mScenarioPanel.createList(2);
	this.mListScrollContainer = this.mListContainer.findListScrollContainer();
	

	this.mFirstPanel = $('<div class="display-none"/>');
	contentContainer.append(this.mFirstPanel);

		var leftColumn = $('<div class="column"/>');
		this.mFirstPanel.append(leftColumn);
		var rightColumn = $('<div class="column"/>');
		this.mFirstPanel.append(rightColumn);

		// name
		var row = $('<div class="row" />');
		leftColumn.append(row);
		var title = $('<div class="title title-font-big font-color-title">Company Name</div>');
		row.append(title);

		var inputLayout = $('<div class="l-input"/>');
		row.append(inputLayout);
		this.mCompanyName = inputLayout.createInput('Battle Brothers', 0, 32, 1, function (_input)
		{
			if(self.mStartButton !== null) self.mStartButton.enableButton(_input.getInputTextLength() >= 1);
		}, 'title-font-big font-bold font-color-brother-name'); 
		this.mCompanyName.setInputText('Battle Brothers');

		// greater evil
		var row = $('<div class="row" />');
		leftColumn.append(row);
		var title = $('<div class="title title-font-big font-color-title">Late Game Crisis</div>');
		row.append(title);
		
		/*var evilNoneControl = $('<div class="control"></div>');
		row.append(evilNoneControl);
		this.mEvilNoneCheckbox = $('<input type="radio" id="cb-evil-none" name="evil"/>');
		evilNoneControl.append(this.mEvilNoneCheckbox);
		this.mEvilNoneLabel = $('<label class="text-font-normal font-color-subtitle" for="cb-evil-none">None</label>');
		evilNoneControl.append(this.mEvilNoneLabel);
		this.mEvilNoneCheckbox.iCheck({
			checkboxClass: 'icheckbox_flat-orange',
			radioClass: 'iradio_flat-orange',
			increaseArea: '30%'
		});
		this.mEvilNoneCheckbox.on('ifChecked', null, this, function (_event)
		{
			var self = _event.data;
			self.mEvil = 255;
		});*/

		var evilRandomControl = $('<div class="control"></div>');
		row.append(evilRandomControl);
		this.mEvilRandomCheckbox = $('<input type="radio" id="cb-evil-random" name="evil" checked />');
		evilRandomControl.append(this.mEvilRandomCheckbox);
		this.mEvilRandomLabel = $('<label class="text-font-normal font-color-subtitle" for="cb-evil-random">Random</label>');
		evilRandomControl.append(this.mEvilRandomLabel);
		this.mEvilRandomCheckbox.iCheck({
			checkboxClass: 'icheckbox_flat-orange',
			radioClass: 'iradio_flat-orange',
			increaseArea: '30%'
		});
		this.mEvilRandomCheckbox.on('ifChecked', null, this, function (_event)
		{
			var self = _event.data;
			self.mEvil = 0;
		});

		var evilWarControl = $('<div class="control"></div>');
		row.append(evilWarControl);
		this.mEvilWarCheckbox = $('<input type="radio" id="cb-evil-war" name="evil"/>');
		evilWarControl.append(this.mEvilWarCheckbox);
		this.mEvilWarLabel = $('<label class="text-font-normal font-color-subtitle" for="cb-evil-war">War</label>');
		evilWarControl.append(this.mEvilWarLabel);
		this.mEvilWarCheckbox.iCheck({
			checkboxClass: 'icheckbox_flat-orange',
			radioClass: 'iradio_flat-orange',
			increaseArea: '30%'
		});
		this.mEvilWarCheckbox.on('ifChecked', null, this, function (_event)
		{
			var self = _event.data;
			self.mEvil = 1;
		});

		var evilGreenskinsControl = $('<div class="control"></div>');
		row.append(evilGreenskinsControl);
		this.mEvilGreenskinsCheckbox = $('<input type="radio" id="cb-evil-greenskins" name="evil"/>');
		evilGreenskinsControl.append(this.mEvilGreenskinsCheckbox);
		this.mEvilGreenskinsLabel = $('<label class="text-font-normal font-color-subtitle" for="cb-evil-greenskins">Greenskin Invasion</label>');
		evilGreenskinsControl.append(this.mEvilGreenskinsLabel);
		this.mEvilGreenskinsCheckbox.iCheck({
			checkboxClass: 'icheckbox_flat-orange',
			radioClass: 'iradio_flat-orange',
			increaseArea: '30%'
		});
		this.mEvilGreenskinsCheckbox.on('ifChecked', null, this, function (_event)
		{
			var self = _event.data;
			self.mEvil = 2;
		});

		var evilUndeadControl = $('<div class="control"></div>');
		row.append(evilUndeadControl);
		this.mEvilUndeadCheckbox = $('<input type="radio" id="cb-evil-undead" name="evil"/>');
		evilUndeadControl.append(this.mEvilUndeadCheckbox);
		this.mEvilUndeadLabel = $('<label class="text-font-normal font-color-subtitle" for="cb-evil-undead">Undead Scourge</label>');
		evilUndeadControl.append(this.mEvilUndeadLabel);
		this.mEvilUndeadCheckbox.iCheck({
			checkboxClass: 'icheckbox_flat-orange',
			radioClass: 'iradio_flat-orange',
			increaseArea: '30%'
		});
		this.mEvilUndeadCheckbox.on('ifChecked', null, this, function (_event)
		{
			var self = _event.data;
			self.mEvil = 3;
		});

		var extraLateControl = $('<div class="control permanent-destruction-control"/>');
		row.append(extraLateControl);
		this.mEvilPermanentDestructionCheckbox = $('<input type="checkbox" id="cb-extra-late" checked/>');
		extraLateControl.append(this.mEvilPermanentDestructionCheckbox);
		this.mEvilPermanentDestructionLabel = $('<label class="text-font-normal font-color-subtitle" for="cb-extra-late">Permanent Destruction</label>');
		extraLateControl.append(this.mEvilPermanentDestructionLabel);
		this.mEvilPermanentDestructionCheckbox.iCheck({
			checkboxClass: 'icheckbox_flat-orange',
			radioClass: 'iradio_flat-orange',
			increaseArea: '30%'
		});

		// banner
		var row = $('<div class="row" />');
		rightColumn.append(row);
		//var title = $('<div class="title title-font-big font-color-title">Banner</div>');
		//row.append(title);

		var bannerContainer = $('<div class="banner-container" />');
		row.append(bannerContainer);

		var table = $('<table width="100%" height="100%"><tr><td width="10%"><div class="l-button prev-banner-button" /></td><td width="80%" class="banner-image-container"></td><td width="10%"><div class="l-button next-banner-button" /></td></tr></table>');
		bannerContainer.append(table);

		var prevBanner = table.find('.prev-banner-button:first');
		this.mPrevBannerButton = prevBanner.createImageButton(Path.GFX + Asset.BUTTON_PREVIOUS_BANNER, function ()
		{
			self.onPreviousBannerClicked();
		}, '', 6);

		var nextBanner = table.find('.next-banner-button:first');
		this.mNextBannerButton = nextBanner.createImageButton(Path.GFX + Asset.BUTTON_NEXT_BANNER, function ()
		{
			self.onNextBannerClicked();
		}, '', 6);

		var bannerImage = table.find('.banner-image-container:first');
		this.mBannerImage = bannerImage.createImage(Path.GFX + 'ui/banners/banner_01.png', function (_image)
		{
			_image.removeClass('display-none').addClass('display-block');
			//_image.centerImageWithinParent();
		}, null, 'display-none banner-image');

		// seed
		var row = $('<div class="row map-seed-control" />');
		leftColumn.append(row);
		var title = $('<div class="title title-font-big font-color-title">Map Seed</div>');
		row.append(title);

		var inputLayout = $('<div class="l-input"/>');
		row.append(inputLayout);
		this.mSeed = inputLayout.createInput('', 0, 10, 1, null, 'title-font-big font-bold font-color-brother-name');

	this.mSecondPanel = $('<div class="display-none"/>');
	contentContainer.append(this.mSecondPanel);
	{
		var leftColumn = $('<div class="column"/>');
		this.mSecondPanel.append(leftColumn);
		var rightColumn = $('<div class="column"/>');
		this.mSecondPanel.append(rightColumn);

		// economic difficulty
		var row = $('<div class="row" />');
		leftColumn.append(row);
		var title = $('<div class="title title-font-big font-color-title">Economic Difficulty</div>');
		row.append(title);

		var easyDifficultyControl = $('<div class="control"></div>');
		row.append(easyDifficultyControl);
		this.mEconomicDifficultyEasyCheckbox = $('<input type="radio" id="cb-economic-difficulty-easy" name="economic-difficulty" checked />');
		easyDifficultyControl.append(this.mEconomicDifficultyEasyCheckbox);
		this.mEconomicDifficultyEasyLabel = $('<label class="text-font-normal font-color-subtitle" for="cb-economic-difficulty-easy">Beginner</label>');
		easyDifficultyControl.append(this.mEconomicDifficultyEasyLabel);
		this.mEconomicDifficultyEasyCheckbox.iCheck({
			checkboxClass: 'icheckbox_flat-orange',
			radioClass: 'iradio_flat-orange',
			increaseArea: '30%'
		});
		this.mEconomicDifficultyEasyCheckbox.on('ifChecked', null, this, function (_event)
		{
			var self = _event.data;
			self.mEconomicDifficulty = 0;
		});

		var normalDifficultyControl = $('<div class="control"></div>');
		row.append(normalDifficultyControl);
		this.mEconomicDifficultyNormalCheckbox = $('<input type="radio" id="cb-economic-difficulty-normal" name="economic-difficulty" />');
		normalDifficultyControl.append(this.mEconomicDifficultyNormalCheckbox);
		this.mEconomicDifficultyNormalLabel = $('<label class="text-font-normal font-color-subtitle" for="cb-economic-difficulty-normal">Veteran</label>');
		normalDifficultyControl.append(this.mEconomicDifficultyNormalLabel);
		this.mEconomicDifficultyNormalCheckbox.iCheck({
			checkboxClass: 'icheckbox_flat-orange',
			radioClass: 'iradio_flat-orange',
			increaseArea: '30%'
		});
		this.mEconomicDifficultyNormalCheckbox.on('ifChecked', null, this, function (_event)
		{
			var self = _event.data;
			self.mEconomicDifficulty = 1;
		});

		var hardDifficultyControl = $('<div class="control"></div>');
		row.append(hardDifficultyControl);
		this.mEconomicDifficultyHardCheckbox = $('<input type="radio" id="cb-economic-difficulty-hard" name="economic-difficulty" />');
		hardDifficultyControl.append(this.mEconomicDifficultyHardCheckbox);
		this.mEconomicDifficultyHardLabel = $('<label class="text-font-normal font-color-subtitle" for="cb-economic-difficulty-hard">Expert</label>');
		hardDifficultyControl.append(this.mEconomicDifficultyHardLabel);
		this.mEconomicDifficultyHardCheckbox.iCheck({
			checkboxClass: 'icheckbox_flat-orange',
			radioClass: 'iradio_flat-orange',
			increaseArea: '30%'
		});
		this.mEconomicDifficultyHardCheckbox.on('ifChecked', null, this, function (_event)
		{
			var self = _event.data;
			self.mEconomicDifficulty = 2;
		});

		// starting budget difficulty
		var row = $('<div class="row" />');
		leftColumn.append(row);
		var title = $('<div class="title title-font-big font-color-title">Starting Funds</div>');
		row.append(title);

		var easyDifficultyControl = $('<div class="control"></div>');
		row.append(easyDifficultyControl);
		this.mBudgetDifficultyEasyCheckbox = $('<input type="radio" id="cb-budget-difficulty-easy" name="budget-difficulty" checked />');
		easyDifficultyControl.append(this.mBudgetDifficultyEasyCheckbox);
		this.mBudgetDifficultyEasyLabel = $('<label class="text-font-normal font-color-subtitle" for="cb-budget-difficulty-easy">High</label>');
		easyDifficultyControl.append(this.mBudgetDifficultyEasyLabel);
		this.mBudgetDifficultyEasyCheckbox.iCheck({
			checkboxClass: 'icheckbox_flat-orange',
			radioClass: 'iradio_flat-orange',
			increaseArea: '30%'
		});
		this.mBudgetDifficultyEasyCheckbox.on('ifChecked', null, this, function (_event)
		{
			var self = _event.data;
			self.mBudgetDifficulty = 0;
		});

		var normalDifficultyControl = $('<div class="control"></div>');
		row.append(normalDifficultyControl);
		this.mBudgetDifficultyNormalCheckbox = $('<input type="radio" id="cb-budget-difficulty-normal" name="budget-difficulty" />');
		normalDifficultyControl.append(this.mBudgetDifficultyNormalCheckbox);
		this.mBudgetDifficultyNormalLabel = $('<label class="text-font-normal font-color-subtitle" for="cb-budget-difficulty-normal">Medium</label>');
		normalDifficultyControl.append(this.mBudgetDifficultyNormalLabel);
		this.mBudgetDifficultyNormalCheckbox.iCheck({
			checkboxClass: 'icheckbox_flat-orange',
			radioClass: 'iradio_flat-orange',
			increaseArea: '30%'
		});
		this.mBudgetDifficultyNormalCheckbox.on('ifChecked', null, this, function (_event)
		{
			var self = _event.data;
			self.mBudgetDifficulty = 1;
		});

		var hardDifficultyControl = $('<div class="control"></div>');
		row.append(hardDifficultyControl);
		this.mBudgetDifficultyHardCheckbox = $('<input type="radio" id="cb-budget-difficulty-hard" name="budget-difficulty" />');
		hardDifficultyControl.append(this.mBudgetDifficultyHardCheckbox);
		this.mBudgetDifficultyHardLabel = $('<label class="text-font-normal font-color-subtitle" for="cb-budget-difficulty-hard">Low</label>');
		hardDifficultyControl.append(this.mBudgetDifficultyHardLabel);
		this.mBudgetDifficultyHardCheckbox.iCheck({
			checkboxClass: 'icheckbox_flat-orange',
			radioClass: 'iradio_flat-orange',
			increaseArea: '30%'
		});
		this.mBudgetDifficultyHardCheckbox.on('ifChecked', null, this, function (_event)
		{
			var self = _event.data;
			self.mBudgetDifficulty = 2;
		});

		// combat difficulty
		var row = $('<div class="row" />');
		rightColumn.append(row);
		var title = $('<div class="title title-font-big font-color-title">Combat Difficulty</div>');
		row.append(title);

		var easyDifficultyControl = $('<div class="control"></div>');
		row.append(easyDifficultyControl);
		this.mDifficultyEasyCheckbox = $('<input type="radio" id="cb-difficulty-easy" name="difficulty" checked />');
		easyDifficultyControl.append(this.mDifficultyEasyCheckbox);
		this.mDifficultyEasyLabel = $('<label class="text-font-normal font-color-subtitle" for="cb-difficulty-easy">Beginner</label>');
		easyDifficultyControl.append(this.mDifficultyEasyLabel);
		this.mDifficultyEasyCheckbox.iCheck({
			checkboxClass: 'icheckbox_flat-orange',
			radioClass: 'iradio_flat-orange',
			increaseArea: '30%'
		});
		this.mDifficultyEasyCheckbox.on('ifChecked', null, this, function (_event)
		{
			var self = _event.data;
			self.mDifficulty = 0;
		});

		var normalDifficultyControl = $('<div class="control"></div>');
		row.append(normalDifficultyControl);
		this.mDifficultyNormalCheckbox = $('<input type="radio" id="cb-difficulty-normal" name="difficulty" />');
		normalDifficultyControl.append(this.mDifficultyNormalCheckbox);
		this.mDifficultyNormalLabel = $('<label class="text-font-normal font-color-subtitle" for="cb-difficulty-normal">Veteran</label>');
		normalDifficultyControl.append(this.mDifficultyNormalLabel);
		this.mDifficultyNormalCheckbox.iCheck({
			checkboxClass: 'icheckbox_flat-orange',
			radioClass: 'iradio_flat-orange',
			increaseArea: '30%'
		});
		this.mDifficultyNormalCheckbox.on('ifChecked', null, this, function (_event)
		{
			var self = _event.data;
			self.mDifficulty = 1;
		});

		var hardDifficultyControl = $('<div class="control"></div>');
		row.append(hardDifficultyControl);
		this.mDifficultyHardCheckbox = $('<input type="radio" id="cb-difficulty-hard" name="difficulty" />');
		hardDifficultyControl.append(this.mDifficultyHardCheckbox);
		this.mDifficultyHardLabel = $('<label class="text-font-normal font-color-subtitle" for="cb-difficulty-hard">Expert</label>');
		hardDifficultyControl.append(this.mDifficultyHardLabel);
		this.mDifficultyHardCheckbox.iCheck({
			checkboxClass: 'icheckbox_flat-orange',
			radioClass: 'iradio_flat-orange',
			increaseArea: '30%'
		});
		this.mDifficultyHardCheckbox.on('ifChecked', null, this, function (_event)
		{
			var self = _event.data;
			self.mDifficulty = 2;
		});

		// combat difficulty
		var row = $('<div class="row" />');
		rightColumn.append(row);
		var title = $('<div class="title title-font-big font-color-title">Ironman Mode</div>');
		row.append(title);

		var ironmanControl = $('<div class="control ironman-control"/>');
		row.append(ironmanControl);
		this.mIronmanCheckbox = $('<input type="checkbox" id="cb-iron-man"/>');
		ironmanControl.append(this.mIronmanCheckbox);
		this.mIronmanCheckboxLabel = $('<label class="text-font-normal font-color-subtitle" for="cb-iron-man">Ironman</label>');
		ironmanControl.append(this.mIronmanCheckboxLabel);
		this.mIronmanCheckbox.iCheck({
			checkboxClass: 'icheckbox_flat-orange',
			radioClass: 'iradio_flat-orange',
			increaseArea: '30%'
		});
	}

	this.mMapPanel = $('<div class="display-none"/>');
	contentContainer.append(this.mMapPanel);
	this.buildMapConfig();

    // create footer button bar
    var footerButtonBar = $('<div class="l-button-bar"></div>');
    this.mDialogContainer.findDialogFooterContainer().append(footerButtonBar);

	var layout = $('<div class="l-random-button"/>');
	footerButtonBar.append(layout);
	this.mRandomButton = layout.createTextButton("Random", function ()
    {
		self.randomizeMapConfig();
	}, '', 1);
	this.mRandomButton.addClass('display-none')
	
    var layout = $('<div class="l-ok-button"/>');
    footerButtonBar.append(layout);
    this.mStartButton = layout.createTextButton("Next", function ()
    {
		self.advanceScreen();

    }, '', 1);

    layout = $('<div class="l-cancel-button"/>');
    footerButtonBar.append(layout);
    this.mCancelButton = layout.createTextButton("Cancel", function ()
    {
    	if (self.mScenarioPanel.hasClass('display-block'))
    	{
    		self.notifyBackendCancelButtonPressed();
		}
		else if (self.mFirstPanel.hasClass('display-block'))
    	{
			self.mScenarioPanel.removeClass('display-none').addClass('display-block');
			self.mFirstPanel.removeClass('display-block').addClass('display-none');
			self.mSecondPanel.removeClass('display-block').addClass('display-none');
			self.mMapPanel.removeClass('display-block').addClass('display-none')
    		self.mStartButton.changeButtonText("Next");
			self.mCancelButton.changeButtonText("Cancel");
			self.mRandomButton.removeClass('display-block').addClass('display-none');
		}
    	else if (self.mSecondPanel.hasClass('display-block'))
    	{
			self.mScenarioPanel.removeClass('display-block').addClass('display-none');
			self.mFirstPanel.removeClass('display-none').addClass('display-block');
			self.mSecondPanel.removeClass('display-block').addClass('display-none');
			self.mMapPanel.removeClass('display-block').addClass('display-none')
			self.mStartButton.changeButtonText("Next");
			self.mCancelButton.changeButtonText("Previous");
			self.mRandomButton.removeClass('display-block').addClass('display-none');
		} else 
		{
			self.mScenarioPanel.removeClass('display-block').addClass('display-none');
			self.mFirstPanel.removeClass('display-block').addClass('display-none');
			self.mSecondPanel.removeClass('display-none').addClass('display-block');
			self.mMapPanel.removeClass('display-block').addClass('display-none')
			self.mStartButton.changeButtonText("Next");
			self.mCancelButton.changeButtonText("Previous");
			self.mRandomButton.removeClass('display-block').addClass('display-none');
		}
    }, '', 1);

    this.mIsVisible = false;
};


NewLegendCampaignMenuModule.prototype.buildMapConfig = function ()
{
	var leftColumn = $('<div class="column"></div>');
	this.mMapPanel.append(leftColumn);
	var rightColumn = $('<div class="column"></div>');
	this.mMapPanel.append(rightColumn);

	this.createSliderControlDIV(this.mMapOptions.Width, 'Map Width', leftColumn);	
	this.createSliderControlDIV(this.mMapOptions.Height, 'Map Height', leftColumn);
	this.createSliderControlDIV(this.mMapOptions.LandMassMult, 'Land Mass Ratio', leftColumn);	
	this.createSliderControlDIV(this.mMapOptions.WaterConnectivity, 'Water Connectivity', leftColumn);
	//this.createSliderControlDIV(this.mMapOptions.MinLandToWaterRatio, 'Land To Water Ratio', leftColumn);
	this.createSliderControlDIV(this.mMapOptions.Snowline, 'Snowline', leftColumn);
	this.createSliderControlDIV(this.mMapOptions.MountainsMult, 'Mountain Density', rightColumn);
	this.createSliderControlDIV(this.mMapOptions.ForestsMult, 'Forest Density', rightColumn);
	this.createSliderControlDIV(this.mMapOptions.SwampsMult, 'Swamp Density', rightColumn);
	this.createSliderControlDIV(this.mMapOptions.NumSettlements, 'Settlements', rightColumn);
	this.createSliderControlDIV(this.mMapOptions.NumFactions, 'Factions', rightColumn);

	//this.createSliderControlDIV(this.mMapOptions.Vision, 'Vision', rightColumn);

	var row = $('<div class="row"></div>');
	rightColumn.append(row);
	var control = $('<div class="control"/>');
	row.append(control);
	this.mFogofWarCheckbox = $('<input type="checkbox" id="cb-fog-of-war"/>');
	control.append(this.mFogofWarCheckbox);
	this.mFogofWarCheckboxLabel = $('<label class="text-font-normal font-color-subtitle" for="cb-fog-of-war">Settlements start hidden</label>');
	control.append(this.mFogofWarCheckboxLabel);
	this.mFogofWarCheckbox.iCheck({
		checkboxClass: 'icheckbox_flat-orange',
		radioClass: 'iradio_flat-orange',
		increaseArea: '30%'
	});
	if (this.mMapOptions.FOW)
	{
		this.mFogofWarCheckbox.iCheck('check');
	}

	var row = $('<div class="row"></div>');
	leftColumn.append(row);
	var control = $('<div class="control"/>');
	row.append(control);
	this.mDebugCheckbox = $('<input type="checkbox" id="cb-debug"/>');
	control.append(this.mDebugCheckbox);
	this.mDebugCheckboxLabel = $('<label class="text-font-normal font-color-subtitle" for="cb-debug">Debug</label>');
	control.append(this.mDebugCheckboxLabel);
	this.mDebugCheckbox.iCheck({
		checkboxClass: 'icheckbox_flat-orange',
		radioClass: 'iradio_flat-orange',
		increaseArea: '30%'
	});
	if (this.mMapOptions.Debug)
	{
		this.mDebugCheckbox.iCheck('check');
	}
};

NewLegendCampaignMenuModule.prototype.updateMapConfig = function () 
{
	var controls = [
		this.mMapOptions.Width,
		this.mMapOptions.Height,
		this.mMapOptions.LandMassMult,
		this.mMapOptions.WaterConnectivity,
		this.mMapOptions.Snowline,
		this.mMapOptions.NumSettlements,
		this.mMapOptions.NumFactions,
		this.mMapOptions.ForestsMult,
		this.mMapOptions.SwampsMult,
		this.mMapOptions.MountainsMult
	]
	controls.forEach(function (_definition) {
		_definition.Control.attr('min', _definition.Min);
		_definition.Control.attr('max', _definition.Max);
		_definition.Control.attr('step', _definition.Step);
		_definition.Control.val(_definition.Value);
		_definition.Label.text('' + _definition.Value);
	});
	if (this.mMapOptions.FOW)
	{
		this.mFogofWarCheckbox.iCheck('check');
	}
	if (this.mMapOptions.Debug)
	{
		this.mDebugCheckbox.iCheck('check');
	}	
}

NewLegendCampaignMenuModule.prototype.randomizeMapConfig = function ()
{

	this.mMapOptions.Width.Value = Helper.getRandomInt(this.mMapOptions.Width.Min, this.mMapOptions.Width.Max);
	this.mMapOptions.Height.Value = Helper.getRandomInt(this.mMapOptions.Height.Min, this.mMapOptions.Height.Max);
	this.mMapOptions.LandMassMult.Value = Helper.getRandomInt(this.mMapOptions.LandMassMult.Min, this.mMapOptions.LandMassMult.Max);
	this.mMapOptions.WaterConnectivity.Value = Helper.getRandomInt(this.mMapOptions.WaterConnectivity.Min, this.mMapOptions.WaterConnectivity.Max);
	this.mMapOptions.Snowline.Value = Helper.weightedRandom(this.mMapOptions.Snowline.Min, this.mMapOptions.Snowline.Max, 90, 5);
	this.mMapOptions.NumSettlements.Value = Helper.getRandomInt(this.mMapOptions.NumSettlements.Min, this.mMapOptions.NumSettlements.Max);
	this.mMapOptions.NumFactions.Value = Helper.getRandomInt(this.mMapOptions.NumFactions.Min, this.mMapOptions.NumFactions.Max);
	this.mMapOptions.ForestsMult.Value = Helper.getRandomInt(this.mMapOptions.ForestsMult.Min, this.mMapOptions.ForestsMult.Max);
	this.mMapOptions.SwampsMult.Value = Helper.getRandomInt(this.mMapOptions.SwampsMult.Min, this.mMapOptions.SwampsMult.Max);
	this.mMapOptions.MountainsMult.Value = Helper.getRandomInt(this.mMapOptions.MountainsMult.Min, this.mMapOptions.MountainsMult.Max);
	this.updateMapConfig();
}

NewLegendCampaignMenuModule.prototype.createSliderControlDIV = function (_definition, _label, _parentDiv)
{
    var self = this;
	var row = $('<div class="row"></div>');
	_parentDiv.append(row);
	_definition.Title = $('<div class="title title-font-big font-bold font-color-title">' + _label + '</div>');
	row.append(_definition.Title);

	var control = $('<div class="scale-control"></div>');
	row.append(control);

	_definition.Control = $('<input class="scale-slider" type="range"/>');
	_definition.Control.attr('min', _definition.Min);
	_definition.Control.attr('max', _definition.Max);
	_definition.Control.attr('step', _definition.Step);
	_definition.Control.val(_definition.Value);
	control.append(_definition.Control);

	_definition.Label = $('<div class="scale-label text-font-normal font-color-subtitle">' +_definition.Value + '</div>');
	control.append(_definition.Label);

	_definition.Control.on("change", function ()
	{
		_definition.Value = parseInt(_definition.Control.val());
		_definition.Label.text('' + _definition.Value);
	});
};


NewLegendCampaignMenuModule.prototype.advanceScreen = function() 
{
	if(this.mScenarioPanel.hasClass('display-block'))
	{
		this.mScenarioPanel.removeClass('display-block').addClass('display-none');
		this.mFirstPanel.removeClass('display-none').addClass('display-block');
		this.mSecondPanel.removeClass('display-block').addClass('display-none');
		this.mMapPanel.removeClass('display-block').addClass('display-none')
		this.mStartButton.changeButtonText("Next");
		this.mCancelButton.changeButtonText("Previous");
		this.mRandomButton.addClass('display-none').removeClass('display-block');

	} else if(this.mFirstPanel.hasClass('display-block'))
	{
		this.mFirstPanel.removeClass('display-block').addClass('display-none');
		this.mSecondPanel.addClass('display-block').removeClass('display-none');
		this.mMapPanel.removeClass('display-block').addClass('display-none')
		this.mStartButton.changeButtonText("Next");
		this.mCancelButton.changeButtonText("Previous");
		this.mRandomButton.addClass('display-none').removeClass('display-block');

	} else if(this.mSecondPanel.hasClass('display-block'))
	{
		this.mFirstPanel.removeClass('display-block').addClass('display-none');
		this.mSecondPanel.removeClass('display-block').addClass('display-none');
		this.mMapPanel.removeClass('display-none').addClass('display-block')
		this.mStartButton.changeButtonText("Start");
		this.mCancelButton.changeButtonText("Previous");
		this.mRandomButton.addClass('display-block').removeClass('display-none');
	}	
	else
	{
		this.notifyBackendStartButtonPressed();
	}    	

}

NewLegendCampaignMenuModule.prototype.destroyDIV = function ()
{
	this.mListContainer.destroyList();
    this.mListContainer = null;
    this.mListScrollContainer = null;


    // controls
	this.mDifficultyEasyCheckbox.remove();
	this.mDifficultyEasyCheckbox = null;
	this.mDifficultyEasyLabel.remove();
	this.mDifficultyEasyLabel = null;
	this.mDifficultyNormalCheckbox.remove();
	this.mDifficultyNormalCheckbox = null;
	this.mDifficultyNormalLabel.remove();
	this.mDifficultyNormalLabel = null;
	this.mDifficultyHardCheckbox.remove();
	this.mDifficultyHardCheckbox = null;
	this.mDifficultyHardLabel.remove();
	this.mDifficultyHardLabel = null;
	this.mCompanyName.remove();
	this.mCompanyName = null;

	this.mPrevBannerButton.remove();
	this.mPrevBannerButton = null;
	this.mNextBannerButton.remove();
	this.mNextBannerButton = null;
	this.mBannerImage.remove();
	this.mBannerImage = null;

	this.mSeed.remove();
	this.mSeed = null;

	// buttons
    this.mStartButton.remove();
    this.mStartButton = null;
    this.mCancelButton.remove();
    this.mCancelButton = null;

    this.mFirstPanel.empty();
    this.mFirstPanel.remove();
    this.mFirstPanel = null;

    this.mSecondPanel.empty();
    this.mSecondPanel.remove();
    this.mSecondPanel = null;

	this.mMapPanel.empty();
    this.mMapPanel.remove();
	this.mMapPanel = null;

    this.mDialogContainer.empty();
    this.mDialogContainer.remove();
    this.mDialogContainer = null;

    this.mContainer.empty();
    this.mContainer.remove();
    this.mContainer = null;
};


NewLegendCampaignMenuModule.prototype.bindTooltips = function ()
{
	this.mCompanyName.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.CompanyName });
	this.mSeed.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.Seed });

	this.mDifficultyEasyLabel.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.DifficultyEasy });
	this.mDifficultyEasyCheckbox.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.DifficultyEasy });

	this.mDifficultyNormalLabel.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.DifficultyNormal });
	this.mDifficultyNormalCheckbox.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.DifficultyNormal });

	this.mDifficultyHardLabel.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.DifficultyHard });
	this.mDifficultyHardCheckbox.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.DifficultyHard });

	this.mIronmanCheckboxLabel.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.Ironman });
	this.mIronmanCheckbox.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.Ironman });

	this.mEconomicDifficultyEasyLabel.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.EconomicDifficultyEasy });
	this.mEconomicDifficultyEasyCheckbox.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.EconomicDifficultyEasy });

	this.mEconomicDifficultyNormalLabel.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.EconomicDifficultyNormal });
	this.mEconomicDifficultyNormalCheckbox.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.EconomicDifficultyNormal });

	this.mEconomicDifficultyHardLabel.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.EconomicDifficultyHard });
	this.mEconomicDifficultyHardCheckbox.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.EconomicDifficultyHard });

	this.mBudgetDifficultyEasyLabel.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.BudgetDifficultyEasy });
	this.mBudgetDifficultyEasyCheckbox.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.BudgetDifficultyEasy });

	this.mBudgetDifficultyNormalLabel.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.BudgetDifficultyNormal });
	this.mBudgetDifficultyNormalCheckbox.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.BudgetDifficultyNormal });

	this.mBudgetDifficultyHardLabel.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.BudgetDifficultyHard });
	this.mBudgetDifficultyHardCheckbox.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.BudgetDifficultyHard });

	this.mEvilRandomLabel.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.EvilRandom });
	this.mEvilRandomCheckbox.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.EvilRandom });

	/*this.mEvilNoneLabel.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.EvilNone });
	this.mEvilNoneCheckbox.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.EvilNone });*/

	this.mEvilWarLabel.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.EvilWar });
	this.mEvilWarCheckbox.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.EvilWar });

	this.mEvilGreenskinsLabel.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.EvilGreenskins });
	this.mEvilGreenskinsCheckbox.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.EvilGreenskins });

	this.mEvilUndeadLabel.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.EvilUndead });
	this.mEvilUndeadCheckbox.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.EvilUndead });

	this.mEvilPermanentDestructionLabel.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.EvilPermanentDestruction });
	this.mEvilPermanentDestructionCheckbox.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.MenuScreen.NewCampaign.EvilPermanentDestruction });

	this.mMapOptions.Width.Control.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.width' });
	this.mMapOptions.Width.Title.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.width' });
	
	this.mMapOptions.Height.Control.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.height' });
	this.mMapOptions.Height.Title.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.height' });	
	
	this.mMapOptions.LandMassMult.Control.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.landmass' });
	this.mMapOptions.LandMassMult.Title.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.landmass' });

	this.mMapOptions.WaterConnectivity.Control.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.water' });
	this.mMapOptions.WaterConnectivity.Title.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.water' });	

	this.mMapOptions.Snowline.Control.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.snowline' });
	this.mMapOptions.Snowline.Title.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.snowline' });	

	this.mMapOptions.MountainsMult.Control.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.mountains' });
	this.mMapOptions.MountainsMult.Title.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.mountains' });	

	this.mMapOptions.ForestsMult.Control.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.forest' });
	this.mMapOptions.ForestsMult.Title.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.forest' });	

	this.mMapOptions.SwampsMult.Control.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.swamp' });
	this.mMapOptions.SwampsMult.Title.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.swamp' });	

	this.mMapOptions.NumSettlements.Control.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.settlements' });
	this.mMapOptions.NumSettlements.Title.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.settlements' });	

	this.mMapOptions.NumFactions.Control.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.factions' });
	this.mMapOptions.NumFactions.Title.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.factions' });	

	this.mFogofWarCheckbox.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.fow' });
	this.mFogofWarCheckboxLabel.bindTooltip({ contentType: 'ui-element', elementId: 'mapconfig.fow' });
};

NewLegendCampaignMenuModule.prototype.unbindTooltips = function ()
{
	this.mCompanyName.unbindTooltip();
	this.mSeed.unbindTooltip();

	this.mDifficultyEasyLabel.unbindTooltip();
	this.mDifficultyEasyCheckbox.unbindTooltip();

	this.mDifficultyNormalLabel.unbindTooltip();
	this.mDifficultyNormalCheckbox.unbindTooltip();

	this.mDifficultyHardLabel.unbindTooltip();
	this.mDifficultyHardCheckbox.unbindTooltip();

	this.mEconomicDifficultyEasyLabel.unbindTooltip();
	this.mEconomicDifficultyEasyCheckbox.unbindTooltip();

	this.mEconomicDifficultyNormalLabel.unbindTooltip();
	this.mEconomicDifficultyNormalCheckbox.unbindTooltip();

	this.mEconomicDifficultyHardLabel.unbindTooltip();
	this.mEconomicDifficultyHardCheckbox.unbindTooltip();

	this.mBudgetDifficultyEasyLabel.unbindTooltip();
	this.mBudgetDifficultyEasyCheckbox.unbindTooltip();

	this.mBudgetDifficultyNormalLabel.unbindTooltip();
	this.mBudgetDifficultyNormalCheckbox.unbindTooltip();

	this.mBudgetDifficultyHardLabel.unbindTooltip();
	this.mBudgetDifficultyHardCheckbox.unbindTooltip();

	this.mIronmanCheckboxLabel.unbindTooltip();
	this.mIronmanCheckbox.unbindTooltip();

	this.mEvilRandomLabel.unbindTooltip();
	this.mEvilRandomCheckbox.unbindTooltip();

	/*this.mEvilNoneLabel.unbindTooltip();
	this.mEvilNoneCheckbox.unbindTooltip();*/

	this.mEvilWarLabel.unbindTooltip();
	this.mEvilWarCheckbox.unbindTooltip();

	this.mEvilGreenskinsLabel.unbindTooltip();
	this.mEvilGreenskinsCheckbox.unbindTooltip();

	this.mEvilUndeadLabel.unbindTooltip();
	this.mEvilUndeadCheckbox.unbindTooltip();

	this.mEvilPermanentDestructionLabel.unbindTooltip();
	this.mEvilPermanentDestructionCheckbox.unbindTooltip();

	this.mMapOptions.Width.Control.unbindTooltip();
	this.mMapOptions.Width.Title.unbindTooltip();

	this.mMapOptions.Height.Control.unbindTooltip();
	this.mMapOptions.Height.Title.unbindTooltip();

	this.mMapOptions.LandMassMult.Control.unbindTooltip();
	this.mMapOptions.LandMassMult.Title.unbindTooltip();

	this.mMapOptions.WaterConnectivity.Control.unbindTooltip();
	this.mMapOptions.WaterConnectivity.Title.unbindTooltip();

	this.mMapOptions.Snowline.Control.unbindTooltip();
	this.mMapOptions.Snowline.Title.unbindTooltip();

	this.mMapOptions.MountainsMult.Control.unbindTooltip();
	this.mMapOptions.MountainsMult.Title.unbindTooltip();

	this.mMapOptions.ForestsMult.Control.unbindTooltip();
	this.mMapOptions.ForestsMult.Title.unbindTooltip();

	this.mMapOptions.SwampsMult.Control.unbindTooltip();
	this.mMapOptions.SwampsMult.Title.unbindTooltip();

	this.mMapOptions.NumSettlements.Control.unbindTooltip();
	this.mMapOptions.NumSettlements.Title.unbindTooltip();

	this.mMapOptions.NumFactions.Control.unbindTooltip();
	this.mMapOptions.NumFactions.Title.unbindTooltip();

	this.mFogofWarCheckbox.unbindTooltip();
	this.mFogofWarCheckboxLabel.unbindTooltip();

};


NewLegendCampaignMenuModule.prototype.create = function(_parentDiv)
{
    this.createDIV(_parentDiv);
    this.bindTooltips();
};

NewLegendCampaignMenuModule.prototype.destroy = function()
{
    this.unbindTooltips();
    this.destroyDIV();
};


NewLegendCampaignMenuModule.prototype.register = function (_parentDiv)
{
    console.log('NewLegendCampaignMenuModule::REGISTER');

    if (this.mContainer !== null)
    {
        console.error('ERROR: Failed to register New Campaign Menu Module. Reason: New Campaign Menu Module is already initialized.');
        return;
    }

    if (_parentDiv !== null && typeof(_parentDiv) == 'object')
    {
        this.create(_parentDiv);
    }
};

NewLegendCampaignMenuModule.prototype.unregister = function ()
{
    console.log('NewLegendCampaignMenuModule::UNREGISTER');

    if (this.mContainer === null)
    {
        console.error('ERROR: Failed to unregister New Campaign Menu Module. Reason: New Campaign Menu Module is not initialized.');
        return;
    }

    this.destroy();
};

NewLegendCampaignMenuModule.prototype.isRegistered = function ()
{
    if (this.mContainer !== null)
    {
        return this.mContainer.parent().length !== 0;
    }

    return false;
};


NewLegendCampaignMenuModule.prototype.registerEventListener = function(_listener)
{
    this.mEventListener = _listener;
};


NewLegendCampaignMenuModule.prototype.show = function (_campaignData)
{
	// reseed
	//this.mSeed.setInputText(Math.round(Math.random() * 9999999).toString(16));

    this.addCampaignsToList(_campaignData);

    var seed = "";
    var characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    for(var i = 0; i < 10; i++)
        seed += characters.charAt(Math.floor(Math.random() * characters.length));

    this.mSeed.setInputText(seed);

	// reset panels
	this.mScenarioPanel.addClass('display-block').removeClass('display-none');
	this.mFirstPanel.addClass('display-none').removeClass('display-block');
	this.mSecondPanel.addClass('display-none').removeClass('display-block');
	this.mMapPanel.addClass('display-none').removeClass('display-block');

	this.mStartButton.changeButtonText("Next");
	this.mCancelButton.changeButtonText("Cancel");
	this.mRandomButton.removeClass('display-block').addClass('display-none');

	var self = this;

    var offset = -(this.mContainer.parent().width() + this.mContainer.width());
    this.mContainer.css({ 'left' : offset });
    this.mContainer.velocity("finish", true).velocity({ opacity: 1, left: '0', right: '0' },
	{
        duration: Constants.SCREEN_SLIDE_IN_OUT_DELAY,
        easing: 'swing',
        begin: function ()
        {
            $(this).removeClass('display-none').addClass('display-block');
            self.notifyBackendModuleAnimating();
        },
        complete: function ()
        {
            self.mIsVisible = true;
            self.notifyBackendModuleShown();
        }
    });
};

NewLegendCampaignMenuModule.prototype.hide = function ()
{
    var self = this;

    var offset = -(this.mContainer.parent().width() + this.mContainer.width());
    this.mContainer.velocity("finish", true).velocity({ opacity: 0, left: offset },
	{
        duration: Constants.SCREEN_SLIDE_IN_OUT_DELAY,
        easing: 'swing',
        begin: function ()
        {
            self.notifyBackendModuleAnimating();
        },
        complete: function ()
        {
            self.mIsVisible = false;
            $(this).removeClass('display-block').addClass('display-none');
            self.notifyBackendModuleHidden();
        }
    });
};

NewLegendCampaignMenuModule.prototype.isVisible = function ()
{
    return this.mIsVisible;
};

NewLegendCampaignMenuModule.prototype.addCampaignsToList = function (_campaigns)
{
	if (_campaigns !== null && jQuery.isArray(_campaigns))
	{
		this.mListScrollContainer.empty();
        this.mStartButton.enableButton(false);
        this.mCancelButton.enableButton(true);

		for (var i = 0; i < _campaigns.length; ++i)
		{
			this.addCampaignEntryToList(_campaigns[i]);
		}

		//this.selectFirstCampaign();
	}
};

NewLegendCampaignMenuModule.prototype.addCampaignEntryToList = function (_data)
{
    var self = this;

    var entry = this.mListScrollContainer.createListCampaign(_data);
	entry.assignListCampaignName(_data["name"]);
	entry.assignListCampaignGroupName(_data["description"]);
	if (CampaignMenuModulesIdentifier.Campaign.Image in _data)
    {
		entry.assignListImage('ui/icons/' + _data[CampaignMenuModulesIdentifier.Campaign.Image] + '.png');
    }

    // if (CampaignMenuModulesIdentifier.Campaign.GroupName in _data)
    // {
    //     entry.assignListCampaignGroupName(_data[CampaignMenuModulesIdentifier.Campaign.GroupName]);
    // }

	// if(_data["isIncompatibleVersion"])
	// {
	// 	entry.assignListCampaignDayName("- Incompatible Version or DLC Missing -");
	// 	entry.addClass('is-disabled');
	// }
	// else
	// {
	// 	if (CampaignMenuModulesIdentifier.Campaign.DayName in _data)
	// 	{
	// 		entry.assignListCampaignDayName(_data[CampaignMenuModulesIdentifier.Campaign.DayName]);
	// 	}
	// }

    // if (CampaignMenuModulesIdentifier.Campaign.CreationDate in _data)
    // {
    //     entry.assignListCampaignDateTime(_data[CampaignMenuModulesIdentifier.Campaign.CreationDate]);
    // }

    entry.assignListCampaignClickHandler(function (_entry, _event)
	{
        // check if this is already selected
        if (_entry.hasClass('is-selected') !== true)
        {
            // deselect all entries first
            self.mListScrollContainer.find('.is-selected:first').each(function (index, el)
            {
                $(el).removeClass('is-selected');
            });

			_entry.addClass('is-selected');

			self.mStartButton.enableButton(true);
			self.advanceScreen();

		}
		
    });

    entry.assignListCampaignDoubleClickHandler(function (_entry, _event)
    {
        // check if this is already selected
    	if (_entry.hasClass('is-selected') === true && !_data["isIncompatibleVersion"])
        {
			this.mStartButton.enableButton(true);
			this.advanceScreen();
        }		
    });
};


NewLegendCampaignMenuModule.prototype.onPreviousBannerClicked = function()
{
	--this.mCurrentBannerIndex;

	if(this.mCurrentBannerIndex < 0)
		this.mCurrentBannerIndex = this.mBanners.length - 1;

	this.mBannerImage.attr('src', Path.GFX + 'ui/banners/' + this.mBanners[this.mCurrentBannerIndex] + '.png');
};


NewLegendCampaignMenuModule.prototype.onNextBannerClicked = function()
{
	++this.mCurrentBannerIndex;

	if(this.mCurrentBannerIndex >= this.mBanners.length)
		this.mCurrentBannerIndex = 0;

	this.mBannerImage.attr('src', Path.GFX + 'ui/banners/' + this.mBanners[this.mCurrentBannerIndex] + '.png');
};


NewLegendCampaignMenuModule.prototype.setBanners = function(_data)
{
	if(_data !== null && jQuery.isArray(_data))
	{
		this.mBanners = _data;
		this.mCurrentBannerIndex = Math.floor(Math.random() * _data.length);

		this.mBannerImage.attr('src', Path.GFX + 'ui/banners/' + _data[this.mCurrentBannerIndex] + '.png');
	}
	else
	{
		console.error('ERROR: No banners specified for NewCampaignMenu::setBanners');
	}
}

NewLegendCampaignMenuModule.prototype.setConfigOpts = function(_data)
{
	if(_data !== null)
	{
		this.mMapConfigOpts = _data;

		if ('Height' in _data) {
			this.mMapOptions.Height.Value = _data['Height'];
			this.mMapOptions.Height.Min = _data['HeightMin'];
			this.mMapOptions.Height.Max = _data['HeightMax'];
		}
		if ('Width' in _data) {
			this.mMapOptions.Width.Value = _data['Width'];
			this.mMapOptions.Width.Min = _data['WidthMin'];
			this.mMapOptions.Width.Max = _data['WidthMax'];
		}
		if ('LandMassMult' in _data) {
			this.mMapOptions.LandMassMult.Value = _data['LandMassMult'];
			this.mMapOptions.LandMassMult.Min = _data['LandMassMultMin'];
			this.mMapOptions.LandMassMult.Max = _data['LandMassMultMax'];
		}
		if ('WaterConnectivity' in _data) {
			this.mMapOptions.WaterConnectivity.Value = _data['WaterConnectivity'];
			this.mMapOptions.WaterConnectivity.Min = _data['WaterConnectivityMin'];
			this.mMapOptions.WaterConnectivity.Max = _data['WaterConnectivityMax'];
		}
		if ('MinLandToWaterRatio' in _data) {
			this.mMapOptions.MinLandToWaterRatio.Value = _data['MinLandToWaterRatio'];
			this.mMapOptions.MinLandToWaterRatio.Min = _data['MinLandToWaterRatioMin'];
			this.mMapOptions.MinLandToWaterRatio.Max = _data['MinLandToWaterRatioMax'];
		}
		if ('Snowline' in _data) {
			this.mMapOptions.Snowline.Value = _data['Snowline'];
			this.mMapOptions.Snowline.Min = _data['SnowlineMin'];
			this.mMapOptions.Snowline.Max = _data['SnowlineMax'];
		}
		if ('NumSettlements' in _data) {
			this.mMapOptions.NumSettlements.Value = _data['NumSettlements'];
			this.mMapOptions.NumSettlements.Min = _data['NumSettlementsMin'];
			this.mMapOptions.NumSettlements.Max = _data['NumSettlementsMax'];
		}
		if ('NumFactions' in _data) {
			this.mMapOptions.NumFactions.Value = _data['NumFactions'];
			this.mMapOptions.NumFactions.Min = _data['NumFactionsMin'];
			this.mMapOptions.NumFactions.Max = _data['NumFactionsMax'];
		}
		if ('ForestsMult' in _data) {
			this.mMapOptions.ForestsMult.Value = _data['ForestsMult'];
			this.mMapOptions.ForestsMult.Min = _data['ForestsMultMin'];
			this.mMapOptions.ForestsMult.Max = _data['ForestsMultMax'];
		}
		if ('SwampsMult' in _data) {
			this.mMapOptions.SwampsMult.Value = _data['SwampsMult'];
			this.mMapOptions.SwampsMult.Min = _data['SwampsMultMin'];
			this.mMapOptions.SwampsMult.Max = _data['SwampsMultMax'];
		}	
		if ('MountainsMult' in _data) {
			this.mMapOptions.MountainsMult.Value = _data['MountainsMult'];
			this.mMapOptions.MountainsMult.Min = _data['MountainsMultMin'];
			this.mMapOptions.MountainsMult.Max = _data['MountainsMultMax'];
		}		
		if ('FOW' in _data) {
			this.mMapOptions.FOW = _data['FOW'];
		}
		if ('Debug' in _data) {
			this.mMapOptions.Debug = _data['Debug'];
		}
	}
	else
	{
		console.error('ERROR: No opts specified for NewCampaignMenu::setConfigOpts');
	}
	this.updateMapConfig();

}


NewLegendCampaignMenuModule.prototype.collectSettings = function()
{
	var settings = [];

	// company name
	settings.push(this.mCompanyName.getInputText());

	// banner
	settings.push(this.mBanners[this.mCurrentBannerIndex]);

	// difficulty
	settings.push(this.mDifficulty);
	settings.push(this.mEconomicDifficulty);
	settings.push(this.mBudgetDifficulty);
	settings.push(this.mIronmanCheckbox.is(':checked'));
	settings.push(this.mEvil);
	settings.push(this.mEvilPermanentDestructionCheckbox.is(':checked'));
	settings.push(this.mSeed.getInputText());
	settings.push(this.mMapOptions.Width.Value);	
	settings.push(this.mMapOptions.Height.Value);	
	settings.push(this.mMapOptions.LandMassMult.Value);	
	settings.push(this.mMapOptions.WaterConnectivity.Value);	
	settings.push(this.mMapOptions.MinLandToWaterRatio.Value);	
	settings.push(this.mMapOptions.Snowline.Value);	
	settings.push(this.mMapOptions.NumSettlements.Value);	
	settings.push(this.mMapOptions.NumFactions.Value);
	// settings.push(this.mMapOptions.Vision.Value);	
	settings.push(this.mFogofWarCheckbox.is(':checked'));
	settings.push(this.mMapOptions.ForestsMult.Value);
	settings.push(this.mMapOptions.SwampsMult.Value);
	settings.push(this.mMapOptions.MountainsMult.Value);
	settings.push(this.mDebugCheckbox.is(':checked'));	
	var selectedEntry = this.mListScrollContainer.find('.is-selected:first');
	settings.push(selectedEntry.data('campaign').banner);	
	return settings;

}


NewLegendCampaignMenuModule.prototype.notifyBackendModuleShown = function ()
{
    if (this.mSQHandle !== null)
    {
        SQ.call(this.mSQHandle, 'onModuleShown');
    }
};

NewLegendCampaignMenuModule.prototype.notifyBackendModuleHidden = function ()
{
    if (this.mSQHandle !== null)
    {
        SQ.call(this.mSQHandle, 'onModuleHidden');
    }
};

NewLegendCampaignMenuModule.prototype.notifyBackendModuleAnimating = function ()
{
    if (this.mSQHandle !== null)
    {
        SQ.call(this.mSQHandle, 'onModuleAnimating');
    }
};

NewLegendCampaignMenuModule.prototype.notifyBackendStartButtonPressed = function ()
{
	if (this.mSQHandle !== null)
	{
		var settings = this.collectSettings();
		SQ.call(this.mSQHandle, 'onStartButtonPressed', settings);
	}
};

NewLegendCampaignMenuModule.prototype.notifyBackendCancelButtonPressed = function ()
{
    if (this.mSQHandle !== null)
    {
        SQ.call(this.mSQHandle, 'onCancelButtonPressed');
    }
};