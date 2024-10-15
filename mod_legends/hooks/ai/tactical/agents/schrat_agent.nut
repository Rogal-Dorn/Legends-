::mods_hookExactClass("ai/tactical/agents/schrat_agent", function(o)
{	
	local addBehaviors = o.addBehaviors;
	o.onAddBehaviors = function ()
	{
		addBehaviors();
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_defend_knock_back"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_knock_out"));
	}
});
