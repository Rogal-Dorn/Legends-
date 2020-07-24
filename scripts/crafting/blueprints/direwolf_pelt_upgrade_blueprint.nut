this.direwolf_pelt_upgrade_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.direwolf_pelt_upgrade";
		this.m.Type = this.Const.Items.ItemType.Armor;
		this.m.PreviewCraftable = this.new("scripts/items/armor_upgrades/direwolf_pelt_upgrade");
		this.m.Cost = 250;
		local ingredients = [
			{
				Script = "scripts/items/misc/werewolf_pelt_item",
				Num = 3
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
		{
			_stash.add(this.new("scripts/items/legend_armor/armor_upgrades/legend_direwolf_pelt_upgrade"));
		}
		else
		{
			_stash.add(this.new("scripts/items/armor_upgrades/direwolf_pelt_upgrade"));
		}

	}

});

