this.legend_leather_robe_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_leather_robe_blueprint";
		this.m.Type = this.Const.Items.ItemType.Armor;
		this.m.PreviewCraftable = this.new("scripts/items/armor/cultist_leather_robe");
		this.m.Cost = 200;
		local ingredients = [
			{
				Script = "scripts/items/trade/furs_item", 
				Num = 1
			},
			{
				Script = "scripts/items/armor/sackcloth",
				Num = 1
			}
		];
		this.init(ingredients);
		local skills = [
			{
				Scripts = [
					"scripts/skills/perks/perk_legend_specialist_cult_armor",
				]
			}
		];
		this.initSkills(skills);
	}

	function onCraft( _stash )
	{
		local item = this.new("scripts/items/armor/cultist_leather_robe");
		item.setVariant(this.m.PreviewCraftable.m.Variant);
		_stash.add(item);
	}

});

