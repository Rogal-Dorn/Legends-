::mods_hookNewObject("entity/world/combat_manager", function(o) {

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

	o.tickCombat = function ( _combat )
	{
		local attackOccured = false;
		if (_combat.Combatants == null || _combat.Combatants.len() == 0)
		{
			_combat.Combatants = [];
			_combat.IsResolved = true;
			return
		}

		if (_combat.Factions == null || _combat.Factions.len() == 0)
		{
			_combat.Factions = [];
			_combat.IsResolved = true;
			return
		}

		for( local i = 0; i < _combat.Combatants.len(); i = ++i )
		{
			local combatant = _combat.Combatants[i];

			if (combatant.Party == null || combatant.Party.isNull())
			{
				continue;
			}

			local potentialOpponentFactions = [];

			for( local f = 0; f < _combat.Factions.len(); f = ++f )
			{
				local lFaction = _combat.Factions[f];
				if (lFaction == null || lFaction.len() == 0)
				{
					continue
				}

				if (combatant.Party.getFaction() != f && !this.World.FactionManager.isAllied(combatant.Party.getFaction(), f))
				{
					potentialOpponentFactions.push(f);
				}
			}

			if (potentialOpponentFactions.len() == 0)
			{
				continue;
			}

			local opponentFaction = potentialOpponentFactions[this.Math.rand(0, potentialOpponentFactions.len() - 1)];
			local opponentParty = _combat.Factions[opponentFaction][this.Math.rand(0, _combat.Factions[opponentFaction].len() - 1)];

			if (opponentParty == null || opponentParty.isNull() || opponentParty.getTroops().len() == 0)
			{
				continue;
			}

			local opponentIndex = this.Math.rand(0, opponentParty.getTroops().len() - 1);
			local opponent = opponentParty.getTroops()[opponentIndex];
			attackOccured = true;
			opponent.Strength -= this.Math.max(1, this.Math.rand(1, combatant.Strength) * this.Const.World.CombatSettings.CombatStrengthMult);

			if (opponent.Strength <= 0)
			{
				++_combat.Stats.Dead;
				opponentParty.getTroops().remove(opponentIndex);
				opponentIndex = _combat.Combatants.find(opponent);
				_combat.Combatants.remove(opponentIndex);

				if (opponentIndex < i)
				{
					i = --i;
				}

				if (opponentParty.getTroops().len() == 0)
				{
					_combat.Stats.Loot.extend(opponentParty.getInventory());
					local partyIndex = _combat.Factions[opponentParty.getFaction()].find(opponentParty);
					opponentParty.setCombatID(0);
					_combat.Factions[opponentParty.getFaction()].remove(partyIndex);
					opponentParty.onCombatLost();
				}
			}

		}

		if (!attackOccured)
		{
			_combat.IsResolved = true;
		}
	}

});
