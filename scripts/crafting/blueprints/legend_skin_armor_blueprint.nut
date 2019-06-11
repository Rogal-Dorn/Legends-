this.legend_skin_armor_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_skin_armor";
		this.m.PreviewCraftable = this.new("scripts/items/armor/legendary/legend_skin_armor");
		this.m.Cost = 2500;
		local ingredients = [
			{
				Script = "scripts/items/misc/legend_skin_ghoul_skin_item",
				Num = 2
			},
			{
				Script = "scripts/items/armor/mail_hauberk",
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
		_stash.add(this.new("scripts/items/armor/legendary/legend_skin_helmet"));
	}

});

