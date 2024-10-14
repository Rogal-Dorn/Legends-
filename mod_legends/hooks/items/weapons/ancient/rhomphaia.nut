::mods_hookExactClass("items/weapons/ancient/rhomphaia", function(o) {
	local onEquip = o.onEquip;
	o.onEquip = function ()
	{
		onEquip();
		this.addSkill(this.new("scripts/skills/actives/legend_great_slash"));
	}
});