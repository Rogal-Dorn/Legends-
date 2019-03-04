this.ai_switchto_melee <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		WeaponToEquip = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.SwitchToMelee;
		this.m.Order = this.Const.AI.Behavior.Order.SwitchToMelee;
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

		if (_entity.getCurrentProperties().IsStunned)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (!this.getAgent().hasVisibleOpponent())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local hasQuickHands = _entity.getSkills().hasSkill("perk.quick_hands");

		if (!hasQuickHands && _entity.getActionPoints() < this.Const.Tactical.Settings.SwitchItemAPCost)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local item = _entity.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		local items = _entity.getItems().getAllItemsAtSlot(this.Const.ItemSlot.Bag);

		if (items.len() == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (item != null && item.isItemType(this.Const.Items.ItemType.RangedWeapon))
		{
			local isGoodReason = false;
			local myTile = _entity.getTile();

			if (item.getAmmoMax() > 0 && item.getAmmo() == 0)
			{
				this.logInfo("switching to melee weapon - no ammo!");
				isGoodReason = true;
				scoreMult = scoreMult * this.Const.AI.Behavior.SwitchToOutOfAmmoMult;
			}

			if (this.getAgent().getBehavior(this.Const.AI.Behavior.Order.EngageRanged) == null)
			{
				local targets = this.queryTargetsInMeleeRange(item.getRangeMin(), item.getRangeMax() + myTile.Level, 3);
				local bestTarget = this.queryBestRangedTarget(_entity, null, targets, item.getRangeMax());

				if (bestTarget.Target == null || bestTarget.Score < 0)
				{
					this.logInfo("switching to melee weapon - noone to hit from here!");
					isGoodReason = true;
					scoreMult = scoreMult * this.Const.AI.Behavior.SwitchToOutOfAmmoMult;
				}
			}

			if (!isGoodReason && this.getAgent().getIntentions().IsChangingWeapons)
			{
				return this.Const.AI.Behavior.Score.Zero;
			}

			if (!isGoodReason)
			{
				local hasReducedRangedEffectiveness = !this.World.getTime().IsDaytime && _entity.getCurrentProperties().IsAffectedByNight;
				local targets = this.queryTargetsInMeleeRange(1, hasReducedRangedEffectiveness || !this.isRangedUnit(_entity) ? 1 : 1);

				if (targets.len() == 0)
				{
					return this.Const.AI.Behavior.Score.Zero;
				}
			}
		}

		local bestWeapon;

		if (item != null && item.isItemType(this.Const.Items.ItemType.MeleeWeapon))
		{
			bestWeapon = item;
		}

		foreach( it in items )
		{
			if (!it.isItemType(this.Const.Items.ItemType.MeleeWeapon))
			{
				continue;
			}

			if (bestWeapon == null || item == null && it.getValue() > bestWeapon.getValue() || item != null && it.getValue() > bestWeapon.getValue() + 1000)
			{
				bestWeapon = it;
			}
		}

		if (bestWeapon == null || item != null && bestWeapon.getID() == item.getID())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.WeaponToEquip = bestWeapon;

		if (hasQuickHands)
		{
			scoreMult = scoreMult * this.Const.AI.Behavior.SwitchToQuickHandsMult;
		}

		if (item == null)
		{
			scoreMult = scoreMult * this.Const.AI.Behavior.SwitchToCurrentlyUnarmedMult;
		}

		return this.Const.AI.Behavior.Score.SwitchToMelee * scoreMult;
	}

	function onExecute( _entity )
	{
		if (this.Const.AI.VerboseMode)
		{
			this.logInfo("* " + _entity.getName() + ": Switching to melee weapon!");
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

});

