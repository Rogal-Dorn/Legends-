this.legend_scroll_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_experience_scroll_blueprint";
		this.m.Type = this.Const.Items.ItemType.Usable;
		this.m.PreviewCraftable = this.new("scripts/items/misc/legend_scroll_item");
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
				Scripts = ["scripts/skills/perks/perk_legend_scroll_ingredients"]
			}
		]
		this.initSkills(skills);	
	}

	function onCraft( _stash )
	{
		local item = this.new("scripts/items/misc/legend_scroll_item");
		local r = this.Math.rand(1, 2);

		switch(r) {
			case 1:
				item.m.Description = "Use the scroll on a character to grant them 1 free perk from their own tree";
				item.m.Name = "Random Perk Scroll";
				break;
			case 2:
				item.m.Description = "Use the scroll on a character to increase experience gains by +50% for the next 3 battles. This will override any other current trained effects.";
				item.m.Name = "Battle Scroll";
				break;
			case 3:
				item.m.Description = "";
				item.m.Name = "";
				break;
			case 4:
				item.m.Description = "";
				item.m.Name = "";
				break;
			
		}

		_stash.add(item);
	}

});