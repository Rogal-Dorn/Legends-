::mods_hookExactClass("ai/tactical/agents/ghost_agent", function(o)
{	
	local addBehaviors = o.addBehaviors;
	o.onAddBehaviors = function ()
	{
		addBehaviors();
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_disengage"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_darkflight"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_defend_rotation"));
	}
});
