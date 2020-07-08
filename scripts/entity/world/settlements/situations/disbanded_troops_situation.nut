this.disbanded_troops_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.disbanded_troops";
		this.m.Name = "Disbanded Troops";
		this.m.Description = "With a local conflict now solved, many levied troops and their weapons are no longer needed. A good time to grab a bargain or hire experienced new men.";
		this.m.Icon = "ui/settlement_status/settlement_effect_30.png";
		this.m.IsStacking = false;
		this.m.ValidDays = 4;
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
		if(this.Const.LegendMod.Configs.LegendWorldEconomyEnabled())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * 0.035);
		}
		_settlement.resetShop();
		_settlement.resetRoster(true);
	}

	function onUpdate( _modifiers )
	{
		_modifiers.PriceMult *= 0.9;
		_modifiers.RecruitsMult *= 1.25;
	}

	function onUpdateDraftList( _draftList )
	{
		_draftList.push("deserter_background");
		_draftList.push("deserter_background");
		_draftList.push("deserter_background");
		_draftList.push("deserter_background");
		_draftList.push("deserter_background");
		_draftList.push("deserter_background");
		_draftList.push("militia_background");
		_draftList.push("militia_background");
		_draftList.push("militia_background");
		_draftList.push("militia_background");
		_draftList.push("militia_background");
		_draftList.push("militia_background");
		_draftList.push("militia_background");
		_draftList.push("militia_background");
		_draftList.push("militia_background");
		_draftList.push("militia_background");
		_draftList.push("sellsword_background");
		_draftList.push("sellsword_background");
		_draftList.push("sellsword_background");
		_draftList.push("retired_soldier_background");
		_draftList.push("retired_soldier_background");
		_draftList.push("retired_soldier_background");
		_draftList.push("retired_soldier_background");
		_draftList.push("retired_soldier_background");
		_draftList.push("retired_soldier_background");
		_draftList.push("retired_soldier_background");
		_draftList.push("retired_soldier_background");
		_draftList.push("squire_background");
		_draftList.push("squire_background");
		_draftList.push("squire_background");
		_draftList.push("squire_background");
		_draftList.push("squire_background");
		_draftList.push("legend_shieldmaiden_background");
		_draftList.push("legend_shieldmaiden_background");
		_draftList.push("legend_shieldmaiden_background");
		_draftList.push("hedge_knight_background");
		_draftList.push("hedge_knight_background");
		_draftList.push("hedge_knight_background");
		_draftList.push("legend_noble_2h");
		_draftList.push("legend_noble_2h");
		_draftList.push("legend_noble_ranged");
		_draftList.push("legend_noble_ranged");
		_draftList.push("legend_noble_shield");
		_draftList.push("legend_noble_shield");


		if(this.Const.LegendMod.Configs.LegendMagicEnabled())
		{
		_draftList.push("legend_noble_event_background");
		_draftList.push("legend_noble_event_background");
		_draftList.push("legend_master_archer_background");
		_draftList.push("legend_crusader_background");
		}
	}

});

