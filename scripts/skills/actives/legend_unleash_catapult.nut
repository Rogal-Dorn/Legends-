this.legend_unleash_catapult <- this.inherit("scripts/skills/skill", {
	m = {
		Entity = null,			
		EntityName = "catapult",
		Script = "scripts/entity/tactical/legend_war_catapult"
	},
	function setItem( _i )
	{
		this.m.Item = this.WeakTableRef(_i);
	}

	function create()
	{
		this.m.ID = "actives.legend_unleash_catapult";
		this.m.Name = "Summon Catapult";
		this.m.Description = "Summon a faithful bear. Needs a free tile adjacent.";
		this.m.Icon = "skills/catapult_square.png";
		this.m.IconDisabled = "skills/catapult_square_bw.png";
		this.m.Overlay = "active_165";
		this.m.SoundOnUse = [
			"sounds/enemies/unhold_idle_01.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.NonTargeted + 5;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsTargetingActor = false;
		this.m.ActionPointCost = 8;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
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
			}
		];
		return ret;
	}

	function isUsable()
	{
		if (this.m.Entity != null || !this.skill.isUsable())
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
		local entity = this.Tactical.spawnEntity(this.m.Script, _targetTile.Coords.X, _targetTile.Coords.Y);
		entity.setFaction(this.Const.Faction.PlayerAnimals);
		entity.setName(this.m.EntityName);

		return true;
	}

	function onCombatFinished()
	{
		this.m.Entity = null;
	}

});
