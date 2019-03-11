this.legend_bribe <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_bribe";
		this.m.Name = "Bribe";
		this.m.Description = "Throw coins at an enemy to bribe them away from battle";
		this.m.Icon = "skills/coins_square.png";
		this.m.IconDisabled = "skills/coins_square_bw.png";
		this.m.Overlay = "active_41";
		this.m.SoundOnUse = [
			"sounds/coins_01.wav",
			"sounds/coins_02.wav",
			"sounds/coins_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 0;
		this.m.MinRange = 1;
		this.m.MaxRange = 3;
		this.m.MaxLevelDifference = 4;
	}

		function getTooltip()
	{
		local target = _targetTile.getEntity();
		local xp = target.getBaseProperties().XP;
		local cost = xp * -1;
		local ret = this.getDefaultTooltip();
		ret.extend([
			{
				id = 6,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.MaxRange + "[/color], can only target humans."
			}
		]);
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/asset_money.png",
				text = "Will cost [color=" + this.Const.UI.Color.PositiveValue + "]" + cost + "[/color] crowns"
			});

		return ret;
	}


	function isUsable()
	{
		local target = _targetTile.getEntity();
		local xp = target.getBaseProperties().XP;
		if (this.World.Assets.getMoney() >= xp  && if (target.getTags().has("human")))
		{
			return true;
		}

	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();
		local xp = target.getBaseProperties().XP;
		local cost = xp * -1;
		this.World.Assets.addMoney(cost);
		target.setMoraleState(this.Const.MoraleState.Fleeing);
		return true;
	}

});
