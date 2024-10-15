::mods_hookExactClass("ai/tactical/agents/military_standard_bearer_agent", function(o)
{	
	local addBehaviors = o.addBehaviors;
	o.onAddBehaviors = function ()
	{
		addBehaviors();
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_boost_stamina"));
	}
});
