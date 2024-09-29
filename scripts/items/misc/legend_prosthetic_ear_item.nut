this.legend_prosthetic_ear_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.item.create();
		this.m.ID = "misc.legend_prosthetic_ear";
		this.m.Name = "Prosthetic Ear";
		this.m.Description = "A wax ear, carefully crafted to resemble a real one. Hardly a proper replacement, but some hearing may be returned.";
		this.m.Icon = "consumables/prosthetic_ear.png";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Usable;
		this.m.IsDroppedAsLoot = false;
		this.m.IsAllowedInBag = false;
		this.m.IsUsable = true;
		this.m.Value = 0;
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

		if (this.getContainer().getActor().getSkills().hasSkill("injury.missing_ear"))
		{
			result.extend([
			{
				id = 64,
				type = "text",
				text = "Reduces the penalty of Missing Ear to [color=" + this.Const.UI.Color.NegativeValue + "]-5%[/color] Initiative"
			},
			{
				id = 65,
				type = "text",
				text = "Right-click or drag onto the currently selected character in order to apply it. This item will be consumed in the process."
			}]);
		}
		else
		{
			result.push({
				id = 65,
				type = "text",
				text = "Item can not be used, because this character still has both his ears"
			});
		}
		return result;
	}

	function isUsable()
	{
		return this.getContainer().getActor().getSkills().hasSkill("injury.missing_ear") && this.m.IsUsable;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/combat/armor_leather_impact_03.wav", this.Const.Sound.Volume.Inventory);
	}

	function onUse( _actor, _item = null )
	{
		this.Sound.play("sounds/combat/armor_leather_impact_03.wav", this.Const.Sound.Volume.Inventory);
		local actor = this.getContainer().getActor();
		actor.getSkills().add(this.new("scripts/skills/traits/legend_prosthetic_ear"));
		actor.getSkills().removeByID("injury.missing_ear");

		return true;
	}
});

