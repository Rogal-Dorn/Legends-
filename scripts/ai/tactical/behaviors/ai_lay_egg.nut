this.ai_lay_egg <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		TargetTile = null,
		AttemptsThisTurn = 0,
		IsSpent = false
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.LayEgg;
		this.m.Order = this.Const.AI.Behavior.Order.LayEgg;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.TargetTile = null;

		if (this.m.IsSpent)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.m.AttemptsThisTurn >= 1)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.Tactical.Entities.getInstancesOfFaction(_entity.getFaction()).len() <= 4)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		return this.Const.AI.Behavior.Score.LayEgg;
	}

	function onBeforeExecute( _entity )
	{
		++this.m.AttemptsThisTurn;
	}

	function onTurnStarted()
	{
		this.m.AttemptsThisTurn = 0;
	}

	function onExecute( _entity )
	{
		local tile = this.findPosition();

		if (tile != null)
		{
			this.m.IsSpent = true;
			local egg = this.Tactical.spawnEntity("scripts/entity/tactical/enemies/spider_egg", tile.Coords);
			egg.setFaction(_entity.getFaction());
		}

		return true;
	}

	function findPosition()
	{
		local mapSize = this.Tactical.getMapSize();

		for( local attempts = 0; attempts < 10; attempts = ++attempts )
		{
			local x = this.Math.rand(3, mapSize.X - 3);
			local y = this.Math.rand(3, mapSize.Y - 3);
			local tile = this.Tactical.getTileSquare(x, y);

			if (!tile.IsEmpty)
			{
			}
			else if (tile.IsVisibleForPlayer)
			{
			}
			else
			{
				return tile;
			}
		}

		return null;
	}

});

