this.kraken_horn_plate_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.m.ID = "misc.kraken_horn_plate";
		this.m.Name = "Horn Plate";
		this.m.Description = "Taken from the the head of the legendary kraken, this large and hard horn plate is a trophy few in this world can claim.";
		this.m.Icon = "misc/inventory_kraken_plate.png";
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

