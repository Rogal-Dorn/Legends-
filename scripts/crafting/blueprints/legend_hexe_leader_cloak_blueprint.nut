this.legend_hexe_leader_cloak_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_hexe_leader_cloak";
		this.m.PreviewCraftable = this.new("scripts/items/armor_upgrades/legend_hexe_leader_cloak_upgrade");
		this.m.Cost = 2500;
		local ingredients = [
			{
				Script = "scripts/items/misc/legend_witch_leader_hair_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/spider_silk_item",
				Num = 6
			}
		];
		this.init(ingredients);
	}

	function isQualified()
	{
		return true;
	}

	function onCraft( _stash )
	{

		if (this.Const.LegendMod.Configs.LegendArmorsEnabled())
		{
			_stash.add(this.new("scripts/items/legend_armor/armor_upgrades/legend_armor_hexe_leader_cloak_upgrade"));
		}
		else
		{
			_stash.add(this.new("scripts/items/armor_upgrades/legend_hexe_leader_cloak_upgrade"));
		}


	}

});

