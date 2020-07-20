this.legend_doghandling_attack <- this.inherit("scripts/skills/skill", {
	m = {
		Item = null,
	},
	function setItem( _i )
	{
		this.m.Item = this.WeakTableRef(_i);
	}

	function create()
	{
		this.m.ID = "actives.legend_doghandling_attack";
		this.m.Name = "Wardog Attack";
		this.m.Description = "Chopper - sick balls";
		this.m.Icon = "skills/active_83.png";
		this.m.IconDisabled = "skills/active_83_sw.png";
		this.m.Overlay = "active_83";
		this.m.SoundOnUse = [
			"sounds/combat/unleash_wardog_01.wav",
			"sounds/combat/unleash_wardog_02.wav",
			"sounds/combat/unleash_wardog_03.wav",
			"sounds/combat/unleash_wardog_04.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.NonTargeted + 5;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsTargetingActor = true;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 15;
	}

	function isHidden()
	{
		if (!this.getContainer().getActor().getSkills().hasSkill("perk.legend_doghandling"))
		{
			return true;
		}
		return this.m.Item.m.Entity == null
	}

	// function addResources()
	// {
	// 	this.skill.addResources();

	// 	foreach( r in this.m.Sounds0 )
	// 	{
	// 		this.Tactical.addResource(r);
	// 	}

	// 	foreach( r in this.m.Sounds1 )
	// 	{
	// 		this.Tactical.addResource(r);
	// 	}

	// 	foreach( r in this.m.Sounds2 )
	// 	{
	// 		this.Tactical.addResource(r);
	// 	}

	// 	foreach( r in this.m.Sounds3 )
	// 	{
	// 		this.Tactical.addResource(r);
	// 	}

	// 	foreach( r in this.m.Sounds4 )
	// 	{
	// 		this.Tactical.addResource(r);
	// 	}

	// 	foreach( r in this.m.Sounds5 )
	// 	{
	// 		this.Tactical.addResource(r);
	// 	}
	// }

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

	// function isUsable()
	// {
	// 	//this.logInfo("**isUsable** " + this + " : " + this.m.Item + " : " + this.m.Item.m.Entity + " : " + this.m.Item.isUnleashed() + " : " + this.skill.isUsable())
	// 	if (this.m.Item.isUnleashed() || !this.skill.isUsable())
	// 	{
	// 		return false;
	// 	}

	// 	return true;
	// }

	function onVerifyTarget( _originTile, _targetTile )
	{
		return this.skill.onVerifyTarget(_originTile, _targetTile)
	}

	function onUpdate( _properties )
	{
		this.m.IsHidden = !this.m.Item.isUnleashed();
	}

	function onUse( _user, _targetTile )
	{
		this.m.Item.m.Entity.setTarget(_targetTile.getEntity())

		return true;
	}

});

