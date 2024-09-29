::mods_hookExactClass("ai/tactical/behaviors/ai_attack_bow", function(o) 
{
	o.m.PossibleSkills.extend([
		"actives.legend_catapult_boulder",
		"actives.legend_sling_heavy_stone",
		"actives.legend_shoot_dart"
	]);
});