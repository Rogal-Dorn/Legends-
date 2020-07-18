this.legend_kite_shield_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_wood_blueprint";
		this.m.Type = this.Const.Items.ItemType.Shield;
		local item = this.new("scripts/items/shields/kite_shield");
		item.onPaintInCompanyColors();
		this.m.PreviewCraftable = item;
		this.m.Cost = 10;
		local ingredients = [
			{
				Script = "scripts/items/trade/quality_wood_item",
				Num = 1
			}
		];
		this.init(ingredients);
		local skills = [
			{
				Scripts = ["scripts/skills/perks/perk_legend_woodworking"]
			}
		]
		this.initSkills(skills);
	}

	function onCraft( _stash )
	{
		local item = this.new("scripts/items/shields/kite_shield");
		item.onPaintInCompanyColors();
		_stash.add(item);

	}

});

