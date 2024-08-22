::mods_hookNewObject("ai/tactical/behaviors/ai_defend_rotation", function ( o )
{
	if (::Legends.Mod.ModSettings.getSetting("MaximumChanceToHit").getValue())
		o.m.PossibleSkills = [];
}); 
