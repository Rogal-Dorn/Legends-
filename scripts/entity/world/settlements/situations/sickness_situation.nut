this.sickness_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.sickness";
		this.m.Name = "Sickness";
		this.m.Description = "A sickness has struck down many folks in this settlement. There are fewer recruits available, and food and medical supplies are scarce.";
		this.m.Icon = "ui/settlement_status/settlement_effect_23.png";
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
		_settlement.resetRoster(true);
	}

	function onUpdate( _modifiers )
	{
		_modifiers.FoodPriceMult *= 2.0;
		_modifiers.MedicalPriceMult *= 3.0;
		_modifiers.RecruitsMult *= 0.25;
	}

	function onUpdateDraftList( _draftList )
	{
		_draftList.push("cripple_background");
		_draftList.push("cripple_background");
		_draftList.push("beggar_background");
		_draftList.push("beggar_background");
		_draftList.push("female_beggar_background");
		_draftList.push("legend_nun_background");
		_draftList.push("legend_herbalist_background");
		_draftList.push("monk_background");

		if(this.Const.LegendMod.Configs.LegendMagicEnabled())
		{
		_draftList.push("legend_diviner_background");
		}
	}

});

