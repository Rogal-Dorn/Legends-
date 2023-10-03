this.dummy_faction <- this.inherit("scripts/factions/faction", {
	m = {
		MimicType = this.Const.FactionType.None
	},
	function create()
	{
		this.faction.create();
		this.m.Type = this.Const.FactionType.DummyFaction;
		this.setMimicValues(this.Const.FactionType.None);
		this.m.PlayerRelation = -200.0;
		this.m.IsHidden = true;
		this.m.IsRelationDecaying = false;
	}

	// Sets the type, base, tacticalbase, and combatmusic
	function setMimicValues( _factionType )
	{
		switch ( _factionType )
		{
			case this.Const.FactionType.None:
				return
			case this.Const.FactionType.OrientalBandits:
				this.m.Base = "world_base_07";
				this.m.TacticalBase = "bust_base_nomads";
				this.m.CombatMusic = this.Const.Music.OrientalBanditTracks;
				return
		}
	}

	function addPlayerRelation( _r, _reason = "" )
	{
	}

	function addPlayerRelationEx( _r, _reason = "" )
	{
	}

	// // Do not believe this should be used
	// function setFakeType( _factionType )
	// {
	// 	this.m.Type = _factionType
	// }

	function onSerialize( _out )
	{
		this.faction.onSerialize(_out);
		_out.writeU8(this.m.MimicType);
	}

	function onDeserialize( _in )
	{
		this.faction.onDeserialize(_in);
		if (_in.getMetaData().getVersion() >= 74)
		{
			this.m.MimicType = _in.readU8();
		}
		this.setMimicValues(this.m.MimicType);
	}

});

