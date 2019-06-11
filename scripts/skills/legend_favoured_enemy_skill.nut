this.legend_favoured_enemy_skill <- this.inherit("scripts/skills/skill", {
	m = {
		ValidTypes = [],
		BraveryMult = 1.0
	},
	function create()
	{
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function validTarget( _targetID)
	{
		foreach (t in this.m.ValidTypes)
		{
			if (_targetID == t)
			{
				return true;
			}
		}
		return false;
	}

	function getTotalKills( _actor )
	{
		local _actor = this.getContainer().getActor();
		if (_actor == null)
		{
			return 0;
		}

		local kills = 0;
		foreach (t in this.m.ValidTypes)
		{
			local mKills = 0;
			mKills = _actor.getLifetimeStats().Tags.get(t)
			if (mKills > 0)
			{
				kills += mKills;
			}
		}
		return kills;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity == null)
		{
			return;
		}
		
		if (!this.validTarget(_targetEntity.getType()))
		{
			return;
		}
		
		local kills = this.getTotalKills()
		_properties.MeleeSkill += this.Math.min(5, this.Math.floor(kills / 10));
		_properties.RangedSkill += this.Math.min(5, this.Math.floor(kills / 10));
		_properties.DamageRegularMax *= 1.1;
	}

	function onUpdate( _properties )
	{
		if (this.m.BraveryMult == 1.0)
		{
			return;
		}

		if (!("Entities" in this.Tactical))
		{
			return;
		}

		if (this.Tactical.Entities == null)
		{
			return;
		}

		local actors = this.Tactical.Entities.getAllInstancesAsArray();
		foreach( a in actors )
		{
			foreach (vt in this.m.ValidTypes)
			{
				if (a.getType() == vt)
				{
					_properties.BraveryMult *= this.m.BraveryMult;
					return;
				}
			}
		}
	}
	
});

