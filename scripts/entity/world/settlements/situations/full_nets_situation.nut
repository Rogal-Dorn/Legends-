this.full_nets_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.full_nets";
		this.m.Name = "Full Nets";
		this.m.Description = "The waters are teeming with swarms of fish. Fresh Fish is abundant and cheaply available.";
		this.m.Icon = "ui/settlement_status/settlement_effect_19.png";
		this.m.IsStacking = false;
		this.m.ValidDays = 3;
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
	}

	function onUpdate( _modifiers )
	{
		_modifiers.FoodRarityMult *= 2.0;
		_modifiers.FoodPriceMult *= 0.5;
	}

	function onUpdateDraftList( _draftList )
	{
		_draftList.push("fisherman_background");
		_draftList.push("fisherman_background");
		_draftList.push("fisherman_background");
		_draftList.push("fisherman_background");
		_draftList.push("fisherman_background");
		_draftList.push("fisherman_background");
		_draftList.push("female_butcher_background");
		_draftList.push("female_butcher_background");
		_draftList.push("female_butcher_background");

	}

});

