::mods_hookNewObject("ai/tactical/behaviors/ai_defend_knock_back", function ( o )
{
	o.m.PossibleSkills.push("actives.legend_kick");
	o.m.PossibleSkills.push("actives.legend_revolt");
	o.m.PossibleSkills.push("actives.legend_push");
	o.m.PossibleSkills.push("actives.legend_chain_hook");
});

