this.unhold_attacks_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.unhold_attacks";
		this.m.Name = "Unhold Attacks";
		this.m.Description = "Large Unholds have been seen and heard in the area. The townsfolk are scared of leaving the vicinity of the settlement.";
		this.m.Icon = "ui/settlement_status/settlement_effect_26.png";
		this.m.IsStacking = false;
	}

	function onAdded( _settlement )
	{
		_settlement.resetRoster(true);
		if(this.Const.LegendMod.Configs.LegendWorldEconomyEnabled())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * -0.025);
		}
	}

	function onResolved( _settlement )
	{
		_settlement.setResources(_settlement.getResources() + _settlement.getResources() * 0.05);
	}


	function getAddedString( _s )
	{
		return _s + " has " + this.m.Name;
	}

	function getRemovedString( _s )
	{
		return _s + " no longer has " + this.m.Name;
	}

	function onAdded( _settlement )
	{
		_settlement.resetShop();
		_settlement.resetRoster(true);
	}

	function onUpdate( _modifiers )
	{
		_modifiers.BuyPriceMult *= 1.1;
		_modifiers.SellPriceMult *= 0.9;
		_modifiers.RarityMult *= 0.9;
		_modifiers.RecruitsMult *= 0.75;
	}

});

