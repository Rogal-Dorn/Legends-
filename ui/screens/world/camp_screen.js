/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2017
 * 
 *  @Author:		Overhype Studios
 *  @Date:			31.10.2017
 *  @Description:	World Town Screen JS
 */
"use strict";


var CampScreen = function()
{
	this.mSQHandle				    = null;

	// generic containers
	this.mContainer				    = null;

    // modules
    this.mMainDialogModule		    = null;
    this.mHireDialogModule		    = null;
    this.mShopDialogModule		    = null;
	this.mTravelDialogModule	    = null;
	this.mBarberDialogModule	    = null;
	this.mTempleDialogModule	    = null;
	this.mTavernDialogModule	    = null;
    this.mTrainingDialogModule      = null;
    this.mTaxidermistDialogModule   = null;
	this.mActiveModule			    = null;

	this.mAssetValues			    = null;

    this.createModules();
};


CampScreen.prototype.isConnected = function ()
{
    return this.mSQHandle !== null;
};

CampScreen.prototype.onConnection = function (_handle)
{
	this.mSQHandle = _handle;
	this.register($('.root-screen'));
};

CampScreen.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;

    this.mMainDialogModule.onDisconnection();
    // this.mHireDialogModule.onDisconnection();
    // this.mShopDialogModule.onDisconnection();
	// this.mTravelDialogModule.onDisconnection();
	// this.mBarberDialogModule.onDisconnection();
	// this.mTempleDialogModule.onDisconnection();
	// this.mTavernDialogModule.onDisconnection();
    // this.mTrainingDialogModule.onDisconnection();
    // this.mTaxidermistDialogModule.onDisconnection();

	this.unregister();
};

CampScreen.prototype.onModuleOnConnectionCalled = function (_module)
{
    // check if every module is connected
    if ((this.mMainDialogModule !== null && this.mMainDialogModule.isConnected()) ) //&&
        // (this.mHireDialogModule !== null && this.mHireDialogModule.isConnected()) &&
		// (this.mTravelDialogModule !== null && this.mTravelDialogModule.isConnected()) &&
		// (this.mTempleDialogModule !== null && this.mTempleDialogModule.isConnected()) &&
		// (this.mBarberDialogModule !== null && this.mBarberDialogModule.isConnected()) &&
		// (this.mTavernDialogModule !== null && this.mTavernDialogModule.isConnected()) &&
        // (this.mTrainingDialogModule !== null && this.mTrainingDialogModule.isConnected()) &&
        // (this.mTaxidermistDialogModule !== null && this.mTaxidermistDialogModule.isConnected()) &&
        // (this.mShopDialogModule !== null && this.mShopDialogModule.isConnected()) )
    {
        this.notifyBackendOnConnected();
    }
};

CampScreen.prototype.onModuleOnDisconnectionCalled = function (_module)
{
    // check if every module is disconnected
    if ((this.mMainDialogModule === null && !this.mMainDialogModule.isConnected()) )//&&
    //     (this.mHireDialogModule === null && !this.mHireDialogModule.isConnected()) &&
	// 	(this.mTravelDialogModule === null && !this.mTravelDialogModule.isConnected()) &&
	// 	(this.mTempleDialogModule === null && !this.mTempleDialogModule.isConnected()) &&
	// 	(this.mBarberDialogModule === null && !this.mBarberDialogModule.isConnected()) &&
	// 	(this.mTavernDialogModule === null && !this.mTavernDialogModule.isConnected()) &&
    //     (this.mTrainingDialogModule === null && !this.mTrainingDialogModule.isConnected()) &&
    //     (this.mTaxidermistDialogModule === null && !this.mTaxidermistDialogModule.isConnected()) &&
    //     (this.mShopDialogModule === null && !this.mShopDialogModule.isConnected()) )
    {
        this.notifyBackendOnDisconnected();
    }
};

CampScreen.prototype.createDIV = function (_parentDiv)
{
	// create: containers (init hidden!)
    this.mContainer = $('<div class="world-town-screen ui-control dialog-modal-background display-none opacity-none"/>');
    _parentDiv.append(this.mContainer);
};

CampScreen.prototype.destroyDIV = function ()
{
    this.mContainer.empty();
    this.mContainer.remove();
    this.mContainer = null;
};

CampScreen.prototype.createModules = function()
{
    this.mMainDialogModule = new CampScreenMainDialogModule(this);
    // this.mHireDialogModule = new CampScreenHireDialogModule(this);
    // this.mShopDialogModule = new CampScreenShopDialogModule(this);
    // this.mTravelDialogModule = new CampScreenTravelDialogModule(this);
    // this.mTempleDialogModule = new CampScreenTempleDialogModule(this);
	// this.mBarberDialogModule = new CampScreenBarberDialogModule(this);
	// this.mTavernDialogModule = new CampScreenTavernDialogModule(this);
    // this.mTrainingDialogModule = new CampScreenTrainingDialogModule(this);
    // this.mTaxidermistDialogModule = new CampScreenTaxidermistDialogModule(this);
};

CampScreen.prototype.registerModules = function ()
{
    this.mMainDialogModule.register(this.mContainer);
    // this.mHireDialogModule.register(this.mContainer);
    // this.mShopDialogModule.register(this.mContainer);
    // this.mTravelDialogModule.register(this.mContainer);
    // this.mTempleDialogModule.register(this.mContainer);
	// this.mBarberDialogModule.register(this.mContainer);
	// this.mTavernDialogModule.register(this.mContainer);
    // this.mTrainingDialogModule.register(this.mContainer);
    // this.mTaxidermistDialogModule.register(this.mContainer);
};

CampScreen.prototype.unregisterModules = function ()
{
    this.mMainDialogModule.unregister();
    // this.mHireDialogModule.unregister();
    // this.mShopDialogModule.unregister();
    // this.mTravelDialogModule.unregister();
    // this.mTempleDialogModule.unregister();
	// this.mBarberDialogModule.unregister();
	// this.mTavernDialogModule.unregister();
    // this.mTrainingDialogModule.unregister();
    // this.mTaxidermistDialogModule.unregister();
};

CampScreen.prototype.create = function(_parentDiv)
{
    this.createDIV(_parentDiv);
    this.registerModules();
};

CampScreen.prototype.destroy = function()
{
    this.unregisterModules();
    this.destroyDIV();
};


CampScreen.prototype.register = function (_parentDiv)
{
    console.log('CampScreen::REGISTER');

    if(this.mContainer !== null)
    {
        console.error('ERROR: Failed to register World Town Screen. Reason: World Town Screen is already initialized.');
        return;
    }

    if(_parentDiv !== null && typeof(_parentDiv) == 'object')
    {
        this.create(_parentDiv);
    }
};

CampScreen.prototype.unregister = function ()
{
    console.log('CampScreen::UNREGISTER');

    if(this.mContainer === null)
    {
        console.error('ERROR: Failed to unregister World Town Screen. Reason: World Town Screen is not initialized.');
        return;
    }

    this.destroy();
};

CampScreen.prototype.show = function (_data)
{
    if(_data !== undefined && _data !== null && typeof(_data) === 'object')
    {
        this.mMainDialogModule.loadFromData(_data);
		this.loadAssetData(_data['Assets']);
    }

	this.mActiveModule = null;

    var self = this;
    this.mContainer.velocity("finish", true).velocity({ opacity: 1 },
	{
        duration: Constants.SCREEN_FADE_IN_OUT_DELAY,
        easing: 'swing',
        begin: function ()
        {
            $(this).css({ opacity: 0 });
            $(this).removeClass('display-none').addClass('display-block');
            self.notifyBackendOnAnimating();
            self.showMainDialog(null);
        },
        complete: function ()
        {
            self.notifyBackendOnShown();
        }
    });
};

CampScreen.prototype.hide = function ()
{
    var self = this;

	this.mActiveModule = null;

    this.mContainer.velocity("finish", true).velocity({ opacity: 0 },
	{
        duration: Constants.SCREEN_FADE_IN_OUT_DELAY,
        easing: 'swing',
		begin: function()
		{
		    self.notifyBackendOnAnimating();
        },
		complete: function()
		{
		    $(this).css({ opacity: 0 });
		    $(this).removeClass('display-block').addClass('display-none');
		    self.mMainDialogModule.mDialogContainer.findDialogContentContainer().empty();
            self.notifyBackendOnHidden();
        }
    });
};

CampScreen.prototype.hideAllDialogs = function (_withSlideAnimation)
{
    this.mMainDialogModule.hide(false);
    
	if(this.mActiveModule != null)
	{
		this.mActiveModule.hide(_withSlideAnimation);
		this.mActiveModule = null;
	}

	this.mContainer.removeClass('display-block').addClass('display-none');
};

CampScreen.prototype.refresh = function (_data)
{
    if (_data !== undefined && _data !== null && typeof (_data) === 'object')
    {
        this.mMainDialogModule.loadFromData(_data);
        this.loadAssetData(_data['Assets']);
    }

    if (this.mActiveModule != null)
    {
        this.mActiveModule.hide();
        this.mActiveModule = null;
    }

    this.mMainDialogModule.show(false);
};

CampScreen.prototype.updateContracts = function (_data)
{
	this.mMainDialogModule.updateContracts(_data);
}

CampScreen.prototype.showMainDialog = function (/*_withSlideAnimation,*/ _data)
{
	var _withSlideAnimation = true;

	this.mContainer.addClass('display-block').removeClass('display-none');

	if(this.mActiveModule != null)
		this.mActiveModule.hide(false);

	this.mActiveModule = null;

	if (_data != null)
	    this.mAssetValues = null;
	else
	    _withSlideAnimation = false;

	this.loadAssetData(_data);
	this.mMainDialogModule.show(_withSlideAnimation);
};

CampScreen.prototype.showHireDialog = function (/*_withSlideAnimation,*/ _data)
{
	var _withSlideAnimation = true;

	this.mContainer.addClass('display-block').removeClass('display-none');

	if(this.mActiveModule != null)
		this.mActiveModule.hide(_withSlideAnimation);
	else
		this.mMainDialogModule.hide();

	this.mActiveModule = this.mHireDialogModule;

	if(_data !== undefined && _data !== null && typeof(_data) === 'object')
    {
		this.loadAssetData(_data.Assets);
		this.mHireDialogModule.loadFromData(_data.Roster);
    }

    this.mHireDialogModule.show(_withSlideAnimation);
};

CampScreen.prototype.showShopDialog = function (/*_withSlideAnimation,*/ _data)
{
	var _withSlideAnimation = true;

	this.mContainer.addClass('display-block').removeClass('display-none');

	if (this.mActiveModule != null)
		this.mActiveModule.hide(_withSlideAnimation);
	else
		this.mMainDialogModule.hide();

	this.mActiveModule = this.mShopDialogModule;

	if(_data !== undefined && _data !== null && typeof(_data) === 'object')
    {
		this.loadAssetData(_data.Assets);
		this.mShopDialogModule.loadFromData(_data);
    }

    this.mShopDialogModule.show(_withSlideAnimation, _data);
};

CampScreen.prototype.showTravelDialog = function (/*_withSlideAnimation,*/ _data)
{
	var _withSlideAnimation = true;

	this.mContainer.addClass('display-block').removeClass('display-none');

	if(this.mActiveModule != null)
		this.mActiveModule.hide(_withSlideAnimation);
	else
		this.mMainDialogModule.hide();

	this.mActiveModule = this.mTravelDialogModule;

	if(_data !== undefined && _data !== null && typeof(_data) === 'object')
    {
		this.loadAssetData(_data.Assets);
		this.mTravelDialogModule.loadFromData(_data.Data);
    }

    this.mTravelDialogModule.show(_withSlideAnimation);
};

CampScreen.prototype.showBarberDialog = function (/*_withSlideAnimation,*/ _data)
{
	var _withSlideAnimation = true;

	this.mContainer.addClass('display-block').removeClass('display-none');

	if(this.mActiveModule != null)
		this.mActiveModule.hide(_withSlideAnimation);
	else
		this.mMainDialogModule.hide();

	this.mActiveModule = this.mBarberDialogModule;

	if(_data !== undefined && _data !== null && typeof(_data) === 'object')
    {
		this.loadAssetData(_data.Assets);
		this.mBarberDialogModule.loadFromData(_data);
    }

    this.mBarberDialogModule.show(_withSlideAnimation);
};

CampScreen.prototype.showTempleDialog = function (/*_withSlideAnimation,*/ _data)
{
	var _withSlideAnimation = true;

	this.mContainer.addClass('display-block').removeClass('display-none');

	if (this.mActiveModule != null)
		this.mActiveModule.hide(_withSlideAnimation);
	else
		this.mMainDialogModule.hide();

	this.mActiveModule = this.mTempleDialogModule;

	if (_data !== undefined && _data !== null && typeof (_data) === 'object')
	{
		this.loadAssetData(_data.Assets);
		this.mTempleDialogModule.loadFromData(_data);
	}

	this.mTempleDialogModule.show(_withSlideAnimation);
};

CampScreen.prototype.showTrainingDialog = function (/*_withSlideAnimation,*/ _data)
{
	var _withSlideAnimation = true;

	this.mContainer.addClass('display-block').removeClass('display-none');

	if (this.mActiveModule != null)
		this.mActiveModule.hide(_withSlideAnimation);
	else
		this.mMainDialogModule.hide();

	this.mActiveModule = this.mTrainingDialogModule;

	if (_data !== undefined && _data !== null && typeof (_data) === 'object')
	{
		this.loadAssetData(_data.Assets);
		this.mTrainingDialogModule.loadFromData(_data);
	}

	this.mTrainingDialogModule.show(_withSlideAnimation);
};

CampScreen.prototype.showTaxidermistDialog = function (/*_withSlideAnimation,*/ _data)
{
    var _withSlideAnimation = true;

    this.mContainer.addClass('display-block').removeClass('display-none');

    if (this.mActiveModule != null)
        this.mActiveModule.hide(_withSlideAnimation);
    else
        this.mMainDialogModule.hide();

    this.mActiveModule = this.mTaxidermistDialogModule;

    if (_data !== undefined && _data !== null && typeof (_data) === 'object')
    {
        this.loadAssetData(_data.Assets);
        this.mTaxidermistDialogModule.loadFromData(_data);
    }

    this.mTaxidermistDialogModule.show(_withSlideAnimation);
};

CampScreen.prototype.showTavernDialog = function (/*_withSlideAnimation,*/ _data)
{
	var _withSlideAnimation = true;

	this.mContainer.addClass('display-block').removeClass('display-none');

	if(this.mActiveModule != null)
		this.mActiveModule.hide(_withSlideAnimation);
	else
		this.mMainDialogModule.hide();

	this.mActiveModule = this.mTavernDialogModule;

	if(_data !== undefined && _data !== null && typeof(_data) === 'object')
    {
		this.loadAssetData(_data.Assets);
		this.mTavernDialogModule.loadFromData(_data);
    }

    this.mTavernDialogModule.show(_withSlideAnimation);
};

CampScreen.prototype.loadAssetData = function (_data)
{
    if(_data !== undefined && _data !== null)
    {     
		this.mMainDialogModule.updateAssets(_data);

		if(this.mActiveModule != null)
			this.mActiveModule.updateAssets(_data);

		this.mAssetValues = _data;
    }
};

CampScreen.prototype.getModule = function (_name)
{
	switch(_name)
	{
        case 'CampMainDialogModule': return this.mMainDialogModule;
        case 'HireDialogModule': return this.mHireDialogModule;
        case 'ShopDialogModule': return this.mShopDialogModule;
		case 'TravelDialogModule': return this.mTravelDialogModule;
		case 'TempleDialogModule': return this.mTempleDialogModule;
		case 'BarberDialogModule': return this.mBarberDialogModule;
		case 'TavernDialogModule': return this.mTavernDialogModule;
        case 'TrainingDialogModule': return this.mTrainingDialogModule;
        case 'TaxidermistDialogModule': return this.mTaxidermistDialogModule;
        default: return null;
	}
};

CampScreen.prototype.getModules = function ()
{
	return [
        { name: 'CampMainDialogModule', module: this.mMainDialogModule },
        { name: 'HireDialogModule', module: this.mHireDialogModule },
		{ name: 'TravelDialogModule', module: this.mTravelDialogModule },
        { name: 'ShopDialogModule', module: this.mShopDialogModule },
		{ name: 'TempleDialogModule', module: this.mTempleDialogModule },
		{ name: 'BarberDialogModule', module: this.mBarberDialogModule },
        { name: 'TrainingDialogModule', module: this.mTrainingDialogModule },
        { name: 'TaxidermistDialogModule', module: this.mTaxidermistDialogModule },
		{ name: 'TavernDialogModule', module: this.mTavernDialogModule }
    ];
};

CampScreen.prototype.notifyBackendOnConnected = function ()
{
	if(this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenConnected');
	}
};

CampScreen.prototype.notifyBackendOnDisconnected = function ()
{
	if(this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenDisconnected');
	}
};

CampScreen.prototype.notifyBackendOnShown = function ()
{
    if(this.mSQHandle !== null)
    {
        SQ.call(this.mSQHandle, 'onScreenShown');
    }
};

CampScreen.prototype.notifyBackendOnHidden = function ()
{
    if(this.mSQHandle !== null)
    {
        SQ.call(this.mSQHandle, 'onScreenHidden');
    }
};

CampScreen.prototype.notifyBackendOnAnimating = function ()
{
    if(this.mSQHandle !== null)
    {
        SQ.call(this.mSQHandle, 'onScreenAnimating');
    }
};

CampScreen.prototype.notifyBackendBrothersButtonPressed = function ()
{
    if(this.mSQHandle !== null)
    {
        SQ.call(this.mSQHandle, 'onBrothersButtonPressed');
    }
};

CampScreen.prototype.notifyBackendSlotClicked = function (_data)
{
    if(this.mSQHandle !== null)
    {
        SQ.call(this.mSQHandle, 'onSlotClicked', _data);
    }
};

CampScreen.prototype.notifyBackendContractClicked = function (_data)
{
    if(this.mSQHandle !== null)
    {
        SQ.call(this.mSQHandle, 'onContractClicked', _data);
    }
};