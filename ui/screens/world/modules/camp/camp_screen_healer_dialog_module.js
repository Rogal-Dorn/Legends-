
"use strict";

var CampScreenHealerDialogModule = function(_parent)
{
	this.mSQHandle = null;
    this.mParent = _parent;

	this.mRoster = null;

    // event listener
    this.mEventListener = null;

	// generic containers
	this.mContainer = null;
    this.mDialogContainer = null;

    // buttons
    this.mLeaveButton = null;

    // generics
    this.mIsVisible = false;
};


CampScreenHealerDialogModule.prototype.isConnected = function ()
{
    return this.mSQHandle !== null;
};

CampScreenHealerDialogModule.prototype.onConnection = function (_handle)
{
	//if (typeof(_handle) == 'string')
	{
		this.mSQHandle = _handle;

        // notify listener
        if (this.mEventListener !== null && ('onModuleOnConnectionCalled' in this.mEventListener))
		{
            this.mEventListener.onModuleOnConnectionCalled(this);
        }
	}
};

CampScreenHealerDialogModule.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;

    // notify listener
    if (this.mEventListener !== null && ('onModuleOnDisconnectionCalled' in this.mEventListener))
	{
        this.mEventListener.onModuleOnDisconnectionCalled(this);
    }
};

CampScreenHealerDialogModule.prototype.createDIV = function (_parentDiv)
{
    var self = this;

    // create: containers (init hidden!)
    this.mContainer = $('<div class="l-commander-dialog-container display-none opacity-none"/>');
    _parentDiv.append(this.mContainer);
    this.mDialogContainer = this.mContainer.createDialog('Commander', '', '', true, 'dialog-1024-768');

    // create footer button bar
    var footerButtonBar = $('<div class="l-button-bar"/>');
    this.mDialogContainer.findDialogFooterContainer().append(footerButtonBar);

    // create: buttons
    var layout = $('<div class="l-leave-button"/>');
    footerButtonBar.append(layout);
    this.mLeaveButton = layout.createTextButton("Leave", function() {
        self.notifyBackendLeaveButtonPressed();
    }, '', 1);

    this.mIsVisible = false;
};

CampScreenHealerDialogModule.prototype.destroyDIV = function ()
{
	this.mLeaveButton.remove();
    this.mLeaveButton = null;

    this.mDialogContainer.empty();
    this.mDialogContainer.remove();
    this.mDialogContainer = null;

    this.mContainer.empty();
    this.mContainer.remove();
    this.mContainer = null;
};


CampScreenHealerDialogModule.prototype.bindTooltips = function ()
{
    //this.mAssets.bindTooltips();
    this.mLeaveButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.WorldTownScreen.HireDialogModule.LeaveButton });
};

CampScreenHealerDialogModule.prototype.unbindTooltips = function ()
{
	//this.mAssets.unbindTooltips();
    this.mLeaveButton.unbindTooltip();
};


CampScreenHealerDialogModule.prototype.create = function(_parentDiv)
{
    this.createDIV(_parentDiv);
    this.bindTooltips();
};

CampScreenHealerDialogModule.prototype.destroy = function()
{
    this.unbindTooltips();
    this.destroyDIV();
};


CampScreenHealerDialogModule.prototype.register = function (_parentDiv)
{
    console.log('CampScreenHealerDialogModule::REGISTER');

    if (this.mContainer !== null)
    {
        console.error('ERROR: Failed to register World Town Screen Hire Dialog Module. Reason: World Town Screen Hire Dialog Module is already initialized.');
        return;
    }

    if (_parentDiv !== null && typeof(_parentDiv) == 'object')
    {
        this.create(_parentDiv);
    }
};

CampScreenHealerDialogModule.prototype.unregister = function ()
{
    console.log('CampScreenHealerDialogModule::UNREGISTER');

    if (this.mContainer === null)
    {
        console.error('ERROR: Failed to unregister World Town Screen Hire Dialog Module. Reason: World Town Screen Hire Dialog Module is not initialized.');
        return;
    }

    this.destroy();
};

CampScreenHealerDialogModule.prototype.isRegistered = function ()
{
    if (this.mContainer !== null)
    {
        return this.mContainer.parent().length !== 0;
    }

    return false;
};


CampScreenHealerDialogModule.prototype.registerEventListener = function(_listener)
{
    this.mEventListener = _listener;
};


CampScreenHealerDialogModule.prototype.show = function (_withSlideAnimation)
{
    var self = this;

    var withAnimation = (_withSlideAnimation !== undefined && _withSlideAnimation !== null) ? _withSlideAnimation : true;
    if (withAnimation === true)
    {
        var offset = -(this.mContainer.parent().width() + this.mContainer.width());
        this.mContainer.css({ 'left': offset });
        this.mContainer.velocity("finish", true).velocity({ opacity: 1, left: '0', right: '0' }, {
            duration: Constants.SCREEN_SLIDE_IN_OUT_DELAY,
            easing: 'swing',
            begin: function () {
                $(this).removeClass('display-none').addClass('display-block');
                self.notifyBackendModuleAnimating();
            },
            complete: function () {
                self.mIsVisible = true;
                self.notifyBackendModuleShown();
            }
        });
    }
    else
    {
        this.mContainer.css({ opacity: 0 });
        this.mContainer.velocity("finish", true).velocity({ opacity: 1 }, {
            duration: Constants.SCREEN_FADE_IN_OUT_DELAY,
            easing: 'swing',
            begin: function() {
                $(this).removeClass('display-none').addClass('display-block');
                self.notifyBackendModuleAnimating();
            },
            complete: function() {
                self.mIsVisible = true;
                self.notifyBackendModuleShown();
            }
        });
    }
};

CampScreenHealerDialogModule.prototype.hide = function ()
{
    var self = this;

    var offset = -(this.mContainer.parent().width() + this.mContainer.width());
    this.mContainer.velocity("finish", true).velocity({ opacity: 0, left: offset },
	{
        duration: Constants.SCREEN_SLIDE_IN_OUT_DELAY,
        easing: 'swing',
        begin: function ()
        {
            $(this).removeClass('is-center');
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

CampScreenHealerDialogModule.prototype.isVisible = function ()
{
    return this.mIsVisible;
};

CampScreenHealerDialogModule.prototype.updateAssets = function (_data)
{
	this.mAssets.loadFromData(_data);
	//this.updateListEntryValues();
}

CampScreenHealerDialogModule.prototype.loadFromData = function (_data)
{
	if(_data === undefined || _data === null)
    {
        return;
    }
};


CampScreenHealerDialogModule.prototype.notifyBackendModuleShown = function ()
{
    SQ.call(this.mSQHandle, 'onModuleShown');
};

CampScreenHealerDialogModule.prototype.notifyBackendModuleHidden = function ()
{
    SQ.call(this.mSQHandle, 'onModuleHidden');
};

CampScreenHealerDialogModule.prototype.notifyBackendModuleAnimating = function ()
{
    SQ.call(this.mSQHandle, 'onModuleAnimating');
};

CampScreenHealerDialogModule.prototype.notifyBackendLeaveButtonPressed = function ()
{
	SQ.call(this.mSQHandle, 'onLeaveButtonPressed');
};