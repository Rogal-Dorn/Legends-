this.legends_spawn_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Items = [],
		SpawnItem =  "",
		Script = ""
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
		this.m.IsTargetingActor = false;
		this.m.IsVisibleTileNeeded = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 10;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.MaxLevelDifference = 4;
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
		local actor = this.getContainer().getActor();
		return this.skill.onVerifyTarget(_originTile, _targetTile) && _targetTile.IsEmpty;
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
		entity.setFaction(this.Const.Faction.PlayerAnimals);
		entity.setItem(spawnItem);
		entity.setName(spawnItem.getName());
		entity.assignRandomEquipment();
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
