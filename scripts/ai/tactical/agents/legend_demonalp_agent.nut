this.legend_demonalp_agent <- this.inherit("scripts/ai/tactical/agent", {
	m = {},
	function create()
	{
		this.agent.create();
		this.m.ID = this.Const.AI.Agent.ID.LegendDemonAlp;
		this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.AttackDefault] = 1.50;
		this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.Miasma] = 0.80;
		this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.Sleep] = 1.25;
		this.m.Properties.TargetPriorityHitchanceMult = 0.0;
		this.m.Properties.TargetPriorityHitpointsMult = 0.5;
		this.m.Properties.TargetPriorityRandomMult = 0.0;
		this.m.Properties.TargetPriorityMoraleMult = 0.25;
		this.m.Properties.TargetPriorityBraveryMult = 0.25;
		this.m.Properties.TargetPriorityHittingAlliesMult = 1.0;
		this.m.Properties.OverallDefensivenessMult = 0.1;
		this.m.Properties.OverallFormationMult = 1.0;
		this.m.Properties.EngageRangeMin = 7;
		this.m.Properties.EngageRangeMax = 9;
		this.m.Properties.EngageRangeIdeal = 9;
		this.m.Properties.PreferCarefulEngage = true;
		this.m.Properties.PreferWait = true;
	}

	function onAddBehaviors()
	{
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_retreat"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_engage_ranged"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_break_free"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_defend"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_defend_rotation"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_disengage"));

		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_sleep"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_alp_realm_of_shadow"));

		local behavior = this.new("scripts/ai/tactical/behaviors/ai_always_use");
		behavior.m.PossibleSkills.push("actives.alp_summon_nightmare");
		this.addBehavior(behavior);

		behavior = this.new("scripts/ai/tactical/behaviors/ai_attack_default");
		behavior.m.PossibleSkills.push("actives.alp_nightmare_manifestation");
		this.addBehavior(behavior);

		//this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_alp_teleport"));
		//this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_corruption"));
	}

	function onUpdate()
	{
	}

});

