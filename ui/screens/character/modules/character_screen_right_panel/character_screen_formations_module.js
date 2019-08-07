/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *  @Description:	Perks Module JS
 */
"use strict";


var CharacterScreenFormationsModule = function(_parent, _dataSource)
{
    this.mParent = _parent;
    this.mDataSource = _dataSource;

	// container
	this.mContainer = null;

    this.mSlotCountPanel = null;

    this.mFormationsPanel = null;
    this.mFormationsSortInventoryButton = null;
    this.mFormationsClearFormationButton = null;
    this.mFormationNameContainer = null;
	this._formBtns = [
		Path.GFX + 'ui/buttons/1.png',
		Path.GFX + 'ui/buttons/2.png',
		Path.GFX + 'ui/buttons/3.png',
		Path.GFX + 'ui/buttons/4.png',
		Path.GFX + 'ui/buttons/5.png',
		Path.GFX + 'ui/buttons/6.png'
		// Path.GFX + 'ui/buttons/7.png',
		// Path.GFX + 'ui/buttons/8.png',
	];
    this.mFormationsButtons = [];

    this.registerDatasourceListener();
};

CharacterScreenFormationsModule.prototype.createDIV = function (_parentDiv)
{
	// create: containers (init hidden!)
	this.mContainer = $('<div class="formations-module opacity-none"/>');
	_parentDiv.append(this.mContainer);

    this.mSlotCountPanel = $('<div class="slot-count-panel"/>');
    this.mContainer.append(this.mSlotCountPanel);

    //formations
    this.mFormationsPanel = $('<div class="formations-panel"/>');
    this.mSlotCountPanel.append(this.mFormationsPanel);

    this._formBtns.forEach(function (_img, _index)
    {
        var layout = $('<div class="l-button is-formation-' + _index + '"/>');
		self.mFormationsPanel.append(layout);
		var index = _index;
		var fBtn = layout.createImageButton(_img, function ()
		{
            self.onFormationSelected(null, _index);
            self.mDataSource.notifyBackendFormationClicked(index);

        }, '', 3);

		self.mFormationsButtons.push(fBtn);
    })

    var layout = $('<div class="l-button formation-panel-btn is-formation-6"/>');
    this.mFormationsPanel.append(layout);
    this.mFormationsSortInventoryButton = layout.createImageButton(Path.GFX + Asset.BUTTON_SORT, function ()
    {
        self.mDataSource.notifyBackendSortButtonClicked();
    }, '', 3);

    var layout = $('<div class="l-button is-formation-7"/>');
    this.mFormationsPanel.append(layout);
    this.mFormationsClearFormationButton = layout.createImageButton(Path.GFX + 'ui/skin/icon_cross.png', function ()
    {
        self.mDataSource.notifyBackendClearFormationButtonClicked();
    }, '', 3);

    this.mFormationNameContainer = $('<div class="formation-name"/>');
    this.mFormationsPanel.append(this.mFormationNameContainer);
    //var editNameimage = $('<img class="display-none"/>');
    ///editNameimage.attr('src', Path.GFX + Asset.ICON_EDIT_NAME_AND_TITLE);
    //this.mNameContainer.append(editNameimage);

    var nameLabel = $('<div class="label title-font-normal font-bold font-color-brother-name"></div>');
    this.mFormationNameContainer.append(nameLabel);
    this.mFormationNameContainer.click(function ()
    {
        if ($(this).hasClass('is-clickable') === false)
        {
            return false;
        }

        self.mDataSource.notifyBackendPopupDialogIsVisible(true);
        self.mCurrentPopupDialog = $('.character-screen').createPopupDialog('Change Formation Name', null, null, 'change-formation-name-popup');

        self.mCurrentPopupDialog.addPopupDialogOkButton(function (_dialog)
        {
            self.updateFormationName(_dialog);
            self.mCurrentPopupDialog = null;
            _dialog.destroyPopupDialog();
            self.mDataSource.notifyBackendPopupDialogIsVisible(false);
        });
        
        self.mCurrentPopupDialog.addPopupDialogCancelButton(function (_dialog)
        {
            self.mCurrentPopupDialog = null;
            _dialog.destroyPopupDialog();
            self.mDataSource.notifyBackendPopupDialogIsVisible(false);
        });

        self.mCurrentPopupDialog.addPopupDialogContent(self.createChangeFormationNameDialogContent(self.mCurrentPopupDialog));

		// focus!
		var inputFields = self.mCurrentPopupDialog.findPopupDialogContentContainer().find('input');
		$(inputFields[0]).focus();
    });

    this.mFormationNameContainer.addClass('is-clickable');

    this.onFormationSelected(null, this.mDataSource.getFormationIndex());
    this.onSetFormationName(null, this.mDataSource.getFormationName());
};

CharacterScreenFormationsModule.prototype.destroyDIV = function ()
{
    this.mSlotCountPanel.empty()
    this.mSlotCountPanel.remove()
    this.mSlotCountPanel = null;

    this.mContainer.empty();
    this.mContainer.remove();
    this.mContainer = null;
};

CharacterScreenFormationsModule.prototype.updateFormationName = function (_dialog)
{
    var contentContainer = _dialog.findPopupDialogContentContainer();
    var inputFields = contentContainer.find('input');
    this.mDataSource.updateFormationName(null, $(inputFields[0]).getInputText());
};

CharacterScreenFormationsModule.prototype.createChangeFormationNameDialogContent = function (_dialog)
{
    var data = this.mDataSource.getFormationName();
    var result = $('<div class="change-formation-name-container"/>');

    // create & set name
    var row = $('<div class="row"/>');
    result.append(row);
    var label = $('<div class="label text-font-normal font-color-label font-bottom-shadow">Name</div>');
    row.append(label);

	var self = this;

    var inputLayout = $('<div class="l-input"/>');
    row.append(inputLayout);
    var inputField = inputLayout.createInput('', 0, Constants.Game.MAX_BROTHER_NAME_LENGTH, 1, function (_input)
	{
        _dialog.findPopupDialogOkButton().enableButton(_input.getInputTextLength() >= Constants.Game.MIN_BROTHER_NAME_LENGTH);
    }, 'title-font-big font-bold font-color-brother-name', function (_input)
	{
		var button = _dialog.findPopupDialogOkButton();
		if(button.isEnabled())
		{
			button.click();
		}
	});

    inputField.setInputText(data);

    return result;
};

CharacterScreenFormationsModule.prototype.registerDatasourceListener = function()
{
    this.mDataSource.addListener(CharacterScreenDatasourceIdentifier.Brother.Updated, jQuery.proxy(this.onBrotherUpdated, this));
    this.mDataSource.addListener(CharacterScreenDatasourceIdentifier.Brother.Selected, jQuery.proxy(this.onBrotherSelected, this));
    this.mDataSource.addListener(CharacterScreenDatasourceIdentifier.Inventory.FormationIndex, jQuery.proxy(this.onFormationSelected, this));
    this.mDataSource.addListener(CharacterScreenDatasourceIdentifier.Inventory.FormationName, jQuery.proxy(this.onSetFormationName, this));
};

CharacterScreenFormationsModule.prototype.bindTooltips = function ()
{
    this.mFormationsSortInventoryButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.CharacterScreen.RightPanelHeaderModule.SortButton });
    this.mFormationsClearFormationButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.CharacterScreen.RightPanelHeaderModule.ClearFormationButton });
    this.mFormationsButtons.forEach(function(btn)
    {
        btn.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.CharacterScreen.RightPanelHeaderModule.ChangeFormationButton });
    });
    if(this.mDataSource.isTacticalMode() !== true)
    {
        this.mFormationNameContainer.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.CharacterScreen.RightPanelHeaderModule.ChangeFormationName });
    }
};

CharacterScreenFormationsModule.prototype.unbindTooltips = function ()
{
    this.mFormationsSortInventoryButton.unbindTooltip();
    this.mFormationsClearFormationButton.unbindTooltip();
    this.mFormationsButtons.forEach(function(btn)
    {
        btn.unbindTooltip();
    });
    if(this.mDataSource.isTacticalMode() !== true)
    {
        this.mFormationNameContainer.unbindTooltip();
    }
};


CharacterScreenFormationsModule.prototype.onFormationSelected = function (_dataSource, _index)
{
    this.mFormationsButtons.forEach(function (_b, _i) 
    {
        _b.removeClass('is-active');
        if (_i === _index) {
            _b.addClass('is-active');
        }
    });
};

CharacterScreenFormationsModule.prototype.onSetFormationName = function( _dataSource, _name)
{
    if (_name == null || _name == undefined)
    {
        return;
    }
	var label = this.mFormationNameContainer.find('.label:first');
    if (label.length > 0)
    {
        label.html(_name);
    }

    /*var image = this.mNameContainer.find('img:first');
    if (image.length > 0)
    {*/
        if (this.mDataSource.isTacticalMode() !== true)
        {
            this.mFormationNameContainer.addClass('is-clickable');
            //image.removeClass('display-none').addClass('display-block');
        }
        else
        {
            this.mFormationNameContainer.removeClass('is-clickable');
            //image.removeClass('display-block').addClass('display-none');
        }
   // }
};

CharacterScreenFormationsModule.prototype.create = function(_parentDiv)
{
    this.createDIV(_parentDiv);
};

CharacterScreenFormationsModule.prototype.destroy = function()
{
    this.destroyDIV();
};


CharacterScreenFormationsModule.prototype.register = function (_parentDiv)
{
    console.log('CharacterScreenFormationsModule::REGISTER');

    if (this.mContainer !== null)
    {
        console.error('ERROR: Failed to register Perks Module. Reason: Module is already initialized.');
        return;
    }

    if (_parentDiv !== null && typeof(_parentDiv) == 'object')
    {
        this.create(_parentDiv);
    }
};

CharacterScreenFormationsModule.prototype.unregister = function ()
{
    console.log('CharacterScreenFormationsModule::UNREGISTER');

    if (this.mContainer === null)
    {
        console.error('ERROR: Failed to unregister Perks Module. Reason: Module is not initialized.');
        return;
    }

    this.destroy();
};

CharacterScreenFormationsModule.prototype.isRegistered = function ()
{
	if (this.mContainer !== null)
	{
		return this.mContainer.parent().length !== 0;
	}

	return false;
};


CharacterScreenFormationsModule.prototype.show = function ()
{
    // NOTE: (js) HACK which prevents relayouting..
	this.mContainer.removeClass('opacity-none').addClass('opacity-full');
	//this.mContainer.removeClass('display-none').addClass('display-block');
};

CharacterScreenFormationsModule.prototype.hide = function ()
{
    // NOTE: (js) HACK which prevents relayouting..
	this.mContainer.removeClass('opacity-full is-top').addClass('opacity-none');
	//this.mContainer.removeClass('display-block is-top').addClass('display-none');
};

CharacterScreenFormationsModule.prototype.isVisible = function ()
{
	return this.mContainer.hasClass('opacity-full');
	//return this.mContainer.hasClass('display-block');
};


CharacterScreenFormationsModule.prototype.onInventoryModeUpdated = function (_dataSource, _mode)
{

};


CharacterScreenFormationsModule.prototype.onBrotherUpdated = function (_dataSource, _brother)
{
	if (_dataSource.isSelectedBrother(_brother))
	{
		this.onBrotherSelected(_dataSource, _brother);
	}
};

CharacterScreenFormationsModule.prototype.onBrotherSelected = function (_dataSource, _brother)
{
	if (_brother === null)
	{
		return;
	}
};