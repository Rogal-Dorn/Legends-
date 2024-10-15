::mods_hookExactClass("entity/tactical/armored_wardog", function(o) 
{
	o.assignRandomEquipment = function ()
	{
		this.m.Items.equip(this.Const.World.Common.pickArmor([
			[1, "special/wardog_armor"]
		]));
	}
});