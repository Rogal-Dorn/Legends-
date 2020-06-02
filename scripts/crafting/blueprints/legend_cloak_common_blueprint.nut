this.legend_cloak_common_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_cloak_common_blueprint";
		this.m.Type = this.Const.Items.ItemType.Armor;
		this.m.PreviewCraftable = this.new("scripts/items/legend_armor/cloak/legend_armor_cloak_common");
		this.m.Cost = 10;
		local ingredients = [
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
				Scripts = ["scripts/skills/backgrounds/female_tailor_background",
							"scripts/skills/backgrounds/tailor_background"]
			}
		]
		this.initSkills(skills);			
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/legend_armor/cloak/legend_armor_cloak_common"));
	}

});

