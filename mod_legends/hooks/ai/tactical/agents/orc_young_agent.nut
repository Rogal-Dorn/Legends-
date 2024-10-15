::mods_hookExactClass("ai/tactical/agents/orc_young_agent", function(o)
{	
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Properties.EngageRangeIdeal = 1;
	}

	local addBehaviors = o.addBehaviors;
	o.onAddBehaviors = function ()
	{
		addBehaviors();
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_thresh"));
	}
});
