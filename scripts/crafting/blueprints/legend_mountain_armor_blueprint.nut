this.legend_mountain_armor_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_mountain_armor";
		this.m.PreviewCraftable = this.new("scripts/items/armor/legendary/legend_mountain_armor");
		this.m.Cost = 2500;
		local ingredients = [
			{
				Script = "scripts/items/misc/legend_rock_unhold_bones_item",
				Num = 1
			},
			{
				Script = "scripts/items/armor/coat_of_plates",
				Num = 1
			},
			{
				Script = "scripts/items/misc/legend_rock_unhold_hide_item",
				Num = 2
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
		_stash.add(this.new("scripts/items/armor/legendary/legend_mountain_armor"));
	}

});

