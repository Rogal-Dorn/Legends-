this.hunting_season_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.hunting_season";
		this.m.Name = "Hunting Season";
		this.m.Description = "The forests are bustling with deer and it is hunting season. Venison and furs are in rich supply.";
		this.m.Icon = "ui/settlement_status/settlement_effect_36.png";
		this.m.IsStacking = false;
		this.m.ValidDays = 5;
	}

	function getAddedString( _s )
	{
		return _s + " now has " + this.m.Name;
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
		_draftList.push("hunter_background");
		_draftList.push("hunter_background");
		_draftList.push("poacher_background");
		_draftList.push("poacher_background");
		_draftList.push("poacher_background");
		_draftList.push("poacher_background");
		_draftList.push("legend_taxidermist_background");
		_draftList.push("legend_taxidermist_background");
		_draftList.push("houndmaster_background");
		_draftList.push("houndmaster_background");
		_draftList.push("butcher_background");
		_draftList.push("butcher_background");
	}

});

