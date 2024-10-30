::mods_hookExactClass("crafting/blueprints/kraken_shield_blueprint", function(o)
{
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Type = this.Const.Items.ItemType.Shield;
	}
});
