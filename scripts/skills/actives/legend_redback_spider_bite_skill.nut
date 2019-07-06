this.legend_redback_spider_bite_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_redback_spider_bite";
		this.m.Name = "Redback Webknecht Bite";
		this.m.Description = "";
		this.m.KilledString = "Ripped to shreds";
		this.m.Icon = "skills/active_115.png";
		this.m.Overlay = "active_115";
		this.m.SoundOnUse = [
			"sounds/enemies/dlc2/giant_spider_attack_01.wav",
			"sounds/enemies/dlc2/giant_spider_attack_02.wav",
			"sounds/enemies/dlc2/giant_spider_attack_03.wav",
			"sounds/enemies/dlc2/giant_spider_attack_04.wav",
			"sounds/enemies/dlc2/giant_spider_attack_05.wav"
		];
		this.m.SoundOnHit = [
			"sounds/enemies/dlc2/giant_spider_attack_hit_01.wav",
			"sounds/enemies/dlc2/giant_spider_attack_hit_02.wav",
			"sounds/enemies/dlc2/giant_spider_attack_hit_03.wav",
			"sounds/enemies/dlc2/giant_spider_attack_hit_04.wav",
			"sounds/enemies/dlc2/giant_spider_attack_hit_05.wav",
			"sounds/enemies/dlc2/giant_spider_attack_hit_06.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.DirectDamageMult = 0.5;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 10;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.ChanceDecapitate = 0;
		this.m.ChanceDisembowel = 50;
		this.m.ChanceSmash = 0;
	}

	function onUpdate( _properties )
	{
		_properties.DamageRegularMin += 30;
		_properties.DamageRegularMax += 50;
		_properties.DamageArmorMult *= 1.0;
	}

	function onUse( _user, _targetTile )
	{
		
		local success = this.attackEntity(_user, _targetTile.getEntity());

		if (!_user.isAlive() || _user.isDying())
		{
			return success;
		}

		if (success && _targetTile.IsOccupiedByActor)
			{
				local target = _targetTile.getEntity();
	
				if (!target.getCurrentProperties().IsImmuneToPoison)
				{
					target.getSkills().add(this.new("scripts/skills/effects/legend_redback_spider_poison_effect"));

					if (!target.getSkills().hasSkill("effects.stunned"))
					{
						target.getSkills().add(this.new("scripts/skills/effects/stunned_effect"));
					}

					if (!_user.isHiddenToPlayer() && _targetTile.IsVisibleForPlayer)
					{
						this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " has poisoned " + this.Const.UI.getColorizedEntityName(target) + " for ten turns");
						this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " has stunned " + this.Const.UI.getColorizedEntityName(target) + " for one turn");
					}
				}
			}
	

		return success;
	}

});

