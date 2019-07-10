this.legend_warlock_cloak_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_warlock_cloak";
		this.m.PreviewCraftable = this.new("scripts/items/armor/named/legend_named_warlock_cloak");
		this.m.Cost = 200;
		local ingredients = [
			{
				Script = "scripts/items/misc/witch_hair_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/parched_skin_item",
				Num = 1
			},
			{
				Script = "scripts/items/armor/thick_dark_tunic",
				Num = 1
			},
			{
				Script = "scripts/items/spawns/zombie_item",
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
		_stash.add(this.new("scripts/items/armor/named/legend_named_warlock_cloak"));
	}

});

