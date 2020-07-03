this.legend_experience_scroll_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.m.ID = "misc.legend_experience_scroll";
		this.m.Name = "Experience Scroll";
		this.m.Description = "A scroll with useful information for any battle-goers.";
		this.m.Icon = "consumables/experience_scroll.png"; //todo icon
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Usable;
		this.m.IsDroppedAsLoot = true;
		this.m.IsAllowedInBag = false;
		this.m.IsUsable = true;
		this.m.Value = 1000;
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
			id = 65,
			type = "text",
			text = "Right-click to use on a character to grant them a temporary +50% experience for 3 battles"
		});
		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/scribble.wav", this.Const.Sound.Volume.Inventory);
	}

	function onUse( _actor, _item = null )
	{
		if ( _actor.getSkills().hasSkill("effects.trained") )
        {
            return false;
        }
        else
        {
            local effect = this.new("scripts/skills/effects_world/new_trained_effect");
            effect.m.Duration = 3;
            effect.m.XPGainMult = 1.5;
            effect.m.Icon = "skills/experience_scroll_effect.png"; //todo icon
            _actor.getSkills().add(effect);
        }

		this.Sound.play("sounds/scribble.wav", this.Const.Sound.Volume.Inventory);
		return true;
	}

});

