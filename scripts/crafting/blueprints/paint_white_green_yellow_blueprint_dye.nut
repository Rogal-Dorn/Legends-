this.paint_white_green_yellow_blueprint_dye <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.paint_white_green_yellow_dye";
		this.m.Type = this.Const.Items.ItemType.Misc;
		this.m.PreviewCraftable = this.new("scripts/items/misc/paint_white_green_yellow_item");
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
            _stash.add(this.new("scripts/items/misc/paint_white_green_yellow_item"));
	}

	function isQualified()
	{
		return (!this.LegendsMod.Configs().LegendArmorsEnabled()) && this.blueprint.isQualified();
	}
});

