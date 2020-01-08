this.legend_net_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_net_blueprint";
		this.m.PreviewCraftable = this.new("scripts/items/tools/throwing_net");
		this.m.Cost = 10;
		local ingredients = [
			{
				Script = "scripts/items/trade/cloth_rolls_item",
				Num = 2
			}
		];
		this.init(ingredients);
	}

	function isCraftable()
	{
		local roster = this.World.getPlayerRoster().getAll();
        foreach( bro in roster )
        {
            if (bro.getSkills().hasSkill("perk.legend_net_repair") )
            {
                return true
            }
		}
		return false;
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/tools/throwing_net"));
	}

});

