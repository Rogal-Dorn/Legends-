this.legends_spawn_zombie_low_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Item = null,
		Sounds0 = [
			"sounds/enemies/zombie_hurt_01.wav",
			"sounds/enemies/zombie_hurt_02.wav",
			"sounds/enemies/zombie_hurt_03.wav",
			"sounds/enemies/zombie_hurt_04.wav",
			"sounds/enemies/zombie_hurt_05.wav",
			"sounds/enemies/zombie_hurt_06.wav",
			"sounds/enemies/zombie_hurt_07.wav"
		],
		Sounds1 = [
			"sounds/enemies/zombie_death_01.wav",
			"sounds/enemies/zombie_death_02.wav",
			"sounds/enemies/zombie_death_03.wav",
			"sounds/enemies/zombie_death_04.wav",
			"sounds/enemies/zombie_death_05.wav",
			"sounds/enemies/zombie_death_06.wav"
		],
		Sounds2 = [
		],
		Sounds3 = [
			"sounds/enemies/zombie_idle_01.wav",
			"sounds/enemies/zombie_idle_02.wav",
			"sounds/enemies/zombie_idle_03.wav",
			"sounds/enemies/zombie_idle_04.wav",
			"sounds/enemies/zombie_idle_05.wav",
			"sounds/enemies/zombie_idle_05.wav"
		],
		Sounds4 = [
			// "sounds/enemies/zombie_charge_00.wav",
			// "sounds/enemies/zombie_charge_01.wav",
			// "sounds/enemies/zombie_charge_02.wav"
		],
		Sounds5 = [
			"sounds/enemies/zombie_bite_01.wav",
			"sounds/enemies/zombie_bite_02.wav",
			"sounds/enemies/zombie_bite_03.wav",
			"sounds/enemies/zombie_bite_04.wav"
		]
	},

	function setItem( _i )
	{
		this.m.Item = this.WeakTableRef(_i);
	}

	function create()
	{
		this.m.ID = "actives.legends_spawn_zombie_low_skill";
		this.m.Name = "Unleash Zombie";
		this.m.Description = "Unleash your zombie and send him charging into the enemy. Needs a free tile adjacent.";
		this.m.Icon = "skills/active_83.png";
		this.m.IconDisabled = "skills/active_83_sw.png";
		this.m.Overlay = "active_83";
		this.m.SoundOnUse = [
			"sounds/enemies/geist_idle_10.wav",
			"sounds/enemies/geist_idle_11.wav",
			"sounds/enemies/geist_idle_12.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.NonTargeted + 5;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsTargetingActor = false;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.SpawnItem = "spawns.zombie"
		this.m.Script =  "scripts/entity/tactical/enemies/zombie"
	}

	function addResources()
	{
		this.skill.addResources();

		foreach( r in this.m.Sounds0 )
		{
			this.Tactical.addResource(r);
		}

		foreach( r in this.m.Sounds1 )
		{
			this.Tactical.addResource(r);
		}

		foreach( r in this.m.Sounds2 )
		{
			this.Tactical.addResource(r);
		}

		foreach( r in this.m.Sounds3 )
		{
			this.Tactical.addResource(r);
		}

		foreach( r in this.m.Sounds4 )
		{
			this.Tactical.addResource(r);
		}

		foreach( r in this.m.Sounds5 )
		{
			this.Tactical.addResource(r);
		}
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
		foreach (item in this.World.Assets.getStash().getItems())
		{
			if (item.getID() != this.m.SpawnItem)
			{
				continue;
			}

			if (item.isUnleashed()) 
			{
				continue;
			}

			++num;

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
		foreach (item in this.World.Assets.getStash().getItems())
		{
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
		entity.setName(this.m.Item.getName());
		//entity.setVariant(this.m.Item.getVariant());
		spawnItem.setEntity(entity);

		return true;
	}

});
