this.legend_stollwurm_scales_upgrade_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_stollwurm_scales_upgrade";
		this.m.PreviewCraftable = this.new("scripts/items/armor_upgrades/legend_stollwurm_scales_upgrade");
		this.m.Cost = 700;
		local ingredients = [
			{
				Script = "scripts/items/misc/legend_stollwurm_scales_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/unhold_hide_item",
				Num = 1
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
		_stash.add(this.new("scripts/items/armor_upgrades/legend_stollwurm_scales_upgrade"));
	}

});

