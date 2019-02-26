this.legend_spawn_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Items = [],
		SpawnItem =  "",
		Script = "",
		IsControlledByPlayer = true
	},

	function setItem( _i )
	{
		this.m.Items.push(this.WeakTableRef(_i));
	}

	function create()
	{
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsHidden = false;
		this.m.IsRanged = true;
		this.m.IsTargetingActor = false;
		this.m.IsVisibleTileNeeded = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 10;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.MaxLevelDifference = 4;
	}

	function getMaxRange()
	{
		if (this.m.Container == null)
		{
			return this.m.MaxRange;
		}

		local skill = this.getContainer().getSkillByID("perk.legend_extended_aura");
		if (skill == null)
		{
			return this.m.MaxRange
		}

		return this.m.MaxRange + skill.m.RangeIncrease;
	}


	function getFatigueCost()
	{

		if (this.m.Container == null)
		{
			return this.Math.ceil(this.m.FatigueCost * this.m.Container.getActor().getCurrentProperties().FatigueEffectMult);
		}
		
		local perkMult = 1.0;
		local skill = this.getContainer().getSkillByID("perk.legend_channeled_power");
		if (skill != null)
		{
			perkMult = skill.m.FatigueMult;
		}
		return this.Math.round(this.Math.ceil(this.m.FatigueCost * perkMult * this.m.FatigueCostMult * this.m.Container.getActor().getCurrentProperties().FatigueEffectMult) + this.m.Container.getActor().getCurrentProperties().FatigueOnSkillUse);
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				text = this.getCostString()
			},
			{
				id = 4,
				type = "hint",
				text = "There are " + this.getNumberOfSpawnsAvailable() + " spawns available in your inventory"
			}
		];
		return ret;
	}

	function getScript()
	{
		return this.m.Script;
	}

	function getNumberOfSpawnsAvailable()
	{
		local num = 0;
		local items = this.World.Assets.getStash().getItems();
		foreach( item in items )
		{
			if (item == null)
			{
				continue;
			}
			
			if (item.getID() != this.m.SpawnItem)
			{
				continue;
			}

			if (item.isUnleashed()) 
			{
				continue;
			}
			
			++num;
			break;
		}
		return num;
	}

	function isUsable()
	{
		if (this.getNumberOfSpawnsAvailable() == 0 || !this.skill.isUsable())
		{
			return false;
		}

		return true;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (this.m.IsTargetingActor && (_targetTile.IsEmpty || !_targetTile.getEntity().isAttackable() || !_targetTile.getEntity().isAlive() || _targetTile.getEntity().isDying()))
		{
			return false;
		}

		if (this.m.IsAttack && this.m.IsTargetingActor && this.m.Container.getActor().isAlliedWith(_targetTile.getEntity()))
		{
			return false;
		}

		if (this.Math.abs(_targetTile.Level - _originTile.Level) > this.m.MaxLevelDifference)
		{
			return false;
		}

		if (!this.m.IsRanged && this.m.IsVisibleTileNeeded && this.getMaxRange() > 1 && _originTile.getDistanceTo(_targetTile) > 1)
		{
			local myPos = _originTile.Pos;
			local targetPos = _targetTile.Pos;
			local Dx = (targetPos.X - myPos.X) / 2;
			local Dy = (targetPos.Y - myPos.Y) / 2;
			local x = myPos.X + Dx;
			local y = myPos.Y + Dy;
			local tileCoords = this.Tactical.worldToTile(this.createVec(x, y));
			local tile = this.Tactical.getTile(tileCoords);

			if (tile.Level > _originTile.Level && (_originTile.Level - tile.Level < -1 || _targetTile.Level - tile.Level < -1))
			{
				return false;
			}
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local spawnItem = null;
		local items = this.World.Assets.getStash().getItems();
		foreach( item in items )
		{
			if (item == null)
			{
				continue;
			}
			
			if (item.getID() != this.m.SpawnItem)
			{
				continue;
			}

			if (item.isUnleashed()) 
			{
				continue;
			}
			
			spawnItem = item;
			this.World.Assets.getStash().remove(item);
			break;
		}

		if (spawnItem == null)
		{
			return false
		}

		local entity = this.Tactical.spawnEntity(this.getScript(), _targetTile.Coords.X, _targetTile.Coords.Y);
		if (this.m.IsControlledByPlayer)
		{
			entity.setFaction(this.Const.Faction.Player);
		} else {
			entity.setFaction(this.Const.Faction.PlayerAnimals);
		}
		entity.setItem(spawnItem);
		entity.setName(spawnItem.getName());
		entity.assignRandomEquipment();
		entity.riseFromGround();
		entity.getTags().add("IsSummoned", true);
		entity.getTags().add("Summoner", _user);
		spawnItem.setEntity(entity);
		this.m.Items.push(spawnItem);
		return true;
	}

	function onCombatFinished()
	{
		foreach(item in this.m.Items)
		{
			if (item == null)
			{
				continue;
			}
			
			item.onCombatFinished();
		}
		this.m.Items = [];
	}
});
