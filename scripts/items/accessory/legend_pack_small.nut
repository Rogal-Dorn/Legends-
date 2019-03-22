this.legend_pack_small <- this.inherit("scripts/items/accessory/accessory", {
	m = {
		StashSize = 3
	},
	function create()
	{
		this.accessory.create();
		this.m.ID = "accessory.legend_pack_small";
		this.m.Name = "Traveler\'s Sash";
		this.m.Description = "A sash worn by travelers to help carry additional supplies";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.IconLarge = "accessory/legend_pack_small.png";
		this.m.Icon = "accessory/legend_pack_small.png";
		this.m.Sprite = "legend_pack_small";
		this.m.Value = 100;
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

		if (this.getIconLarge() != null)
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIconLarge(),
				isLarge = true
			});
		}
		else
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIcon()
			});
		}

		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "Provides [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.StashSize + "[/color] stash spaces. If you remove the bag, spaces at the bottom of the stash will be lost, along with any items in those spaces."
		});
		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/cloth_01.wav", this.Const.Sound.Volume.Inventory);
	}

	function isAllowedInBag()
	{
		return false;
	}

	function onEquip()
	{
		this.accessory.onEquip();
		this.Stash.resize(this.Stash.getCapacity() + this.m.StashSize)
	}

	function onUnequip()
	{
		this.accessory.onUnequip();
		this.Stash.resize(this.Stash.getCapacity() - this.m.StashSize)
	}


});
