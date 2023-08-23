local gt = this.getroottable();

if (!("Hunting_Categories" in gt.Const))
{
	gt.Const.Hunting_Categories <- {};
}



ge.Const.Hunting_Categories.Plains <- {
	local container = this.new("scripts/mods/script_container");
	items = container.extend([
		"scripts/items/supplies/beer_item"
	]);
};


gt.Const.Hunting_Categories.Settings <- {
	1 = gt.Const.Hunting_Categories.Plains
};
