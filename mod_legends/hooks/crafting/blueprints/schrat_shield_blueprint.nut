::mods_hookExactClass("crafting/blueprints/schrat_shield_blueprint", function(o)
{
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Type = this.Const.Items.ItemType.Shield;
		local skills = [
			{
				Scripts = ["scripts/skills/perks/perk_legend_woodworking"]
			}
		];
		this.initSkills(skills);
	}
});
