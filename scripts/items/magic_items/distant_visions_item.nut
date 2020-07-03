this.distant_visions_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.item.create();
		this.m.ID = "accessory.distant_visions_item";
		this.m.Name = "Distant Visions";
		this.m.Description = "";
		this.m.SlotType = this.Const.ItemSlot.Bag;
		this.m.IsAllowedInBag = true;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = false;
		this.m.IconLarge = ""; //todo add icon
		this.m.Icon = "consumables/bandages_01.png";
		this.m.StaminaModifier = 0;
		this.m.Value = 25;
	}

	function getTooltip()
	{
		local result = this.item.getTooltip();
		return result;
	}
});

