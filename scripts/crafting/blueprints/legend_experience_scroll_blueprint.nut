this.legend_experience_scroll_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_experience_scroll_blueprint";
		this.m.Type = this.Const.Items.ItemType.Usable;
		this.m.PreviewCraftable = this.new("scripts/items/misc/legend_experience_scroll_item");
		this.m.Cost = 2000;
		local ingredients = [
			{
				Script = "scripts/items/trade/legend_ancient_scroll_item",
				Num = 1
			},
            {
                Script = "scripts/items/trade/cloth_rolls_item",
                Num = 1
            },
            {
                Script = "scripts/items/trade/dies_item",
                Num = 1
            }
		];
		this.init(ingredients);
		local skills = [
			{
				Scripts = ["scripts/skills/perks/perk_legend_perk_scroll_ingredients"]
			}
		]
		this.initSkills(skills);	
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/misc/legend_experience_scroll_item"));
	}

});