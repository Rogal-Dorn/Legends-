::mods_hookBaseClass("entity/tactical/actor", function(o) {
    while(!("BloodSaturation" in o.m)) o = o[o.SuperName]; // find the base class
    if(!("_mod_legend" in o))
    {
        o._mod_legend <- true;// only override the methods once per base instance
        o.m.BloodSaturation = 1.5;
        o.m.DeathBloodAmount = 1.5;
        o.m.BloodPoolScale = 1.25;
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

		if (this.getSkills().hasSkill("perk.student"))
		{
			perks = perks - 1;
			hasStudent = true;
		}

		this.m.PerkPoints += perks;
		this.m.PerkPointsSpent = 0;
		this.getSkills().removeByType(this.Const.SkillType.Perk);

		if (hasStudent && _actor.getLevel() >= 11)
		{
			this.getSkills().add(this.new("scripts/skills/perks/perk_student"));
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

		if (this.Const.MoraleStateBrush[this.m.MoraleState].len() != 0)
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

        //
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