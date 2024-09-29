::mods_hookExactClass("ai/tactical/behaviors/ai_defend_riposte", function(o) 
{
	o.m.PossibleSkills.extend([
		"actives.legend_staff_riposte",
		"actives.return_favor"
	]);
});