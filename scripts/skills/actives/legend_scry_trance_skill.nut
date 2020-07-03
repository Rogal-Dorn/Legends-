this.legend_scry_trance_skill <- this.inherit("scripts/skills/skill", {
	m = {
        IsInTrance = false,
        IsSameTurn = false,
		BaseFatigueCost = 50,
		BaseAPCost = 5
    },
	function create()
	{
		this.m.ID = "actives.legend_scry_trance";
		this.m.Name = "Scry Area (Trance)";
		this.m.Description = "Toggle Scry Trance On (12 Tile Scry until cancelled)";
		this.m.Icon = "skills/active_104.png"; //todo: change icons, better description
		this.m.IconDisabled = "skills/active_104_sw.png";
		this.m.Overlay = "active_104";
		this.m.SoundOnUse = [
			"sounds/combat/hawk_01.wav",
			"sounds/combat/hawk_02.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.NonTargeted + 5;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = false;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsTargetingActor = false;
		this.m.ActionPointCost = this.m.BaseAPCost;
		this.m.FatigueCost = this.m.BaseFatigueCost;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
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

	function onCombatFinished()
	{
		this.m.IsInTrance = false;
		this.m.IsSameTurn = false;
	}
    
	function isUsable()
	{
		return this.skill.isUsable() && !this.m.IsSameTurn;
	}

	// function onUpdate( _properties )
	// {
	// 	if (this.m.IsInTrance)
	// 	{
	// 		this.Tactical.queryTilesInRange( this.getContainer().getActor().getTile(), 1, 12, false, [], this.onQueryTile, this.getContainer().getActor().getFaction());
	// 	}
	// }

	function onTurnStart()
	{
		if (this.m.IsInTrance)
		{
			this.Tactical.queryTilesInRange( this.getContainer().getActor().getTile(), 1, 12, false, [], this.onQueryTile, this.getContainer().getActor().getFaction());
			this.getContainer().getActor().setActionPoints(0);
		}
		this.m.IsSameTurn = false;
	}

	function onUse( _user, _targetTile )
	{
        if (this.m.IsInTrance)
        {
            this.m.Description = "Toggle Scry Trance On (12 Tile Scry until cancelled)";
			this.m.FatigueCost = this.m.BaseFatigueCost;
			this.m.ActionPointCost = this.m.BaseAPCost;	
        }
        else
        {
            this.m.Description = "Toggle Scry Trance Off"
			this.Tactical.queryTilesInRange(_user.getTile(), 1, 12, false, [], this.onQueryTile, _user.getFaction());
			this.getContainer().getActor().setActionPoints(0);
			this.m.FatigueCost = 0;
			this.m.ActionPointCost = 0;
			this.m.IsSameTurn = true;
        }
        this.m.IsInTrance = !this.m.IsInTrance;
		return true;
	}

	function onQueryTile( _tile, _tag )
	{
		_tile.addVisibilityForFaction(_tag);

		if (_tile.IsOccupiedByActor)
		{
			_tile.getEntity().setDiscovered(true);
		}
	}

});
