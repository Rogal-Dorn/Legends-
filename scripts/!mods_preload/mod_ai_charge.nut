::mods_hookNewObject("ai/tactical/behaviors/ai_charge", function(o) {
    o.m.PossibleSkills.push("actives.charge");
	o.m.PossibleSkills.push("actives.unstoppable_charge");
	o.m.PossibleSkills.push("actives.legend_horse_charge");
});