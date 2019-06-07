this.legend_stollwurm_blood_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.m.ID = "misc.legend_stollwurm_blood";
		this.m.Name = "Stollwurm Blood";
		this.m.Description = "The corroding blood of a Stollwurm that eats away at metal in no time. Luckily it can be safely transported in glass vials.";
		this.m.Icon = "misc/inventory_stollwurm_blood.png";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Misc | this.Const.Items.ItemType.Crafting;
		this.m.IsDroppedAsLoot = true;
		this.m.Value = 4000;
	}

	function getTooltip()
	{
		local result = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
		result.push({
			id = 66,
			type = "text",
			text = this.getValueString()
		});
		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/combat/armor_leather_impact_03.wav", this.Const.Sound.Volume.Inventory);
	}

});

