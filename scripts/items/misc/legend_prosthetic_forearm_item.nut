this.legend_prosthetic_forearm_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.item.create();
		this.m.ID = "misc.legend_prosthetic_forearm";
		this.m.Name = "Prosthetic Forearm";
		this.m.Description = "to do.";
		this.m.Icon = "consumables/prosthetic_forearm.png";
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
		result.extend([
		{
			id = 7,
			type = "text",
			icon = "ui/icons/melee_skill.png",
			text = "Reduces the penalty of Broken Elbow Joint to [color=" + this.Const.UI.Color.NegativeValue + "]-10%[/color] Melee Skill"
		},
		{
			id = 7,
			type = "text",
			icon = "ui/icons/ranged_skill.png",
			text = "Reduces the penalty of Broken Elbow Joint to [color=" + this.Const.UI.Color.NegativeValue + "]-10%[/color] Ranged Skill"
		},
		{
			id = 7,
			type = "text",
			icon = "ui/icons/melee_defense.png",
			text = "Reduces the penalty of Broken Elbow Joint to [color=" + this.Const.UI.Color.NegativeValue + "]-15%[/color] Melee Defense"
		}
		]);

		if (!("getActor" in this.getContainer())) {
			return result;
		}

		if (this.getContainer().getActor().getSkills().hasSkill("injury.broken_elbow_joint"))
		{
			result.push({
				id = 65,
				type = "text",
				text = "Right-click or drag onto the currently selected character in order to apply it. This item will be consumed in the process."
			});
		}
		else
		{
			result.push({
				id = 65,
				type = "text",
				text = "Item can not be used, because this character still has both his elbows intact"
			});
		}
		return result;
	}

	function isUsable()
	{
		if (this.getContainer() == null || this.getContainer().getActor() == null || this.getContainer().getActor().isNull())
			return false;
		return this.getContainer().getActor().getSkills().hasSkill("injury.broken_elbow_joint") && this.m.IsUsable;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/combat/armor_leather_impact_03.wav", this.Const.Sound.Volume.Inventory);
	}

	function onUse( _actor, _item = null )
	{
		this.Sound.play("sounds/combat/armor_leather_impact_03.wav", this.Const.Sound.Volume.Inventory);
		local actor = this.getContainer().getActor();
		actor.getSkills().add(this.new("scripts/skills/traits/legend_prosthetic_forearm"));
		actor.getSkills().removeByID("injury.broken_elbow_joint");

		return true;
	}
});

