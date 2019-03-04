this.lash <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.lash";
		this.m.Name = "Lash";
		this.m.Description = "Swinging the flail in a wide cone in front of the character without aiming at any particular target. Has a good chance to hit any one of up to three targets, but only one, as the swing comes to a halt once it first connects. Somewhat unpredictable who will be hit, so be careful around your own men!";
		this.m.Icon = "skills/active_38.png";
		this.m.IconDisabled = "skills/active_38_sw.png";
		this.m.Overlay = "active_38";
		this.m.SoundOnUse = [
			"sounds/combat/lash_01.wav",
			"sounds/combat/lash_02.wav",
			"sounds/combat/lash_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/lash_hit_01.wav",
			"sounds/combat/lash_hit_02.wav",
			"sounds/combat/lash_hit_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsAOE = true;
		this.m.DirectDamageMult = 0.25;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.ChanceDecapitate = 0;
		this.m.ChanceDisembowel = 0;
		this.m.ChanceSmash = 50;
	}

	function getTooltip()
	{
		local p = this.getContainer().getActor().getCurrentProperties();
		local mult = 1.0;
		local damage_regular_min = this.Math.floor(p.getDamageRegularMin() * mult);
		local damage_regular_max = this.Math.floor(p.getDamageRegularMax() * mult);
		local damage_Armor_min = this.Math.floor(p.getDamageArmorMin() * mult);
		local damage_Armor_max = this.Math.floor(p.getDamageArmorMax() * mult);
		local damage_direct_max = this.Math.floor(damage_regular_max * this.m.DirectDamageMult);
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
		ret.push({
			id = 4,
			type = "text",
			icon = "ui/icons/regular_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + damage_regular_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_regular_max + "[/color] damage, of which [color=" + this.Const.UI.Color.DamageValue + "]0[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_direct_max + "[/color] can ignore armor"
		});

		if (damage_Armor_max > 0)
		{
			ret.push({
				id = 5,
				type = "text",
				icon = "ui/icons/armor_damage.png",
				text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + damage_Armor_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_Armor_max + "[/color] armor damage"
			});
		}

		ret.extend([
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Can hit one of up to three targets"
			}
		]);
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		local ownTile = _user.getTile();
		local dir = ownTile.getDirectionTo(_targetTile);
		local middleTile = _targetTile;

		if (this.attackEntity(_user, _targetTile.getEntity()))
		{
			this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectLash);
			return true;
		}

		local nextDir = dir - 1 >= 0 ? dir - 1 : this.Const.Direction.COUNT - 1;

		if (ownTile.hasNextTile(nextDir))
		{
			local nextTile = ownTile.getNextTile(nextDir);

			if (nextTile.IsOccupiedByActor && this.Math.abs(nextTile.Level - ownTile.Level) <= 1)
			{
				if (this.attackEntity(_user, nextTile.getEntity()))
				{
					this.spawnAttackEffect(nextTile, this.Const.Tactical.AttackEffectLash);
					return true;
				}
			}
		}

		nextDir = nextDir - 1 >= 0 ? nextDir - 1 : this.Const.Direction.COUNT - 1;

		if (ownTile.hasNextTile(nextDir))
		{
			local nextTile = ownTile.getNextTile(nextDir);

			if (nextTile.IsOccupiedByActor && this.Math.abs(nextTile.Level - ownTile.Level) <= 1)
			{
				if (this.attackEntity(_user, nextTile.getEntity()))
				{
					this.spawnAttackEffect(nextTile, this.Const.Tactical.AttackEffectLash);
					return true;
				}
			}
		}

		this.spawnAttackEffect(middleTile, this.Const.Tactical.AttackEffectLash);
		return false;
	}

	function onTargetSelected( _targetTile )
	{
		local ownTile = this.m.Container.getActor().getTile();
		local dir = ownTile.getDirectionTo(_targetTile);
		this.Tactical.getHighlighter().addOverlayIcon(this.Const.Tactical.Settings.AreaOfEffectIcon, _targetTile, _targetTile.Pos.X, _targetTile.Pos.Y);
		local nextDir = dir - 1 >= 0 ? dir - 1 : this.Const.Direction.COUNT - 1;

		if (ownTile.hasNextTile(nextDir))
		{
			local nextTile = ownTile.getNextTile(nextDir);

			if (!nextTile.IsEmpty && nextTile.getEntity().isAttackable() && this.Math.abs(nextTile.Level - ownTile.Level) <= 1)
			{
				this.Tactical.getHighlighter().addOverlayIcon(this.Const.Tactical.Settings.AreaOfEffectIcon, nextTile, nextTile.Pos.X, nextTile.Pos.Y);
			}
		}

		nextDir = nextDir - 1 >= 0 ? nextDir - 1 : this.Const.Direction.COUNT - 1;

		if (ownTile.hasNextTile(nextDir))
		{
			local nextTile = ownTile.getNextTile(nextDir);

			if (!nextTile.IsEmpty && nextTile.getEntity().isAttackable() && this.Math.abs(nextTile.Level - ownTile.Level) <= 1)
			{
				this.Tactical.getHighlighter().addOverlayIcon(this.Const.Tactical.Settings.AreaOfEffectIcon, nextTile, nextTile.Pos.X, nextTile.Pos.Y);
			}
		}
	}

});

