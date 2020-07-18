this.legend_scroll_item <- this.inherit("scripts/items/item", {
	m = {
		Selection = 0,
	},
	function create()
	{
		this.m.ID = "misc.legend_scroll";
		this.m.Name = "Scroll";
		this.m.Description = "A Scroll with description improperly set if you see this!";
		this.m.Icon = "trade/scroll.png"; //todo icon
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
			text = "Right-click to use on a character. Studying may lead to headaches and irritability. Who wants to study?"
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
		local smart = _actor.getSkills().getSkillByID("trait.bright");
		if (  effect != null && ( (effect.m.Smart && smart != null) || smart == null ) )
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
						_actor.getSkills().removeByID("effects.trained");
					}
					local effect = this.new("scripts/skills/effects_world/new_trained_effect");
					effect.m.Description = "flavor text :) +50% exp for 3 battles"; //todo flavor text
					effect.m.Duration = 3;
					effect.m.XPGainMult = 1.5;
					//effect.m.Icon = "skills/experience_scroll_effect.png"; //todo icon
					_actor.getSkills().add(effect);
					break;
				case 3:
					local pT = _actor.getBackground().getPerkTree();
					local r = this.Math.rand(1, 100);
					local t;
					if (r <= 10)
					{
						t = this.Const.Perks.MagicTrees;
					}
					else if (r <= 20)
					{
						t = this.Const.Perks.EnemyTrees;
					}
					else if (r <= 30)
					{
						t = this.Const.Perks.DefenseTrees;
					}
					else if (r <= 55)
					{
						t = this.Const.Perks.ClassTrees;
					}
					else if (r <= 75)
					{
						t = this.Const.Perks.TraitsTrees;
					}
					else if (r <= 100)
					{
						t = this.Const.Perks.WeaponTrees;
					}

					for (local i = 0; i < 100; i = ++i)
					{
						if (!_actor.getBackground().addPerk(t.getRandomPerk()))
						{
							continue;
						}
						break;
					}
					break;
				case 4: //adds a gifted level, copied from gifted perk so it's probably safe
					_actor.m.LevelUps += 1;
					_actor.fillAttributeLevelUpValues(1, true);
					break;
				case 5:
					break;
				local r = (this.Math.rand(0, 7))
				if (r == 0)
				{
					if (!_actor.getSkills().hasSkill("effect.legend_headache"))
					{
						_actor.getSkills().add(this.new("scripts/skills/effects_world/legend_headache_effect"));
					}
					{
						_actor.getSkills().add(this.new("scripts/skills/effects_world/legend_irritable_effect")); //dont have to wry about this stacking because u can aat max study twice
					}
				}

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

