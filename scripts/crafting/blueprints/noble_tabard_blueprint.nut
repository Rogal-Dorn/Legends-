this.noble_tabard_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {
		Variants = 0,
		Variant = 1
	},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.noble_tabard_blueprint";
		this.m.Type = this.Const.Items.ArmorUpgrades.Tabbard;
		this.m.PreviewCraftable = this.new("scripts/items/legend_armor/tabard/legend_noble_tabard");
		this.m.Variants = this.m.PreviewCraftable.m.Variants.len();
		this.m.PreviewCraftable.setVariant(1);
		this.m.PreviewCraftable.m.Name = "Heraldic Tabard";
		this.m.Cost = 1250;
		local ingredients = [
			{
				Script = "scripts/items/legend_armor/cloth/legend_tunic",
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

	function isQualified()
	{
		return this.LegendsMod.Configs().LegendArmorsEnabled() && this.blueprint.isQualified();
	}

	function onCraft( _stash )
	{
		local item = this.new("scripts/items/legend_armor/tabard/legend_noble_tabard");
		item.setVariant(item.m.Variants[this.m.Variant-1]);
		local name = "Noble Tabard"
		switch (this.m.Variant-1) {
			case 1:
				name = "Castle Tabard"
				break;
			case 2:
				name = "Arrow Tabard"
				break;
			case 3:
				name = "Bull Tabard"
				break;
			case 4:
				name = "Lion Tabard"
				break;
			case 5:
				name = "Feather Tabard"
				break;
			case 6:
				name = "Swan Tabard"
				break;
			case 7:
				name = "Fish Tabard"
				break;
			case 8:
				name = "Deer Tabard"
				break;
			case 9:
				name = "Sun Tabard"
				break;
			case 10:
				name = "Dragon Tabard"
				break;

		}
		item.m.Name = name
		_stash.add(item);
	}


	function setVariant( _variant )
	{
		this.m.Variant = _variant;
	}


});

