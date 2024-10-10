::mods_hookExactClass("ui/screens/world/world_town_screen", function(o) {
	o.m.BlackmarketDialogModule <- null;
	o.m.StablesDialogModule <- null;

	o.isAnimating = function ()
	{
		if (this.m.Animating != null && this.m.MainDialogModule != null && this.m.HireDialogModule != null && this.m.ShopDialogModule != null && this.m.StablesDialogModule != null)
		{
			return this.m.Animating == true || this.m.MainDialogModule.isAnimating() || this.m.HireDialogModule.isAnimating() || this.m.ShopDialogModule.isAnimating() || this.m.TrainingDialogModule.isAnimating() || this.m.BarberDialogModule.isAnimating() || this.m.StablesDialogModule.isAnimating();
		}
		else
		{
			return false;
		}
	}

	o.getStablesDialogModule <- function ()
	{
		return this.m.StablesDialogModule;
	}
	o.getBlackmarketDialogModule <- function ()
	{
		return this.m.BlackmarketDialogModule;
	}

	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.StablesDialogModule = this.new("scripts/ui/screens/world/modules/world_town_screen/town_stables_dialog_module");
		this.m.StablesDialogModule.setParent(this);
		this.m.StablesDialogModule.connectUI(this.m.JSHandle);
	}

	local destroy = o.destroy;
	o.destroy = function ()
	{
		destroy();
		this.m.StablesDialogModule.destroy();
		this.m.StablesDialogModule = null;
	}

	local clear = o.clear;
	o.clear = function ()
	{
		clear();
		this.m.StablesDialogModule.clear();
	}

	o.showLastActiveDialog = function ()
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
		if (this.m.LastActiveModule == this.m.StablesDialogModule)
		{
			this.showStablesDialog();
		}
		else
		{
			this.showMainDialog();
		}
	}

	o.showStablesDialog <- function ()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.LastActiveModule = this.m.StablesDialogModule;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("showStablesDialog", this.m.StablesDialogModule.queryHireInformation());
		}
	}
	o.showBlackmarketDialog <- function ()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.LastActiveModule = this.m.BlackmarketDialogModule;
			this.Tooltip.hide();
			this.m.JSHandle.asyncCall("showBlackmarketDialog", this.m.BlackmarketDialogModule.queryRosterInformation());
		}
	}
});
