::mods_hookExactClass("ai/tactical/agents/skeleton_melee_agent", function(o)
{	
	local addBehaviors = o.addBehaviors;
	o.onAddBehaviors = function ()
	{
		addBehaviors();
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_gash")); //mainly for mummies
	}
});
