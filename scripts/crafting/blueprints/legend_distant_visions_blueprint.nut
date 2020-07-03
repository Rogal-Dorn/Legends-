this.legend_distant_visions_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_distant_visions_blueprint";
		this.m.Type = this.Const.Items.ItemType.Accessory;
		this.m.PreviewCraftable = this.new("scripts/items/accessory/distant_visions_item");
		this.m.Cost = 3000;
		local ingredients = [
			{
				Script = "scripts/items/trade/cloth_rolls_item",
				Num = 2
			},
			{
				Script = "scripts/items/trade/dies_item",
				Num = 1
			}
		];
		this.init(ingredients);
		local skills = [
			{
				Scripts = ["scripts/skills/perks/perk_legend_distant_visions_ingredients"]
			}
		]
		this.initSkills(skills);	
	}

	function onCraft( _stash )
	{
		this.World.State.setDistantVisionBonus(true);
	}

});

