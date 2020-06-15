this.razed_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.razed";
		this.m.Name = "Razed";
		this.m.Description = "This place has been razed. Many of its inhabitants lie slain, and any valuables have been plundered.";
		this.m.Icon = "ui/settlement_status/settlement_effect_10.png";
		this.m.IsStacking = false;
	}

	function getAddedString( _s )
	{
		return _s + " now is " + this.m.Name;
	}

	function getRemovedString( _s )
	{
		return _s + " no longer is " + this.m.Name;
	}

	function onAdded( _settlement )
	{
		_settlement.resetShop();
		_settlement.resetRoster(false);
	}

	function onUpdate( _modifiers )
	{
		_modifiers.SellPriceMult *= 0.5;
		_modifiers.BuyPriceMult *= 2.0;
		_modifiers.FoodPriceMult *= 2.0;
		_modifiers.RecruitsMult *= 0.25;
		_modifiers.RarityMult *= 0.25;
	}

	function onUpdateDraftList( _draftList )
	{
		_draftList.push("female_beggar_background");
		_draftList.push("female_beggar_background");
		_draftList.push("female_beggar_background");
		_draftList.push("beggar_background");
		_draftList.push("beggar_background");
		_draftList.push("beggar_background");
		_draftList.push("cripple_background");
		_draftList.push("cripple_background");
		_draftList.push("cripple_background");
		_draftList.push("graverobber_background");
		_draftList.push("raider_background");
		_draftList.push("female_thief_background");
		if(this.Const.LegendMod.Configs.LegendMagicEnabled())
		{
		_draftList.push("legend_death_summoner_background");
		}
	}

});

