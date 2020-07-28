this.therianthropic_potion_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.herbal_oblivion_potion";
		this.m.Type = this.Const.Items.ItemType.Usable
		this.m.PreviewCraftable = this.new("scripts/items/accessory/therianthropy_potion_item");
		this.m.Cost = 30;
		local ingredients = [
			{
				Script = "scripts/items/accessory/wardog_item",
				Num = 1
			},
			{
				Script = "scripts/items/accessory/legend_heartwood_sap_flask_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/legend_white_wolf_pelt_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/legend_ancient_scroll_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/mysterious_herbs_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/snake_oil_item",
				Num = 1
			}
		];
		this.init(ingredients);
		local skills = [
			{
				Scripts = ["scripts/skills/perks/perk_legend_potion_brewer"]
			}
		]
		this.initSkills(skills);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/accessory/therianthropy_potion_item"));
	}

});

