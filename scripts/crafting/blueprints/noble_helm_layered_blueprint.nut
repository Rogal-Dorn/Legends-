this.noble_helm_layered_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {
		Variants = 0,
		Variant = 1
	},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.noble_helm_layered_blueprint";
		this.m.Type = this.Const.Items.ItemType.Helmet;
		this.m.PreviewCraftable = this.new("scripts/items/legend_helmets/vanity/legend_helmet_faction_helmet");
		this.m.Variants = this.m.PreviewCraftable.m.Variants.len();
		this.m.PreviewCraftable.setVariant(this.m.PreviewCraftable.m.Variants[0]);
		this.m.PreviewCraftable.m.Name = "Heraldic Helmet Ornament";
		this.m.Cost = 250;
		local ingredients = [
			{
				Script = "scripts/items/legend_helmets/vanity/legend_helmet_faction_helmet",
				Num = 1
			}
		];
		this.init(ingredients);
		local skills = [
			{
				Scripts = [
					"scripts/skills/backgrounds/legend_blacksmith_background"
				]
			}
		];
		this.initSkills(skills);
	}

	function isQualified()
	{
		return this.LegendsMod.Configs().LegendArmorsEnabled() && this.blueprint.isQualified();
	}

	function onCraft( _stash )
	{
		local item = this.new("scripts/items/legend_helmets/vanity/legend_helmet_faction_helmet");
		item.setVariant(item.m.Variants[this.m.Variant-1]);
		_stash.add(item);
	}

	function setVariant( _variant )
	{
		this.m.Variant = _variant;
	}
});

