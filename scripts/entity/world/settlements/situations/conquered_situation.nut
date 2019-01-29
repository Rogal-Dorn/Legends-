this.conquered_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.conquered";
		this.m.Name = "Conquered";
		this.m.Description = "This place has recently been conquered. Many lives were lost, and the survivors had to endure the conquerors taking their spoils of war. Much of the settlement is still damaged, and spirits are low.";
		this.m.Icon = "ui/settlement_status/settlement_effect_02.png";
		this.m.IsStacking = false;
	}

	function onAdded( _settlement )
	{
		_settlement.resetShop();
	}

	function onUpdate( _modifiers )
	{
		_modifiers.SellPriceMult *= 0.899999976;
		_modifiers.BuyPriceMult *= 1.10000002;
		_modifiers.RarityMult *= 0.600000024;
		_modifiers.FoodRarityMult *= 0.899999976;
	}

});
