this.noble_deer_helm_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.noble_deer_helm_blueprint";
		this.m.Type = this.Const.Items.ItemType.Helmet;
		this.m.PreviewCraftable = this.new("scripts/items/helmets/noble_deer_helm");
		this.m.Cost = 5000;
		local ingredients = [
			{
				Script = "scripts/items/helmets/full_helm",
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
		local item = this.new("scripts/items/helmets/noble_deer_helm");
		item.m.Name = "Deer Full Helm";
		_stash.add(item);
	}

});

