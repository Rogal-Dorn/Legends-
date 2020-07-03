this.greenskins_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.greenskins";
		this.m.Name = "Marauding Greenskins";
		this.m.Description = "Greenskins are terrorizing the surrounding lands, and many lives have been lost as orcs or goblins continue to raid outlying farms and raze caravans. Supplies are beginning to run low and people become desperate.";
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
		if(this.Const.LegendMod.Configs.LegendWorldEconomyEnabled())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * -0.25);
		}
		_settlement.resetShop();
		_settlement.resetRoster(true);
	}

	function onResolved( _settlement )
	{
		_settlement.setResources(_settlement.getResources() + _settlement.getResources() * 0.20);
	}

	function onUpdate( _modifiers )
	{
		_modifiers.RarityMult *= 0.75;
		_modifiers.RecruitsMult *= 0.75;
	}

});

