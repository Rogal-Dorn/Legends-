this.trader_follower <- this.inherit("scripts/retinue/follower", {
	m = {},
	function create()
	{
		this.follower.create();
		this.m.ID = "follower.trader";
		this.m.Name = "The Trader";
		this.m.Description = "Southern traders are renowned for their bartering skills. Lucky you that you could convince one such master of haggling to join your company. And at such a bargain!";
		this.m.Image = "ui/campfire/trader_01";
		this.m.Cost = 3500;
		this.m.Effects = [
			"Increases the amount of trade goods for sale by 1 for each location that produces them, like salt near salt mines, allowing you to trade at higher volumes"
		];
		this.m.Requirements = [
			{
				IsSatisfied = false,
				Text = ""
			}
		];
	}

	function onUpdate()
	{
	}

	function onEvaluate()
	{
	
		local hasTrader = 0;
		local brothers = this.World.getPlayerRoster().getAll();
		foreach( bro in brothers )
		{
			if (bro.getBackground().getID() == "background.caravan_hand" || bro.getBackground().getID() == "background.legend_trader"  || bro.getBackground().getID() == "background.legend_commander_trader"  || bro.getBackground().getID() == "background.legend_donkey" )
			{
			hasTrader++;
			}

		}	
		this.m.Requirements[0].Text = "Sold " + this.Math.min(25, this.World.Statistics.getFlags().getAsInt("TradeGoodsSold")) + "/25 trade goods. Have a Caravan Hand, Trader or Donkey in your company";

		if (this.World.Statistics.getFlags().getAsInt("TradeGoodsSold") >= 25 && hasTrader >= 1)
		{
			this.m.Requirements[0].IsSatisfied = true;
		}
	}

});

