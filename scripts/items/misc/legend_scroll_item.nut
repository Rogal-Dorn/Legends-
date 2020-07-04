this.legend_scroll_item <- this.inherit("scripts/items/item", {
	m = {
		Selection = 0;
	},
	function create()
	{
		this.m.ID = "misc.legend_scroll";
		this.m.Name = "Scroll";
		this.m.Description = "A Scroll with description improperly set if you see this!";
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
			text = "Right-click to use on a character"
		});
		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/scribble.wav", this.Const.Sound.Volume.Inventory);
	}

	function onUse( _actor, _item = null )
	{
		local effect = _actor.getSkills().getSkillByID("effects.scroll");
		if (  effect != null && effect.m.Smart == true )
        {
            return false;
        }
        else
        {
			switch(this.m.Selection)
			{
				case 1:
					local pT = _actor.getBackground().getPerkTree();
					local r;
					local r2;
					do {
						r = this.Math.rand(0, pT.len()-1);
						r2 = this.Math.rand(0, pT[r].len()-1);
					} while ( _actor.getSkills().hasSkill( pT[r][r2].ID ) ) 	
					_actor.getSkills().add(this.new( pT[r][r2].Script ));
					break;

				case 2:
					if (_actor.getSkills().hasSkill("effects.trained"))
					{
						_actor.getSkills().removeByID("effects.trained"));
					}
					local effect = this.new("scripts/skills/effects_world/new_trained_effect");
					effect.m.Description = "Flavor text here"; //todo flavor text
					effect.m.Duration = 3;
					effect.m.XPGainMult = 1.5;
					effect.m.Icon = "skills/experience_scroll_effect.png"; //todo icon
					_actor.getSkills().add(effect);
					break;
			}
        }
		if (  effect != null )
        {
			effect.m.Smart = true;	
        }
		else {
			_actor.getSkills().add(this.new("scripts/skills/effects/legend_scroll_effect"));
		}

		this.Sound.play("sounds/scribble.wav", this.Const.Sound.Volume.Inventory);
		return true;
	}

});

