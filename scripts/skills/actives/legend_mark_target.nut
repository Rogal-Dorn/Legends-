this.legend_mark_target <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_mark_target";
		this.m.Name = "Daze";
		this.m.Description = "Analyse the weak points on an opponent and tell your comrades, reducing the targets ranged defense by 20";
		this.m.KilledString = "Marked";
		this.m.Icon = "skills/daze_square.png";
		this.m.IconDisabled = "skills/daze_square_bw.png";
		this.m.Overlay = "daze_square";
		this.m.SoundOnUse = [
			"sounds/combat/stupefy_01.wav",
			"sounds/combat/stupefy_02.wav",
			"sounds/combat/stupefy_03.wav",
			"sounds/combat/stupefy_04.wav",
			"sounds/combat/stupefy_05.wav"

		];
		this.m.SoundOnHit = [
			"sounds/human/0/human_fatigue_01.wav",
			"sounds/human/0/human_fatigue_01.wav",
			"sounds/human/0/human_fatigue_01.wav",
			"sounds/human/0/human_fatigue_01.wav"
		];
		this.m.SoundVolume = 1.25;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 2;
		this.m.FatigueCost = 10;
		this.m.MinRange = 1;
		this.m.MaxRange = 6;
	}

	function getTooltip()
	{
		local ret = this.getDefaultUtilityTooltip()
		ret.push(
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Leave your opponent marked, reducing their ranged defense by 20"
			})
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectBash);

		if (target.isAlive())
		{
			target.getSkills().add(this.new("scripts/skills/effects/legend_marked_target"));

			if (!_user.isHiddenToPlayer() && _targetTile.IsVisibleForPlayer)
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " stupefied " + this.Const.UI.getColorizedEntityName(_targetTile.getEntity()) + " leaving them marked");
			}
		}
	}

});
