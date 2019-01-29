this.ai_switchto_ranged <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		WeaponToEquip = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.SwitchToRanged;
		this.m.Order = this.Const.AI.Behavior.Order.SwitchToRanged;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.WeaponToEquip = null;
		local scoreMult = this.getProperties().BehaviorMult[this.m.ID];

		if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.getAgent().getIntentions().IsChangingWeapons)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getCurrentProperties().IsStunned)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local hasQuickHands = _entity.getSkills().hasSkill("perk.quick_hands");

		if (!hasQuickHands && _entity.getActionPoints() < this.Const.Tactical.Settings.SwitchItemAPCost)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getSkills().hasSkill("effects.spearwall"))
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.getAgent().getIntentions().IsKnockingBack)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local item = _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

		if (item != null && item.isItemType(this.Const.Items.ItemType.RangedWeapon) && (item.getAmmoMax() == 0 || item.getAmmo() > 0))
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local targets = this.queryTargetsInMeleeRange(item != null ? item.getRangeMin() : 1, item != null ? item.getRangeMax() : 1);

		if (targets.len() != 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (hasQuickHands)
		{
			scoreMult = scoreMult * this.Const.AI.Behavior.SwitchToQuickHandsMult;
		}

		local items = _entity.getItems().getAllItemsAtSlot(this.Const.ItemSlot.Bag);

		if (items.len() == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local rangedWeapons = [];

		foreach( it in items )
		{
			if (it.isItemType(this.Const.Items.ItemType.RangedWeapon) && (it.getAmmoMax() == 0 || it.getAmmo() > 0))
			{
				rangedWeapons.push(it);
			}
		}

		if (rangedWeapons.len() == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.WeaponToEquip = this.selectBestRangedWeapon(rangedWeapons);
		local IsRangedUnit = this.isRangedUnit(_entity);
		targets = this.getAgent().getKnownOpponents();
		local potentialDanger = [];
		local switchMaxDangerDist = hasQuickHands || _entity.getActionPoints() >= 8 ? _entity.getIdealRange() : this.Math.max(_entity.getIdealRange(), this.Const.AI.Behavior.SwitchToRangedMaxDangerDist);

		if (!hasQuickHands && IsRangedUnit)
		{
			foreach( t in targets )
			{
				if (t.Actor.isNull())
				{
					continue;
				}

				local dist = _entity.getTile().getDistanceTo(t.Tile);

				if (dist <= switchMaxDangerDist && t.Actor.getMoraleState() != this.Const.MoraleState.Fleeing && !t.Actor.isArmedWithRangedWeapon() && t.Actor.getHitpoints() / t.Actor.getHitpointsMax() >= this.Const.AI.Behavior.SwitchToRangedMinDangerHitpointsPct && t.Actor.getTile().getZoneOfControlCount(_entity.getFaction()) < this.Const.AI.Behavior.SwitchToRangedIgnoreDangerMinZones)
				{
					potentialDanger.push(t.Actor);
				}
			}
		}

		if (this.isOpponentTooClose(_entity, potentialDanger))
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local myTile = _entity.getTile();

		if (this.getAgent().getBehavior(this.Const.AI.Behavior.Order.EngageRanged) == null)
		{
			local targets = this.queryTargetsInMeleeRange(this.m.WeaponToEquip.getRangeMin(), this.m.WeaponToEquip.getRangeMax() + myTile.Level, 3);
			local bestTarget = this.queryBestRangedTarget(_entity, null, targets, this.m.WeaponToEquip.getRangeMax());

			if (bestTarget.Target == null || bestTarget.Score < 0)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}
		}

		targets = this.queryTargetsInMeleeRange(this.m.WeaponToEquip.getRangeMin(), this.m.WeaponToEquip.getRangeMax());
		scoreMult = scoreMult * this.Math.pow(this.Const.AI.Behavior.SwitchToEnemyInRangeMult, targets.len());

		if (_entity.getCurrentProperties().getRangedSkill() < 50)
		{
			scoreMult = scoreMult * (1.0 - (50 - _entity.getCurrentProperties().getRangedSkill()) * 0.00999999978);
		}

		local declaredTargetTile = this.getAgent().getIntentions().TargetTile;

		if (declaredTargetTile != null)
		{
			local willRunIntoSpearwalls = 0;

			for( local i = 0; i < this.Const.Direction.COUNT; i = ++i )
			{
				if (!declaredTargetTile.hasNextTile(i))
				{
				}
				else
				{
					local tile = declaredTargetTile.getNextTile(i);

					if (!tile.IsOccupiedByActor || this.Math.abs(tile.Level - declaredTargetTile.Level) > 1)
					{
					}
					else if (!tile.getEntity().isAlliedWith(_entity) && !tile.hasZoneOfControlOtherThan(tile.getEntity().getAlliedFactions()) && tile.getEntity().getSkills().hasSkill("effects.spearwall"))
					{
						willRunIntoSpearwalls = ++willRunIntoSpearwalls;
					}
				}
			}

			scoreMult = scoreMult * this.Math.pow(this.Const.AI.Behavior.SwitchToVSSpearwallPOW, willRunIntoSpearwalls);
		}

		if (!IsRangedUnit && this.getStrategy().getStats().RangedAlliedVSEnemies < 1.0)
		{
			scoreMult = scoreMult * (0.25 + this.getStrategy().getStats().RangedAlliedVSEnemies * 0.75);
		}

		return this.Const.AI.Behavior.Score.SwitchToRanged * scoreMult;
	}

	function onExecute( _entity )
	{
		if (this.Const.AI.VerboseMode)
		{
			this.logInfo("* " + _entity.getName() + ": Switching to ranged weapon!");
		}

		local oldWeapon = _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

		if (oldWeapon != null)
		{
			_entity.getItems().unequip(oldWeapon);
		}

		_entity.getItems().removeFromBag(this.m.WeaponToEquip);

		if (this.m.WeaponToEquip.getBlockedSlotType() != null && _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) != null)
		{
			local slotsRequired = 1;

			if (oldWeapon != null)
			{
				slotsRequired = ++slotsRequired;
			}

			local shield = _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

			if (_entity.getItems().getNumberOfEmptySlots(this.Const.ItemSlot.Bag) >= slotsRequired)
			{
				_entity.getItems().unequip(shield);
				_entity.getItems().addToBag(shield);
			}
			else
			{
				shield.drop(_entity.getTile());
			}
		}

		_entity.getItems().equip(this.m.WeaponToEquip);

		if (oldWeapon != null)
		{
			_entity.getItems().addToBag(oldWeapon);
		}

		this.m.WeaponToEquip = null;
		_entity.getItems().payForAction();
		this.getAgent().getIntentions().IsChangingWeapons = true;
		return true;
	}

	function isOpponentTooClose( _entity, _potentialDanger )
	{
		if (_potentialDanger.len() == 0)
		{
			return false;
		}

		local myTile = _entity.getTile();

		foreach( d in _potentialDanger )
		{
			local turnsRequired = this.queryActorTurnsNearTarget(d, myTile, _entity).Turns;

			if (turnsRequired <= this.Const.AI.Behavior.SwitchToRangedKeepMinTurnsAway)
			{
				return true;
			}
		}

		return false;
	}

	function selectBestRangedWeapon( _weapons )
	{
		return _weapons[this.Math.rand(0, _weapons.len() - 1)];
	}

});
