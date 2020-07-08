this.lost_at_sea_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.lost_at_sea";
		this.m.Name = "Lost at Sea";
		this.m.Description = "A boat with fishermen has been lost at sea during a storm. Both fresh fish and willing recruits are a rare sight.";
		this.m.Icon = "ui/settlement_status/settlement_effect_18.png";
		this.m.IsStacking = false;
		this.m.ValidDays = 4;
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
		if(this.Const.LegendMod.Configs.LegendWorldEconomyEnabled())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * -0.05);
		}
		_settlement.resetShop();
		_settlement.resetRoster(true);
	}

	function onUpdate( _modifiers )
	{
		_modifiers.FoodRarityMult *= 0.5;
		_modifiers.FoodPriceMult *= 2.0;
		_modifiers.RecruitsMult *= 0.5;
	}

	function onUpdateDraftList( _draftList )
	{
		_draftList.push("female_beggar_background");
		_draftList.push("female_beggar_background");
		_draftList.push("female_beggar_background");
		_draftList.push("female_butcher_background");
		_draftList.push("female_butcher_background");
		_draftList.push("female_butcher_background");

	}

});

