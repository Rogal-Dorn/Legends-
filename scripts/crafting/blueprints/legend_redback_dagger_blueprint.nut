this.legend_redback_dagger_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_redback_dagger";
		this.m.PreviewCraftable = this.new("scripts/items/weapons/legend_redback_dagger");
		this.m.Cost = 2500;
		local ingredients = [
			{
				Script = "scripts/items/misc/legend_redback_poison_gland_item",
				Num = 1
			},
			{
				Script = "scripts/items/weapons/rondel_dagger",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/helmets/weapons/legend_redback_dagger"));
	}

});

