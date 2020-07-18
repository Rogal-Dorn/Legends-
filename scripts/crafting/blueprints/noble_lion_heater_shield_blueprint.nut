this.noble_lion_heater_shield_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_lion_heater_shield_blueprint";
		this.m.Type = this.Const.Items.ItemType.Shield;
		local preview = this.new("scripts/items/shields/faction_heater_shield");
		preview.setFaction(04);
		this.m.PreviewCraftable = preview;
		this.m.Cost = 5000;
		local ingredients = [
			{
				Script = "scripts/items/trade/quality_wood_item",
				Num = 2
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
		local item = this.new("scripts/items/shields/faction_heater_shield");
		item.setFaction(04)
		_stash.add(item);

	}

});

