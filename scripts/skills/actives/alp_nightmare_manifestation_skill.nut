this.alp_nightmare_manifestation_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.alp_nightmare_manifestation";
		this.m.Name = "Summon Nightmare";
		this.m.Description = "";
		this.m.Icon = "skills/active_160.png";
		this.m.IconDisabled = "skills/active_160.png";
		this.m.Overlay = "active_160";
		this.m.SoundOnUse = [
			"sounds/enemies/dlc2/alp_nightmare_01.wav",
			"sounds/enemies/dlc2/alp_nightmare_02.wav",
			"sounds/enemies/dlc2/alp_nightmare_03.wav",
			"sounds/enemies/dlc2/alp_nightmare_04.wav",
			"sounds/enemies/dlc2/alp_nightmare_05.wav",
			"sounds/enemies/dlc2/alp_nightmare_06.wav"
		];
		this.m.IsUsingActorPitch = true;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 400;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsUsingHitchance = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsDoingForwardMove = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.ActionPointCost = 8;
		this.m.FatigueCost = 10;
		this.m.MinRange = 1;
		this.m.MaxRange = 9;
		this.m.MaxLevelDifference = 4;
	}

	function isUsable()
	{
		if (!this.skill.isUsable())
		{
			return false;
		}

		local b = this.getContainer().getActor().getAIAgent().getBehavior(this.Const.AI.Behavior.ID.AttackDefault);
		local targets = b.queryTargetsInMeleeRange(this.getMinRange(), this.getMaxRange());
		local myTile = this.getContainer().getActor().getTile();

		foreach( t in targets )
		{
			if (this.onVerifyTarget(myTile, t.getTile()))
			{
				return true;
			}
		}

		return false;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{	
		if (_targetTile.getEntity().getSkills().hasSkill("effects.sleeping"))
			return false;

		if (this.getAvailableTiles(_targetTile).len() <= 1)
			return false;

		return this.skill.onVerifyTarget(_originTile, _targetTile);
	}

	function onUse( _user, _targetTile )
	{
		local tag = {
			User = _user,
			TargetTile = _targetTile
		};

		if (_targetTile.IsVisibleForPlayer || !_user.isHiddenToPlayer())
			this.Time.scheduleEvent(this.TimeUnit.Virtual, 400, this.onDelayedEffect.bindenv(this), tag);
		else
			this.onDelayedEffect(tag);

		return true;
	}

	function getAvailableTiles( _targetTile )
	{
		local ret = [];

		for( local i = 0; i != 6; ++i )
		{
			if (!_targetTile.hasNextTile(i))
				continue;

			local tile = _targetTile.getNextTile(i);

			if (!tile.IsEmpty)
				continue;

			ret.push(tile);
		}

		return ret;
	}

	function onDelayedEffect( _tag )
	{
		local targetTile = _tag.TargetTile;
		local user = _tag.User;
		local target = targetTile.getEntity();
		local potential = this.getAvailableTiles(targetTile);
		local num = ::Math.min(this.Math.rand(2, 3), potential.len());

		for (local i = 0; i < num; ++i)
		{
			local tile = potential.remove(::Math.rand(0, potential.len() - 1));
			local nightmare = this.Tactical.spawnEntity("scripts/entity/tactical/enemies/alp_nightmare_" + ::MSU.Array.rand([
				"direwolf",
				"human",
				"serpent",
				"tentacle"
			]), tile.Coords);
			nightmare.setFaction(user.getFaction());
			nightmare.spawnSpecialEffect(tile);
			nightmare.assignRandomEquipment();
			nightmare.setMaster(user);

			if (tile.Properties.Effect != null && tile.Properties.Effect.Type == "shadows")
				tile.Properties.Effect.Callback(tile, nightmare);
		}
	}

});

