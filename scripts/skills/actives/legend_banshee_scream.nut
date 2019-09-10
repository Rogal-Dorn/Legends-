this.legend_banshee_scream <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_banshee_scream";
		this.m.Name = "Banshee Scream";
		this.m.Description = "";
		this.m.Icon = "skills/active_41.png";
		this.m.IconDisabled = "skills/active_41.png";
		this.m.Overlay = "active_41";
		this.m.SoundOnUse = [
			"sounds/enemies/banshee_attack_01.wav",
			"sounds/enemies/banshee_attack_02.wav",
			"sounds/enemies/banshee_attack_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsVisibleTileNeeded = false;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 0;
		this.m.MinRange = 1;
		this.m.MaxRange = 4;
		this.m.MaxLevelDifference = 4;
	}

	function onUse( _user, _targetTile )
	{
		if (!_user.isHiddenToPlayer() || _targetTile.IsVisibleForPlayer)
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " uses Banshee Scream");
		}

		local hit = false;
		hit = hit || _targetTile.getEntity().checkMorale(-1, 0, this.Const.MoraleCheckType.MentalAttack);
		hit = hit || _targetTile.getEntity().checkMorale(-1, 0, this.Const.MoraleCheckType.MentalAttack);
		hit = hit || _targetTile.getEntity().checkMorale(-1, 0, this.Const.MoraleCheckType.MentalAttack);
		hit = hit || _targetTile.getEntity().checkMorale(-1, 0, this.Const.MoraleCheckType.MentalAttack);
		if (hit)
		{
			//Do some damage!!
		}
		return true;
	}

});

