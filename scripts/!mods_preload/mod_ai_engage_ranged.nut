::mods_hookNewObject("ai/tactical/behaviors/ai_engage_ranged", function(o) {
    o.m.PossibleSkills.push("actives.legend_quick_pebble");
    o.m.PossibleSkills.push("actives.legend_aimed_pebble");
});