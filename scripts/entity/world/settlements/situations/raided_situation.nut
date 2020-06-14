this.raided_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.raided";
		this.m.Name = "Raided";
		this.m.Description = "This place has been recently raided! It\'s suffered damage, has lost valuable goods and supplies, and lives were lost.";
		this.m.Icon = "ui/settlement_status/settlement_effect_08.png";
		this.m.IsStacking = false;
	}

	function getAddedString( _s )
	{
		return _s + " has been " + this.m.Name;
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
		_modifiers.RecruitsMult *= 0.5;
		_modifiers.RarityMult *= 0.5;
	}

	function onUpdateDraftList( _draftList )
	{
		_draftList.push("female_beggar_background");
		_draftList.push("female_beggar_background");
		_draftList.push("refugee_background");
		_draftList.push("cripple_background");
		_draftList.push("cripple_background");
		_draftList.push("vagabond_background");
		_draftList.push("gravedigger_background");
		_draftList.push("beggar_background");


	}

});

