this.legend_skeleton_gladiator_agent <- this.inherit("scripts/ai/tactical/agent", {
	m = {},
	function create()
	{
		this.agent.create();
		this.m.ID = this.Const.AI.Agent.ID.SkeletonMelee;
		this.m.Properties.IsRangedUnit = true;
		this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.Shieldwall] = 8.0;
		this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.Defend] = 1.0;
		this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.EngageMelee] = 0.0;
		this.m.Properties.TargetPriorityMoraleMult = 0.25;
		this.m.Properties.TargetPriorityBraveryMult = 0.25;
		this.m.Properties.OverallDefensivenessMult = 0.25;
		this.m.Properties.OverallFormationMult = 1.0;
		this.m.Properties.TargetPriorityFinishOpponentMult = 3.0;
		this.m.Properties.TargetPriorityFleeingMult = 1.5;
		this.m.Properties.EngageTargetArmedWithRangedWeaponMult = 1.0;
		this.m.Properties.EngageWhenAlreadyEngagedMult = 0.1;
		this.m.Properties.EngageFlankingMult = 5.0;
		this.m.Properties.EngageTargetAlreadyBeingEngagedMult = 5.0;
		this.m.Properties.PreferCarefulEngage = true;

	}

	function onAddBehaviors()
	{
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_defend"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_defend_rotation"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_break_free"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_reload"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_wake_up_ally"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_engage_ranged"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_engage_melee"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_bow"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_default"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_throw_net"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_recover"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_switchto_melee"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_switchto_ranged"));
	}

	function onUpdate()
	{
	this.setRangedAtDayOnly();
	}
});

