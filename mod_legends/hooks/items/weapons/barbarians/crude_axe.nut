::mods_hookExactClass("items/weapons/barbarians/crude_axe", function(o) {
	local onEquip = o.onEquip;
	o.onEquip = function ()
	{
		onEquip();
		//this.addSkill(this.new("scripts/skills/actives/legend_harvest_tree_skill"));
	}
});