this.legend_perk_scroll_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.m.ID = "misc.legend_perk_scroll";
		this.m.Name = "Random Perk Scroll";
		this.m.Description = "A scroll with secrets held by the creator.";
		this.m.Icon = "consumables/paint_red.png"; //todo icon
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
			text = "Right-click to use on a character to grant them a random perk from their own perk tree. May be used up to 1 time"
		});
		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/scribble.wav", this.Const.Sound.Volume.Inventory);
	}

	function onUse( _actor, _item = null )
	{
		if ( _actor.getSkills().hasSkill("effects.perk_scroll") )
        {
            return false;
        }
        else
        {
            local pT = _actor.getBackground().getPerkTree();
            
			do {
				local r = this.Math.rand(0, pT.len()-1);
       	     	local r2 = this.Math.rand(0, pT[r].len()-1);
			} while ( _actor.getSkills().hasSkill( pT[r][r2].ID ) ) 	
            _actor.getSkills().add(this.new( pT[r][r2].Script ));
            _actor.getSkills().add(this.new("scripts/skills/effects/legend_perk_scroll_effect"));
        }

		this.Sound.play("sounds/scribble.wav", this.Const.Sound.Volume.Inventory);
		return true;
	}

});

