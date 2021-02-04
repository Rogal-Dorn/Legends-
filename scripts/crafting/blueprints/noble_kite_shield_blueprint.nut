this.noble_kite_shield_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {
		Variants = 0,
		Variant = 1
	},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_castle_kite_shield_blueprint";
		this.m.Type = this.Const.Items.ItemType.Shield;
		this.m.PreviewCraftable = this.new("scripts/items/shields/faction_kite_shield");
		this.m.Variants = 10;
		this.m.PreviewCraftable.setFaction(1);
		this.m.PreviewCraftable.m.Name = "Heraldic Kite Shield";
		this.m.Cost = 250;
		local ingredients = [
			{
				Script = "scripts/items/trade/quality_wood_item",
				Num = 2
			}
		];
		this.init(ingredients);
		local skills = [
			{
				Scripts = [
					"scripts/skills/perks/perk_legend_woodworking"
				]
			}
		];
		this.initSkills(skills);
	}

	function onCraft( _stash )
	{
		local item = this.new("scripts/items/shields/faction_kite_shield");
		item.setFaction(this.m.Variant);
		item.setVariant(this.m.PreviewCraftable.m.Variant);
		_stash.add(item);
	}

	function setVariant( _variant )
	{
		this.m.Variant = _variant;
	}

});

