::mods_hookExactClass("ai/tactical/behaviors/ai_attack_terror", function(o) 
{
	o.m.PossibleSkills.extend([
		"actives.legend_banshee_scream",
		"actives.legend_horrific_scream"
	]);
});