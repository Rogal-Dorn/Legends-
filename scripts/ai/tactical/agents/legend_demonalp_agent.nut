this.legend_demonalp_agent <- this.inherit("scripts/ai/tactical/agent", {
	m = {},
	function create()
	{
		this.agent.create();
		this.m.ID = this.Const.AI.Agent.ID.LegendDemonAlp;
		this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.AttackDefault] = 1.25;
		this.m.Properties.TargetPriorityHitchanceMult = 0.0;
		this.m.Properties.TargetPriorityHitpointsMult = 0.5;
		this.m.Properties.TargetPriorityRandomMult = 0.0;
		this.m.Properties.TargetPriorityMoraleMult = 0.25;
		this.m.Properties.TargetPriorityBraveryMult = 0.25;
		this.m.Properties.TargetPriorityHittingAlliesMult = 1.0;
		this.m.Properties.OverallDefensivenessMult = 0.1;
		this.m.Properties.OverallFormationMult = 1.0;
		this.m.Properties.EngageRangeMin = 1;
		this.m.Properties.EngageRangeMax = 9;
		this.m.Properties.EngageRangeIdeal = 9;
		this.m.Properties.PreferCarefulEngage = true;
	}

	function onAddBehaviors()
	{
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_retreat"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_engage_ranged"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_break_free"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_defend"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_defend_rotation"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_disengage"));

		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_default"));
		//this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_alp_teleport"));

		local summon = this.new("scripts/ai/tactical/behaviors/ai_sleep");
		summon.m.PossibleSkills.push("actives.alp_nightmare_manifestation");
		this.addBehavior(summon);

		local mist = this.new("scripts/ai/tactical/behaviors/ai_miasma");
		mist.m.PossibleSkills.push("actives.alp_realm_of_shadow");
		this.addBehavior(mist);

		// this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_corruption"));
	}

	function onUpdate()
	{
	}

});

