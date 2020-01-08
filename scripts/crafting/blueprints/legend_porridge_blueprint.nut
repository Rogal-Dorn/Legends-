this.legend_porridge_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_porridge";
		this.m.PreviewCraftable = this.new("scripts/items/supplies/legend_porridge_item");
		this.m.Cost = 10;
		local ingredients = [
			{
				Script = "scripts/items/supplies/roots_and_berries_item",
				Num = 1
			},
			{
				Script = "scripts/items/supplies/legend_cooking_spices_item",
				Num = 1
			},
			{
				Script = "scripts/items/supplies/ground_grains_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function requirementsMet()
	{
		local roster = this.World.getPlayerRoster().getAll();
        foreach( bro in roster )
        {
            if (bro.getSkills().hasSkill("perk.legend_camp_cook"))
            {
                return true
            }
		}
		return false;
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/supplies/legend_porridge_item"));
	}

});

