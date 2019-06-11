this.legend_demonalp_helmet_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_demonalp_helmet";
		this.m.PreviewCraftable = this.new("scripts/items/helmets/legendary/legend_demonalp_helmet");
		this.m.Cost = 2500;
		local ingredients = [
			{
				Script = "scripts/items/misc/legend_demon_alp_skin_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/legend_demon_third_eye_item",
				Num = 1
			},
			{
				Script = "scripts/items/helmets/bascinet_with_mail",
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
		_stash.add(this.new("scripts/items/helmets/legendary/legend_demonalp_helmet"));
	}

});

