::mods_hookNewObjectOnce("entity/world/combat_manager", function(o) {

	o.joinCombat = function( _combat, _party )
	{
		if (_party == null)
		{
			return;
		}

		local troops = _party.getTroops();

		foreach( t in troops )
		{
			t.Initiative <- this.Math.rand(1, 100);
			_combat.Combatants.push(t);
		}

		_combat.Combatants.sort(this.onInitiativeCompare);
		_party.setCombatID(_combat.ID);
		

        if (_party.getFaction() >= _combat.Factions.len()) {
            _combat.Factions.resize(_party.getFaction() + 1);
            for( local f = _party.getFaction(); f != _party.getFaction() + 1; f = ++f )
            {
                _combat.Factions[f] = [];
            }
        }

		_combat.Factions[_party.getFaction()].push(this.WeakTableRef(_party));
		_party.onCombatStarted();
	}

    o.startCombat = function( _p1, _p2 )
	{
		local p1 = typeof _p1 == "instance" ? _p1.get() : _p1;
		local p2 = typeof _p2 == "instance" ? _p2.get() : _p2;

		if (!p1.isAttackable() || !p2.isAttackable())
		{
			this.logError("Entity cannot be attacked!");
			return;
		}

		if (p1.isInCombat() && p2.isInCombat())
		{
			return;
		}

		p1.onBeforeCombatStarted();
		p2.onBeforeCombatStarted();

		if (!p1.isAlive() || !p2.isAlive())
		{
			return;
		}

		if (p1.getTroops().len() == 0 || p2.getTroops().len() == 0)
		{
			return;
		}

		if (!p1.isInCombat() && p2.isInCombat())
		{
			foreach( combat in this.m.Combats )
			{
				if (combat.ID == p2.getCombatID())
				{
					this.joinCombat(combat, p1);
					return;
				}
			}
		}
		else if (p1.isInCombat() && !p2.isInCombat())
		{
			foreach( combat in this.m.Combats )
			{
				if (combat.ID == p1.getCombatID())
				{
					this.joinCombat(combat, p2);
					return;
				}
			}
		}

		local stats = {
			Dead = 0,
			Loot = []
		};
		local combat = {
			ID = this.m.NextCombatID++,
			IsResolved = false,
			Stats = stats,
			Combatants = [],
			Factions = []
		};
		local numFactions = 32;
		if (p1.getFaction() >= numFactions) {
			numFactions = p1.getFaction() + 1;
		}
		if (p2.getFaction() >= numFactions) {
			numFactions = p2.getFaction() + 1;
		}

		combat.Factions.resize(numFactions);

		for( local f = 0; f != numFactions; f = ++f )
		{
			combat.Factions[f] = [];
		}

		this.joinCombat(combat, p1);
		this.joinCombat(combat, p2);
		this.m.Combats.push(combat);
	}

})