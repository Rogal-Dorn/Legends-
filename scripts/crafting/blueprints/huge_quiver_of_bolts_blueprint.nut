this.huge_quiver_of_bolts_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.huge_quiver_of_bolts";
		this.m.PreviewCraftable = this.new("scripts/items/ammo/huge_quiver_of_bolts");
		this.m.Cost = 3000;
		local ingredients = [
			{
				Script = "scripts/items/misc/legend_rock_unhold_hide_item",
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
            if (bro.getSkills().hasSkill("background.female_bowyer") )
            {
                return true
            }
		}
		return false;
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/ammo/huge_quiver_of_bolts"));
	}

});

