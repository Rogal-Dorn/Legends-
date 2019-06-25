this.legend_field_repairs <- this.inherit("scripts/skills/skill", {
	m = {
	ArmorCost = 0,
	ArmorParts = 0
	},
	function create()
	{
		this.m.ID = "actives.legend_field_repairs";
		this.m.Name = "Field Repairs";
		this.m.Description = "Repair armor, costs 1 Armor Part for every 5 missing armor";
		this.m.Icon = "skills/repair_square.png";
		this.m.IconDisabled = "skills/repair_square_bw.png";
		this.m.Overlay = "active_41";
		this.m.SoundOnUse = [
			"sounds/ambience/buildings/blacksmith_hammering_00.wav",
			"sounds/ambience/buildings/blacksmith_hammering_01.wav",
			"sounds/ambience/buildings/blacksmith_hammering_02.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.ActionPointCost = 8;
		this.m.FatigueCost = 16;
		this.m.MinRange = 1;
		this.m.MaxRange = 2;
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
				text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.MaxRange + "[/color], can only target units with damaged armor"
			}
		]);
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/asset_money.png",
				text = "You have[color=" + this.Const.UI.Color.PositiveValue +"]" + this.m.ArmorParts + "[/color] armor parts, this will cost [color=" + this.Const.UI.Color.PositiveValue +"]" + this.m.ArmorCost + "[/color] armor parts. "
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
		local missingHeadArmor = maxHeadArmor - currentHeadArmor;
		local missingBodyArmor = maxBodyArmor - currentBodyArmor;
		local missingArmor = missingHeadArmor + missingBodyArmor;
		local cost = missingArmor / 5;
		this.m.ArmorCost = cost;
		local armorParts = this.World.Assets.getArmorParts();
		this.m.ArmorParts = armorParts;

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
		local missingHeadArmor = maxHeadArmor - currentHeadArmor;
		local missingBodyArmor = maxBodyArmor - currentBodyArmor;
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
