::mods_hookExactClass("entity/tactical/enemies/skeleton_lich_mirror_image", function(o) 
{
	local onInit = o.onInit;
	o.onInit = function ()
	{
		onInit();
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_composure"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_poison_immunity"));
	}
});