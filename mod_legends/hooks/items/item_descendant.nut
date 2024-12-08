::mods_hookDescendants("items/item", function ( o )
{
	local getSellPrice = ::mods_getMember(o, "getSellPrice");
	o.getSellPrice <- function ()
	{
		local ID = this.getID();
		local originalTime;
		if (::mods_isClass(this, "food_item") != null && this.getSpoilInDays() > this.m.GoodForDays)
		{
			originalTime = this.m.BestBefore;
			this.m.BestBefore = 0;
		}

		local sellPrice;

		if (this.isBought())
		{
			this.m.IsBought = false;
			sellPrice = this.getBuyPrice();
			this.m.IsBought = true;
		}
		else
		{
			sellPrice = getSellPrice();
		}

		if (originalTime != null)
		{
			this.m.BestBefore = originalTime;
		}

		return sellPrice;
	}

	local getBuyPrice = ::mods_getMember(o, "getBuyPrice");
	o.getBuyPrice <- function ()
	{
		local ID = this.getID();
		if (this.isSold())
		{
			this.m.IsSold = false;
			local sellPrice = this.getSellPrice();
			this.m.IsSold = true;
			return sellPrice;
		}
		else
		{
			local originalTime;
			if (::mods_isClass(this, "food_item") != null && this.getSpoilInDays() > this.m.GoodForDays)
			{
				if (this.getSpoilInDays() > this.m.GoodForDays)
				{
					originalTime = this.m.BestBefore;
					this.m.BestBefore = 0;
				}
			}

			local buyPrice = getBuyPrice();

			if (originalTime != null)
			{
				this.m.BestBefore = originalTime;
			}

			return buyPrice;
		}
	}
});
