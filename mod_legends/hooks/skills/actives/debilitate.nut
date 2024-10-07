::mods_hookExactClass("skills/actives/debilitate", function(o)
{
	local create = o.create;
	o.create = function()
	{
		create();
		this.m.Icon = "skills/debilitate_square.png";
		this.m.IconDisabled = "skills/debilitate_square_bw.png";
		this.m.FatigueCost = 10;
	}
});
