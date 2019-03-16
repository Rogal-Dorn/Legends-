this.legend_field_triage <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_field_triage";
		this.m.Name = "Field Triage";
		this.m.Description = "Heal a unit, costs 1 medicine for every 5 health";
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
		this.m.FatigueCost = 4;
		this.m.MinRange = 1;
		this.m.MaxRange = 3;
		this.m.MaxLevelDifference = 4;
	}


		function getTooltip( )
	{
		local ret = this.getDefaultTooltip();
		ret.extend([
			{
				id = 6,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.MaxRange + "[/color], can only target damaged units"
			}
		]);
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/asset_money.png",
				text = "You have[color=" + this.Const.UI.Color.PositiveValue +"] TODO [/color] medicine, this will cost [color=" + this.Const.UI.Color.PositiveValue +"] TODO [/color] medicine. "
			});

		return ret;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local target = _targetTile.getEntity();
		local maxHP = target.getHitpointsMax();
		local currentHP = target.getHitpoints();
		local meds = this.World.Assets.getMedicine();
	
		if (maxHP = currentHP )
		{
			return false;
		}


		if (meds <= 1 )
		{
			return false;
		}

		return true;
	}
	function onUse( _user, _targetTile )
	{
		local meds = this.World.Assets.getMedicine();
		local target = _targetTile.getEntity();
		local maxHP = target.getHitpointsMax();
		local percentHP = maxHP / 100;
		local currentHP = target.getHitpoints();
		local currentPercent = currentHP / percentHP;
		local missingPercent = 100 - currentPercent;
		local maxHeal = meds * 5; 
		
		if (missingPercent => maxHeal)
			{
			local cost = meds * -1;
			this.World.Assets.addMedicine(cost);
			targetSetHitpoints(this.Math.min(actor.getHitpoints() + maxHeal, maxHP);
			}
		else if (missingPercent < maxHeal)
			{
			local cost = missingPercent * -0.2;
			this.World.Assets.addMedicine(cost);
			targetSetHitpoints(maxHP);
			}
		return true;
	}

});
