this.basilisk_trophy_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.basilisk_trophy";
		this.m.Type = this.Const.Items.ItemType.Accessory;
		this.m.PreviewCraftable = this.new("scripts/items/accessory/basilisk_trophy_item"); //to do
		this.m.Cost = 2300;
		local ingredients = [
			{
				Script = "scripts/items/misc/basilisk_eye_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/basilisk_feathers_item",
				Num = 2
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/accessory/basilisk_trophy_item")); //to do
	}

});
