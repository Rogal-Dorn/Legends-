this.legend_heater_shield_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_heater_shield_blueprint";
		this.m.Type = this.Const.Items.ItemType.Shield;
		this.m.PreviewCraftable = this.new("scripts/items/shields/heater_shield");
		this.m.Cost = 50;
		local ingredients = [
			{
				Script = "scripts/items/trade/quality_wood_item",
				Num = 1
			}
		];
		this.init(ingredients);
		local skills = [
			{
				Scripts = ["scripts/skills/perks/perk_legend_woodworking"]
			}
		]
		this.initSkills(skills);
	}

	function onCraft( _stash )
	{
		local item = this.new("scripts/items/shields/heater_shield");
		item.onPaintInCompanyColors();
		_stash.add(item);

	}

});

