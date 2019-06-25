this.legend_field_treats <- this.inherit("scripts/skills/skill", {
	m = {
	Food = 0
	},
	function create()
	{
		this.m.ID = "actives.legend_field_treats";
		this.m.Name = "Field Treats";
		this.m.Description = "Restore confidence through liberal application of alcohol and food, taking someone from wavering to steady";
		this.m.Icon = "skills/drink_square.png";
		this.m.IconDisabled = "skills/drink_square_bw.png";
		this.m.Overlay = "active_41";
		this.m.SoundOnUse = [
			"sounds/combat/drink_01.wav",
			"sounds/combat/drink_02.wav",
			"sounds/combat/drink_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
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
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/asset_money.png",
				text = "You have[color=" + this.Const.UI.Color.PositiveValue +"]" + this.m.Food + "[/color] food, this will cost [color=" + this.Const.UI.Color.PositiveValue +"] 50 [/color] food. "
			});

		return ret;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local food = this.World.Assets.getFood();
		this.m.Food = food;

		if (food < 50 )
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local food = this.World.Assets.getFood();
		local a = _targetTile.getEntity();
		local myTile = _user.getTile();

		if (food >= 50)
			{
			this.World.Assets.addMedicine(-50);
				if (!a.getSkills().hasSkill("effects.rallied"))
				{
					for( ; a.getMoraleState() >= this.Const.MoraleState.Steady;  )
					{
					}
					local bravery = this.Math.floor(_user.getCurrentProperties().getBravery() * 0.5);
					local difficulty = bravery;
					local distance = a.getTile().getDistanceTo(myTile) * 10;
					local morale = a.getMoraleState();

					if (a.getMoraleState() == this.Const.MoraleState.Wavering)
					{
						a.checkMorale(this.Const.MoraleState.Steady - this.Const.MoraleState.Wavering, difficulty, this.Const.MoraleCheckType.Default, "status_effect_56");
					}
					else
					{
						a.checkMorale(1, difficulty - distance, this.Const.MoraleCheckType.Default, "status_effect_56");
					}

					if (morale != a.getMoraleState())
					{
						a.getSkills().add(this.new("scripts/skills/effects/rallied_effect"));
					}
				}

			}

		return true;
	}

});
