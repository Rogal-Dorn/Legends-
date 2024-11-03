::mods_hookExactClass("entity/tactical/enemies/kraken_tentacle", function(o) 
{
	local onInit = o.onInit;
	o.onInit = function ()
	{
		onInit();
		local b = this.m.BaseProperties;
		b.IsAffectedByRain = false;
		this.m.Skills.add(this.new("scripts/skills/perks/perk_stalwart"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_poison_immunity"));
	}
});