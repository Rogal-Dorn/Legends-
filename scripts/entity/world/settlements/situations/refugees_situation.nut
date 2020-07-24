this.refugees_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.refugees";
		this.m.Name = "Refugees";
		this.m.Description = "With the war raging, a constant stream of refugees is pouring into this settlement. It puts a strain on local economy, but it also means cheap recruits for anyone that can offer work.";
		this.m.Icon = "ui/settlement_status/settlement_effect_01.png";
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
		if(this.World.LegendsMod.Configs().LegendWorldEconomyEnabled())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * -0.1);
		}
		_settlement.resetRoster(true);
	}

	function onUpdate( _modifiers )
	{
		_modifiers.RarityMult *= 0.9;
		_modifiers.FoodRarityMult *= 0.75;
		_modifiers.FoodPriceMult *= 1.25;
	}

	function onUpdateDraftList( _draftList )
	{
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
		_draftList.push("refugee_background");
	}

});

