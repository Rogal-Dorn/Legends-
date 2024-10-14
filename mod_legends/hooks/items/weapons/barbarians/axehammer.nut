::mods_hookExactClass("items/weapons/barbarians/axehammer", function(o) {
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Categories = "Hammer, Axe, One-Handed";
	}

	local onEquip = o.onEquip;
	o.onEquip = function ()
	{
		onEquip();
		//this.addSkill(this.new("scripts/skills/actives/legend_harvest_tree_skill"));
		//this.addSkill(this.new("scripts/skills/actives/legend_harvest_rock_skill"));
	}
});