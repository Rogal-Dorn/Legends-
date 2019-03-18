this.legend_field_repairs <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_field_repairs";
		this.m.Name = "Field Repairs";
		this.m.Description = "Repair armor, costs 1 Armor Part for every %5 missing armor";
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
				text = "You have[color=" + this.Const.UI.Color.PositiveValue +"] TODO [/color] armor parts, this will cost [color=" + this.Const.UI.Color.PositiveValue +"] TODO [/color] armor parts. "
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
		local currentHeadArmor = target.getArmor(this.Const.BodyPart.Head);
		local currentBodyArmor = target.getArmor(this.Const.BodyPart.Body);
		local maxHeadArmor = target.getArmorMax(this.Const.BodyPart.Head);
		local maxBodyArmor = target.getArmorMax(this.Const.BodyPart.Body);
		local armorParts = this.World.Assets.getArmorParts();
	
		if (currentHeadArmor = maxHeadArmor && currentBodyArmor = maxBodyArmor)
		{
			return false;
		}


		if (armorParts <= 1 )
		{
			return false;
		}

		return true;
	}
	function onUse( _user, _targetTile )
	{
		local armorParts = this.World.Assets.getArmorParts();
		local target = _targetTile.getEntity();
		local currentHeadArmor = target.getArmor(this.Const.BodyPart.Head);
		local currentBodyArmor = target.getArmor(this.Const.BodyPart.Body);
		local maxHeadArmor = target.getArmorMax(this.Const.BodyPart.Head);
		local maxBodyArmor = target.getArmorMax(this.Const.BodyPart.Body);
		local percentMaxHeadArmor = maxHeadArmor / 100;
		local percentMaxBodyArmor = maxBodyArmor / 100;
		local percentCurrentHeadArmor = currentHeadArmor / percentMaxHeadArmor;
		local percentCurrentBodyArmor = currentBodyArmor / percentMaxBodyArmor;
		local missingHeadArmor = percentMaxHeadArmor - percentCurrentHeadArmor;
		local missingBodyArmor = percentMaxBodyArmor - percentCurrentBodyArmor;
		local maxRepair = armorParts * 5;

			if (missingHeadArmor > missingBodyArmor)
				{
					if (missingHeadArmor >= maxRepair)
						{
						local cost = armorParts * -1;
						this.World.Assets.addArmorParts(cost);
						target.setArmor(this.Math.min(currentHeadArmor + maxRepair, maxHeadArmor));
						}
					else if (missingHeadArmor < maxRepair)
						{
						local cost = missingHeadArmor * -0.2;
						this.World.Assets.addArmorParts(cost);
						target.setArmor(maxHeadArmor);
						}
				}
				else if (missingHeadArmor <= missingBodyArmor)
				{
					if (missingBodyArmor >= maxRepair)
						{
						local cost = armorParts * -1;
						this.World.Assets.addArmorParts(cost);
						target.setArmor(this.Math.min(currentBodyArmor + maxRepair, maxBodyArmor));
						}
					else if (missingBodyArmor < maxRepair)
						{
						local cost = missingBodyArmor * -0.2;
						this.World.Assets.addArmorParts(cost);
						target.setArmor(maxBodyArmor);
						}
				}
	}

});
