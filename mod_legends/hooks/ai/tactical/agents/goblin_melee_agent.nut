::mods_hookExactClass("ai/tactical/agents/goblin_melee_agent", function(o)
{	
	local addBehaviors = o.addBehaviors;
	o.onAddBehaviors = function ()
	{
		addBehaviors();
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_thresh"));
	}
});
