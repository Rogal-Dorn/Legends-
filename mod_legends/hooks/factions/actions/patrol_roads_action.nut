::mods_hookExactClass("factions/actions/patrol_roads_action", function(o) 
{
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Cooldown = 200.0;
	}

	local onExecute = o.onExecute;
	o.onExecute = function ( _faction )
	{
		onExecute(_faction);
		local r = this.Math.rand(5, 40);
		wait1.setTime(r);
		local wait2 = this.new("scripts/ai/world/orders/wait_order");
		local r = this.Math.rand(5, 40);
		this.m.Cooldown = this.World.FactionManager.isGreaterEvil() ? 150.0 : 300.0;
	}
});