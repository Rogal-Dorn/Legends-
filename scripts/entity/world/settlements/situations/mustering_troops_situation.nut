this.mustering_troops_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.mustering_troops";
		this.m.Name = "Mustering Troops";
		this.m.Description = "Order has been given to muster troops for service in this settlement. Equipment and recruits are in short supply, but a quick crown can be made by selling arms and armor here.";
		this.m.Icon = "ui/settlement_status/settlement_effect_35.png";
		this.m.IsStacking = false;
		this.m.ValidDays = 4;
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
		_modifiers.PriceMult *= 1.25;
		_modifiers.RecruitsMult *= 0.5;
		_modifiers.RarityMult *= 0.5;
	}

	function onUpdateDraftList( _draftList )
	{
		_draftList.push("retired_soldier_background");
		_draftList.push("cripple_background");
		_draftList.push("cripple_background");
		_draftList.push("deserter_background");
		_draftList.push("deserter_background");
		_draftList.push("female_beggar_background");
	}

});

