::mods_hookExactClass("entity/tactical/enemies/zombie_betrayer", function(o) 
{
	local onInit = o.onInit;
	o.onInit = function ()
	{
		onInit();
		b.SurroundedBonus = 5; // resetting from vanilla
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_poison_immunity"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
		if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			b.MeleeSkill += 5;
			this.m.Hitpoints = b.Hitpoints * 1.5;
		}
	}
});