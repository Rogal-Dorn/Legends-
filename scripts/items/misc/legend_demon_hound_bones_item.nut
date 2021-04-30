this.legend_demon_hound_bones_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.m.ID = "misc.legend_demon_hound_bones";
		this.m.Name = "Demon Hound Bones";
		this.m.Description = "A few bones from a Höllenhund; they still have a faint, eerie glow about them. Might fetch some coin from alchemists on the market place, or be used in crafting.";
		this.m.Icon = "misc/inventory_demon_hound_bones.png";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Misc | this.Const.Items.ItemType.Crafting;
		this.m.IsDroppedAsLoot = true;
		this.m.Value = 500;
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

