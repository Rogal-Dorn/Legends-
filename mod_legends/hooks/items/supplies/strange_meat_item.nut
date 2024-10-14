::mods_hookExactClass("items/supplies/strange_meat_item", function(o) {
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Description = "Provisions. Wine made from squashed and fermented grapes. Both elaborate to produce and expensive to buy. Can be drunk in battle to gain +6% resolve, melee and ranged skill, at the expense of -12% initiative, melee and ranged defense. Will be used as provisions if left in the company stash";
		this.m.Value = 20;
		this.m.Amount = 15.0;
		this.m.GoodForDays = 4;
	}
});