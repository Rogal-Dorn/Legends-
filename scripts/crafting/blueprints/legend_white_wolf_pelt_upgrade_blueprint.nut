this.legend_white_wolf_pelt_upgrade_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_white_wolf_pelt_upgrade";
		this.m.PreviewCraftable = this.new("scripts/items/armor_upgrades/legend_white_wolf_pelt_upgrade");
		this.m.Cost = 2500;
		local ingredients = [
			{
				Script = "scripts/items/misc/legend_white_wolf_pelt_item",
				Num = 3
			}
		];
		this.init(ingredients);
	}

	function isQualified()
	{
		return true;
	}
	
	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/armor_upgrades/legend_white_wolf_pelt_upgrade"));
	}

});

