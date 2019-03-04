this.terrifying_nightmares_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.terrifying_nightmares";
		this.m.Name = "Terrifying Nightmares";
		this.m.Description = "The people of this settlement are terrorized by nightmares. Many prefer to stay awake all night just to be safe.";
		this.m.Icon = "ui/settlement_status/settlement_effect_25.png";
	}

	function getAddedString( _s )
	{
		return _s + " suffers from " + this.m.Name;
	}

	function getRemovedString( _s )
	{
		return _s + " no longer suffers from " + this.m.Name;
	}

	function onUpdate( _modifiers )
	{
		_modifiers.RecruitsMult *= 0.75;
	}

});

