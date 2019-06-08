this.legend_white_wolf_helmet_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_white_wolf_helmet";
		this.m.PreviewCraftable = this.new("scripts/items/helmets/legendary/legend_white_wolf_helmet");
		this.m.Cost = 2500;
		local ingredients = [
			{
				Script = "scripts/items/misc/legend_white_wolf_pelt_item",
				Num = 1
			},
			{
				Script = "scripts/items/helmets/bascinet_with_mail",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/helmets/legendary/legend_white_wolf_helmet"));
	}

});

