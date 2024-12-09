::mods_hookDescendants("items/item", function ( o ) {
	local getSellPrice = o.getSellPrice;
	o.getSellPrice <- function ()
	{
		local itemID = this.getID();
		local originalTime;

		if (::mods_isClass(this, "food_item") != null && this.getSpoilInDays() > this.m.GoodForDays) {
			originalTime = this.m.BestBefore;
			this.m.BestBefore = 0;
		}

		local sellPrice = this.m.LastTransactionPrice;

		if (sellPrice == null)
			sellPrice = getSellPrice();

		if (originalTime != null)
			this.m.BestBefore = originalTime;

		return sellPrice;
	};

	local getBuyPrice = o.getBuyPrice;
	o.getBuyPrice <- function ()
	{
		local itemID = this.getID();
		if (this.m.LastTransactionPrice != null) {
			return this.m.LastTransactionPrice;
		} else {
			local originalTime;
			if (::mods_isClass(this, "food_item") != null && this.getSpoilInDays() > this.m.GoodForDays) {
				if (this.getSpoilInDays() > this.m.GoodForDays) {
					originalTime = this.m.BestBefore;
					this.m.BestBefore = 0;
				}
			}
			if (originalTime != null)
				this.m.BestBefore = originalTime;
			return getBuyPrice();
		}
	};
});
