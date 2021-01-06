this.legend_holyflame_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_holyflame";
		this.m.Name = "Holy Flame";
		this.m.Description = "Bless an area, the holy shall be sanctified when entering, the damned shall be consecrated.";
		this.m.Icon = "skills/holybluefire_square.png";
		this.m.IconDisabled = "skills/holyfire_square_bw.png";
		this.m.Overlay = "bluefire_circle";
		this.m.SoundOnUse = [
			"sounds/combat/fire_01.wav",
			"sounds/combat/fire_02.wav",
			"sounds/combat/fire_03.wav",
			"sounds/combat/fire_04.wav",
			"sounds/combat/fire_05.wav",
			"sounds/combat/fire_06.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted +10;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsRanged = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.IsDoingForwardMove = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.ActionPointCost = 7;
		this.m.FatigueCost = 30;
		this.m.MinRange = 1;
		this.m.MaxRange = 3;
		this.m.MaxLevelDifference = 3;
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
		ret.extend([
			{
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Apply hallowed ground. Our allies shall be sanctified, becoming immune to injury. The undead shall be consecrated, able to gain injury and unable to resurrect."
			}
		]);
		return ret;
	}

	function isViableTarget( _user, _target )
	{

		if (_target.getTile().Properties.Effect != null)
		{
			return false;
		}

		return true;
	}

	function isUsable()
	{

		return !this.Tactical.isActive() || this.skill.isUsable();
	}

	function onUse( _user, _targetTile )
	{
		local targets = [];
		targets.push(_targetTile);

		for( local i = 0; i != 6; i = ++i )
		{
			if (!_targetTile.hasNextTile(i))
			{
				continue
			}
			local tile = _targetTile.getNextTile(i);
			targets.push(tile);
		}

		local p = {
			Type = "legend_holyflame",
			Tooltip = "This is hallowed ground. Our allies shall be sanctified, becoming immune to injury. The undead shall be consecrated, able to gain injury and unable to resurrect.",
			IsAppliedAtRoundStart = false,
			IsAppliedAtTurnEnd = true,
			IsAppliedOnMovement = false,
			IsByPlayer = _user.isPlayerControlled(),
			Timeout = this.Time.getRound() + 2,
			Callback = this.Const.Tactical.Common.onApplyHolyFlame
			function Applicable( _a )
			{
				return true;
			}
		};

		foreach( tile in targets )
		{
			if (tile.Properties.Effect != null && tile.Properties.Effect.Type == "legend_holyflame")
			{
				tile.Properties.Effect.Timeout = this.Time.getRound() + 2;
			}
			else
			{
				tile.Properties.Effect = clone p;
				local particles = [];

				for( local i = 0; i < this.Const.Tactical.HolyFlameParticles.len(); i = ++i )
				{
					particles.push(this.Tactical.spawnParticleEffect(true, this.Const.Tactical.HolyFlameParticles[i].Brushes, tile, this.Const.Tactical.HolyFlameParticles[i].Delay, this.Const.Tactical.HolyFlameParticles[i].Quantity, this.Const.Tactical.HolyFlameParticles[i].LifeTimeQuantity, this.Const.Tactical.HolyFlameParticles[i].SpawnRate, this.Const.Tactical.HolyFlameParticles[i].Stages));
				}

				this.Tactical.Entities.addTileEffect(tile, tile.Properties.Effect, particles);
			}
		}

		return true;
	}

});
