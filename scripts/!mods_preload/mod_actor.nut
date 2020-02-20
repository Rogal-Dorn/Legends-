::mods_hookBaseClass("entity/tactical/actor", function(o) {
    while(!("BloodSaturation" in o.m)) o = o[o.SuperName]; // find the base class
    if(!("_mod_legend" in o))
    {
        o._mod_legend <- true;// only override the methods once per base instance
        o.m.BloodSaturation = 1.5;
        o.m.DeathBloodAmount = 1.5;
        o.m.BloodPoolScale = 1.25;
		o.m.RiderID <- "";
		o.m.FlatOnKillOtherActorModifier <- 0;
		o.m.PercentOnKillOtherActorModifier <- 1.0;
    }

	o.onOtherActorDeath <- function ( _killer, _victim, _skill )
	{
		if (!this.m.IsAlive || this.m.IsDying)
		{
			return;
		}

		if (_victim.getXPValue() == 0)
		{
			return;
		}

		if (_victim.getFaction() == this.getFaction() && _victim.getCurrentProperties().TargetAttractionMult > 0.5 && this.getCurrentProperties().IsAffectedByDyingAllies)
		{
			local difficulty = this.Const.Morale.AllyKilledBaseDifficulty - _victim.getXPValue() * this.Const.Morale.AllyKilledXPMult + this.Math.pow(_victim.getTile().getDistanceTo(this.getTile()), this.Const.Morale.AllyKilledDistancePow);
			if (_killer != null)
			{
				difficulty = this.Math.floor((this.Const.Morale.AllyKilledBaseDifficulty - _victim.getXPValue() * this.Const.Morale.AllyKilledXPMult + this.Math.pow(_victim.getTile().getDistanceTo(this.getTile()), this.Const.Morale.AllyKilledDistancePow)) * _killer.getPercentOnKillOtherActorModifier()) + _killer.getFlatOnKillOtherActorModifier();
			}
			this.checkMorale(-1, difficulty, this.Const.MoraleCheckType.Default, "", true);
		}
		else if (this.getAlliedFactions().find(_victim.getFaction()) == null)
		{
			local difficulty = this.Const.Morale.EnemyKilledBaseDifficulty + _victim.getXPValue() * this.Const.Morale.EnemyKilledXPMult - this.Math.pow(_victim.getTile().getDistanceTo(this.getTile()), this.Const.Morale.EnemyKilledDistancePow);

			if (_killer != null && _killer.isAlive() && _killer.getID() == this.getID())
			{
				difficulty = difficulty + this.Const.Morale.EnemyKilledSelfBonus;
			}

			this.checkMorale(1, difficulty);
		}
	}

	o.getPercentOnKillOtherActorModifier <- function ()
	{
		return this.m.PercentOnKillOtherActorModifier;
	}
	o.modifyPercentOnKillOtherActorModifier <- function ( _value ) 
	{
		this.m.PercentOnKillOtherActorModifier *= _value;
	}
	o.getFlatOnKillOtherActorModifier <- function ()
	{
		return this.m.FlatOnKillOtherActorModifier;
	}
	o.modifyFlatOnKillOtherActorModifier <- function ( _value )
	{
		this.m.FlatOnKillOtherActorModifier += _value;
	}

	o.isStabled <- function ()
	{
		return false;
	}

    local fn = o.onMovementFinish;
    o.onMovementFinish = function (_tile)
    {
        fn(_tile);
        this.m.Skills.MovementCompleted(_tile);
    }

    o.isArmedWithMagicStaff <- function()
	{
		local item = this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand);
		return item != null && item.isItemType(this.Const.Items.ItemType.MagicStaff);
	}

    o.equipItem <- function( _item)
    {
        return this.getItems().equip(_item);
    }

    o.bagItem <- function (_item)
    {
        this.getItems().addToBag(_item);
    }

    o.setArmor <- function (_bodyPart, _value)
    {
        this.m.BaseProperties.Armor[_bodyPart] = _value;
    }

	o.onMissed = function ( _attacker, _skill, _dontShake = false )
	{
		if (!_dontShake && !this.isHiddenToPlayer() && this.m.IsShakingOnHit && (!_skill.isRanged() || _attacker.getTile().getDistanceTo(this.getTile()) == 1) && !this.Tactical.getNavigator().isTravelling(this))
		{
			this.Tactical.getShaker().shake(this, _attacker.getTile(), 4);
		}

		if (this.m.CurrentProperties.IsRiposting && _attacker != null && !_attacker.isAlliedWith(this) && _attacker.getTile().getDistanceTo(this.getTile()) == 1 && this.Tactical.TurnSequenceBar.getActiveEntity() != null && this.Tactical.TurnSequenceBar.getActiveEntity().getID() == _attacker.getID() && _skill != null && !_skill.isIgnoringRiposte())
		{
			local skill = this.m.Skills.getAttackOfOpportunity();

			if (skill != null)
			{
				local info = {
					User = this,
					Skill = skill,
					TargetTile = _attacker.getTile()
				};
				this.Time.scheduleEvent(this.TimeUnit.Virtual, this.Const.Combat.RiposteDelay, this.onRiposte.bindenv(this), info);
			}
		}


		if (this.m.CurrentProperties.IsParrying && _attacker != null && !_attacker.isAlliedWith(this) && _attacker.getTile().getDistanceTo(this.getTile()) == 1 && this.Tactical.TurnSequenceBar.getActiveEntity() != null && this.Tactical.TurnSequenceBar.getActiveEntity().getID() == _attacker.getID() && _skill != null && !_skill.isIgnoringRiposte())
		{

			_attacker.getSkills().add(this.new("scripts/skills/effects/legend_parried_effect"));
		}

		if (_skill != null && !_skill.isRanged())
		{
			this.m.Fatigue = this.Math.min(this.getFatigueMax(), this.Math.round(this.m.Fatigue + this.Const.Combat.FatigueLossOnBeingMissed * this.m.CurrentProperties.FatigueEffectMult * this.m.CurrentProperties.FatigueLossOnBeingMissedMult));
		}

		this.m.Skills.onMissed(_attacker, _skill);
	}

    o.resetPerks <- function ()
    {
        local perks = this.m.PerkPointsSpent;
		local hasStudent = false;
		local hasGifted = false;

		if (this.getSkills().hasSkill("perk.student") && this.getLevel() >= 11)
		{
			perks = perks - 1;
			hasStudent = true;
		}
		if (this.getSkills().hasSkill("perk.gifted"))
		{
			perks = perks - 1;
			hasGifted = true;
		}

		this.m.PerkPoints += perks;
		this.m.PerkPointsSpent = 0;
		this.getSkills().removeByType(this.Const.SkillType.Perk);

		if (hasStudent)
		{
			this.m.PerkPointsSpent += 1;
			this.getSkills().add(this.new("scripts/skills/perks/perk_student"));
		}
		if (hasGifted)
		{
			this.m.PerkPointsSpent += 1;
			this.getSkills().add(this.new("scripts/skills/perks/perk_gifted"));
		}
    }

	o.changeMorale <- function( _change, _showIconBeforeMoraleIcon = "", _noNewLine = false)
	{
		local oldMoraleState = this.m.MoraleState;
		this.m.MoraleState = _change;
		this.m.FleeingRounds = 0;

		if (oldMoraleState == this.Const.MoraleState.Fleeing && this.m.IsActingEachTurn)
		{
			if (this.m.IsUsingZoneOfControl)
			{
				this.getTile().addZoneOfControl(this.getFaction());
			}

			if (this.isPlayerControlled() || !this.isHiddenToPlayer())
			{
				if (_noNewLine)
				{
					this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(this) + " has rallied");
				}
				else
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(this) + " has rallied");
				}
			}
		}
		else if (this.m.MoraleState == this.Const.MoraleState.Fleeing)
		{
			if (this.m.IsActingEachTurn && this.m.IsUsingZoneOfControl)
			{
				this.getTile().removeZoneOfControl(this.getFaction());
			}

			this.m.Skills.removeByID("effects.shieldwall");
			this.m.Skills.removeByID("effects.spearwall");
			this.m.Skills.removeByID("effects.riposte");
			this.m.Skills.removeByID("effects.return_favor");
			this.m.Skills.removeByID("effects.indomitable");
		}

		local morale = this.getSprite("morale");

		if (this.Const.MoraleStateBrush[this.m.MoraleState].len() != 0 && morale != null )
		{
			if (this.m.MoraleState == this.Const.MoraleState.Confident)
			{
				morale.setBrush(this.m.ConfidentMoraleBrush);
			}
			else
			{
				morale.setBrush(this.Const.MoraleStateBrush[this.m.MoraleState]);
			}

			morale.Visible = true;
		}
		else
		{
			morale.Visible = false;
		}

		if (this.isPlayerControlled() || !this.isHiddenToPlayer())
		{
			if (_noNewLine)
			{
				this.Tactical.EventLog.logEx(this.Const.UI.getColorizedEntityName(this) + this.Const.MoraleStateEvent[this.m.MoraleState]);
			}
			else
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(this) + this.Const.MoraleStateEvent[this.m.MoraleState]);
			}

			if (_showIconBeforeMoraleIcon != "")
			{
				this.Tactical.spawnIconEffect(_showIconBeforeMoraleIcon, this.getTile(), this.Const.Tactical.Settings.SkillIconOffsetX, this.Const.Tactical.Settings.SkillIconOffsetY, this.Const.Tactical.Settings.SkillIconScale, this.Const.Tactical.Settings.SkillIconFadeInDuration, this.Const.Tactical.Settings.SkillIconStayDuration, this.Const.Tactical.Settings.SkillIconFadeOutDuration, this.Const.Tactical.Settings.SkillIconMovement);
			}

			if (_change > 0)
			{
				this.Tactical.spawnIconEffect(this.Const.Morale.MoraleUpIcon, this.getTile(), this.Const.Tactical.Settings.SkillIconOffsetX, this.Const.Tactical.Settings.SkillIconOffsetY, this.Const.Tactical.Settings.SkillIconScale, this.Const.Tactical.Settings.SkillIconFadeInDuration, this.Const.Tactical.Settings.SkillIconStayDuration, this.Const.Tactical.Settings.SkillIconFadeOutDuration, this.Const.Tactical.Settings.SkillIconMovement);
			}
			else
			{
				this.Tactical.spawnIconEffect(this.Const.Morale.MoraleDownIcon, this.getTile(), this.Const.Tactical.Settings.SkillIconOffsetX, this.Const.Tactical.Settings.SkillIconOffsetY, this.Const.Tactical.Settings.SkillIconScale, this.Const.Tactical.Settings.SkillIconFadeInDuration, this.Const.Tactical.Settings.SkillIconStayDuration, this.Const.Tactical.Settings.SkillIconFadeOutDuration, this.Const.Tactical.Settings.SkillIconMovement);
			}
		}

		this.m.Skills.update();
		this.setDirty(true);

		if (this.m.MoraleState == this.Const.MoraleState.Fleeing && this.Tactical.TurnSequenceBar.getActiveEntity() != this)
		{
			this.Tactical.TurnSequenceBar.pushEntityBack(this.getID());
		}

		if (this.m.MoraleState == this.Const.MoraleState.Fleeing)
		{
			local actors = this.Tactical.Entities.getInstancesOfFaction(this.getFaction());

			if (actors != null)
			{
				foreach( a in actors )
				{
					if (a.getID() != this.getID())
					{
						a.onOtherActorFleeing(this);
					}
				}
			}
		}
	}


	o.checkMorale = function( _change, _difficulty, _type = this.Const.MoraleCheckType.Default, _showIconBeforeMoraleIcon = "", _noNewLine = false )
	{
		if (!this.isAlive() || this.isDying())
		{
			return false;
		}

		if (this.m.MoraleState == this.Const.MoraleState.Ignore)
		{
			return false;
		}

		if (_change > 0 && this.m.MoraleState == this.Const.MoraleState.Confident)
		{
			return false;
		}

		if (_change < 0 && this.m.MoraleState == this.Const.MoraleState.Fleeing)
		{
			return false;
		}

		if (_change > 0 && this.m.MoraleState >= this.m.MaxMoraleState)
		{
			return false;
		}

		if (_change == 1 && this.m.MoraleState == this.Const.MoraleState.Fleeing)
		{
			return false;
		}

		local myTile = this.getTile();

		if (this.isPlayerControlled() && _change > 0 && (myTile.SquareCoords.X == 0 || myTile.SquareCoords.Y == 0 || myTile.SquareCoords.X == 31 || myTile.SquareCoords.Y == 31))
		{
			return false;
		}

		_difficulty = _difficulty * this.getCurrentProperties().MoraleEffectMult;
		local bravery = (this.getBravery() + this.getCurrentProperties().MoraleCheckBravery[_type]) * this.getCurrentProperties().MoraleCheckBraveryMult[_type];

		if (bravery > 500)
		{
			if (_change != 0)
			{
				return false;
			}
			else
			{
				return true;
			}
		}

		local numOpponentsAdjacent = 0;
		local numAlliesAdjacent = 0;
		local threatBonus = 0;

		for( local i = 0; i != 6; i = ++i )
		{
			if (!myTile.hasNextTile(i))
			{
			}
			else
			{
				local tile = myTile.getNextTile(i);

				if (tile.IsOccupiedByActor && tile.getEntity().getMoraleState() != this.Const.MoraleState.Fleeing)
				{
					if (tile.getEntity().isAlliedWith(this))
					{
						numAlliesAdjacent = ++numAlliesAdjacent;
					}
					else
					{
						numOpponentsAdjacent = ++numOpponentsAdjacent;
						threatBonus = threatBonus + tile.getEntity().getCurrentProperties().Threat;
					}
				}
			}
		}

		if (_change > 0)
		{
			if (this.Math.rand(1, 100) > this.Math.minf(95, bravery + _difficulty - numOpponentsAdjacent * this.Const.Morale.OpponentsAdjacentMult - threatBonus))
			{
				return false;
			}
		}
		else if (_change < 0)
		{
			if (this.Math.rand(1, 100) <= this.Math.minf(95, bravery + _difficulty - numOpponentsAdjacent * this.Const.Morale.OpponentsAdjacentMult + numAlliesAdjacent * this.Const.Morale.AlliesAdjacentMult - threatBonus))
			{
				return false;
			}
		}
		else if (this.Math.rand(1, 100) <= this.Math.minf(95, bravery + _difficulty - numOpponentsAdjacent * this.Const.Morale.OpponentsAdjacentMult + numAlliesAdjacent * this.Const.Morale.AlliesAdjacentMult - threatBonus))
		{
			return true;
		}
		else
		{
			return false;
		}

		this.changeMorale(this.Math.min(this.Const.MoraleState.Confident, this.Math.max(0, this.m.MoraleState + _change)));
		return true;
	}

	local oacFn = o.onAppearanceChanged;
	o.onAppearanceChanged = function( _appearance, _setDirty = true )
	{
		oacFn(_appearance, _setDirty);

		if (this.hasSprite("armor_layer_chain"))
		{
				if (_appearance.ArmorLayerChain.len() != 0)
			{
				local armor = this.getSprite("armor_layer_chain");
				armor.setBrush(_appearance.ArmorLayerChain);
				armor.Visible = true;
			}
			else
			{
				this.getSprite("armor_layer_chain").Visible = false;
			}
		}

		if (this.hasSprite("armor_layer_plate"))
		{
			if (_appearance.ArmorLayerPlate.len() != 0)
			{
				local armor = this.getSprite("armor_layer_plate");
				armor.setBrush(_appearance.ArmorLayerPlate);
				armor.Visible = true;
			}
			else
			{
				this.getSprite("armor_layer_plate").Visible = false;
			}
		}

		if (this.hasSprite("armor_layer_tabbard"))
		{
			if (_appearance.ArmorLayerTabbard.len() != 0)
			{
				local armor = this.getSprite("armor_layer_tabbard");
				armor.setBrush(_appearance.ArmorLayerTabbard);
				armor.Visible = true;
			}
			else
			{
				this.getSprite("armor_layer_tabbard").Visible = false;
			}
		}

		if (this.hasSprite("armor_layer_cloak"))
		{
			if (_appearance.ArmorLayerCloak.len() != 0)
			{
				local armor = this.getSprite("armor_layer_cloak");
				armor.setBrush(_appearance.ArmorLayerCloak);
				armor.Visible = true;
			}
			else
			{
				this.getSprite("armor_layer_cloak").Visible = false;
			}
		}
	}


	o.removeArmorUpgrade <- function ( _slot)
	{
		local armor = this.getItems().getItemAtSlot(this.Const.ItemSlot.Body);
		if (armor == null)
		{
			return null;
		}

		return armor.removeUpgrade( _slot );
	}

	o.setRiderID <- function ( _id)
	{
		if (_id == null)
		{
			_id = ""
		}
		this.m.RiderID = _id;
	}

	o.getRiderID <- function()
	{
		return this.m.RiderID
	}

	o.getRider <- function()
	{
		return null;
	}

	local szFn = o.onSerialize
	o.onSerialize = function( _out )
	{
		szFn(_out)
		_out.writeString(this.m.RiderID);
	}

	local dszFn = o.onDeserialize
	o.onDeserialize = function( _in )
	{
		dszFn(_in)
		if (_in.getMetaData().getVersion() >= 59)
		{
			this.m.RiderID = _in.readString();
		}
	}



    // local onResurrected = o.onResurrected;
    // o.onResurrected = function ( _info )
    // {
    //     onResurrected(_info);
    //     this.World.getPlayerRoster().add(_info);
    // }
    // local onInit = o.onInit;
    // o.onInit = function ()
    // {
    //     o.onInit();
    //     o.m.BloodSaturation = 1.5;
    //     o.m.DeathBloodAmount = 1.5;
    //     o.m.BloodPoolScale = 1.25;
    //     o.m.BloodSplatterOffset = this.createVec(-1, -1);
    // }
    // }
});