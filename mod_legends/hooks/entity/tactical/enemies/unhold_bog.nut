::mods_hookExactClass("entity/tactical/enemies/unhold_bog", function(o) 
{
	local onInit = o.onInit;
	o.onInit = function ()
	{
		onInit();
		if(this.Math.rand(1, 100) < 2)
		{
			head.setBrush("bust_unhold_head_05");
		}
		else
		{
			head.setBrush("bust_unhold_head_03");
		}
		foreach (a in this.Const.CharacterSprites.Helmets)
		{
			this.addSprite(a)
		}
		this.addSprite("accessory");
		this.addSprite("accessory_special");
		if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.Skills.add(this.new("scripts/skills/racial/legend_bog_unhold_racial"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_battleheart"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
			this.m.Hitpoints = 2 * b.Hitpoints;
		}
	}
});