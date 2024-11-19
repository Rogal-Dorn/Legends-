::mods_hookExactClass("entity/tactical/enemies/unhold_frost", function(o) 
{
	local onInit = o.onInit;
	o.onInit = function ()
	{
		onInit();
		local b = this.m.BaseProperties;
		if(this.Math.rand(1, 100) < 1)
		{
			head.setBrush("bust_unhold_head_06");
		}
		else
		{
			head.setBrush("bust_unhold_head_01");
		}
		foreach (a in this.Const.CharacterSprites.Helmets)
		{
			this.addSprite(a)
		}
		if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			b.MeleeSkill += 10;
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_battleheart"));
			this.m.Hitpoints = 2 * b.Hitpoints;
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
		}
	}

	o.onFactionChanged = function()
	{
	}
});