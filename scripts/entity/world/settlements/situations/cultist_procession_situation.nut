this.cultist_procession_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.cultist_procession";
		this.m.Name = "Cultist Procession";
		this.m.Description = "There\'s a procession of cultists going through the city; a steady stream of people seemingly manifested themselves out of thin air and now slowly makes its way along the main roads. Clad in muted colors they ring bells and chant monotonously the name of Davkul.";
		this.m.Icon = "ui/settlement_status/settlement_effect_37.png";
		this.m.IsStacking = false;
		this.m.ValidDays = 2;
	}

	function getAddedString( _s )
	{
		return _s + " now has a " + this.m.Name;
	}

	function getRemovedString( _s )
	{
		return _s + " no longer has a " + this.m.Name;
	}

	function onAdded( _settlement )
	{
		_settlement.resetRoster(true);
	}

	function onRemoved( _settlement )
	{
		_settlement.resetRoster(true);
	}

	function onUpdate( _modifiers )
	{
	}

	function onUpdateDraftList( _draftList )
	{
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("cultist_background");
		_draftList.push("flagellant_background");
		_draftList.push("butcher_background");
	}

});

