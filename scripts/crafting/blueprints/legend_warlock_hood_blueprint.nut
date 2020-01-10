this.legend_warlock_hood_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_warlock_hood";
		this.m.Type = this.Const.Items.ItemType.Armor;
		this.m.PreviewCraftable = this.new("scripts/items/helmets/named/legend_named_warlock_hood");
		this.m.Cost = 200;
		local ingredients = [
			{
				Script = "scripts/items/misc/witch_hair_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/petrified_scream_item",
				Num = 1
			},
			{
				Script = "scripts/items/helmets/dark_cowl",
				Num = 1
			},
			{
				Script = "scripts/items/spawns/skeleton_item",
				Num = 1
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
		local item = this.new("scripts/items/helmets/named/legend_named_warlock_hood");
		item.m.Name = "";
		_stash.add(item);
	}

});

