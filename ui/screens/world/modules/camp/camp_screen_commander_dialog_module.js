
"use strict";

var CampScreenCommanderDialogModule = function(_parent)
{
	this.mSQHandle = null;
    this.mParent = _parent;

	this.mRoster = null;

    // event listener
    this.mEventListener = null;

	// generic containers
	this.mContainer = null;
    this.mDialogContainer = null;


    this.mTentListScrollContainer = null;
    this.mTents = null;

    this.mNumActive = 0;
    this.IsMoodVisible = true;
    this.mSlots = null;

    // buttons
    this.mLeaveButton = null;

    // generics
    this.mIsVisible = false;
};


CampScreenCommanderDialogModule.prototype.isConnected = function ()
{
    return this.mSQHandle !== null;
};

CampScreenCommanderDialogModule.prototype.onConnection = function (_handle)
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

CampScreenCommanderDialogModule.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;

    // notify listener
    if (this.mEventListener !== null && ('onModuleOnDisconnectionCalled' in this.mEventListener))
	{
        this.mEventListener.onModuleOnDisconnectionCalled(this);
    }
};

CampScreenCommanderDialogModule.prototype.createDIV = function (_parentDiv)
{
    var self = this;

    // create: containers (init hidden!)
    this.mContainer = $('<div class="l-commander-dialog-container display-none opacity-none"/>');
    _parentDiv.append(this.mContainer);
    this.mDialogContainer = this.mContainer.createDialog('Commander', '', '', true, 'dialog-1280-768');

    // create content
    var content = this.mDialogContainer.findDialogContentContainer();

    // top row
    var row = $('<div class="top-row"/>');
    content.append(row);
    var listContainerLayout = $('<div class="l-list-container"/>');
    row.append(listContainerLayout)
    this.mTentListContainer = listContainerLayout.createList(1.24/*8.63*/);
    this.mTentListScrollContainer = this.mTentListContainer.findListScrollContainer();
    this.mTents = this.createActionSlots(this.mTentListScrollContainer)

    var row = $('<div class="middle-row"/>');
    content.append(row);

    // bottom row
    row = $('<div class="bottom-row"/>');
    content.append(row);
    var stats = $('<div class="stats"/>');
    row.append(stats);
    var listContainerLayout = $('<div class="l-list-container"/>');
    row.append(listContainerLayout);
    this.mSlots = this.createBrotherSlots(listContainerLayout);

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

CampScreenCommanderDialogModule.prototype.destroyDIV = function ()
{
	this.mLeaveButton.remove();
    this.mLeaveButton = null;

    this.mTentListScrollContainer.empty();
    this.mTentListScrollContainer = null;

    this.mDialogContainer.empty();
    this.mDialogContainer.remove();
    this.mDialogContainer = null;

    this.mContainer.empty();
    this.mContainer.remove();
    this.mContainer = null;
};

CampScreenCommanderDialogModule.prototype.createActionSlots = function (_parentDiv)
{
    var mSlots = [null, null, null, null, null, null, null, null, null, null, null, null, null, null];

    var dropHandler = function (ev, dd)
    {
        var drag = $(dd.drag);
        var drop = $(dd.drop);
        var proxy = $(dd.proxy);

        if (proxy === undefined || proxy.data('idx') === undefined || drop === undefined || drop.data('idx') === undefined)
        {
            return false;
        }

        drag.removeClass('is-dragged');

        // do the swapping
        //self.swapSlots(drag.data('idx'), drop.data('idx'));
    };
    for (var i = 0; i < 14; ++i)
    {
        mSlots[i] = $('<div class="ui-control is-camp-action-slot"/>');
        _parentDiv.append(mSlots[i]);
        mSlots[i].data('idx', i);
        mSlots[i].data('child', null);
        mSlots[i].drop("end", dropHandler);
    }
    return mSlots;
}

CampScreenCommanderDialogModule.prototype.createBrotherSlots = function (_parentDiv)
{
    var self = this;

    var mSlots = [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null ];

    var dropHandler = function (ev, dd)
    {
        var drag = $(dd.drag);
        var drop = $(dd.drop);
        var proxy = $(dd.proxy);

        if (proxy === undefined || proxy.data('idx') === undefined || drop === undefined || drop.data('idx') === undefined)
        {
            return false;
        }

        drag.removeClass('is-dragged');

        if (drag.data('idx') == drop.data('idx'))
        {
            return false;
        }

        // number in formation is limited
        if (self.mNumActive >= self.mNumActiveMax && drag.data('idx') > 27 && drop.data('idx') <= 27 && self.mSlots[drop.data('idx')].data('child') == null)
        {
            return false;
        }

        // always keep at least 1 in formation
        if (self.mNumActive == 1 && drag.data('idx') <= 27 && drop.data('idx') > 27 && self.mSlots[drop.data('idx')].data('child') == null)
        {
            return false;
        }

        // do the swapping
        self.swapSlots(drag.data('idx'), drop.data('idx'));
    };

    for (var i = 0; i < 27; ++i)
    {
        // if(!reserve)
        //     mSlots[i] = $('<div class="ui-control is-brother-slot is-roster-slot"/>');
        // else
        mSlots[i] = $('<div class="ui-control is-brother-slot is-roster-slot"/>');

        _parentDiv.append(mSlots[i]);

        mSlots[i].data('idx', i);
        mSlots[i].data('child', null);
        mSlots[i].drop("end", dropHandler);
    }
    return mSlots;

    /*$('.is-brother-slot')
      .drop("start", function ()
      {
          $(this).addClass("is-active-slot");
      })
      .drop("end", function ()
      {
          $(this).removeClass("is-active-slot");
      });*/
}


CampScreenCommanderDialogModule.prototype.bindTooltips = function ()
{
    //this.mAssets.bindTooltips();
    this.mLeaveButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.WorldTownScreen.HireDialogModule.LeaveButton });
};

CampScreenCommanderDialogModule.prototype.unbindTooltips = function ()
{
	//this.mAssets.unbindTooltips();
    this.mLeaveButton.unbindTooltip();
};


CampScreenCommanderDialogModule.prototype.create = function(_parentDiv)
{
    this.createDIV(_parentDiv);
    this.bindTooltips();
};

CampScreenCommanderDialogModule.prototype.destroy = function()
{
    this.unbindTooltips();
    this.destroyDIV();
};


CampScreenCommanderDialogModule.prototype.register = function (_parentDiv)
{
    console.log('CampScreenCommanderDialogModule::REGISTER');

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

CampScreenCommanderDialogModule.prototype.unregister = function ()
{
    console.log('CampScreenCommanderDialogModule::UNREGISTER');

    if (this.mContainer === null)
    {
        console.error('ERROR: Failed to unregister World Town Screen Hire Dialog Module. Reason: World Town Screen Hire Dialog Module is not initialized.');
        return;
    }

    this.destroy();
};

CampScreenCommanderDialogModule.prototype.isRegistered = function ()
{
    if (this.mContainer !== null)
    {
        return this.mContainer.parent().length !== 0;
    }

    return false;
};


CampScreenCommanderDialogModule.prototype.registerEventListener = function(_listener)
{
    this.mEventListener = _listener;
};


CampScreenCommanderDialogModule.prototype.show = function (_withSlideAnimation)
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

CampScreenCommanderDialogModule.prototype.hide = function ()
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

CampScreenCommanderDialogModule.prototype.isVisible = function ()
{
    return this.mIsVisible;
};

CampScreenCommanderDialogModule.prototype.updateAssets = function (_data)
{
	this.mAssets.loadFromData(_data);
	//this.updateListEntryValues();
}

CampScreenCommanderDialogModule.prototype.loadFromData = function (_data)
{
	if(_data === undefined || _data === null)
    {
        return;
    }

    this.onBrothersListLoaded(_data.brothers);
    this.onTentsListLoaded(_data.buildings);

};

CampScreenCommanderDialogModule.prototype.notifyBackendModuleShown = function ()
{
    SQ.call(this.mSQHandle, 'onModuleShown');
};

CampScreenCommanderDialogModule.prototype.notifyBackendModuleHidden = function ()
{
    SQ.call(this.mSQHandle, 'onModuleHidden');
};

CampScreenCommanderDialogModule.prototype.notifyBackendModuleAnimating = function ()
{
    SQ.call(this.mSQHandle, 'onModuleAnimating');
};

CampScreenCommanderDialogModule.prototype.notifyBackendLeaveButtonPressed = function ()
{
	SQ.call(this.mSQHandle, 'onLeaveButtonPressed');
};




CampScreenCommanderDialogModule.prototype.addBrotherSlotDIV = function (_parentDiv, _data, _index, _allowReordering)
{
    var self = this;

    // create: slot & background layer
    var result = _parentDiv.createListBrother(_data[CharacterScreenIdentifier.Entity.Id]);
    result.attr('id', 'slot-index_' + _data[CharacterScreenIdentifier.Entity.Id]);
    result.data('ID', _data[CharacterScreenIdentifier.Entity.Id]);
    result.data('idx', _index);

    this.mSlots[_index].data('child', result);

    if (_index <= 27)
        ++this.mNumActive;

    // drag handler
    if (_allowReordering)
    {
        result.drag("start", function (ev, dd)
        {
            // dont allow drag if this is an empty slot
            /*var data = $(this).data('item');
            if (data.isEmpty === true)
            {
                return false;
            }*/

            // build proxy
            var proxy = $('<div class="ui-control brother is-proxy"/>');
            proxy.appendTo(document.body);
            proxy.data('idx', _index);

            var imageLayer = result.find('.image-layer:first');
            if (imageLayer.length > 0)
            {
                imageLayer = imageLayer.clone();
                proxy.append(imageLayer);
            }

            $(dd.drag).addClass('is-dragged');

            return proxy;
        }, { distance: 3 });

        result.drag(function (ev, dd)
        {
            $(dd.proxy).css({ top: dd.offsetY, left: dd.offsetX });
        }, { relative: false, distance: 3 });

        result.drag("end", function (ev, dd)
        {
            var drag = $(dd.drag);
            var drop = $(dd.drop);
            var proxy = $(dd.proxy);

            var allowDragEnd = true; // TODO: check what we're dropping onto

            // not dropped into anything?
            if (drop.length === 0 || allowDragEnd === false)
            {
                proxy.velocity("finish", true).velocity({ top: dd.originalY, left: dd.originalX },
			    {
			        duration: 300,
			        complete: function ()
			        {
			            proxy.remove();
			            drag.removeClass('is-dragged');
			        }
			    });
            }
            else
            {
                proxy.remove();
            }
        }, { drop: '.is-brother-slot' });
    }

    // update image & name
    var character = _data[CharacterScreenIdentifier.Entity.Character.Key];
    var imageOffsetX = (CharacterScreenIdentifier.Entity.Character.ImageOffsetX in character ? character[CharacterScreenIdentifier.Entity.Character.ImageOffsetX] : 0);
    var imageOffsetY = (CharacterScreenIdentifier.Entity.Character.ImageOffsetY in character ? character[CharacterScreenIdentifier.Entity.Character.ImageOffsetY] : 0);

    result.assignListBrotherImage(Path.PROCEDURAL + character[CharacterScreenIdentifier.Entity.Character.ImagePath], imageOffsetX, imageOffsetY, 0.66);
    //result.assignListBrotherName(character[CharacterScreenIdentifier.Entity.Character.Name]);
    //result.assignListBrotherDailyMoneyCost(character[CharacterScreenIdentifier.Entity.Character.DailyMoneyCost]);

    if(CharacterScreenIdentifier.Entity.Character.LeveledUp in character && character[CharacterScreenIdentifier.Entity.Character.LeveledUp] === true)
    {
        result.assignListBrotherLeveledUp();
    }

    /*if(CharacterScreenIdentifier.Entity.Character.DaysWounded in character && character[CharacterScreenIdentifier.Entity.Character.DaysWounded] === true)
    {
        result.assignListBrotherDaysWounded();
    }*/

    if('moodIcon' in character)
    {
    	result.showListBrotherMoodImage(this.IsMoodVisible, character['moodIcon']);
    }

    for(var i = 0; i != _data['injuries'].length && i < 3; ++i)
    {
        result.assignListBrotherStatusEffect(_data['injuries'][i].imagePath, _data[CharacterScreenIdentifier.Entity.Id], _data['injuries'][i].id)
    }

    if(_data['injuries'].length <= 2 && _data['stats'].hitpoints < _data['stats'].hitpointsMax)
    {
    	result.assignListBrotherDaysWounded();
    }

    result.assignListBrotherClickHandler(function (_brother, _event)
	{
        var data = _brother.data('brother');
        //self.mDataSource.selectedBrotherById(data.id);
    });
};


CampScreenCommanderDialogModule.prototype.clearBrothersList = function ()
{
    for(var i=0; i != this.mSlots.length; ++i)
    {
        this.mSlots[i].empty();
        this.mSlots[i].data('child', null);
    }

    this.mNumActive = 0;
};


CampScreenCommanderDialogModule.prototype.onBrothersListLoaded = function (_brothers)
{
	this.clearBrothersList();

	if (_brothers === null || !jQuery.isArray(_brothers) || _brothers.length === 0)
	{
		return;
	}

	for (var i = 0; i < _brothers.length; ++i)
	{
	    var brother = _brothers[i];

		if (brother !== null)
		{
		    this.addBrotherSlotDIV(this.mSlots[i], brother, i, true);
		}
	}
	//this.updateBrotherSlotLocks(inventoryMode);
	//this.updateRosterLabel();
};



CampScreenCommanderDialogModule.prototype.addTentSlotDIV = function (_parentDiv, _data, _index, _allowReordering)
{
    var self = this;

    this.mTents[_index].data('id', _data.id);
    this.mTents[_index].data('idx', _index);
    var layout = $('<div class="l-button"/>');
    _parentDiv.append(layout);
    layout.createTabTextButton(_data.name + "(" + _data.count + ")", function()
    {
        if (self.mOnSwitchToInventoryCallback !== null && jQuery.isFunction(self.mOnSwitchToInventoryCallback))
        {
            self.mOnSwitchToInventoryCallback();
        }
    }, null, 'tab-button', 75);

    var image = $('<div class="is-reserve-slot"/>');
    _parentDiv.append(image);

};


CampScreenCommanderDialogModule.prototype.clearTentsList = function ()
{
    for(var i=0; i != this.mTents.length; ++i)
    {
        this.mSlots[i].empty();
        this.mSlots[i].data('child', null);
    }

    this.mNumActive = 0;
};

CampScreenCommanderDialogModule.prototype.onTentsListLoaded = function (_tents)
{
	this.clearTentsList();

	if (_tents === null || !jQuery.isArray(_tents) || _tents.length === 0)
	{
		return;
	}

	for (var i = 0; i < _tents.length; ++i)
	{
	    var tent = _tents[i];

		if (tent !== null)
		{
		    this.addTentSlotDIV(this.mTents[i], tent, i, true);
		}
	}
	//this.updateBrotherSlotLocks(inventoryMode);
	//this.updateRosterLabel();
};
