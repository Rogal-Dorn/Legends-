this.legend_cloak_noble_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_cloak_noble_blueprint";
		this.m.PreviewCraftable = this.new("scripts/items/legend_armor/cloak/legend_armor_cloak_noble");
		this.m.Cost = 1000;
		local ingredients = [
			{
				Script = "scripts/items/misc/spider_silk_item",
				Num = 6
			},
			{
				Script = "scripts/items/trade/dies_item",
				Num = 4
			}
		];
		this.init(ingredients);
	}

	function isCraftable()
	{
		local roster = this.World.getPlayerRoster().getAll();
        foreach( bro in roster )
        {
            if (bro.getSkills().hasSkill("perk.background.tailor") || bro.getSkills().hasSkill("background.female_tailor") )
            {
                return true
            }
		}
		return false;
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/legend_armor/cloak/legend_armor_cloak_noble"));
	}

});

