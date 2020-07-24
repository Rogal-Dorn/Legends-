this.safe_roads_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.safe_roads";
		this.m.Name = "Safe Roads";
		this.m.Description = "The roads leading here have been reasonably safe of late, which allowed for many a profitable trade to be made and the settlement to prosper somewhat.";
		this.m.Icon = "ui/settlement_status/settlement_effect_06.png";
		this.m.IsStacking = false;
	}

	function onAdded( _settlement )
	{
		_settlement.removeSituationByID("situation.ambushed_trade_routes");
		if(this.World.LegendsMod.Configs().LegendWorldEconomyEnabled())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * 0.1);
		}
		_settlement.resetShop();
	}

	function onUpdate( _modifiers )
	{
		_modifiers.PriceMult *= 1.1;
		_modifiers.RarityMult *= 1.1;
	}

	function onUpdateDraftList( _draftList )
	{
		_draftList.push("caravan_hand_background");
		_draftList.push("caravan_hand_background");
		_draftList.push("caravan_hand_background");
		_draftList.push("caravan_hand_background");
		_draftList.push("sellsword_background");
		_draftList.push("sellsword_background");
		_draftList.push("vagabond_background");
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("messenger_background");
		_draftList.push("gambler_background");
		_draftList.push("tailor_background");
		_draftList.push("minstrel_background");
		_draftList.push("historian_background");
		_draftList.push("adventurous_noble_background");
		_draftList.push("female_adventurous_noble_background");
		_draftList.push("legend_donkey");
		_draftList.push("female_thief_background");

	}

});

