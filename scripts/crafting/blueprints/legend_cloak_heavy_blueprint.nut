this.legend_cloak_heavy_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_cloak_heavy_blueprint";
		this.m.PreviewCraftable = this.new("scripts/items/legend_armor/cloak/legend_armor_cloak_heavy");
		this.m.Cost = 10;
		local ingredients = [
			{
				Script = "scripts/items/trade/cloth_rolls_item",
				Num = 2
			},
			{
				Script = "scripts/items/trade/furs_item",
				Num = 1
			},
			{
				Script = "scripts/items/trade/dies_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function isCraftable()
	{
		local roster = this.World.getPlayerRoster().getAll();
        foreach( bro in roster )
        {
            if (bro.getSkills().hasSkill("background.tailor") || bro.getSkills().hasSkill("background.female_tailor") )
            {
                return true
            }
		}
		return false;
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/legend_armor/cloak/legend_armor_cloak_heavy"));
	}

});

