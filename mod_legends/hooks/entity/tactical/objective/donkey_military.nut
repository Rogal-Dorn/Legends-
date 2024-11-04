::mods_hookExactClass("entity/objective/tactical/donkey_military", function(o) 
{
	o.onInit <- function ()
	{
		this.donkey.onInit();
		this.m.Skills.add(this.new("scripts/skills/active/legend_donkey_kick_skill"));
		if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_muscularity"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_steadfast"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_stalwart"));
		}
		this.m.Skills.update();
	}
});