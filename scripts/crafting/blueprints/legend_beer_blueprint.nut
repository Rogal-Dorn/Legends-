this.legend_beer_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_beer";
		this.m.PreviewCraftable = this.new("scripts/items/supplies/beer_item");
		this.m.Cost = 10;
		local ingredients = [
			{
				Script = "scripts/items/supplies/ground_grains_item",
				Num = 2
			}
		];
		this.init(ingredients);
	}

	function requirementsMet()
	{
		local roster = this.World.getPlayerRoster().getAll();
        foreach( bro in roster )
        {
            if (bro.getSkills().hasSkill("perk.legend_potion_brewer") || bro.getSkills().hasSkill("perk.legend_alcohol_brewing") )
            {
                return true
            }
		}
		return false;
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/supplies/beer_item"));
	}

});

