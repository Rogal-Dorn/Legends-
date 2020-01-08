this.legend_dog_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_dog";
		this.m.PreviewCraftable = this.new("scripts/items/accessory/wardog_item");
		this.m.Cost = 120;
		local ingredients = [
			{
				Script = "scripts/items/accessory/wardog_item",
				Num = 1
			},
			{
				Script = "scripts/items/accessory/wardog_item",
				Num = 1
			},
			{
				Script = "scripts/items/supplies/legend_fresh_meat_item",
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
            if (bro.getSkills().hasSkill("perk.legend_dogbreeder"))
            {
                return true
            }
		}
		return false;
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/accessory/wardog_item"));
		_stash.add(this.new("scripts/items/accessory/wardog_item"));
		_stash.add(this.new("scripts/items/accessory/wardog_item"));
	}

});

