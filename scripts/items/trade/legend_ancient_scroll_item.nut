this.legend_ancient_scroll_item <- this.inherit("scripts/items/trade/trading_good_item", {
	m = {},
	function create()
	{
		this.trading_good_item.create();
		this.m.ID = "misc.ancient_scroll";
		this.m.Name = "Ancient Scroll";
		this.m.Description = "A torn-up scroll with knowledge unseen for centuries. It can be translated by a character with the interpretation perk in the crafting tent. Highly valuable to some historians, although it is useless to many.";
		this.m.Icon = "trade/inventory_trade_06.png"; //todo ancient scroll icon
		this.m.Value = 50;
	}

	function getBuyPrice()
	{
		if (this.m.IsSold)
		{
			return this.getSellPrice();
		}

		if (("State" in this.World) && this.World.State != null && this.World.State.getCurrentTown() != null)
		{
			return this.Math.max(this.getSellPrice(), this.Math.ceil(this.getValue() * this.getPriceMult() * this.World.State.getCurrentTown().getBuyPriceMult() * this.Const.World.Assets.BaseBuyPrice ));
		}

		return this.item.getBuyPrice();
	}

	function getSellPrice()
	{
		if (this.m.IsBought)
		{
			return this.getBuyPrice();
		}

		if (("State" in this.World) && this.World.State != null && this.World.State.getCurrentTown() != null)
		{
			return this.Math.floor(this.getValue() * this.World.State.getCurrentTown().getSellPriceMult() *  this.Const.World.Assets.BaseSellPrice);
		}

		return this.item.getSellPrice();
	}

});

