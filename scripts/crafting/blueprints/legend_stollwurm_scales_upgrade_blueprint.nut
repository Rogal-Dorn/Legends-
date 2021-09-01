this.legend_stollwurm_scales_upgrade_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_stollwurm_scales_upgrade";
		this.m.Type = this.Const.Items.ItemType.Armor;
		if (this.LegendsMod.Configs().LegendArmorsEnabled())
		{
			this.m.PreviewCraftable = this.new("scripts/items/legend_armor/armor_upgrades/legend_stollwurm_scales_upgrade");
		}
		else
		{
			this.m.PreviewCraftable = this.new("scripts/items/armor_upgrades/legend_stollwurm_scales_upgrade");
		}
		this.m.Cost = 700;
		local ingredients = [
			{
				Script = "scripts/items/misc/legend_stollwurm_scales_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/unhold_hide_item",
				Num = 2
			}
		];
		this.init(ingredients);
	}

	function isQualified()
	{
		return this.blueprint.isQualified();
	}

	function onCraft( _stash )
	{
		if (this.LegendsMod.Configs().LegendArmorsEnabled())
		{
		_stash.add(this.new("scripts/items/legend_armor/armor_upgrades/legend_armor_stollwurm_scales_upgrade"));
		}
		else
		{
		_stash.add(this.new("scripts/items/armor_upgrades/legend_stollwurm_scales_upgrade"));
		}

	}

});

