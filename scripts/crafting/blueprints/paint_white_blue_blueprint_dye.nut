this.paint_white_blue_blueprint_dye <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.paint_white_blue_dye";
		this.m.PreviewCraftable = this.new("scripts/items/misc/paint_white_blue_item");
		this.m.Cost = 50;
		local ingredients = [
			{
				Script = "scripts/items/trade/dies_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/misc/paint_white_blue_item"));
	}

});

