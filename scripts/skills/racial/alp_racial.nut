this.alp_racial <- this.inherit("scripts/skills/skill", {
	m = {
		TimesWaited = 0
	},
	function create()
	{
		this.m.ID = "racial.alp";
		this.m.Name = "Existing partly in dreams";
		this.m.Description = "TODO";
		this.m.Icon = "skills/status_effect_81.png";
		this.m.Type = this.Const.SkillType.Racial | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function onTurnStart()
	{
		this.m.TimesWaited = 0;
	}

	function onResumeTurn()
	{
		if (++this.m.TimesWaited <= 1 && this.getContainer().getActor().getActionPoints() >= 4)
		{
			this.getContainer().getActor().setWaitActionSpent(false);
		}
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_skill.getID() == "actives.aimed_shot" || _skill.getID() == "actives.quick_shot" || _skill.getID() == "actives.shoot_bolt" || _skill.getID() == "actives.shoot_stake")
		{
			_properties.DamageReceivedRegularMult *= 0.100000001;
		}
		else if (_skill.getID() == "actives.throw_javelin")
		{
			_properties.DamageReceivedRegularMult *= 0.25;
		}
		else if (_skill.getID() == "actives.puncture" || _skill.getID() == "actives.thrust" || _skill.getID() == "actives.stab" || _skill.getID() == "actives.impale" || _skill.getID() == "actives.rupture" || _skill.getID() == "actives.lunge")
		{
			_properties.DamageReceivedRegularMult *= 0.5;
		}
		else if (_skill.getID() == "actives.wardog_bite" || _skill.getID() == "actives.wolf_bite")
		{
			_properties.DamageReceivedRegularMult *= 0.330000013;
		}
	}

});
