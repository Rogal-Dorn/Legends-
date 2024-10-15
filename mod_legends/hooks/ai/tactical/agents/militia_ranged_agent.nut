::mods_hookExactClass("ai/tactical/agents/militia_ranged_agent", function(o)
{	
	local addBehaviors = o.addBehaviors;
	o.onAddBehaviors = function ()
	{
		addBehaviors();
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_disengage"));
	}
});
