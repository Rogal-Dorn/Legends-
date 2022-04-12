this.legend_oms_amphora_item <- this.inherit("scripts/items/accessory/accessory", {
	m = {
		IsConsumed = false
	},
	function isAllowedInBag(_actor)
	{
		return false;
	}

	function isConsumed()
	{
		return this.m.IsConsumed;
	}

	function setConsumed( _r )
	{
		this.m.IsConsumed = _r;

		if (!this.m.IsConsumed)
		{
			this.m.Icon = "accessory/oms_placeholder.png"; //Filled
		}
		else
		{
			this.m.Icon = "accessory/oms_placeholder.png"; //Empty
		}
	}

	function getName()
	{
		if (this.m.IsConsumed)
		{
			return this.item.getName() + " (Consumed)";
		}
		else
		{
			return this.item.getName();
		}
	}

	function create()
	{
		this.accessory.create();
		this.m.ID = "accessory.legend_oms_amphora";
		this.m.Name = "Ancient Amphora";
		this.m.Description = "An ancient glazed pot that has seen much use before your time. It depicts specific characters fighting over ripe fields with the amphora at the centre - a sickly grey mulch resides inside. When emptied, the vessel appears to gradually refill from a second chamber within the walls of the item. The freshness of the drink does not improve.";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.ShowOnCharacter = false;
		this.m.IsDroppedAsLoot = true;
		this.m.IconLarge = "";
		this.m.Icon = "accessory/oms_placeholder.png"; //PLACEHOLDER
		this.m.Value = 2450;
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
			icon = "ui/icons/special.png",
			text = "Does something...?"
		});
		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/bottle_01.wav", this.Const.Sound.Volume.Inventory);
	}

	function onEquip()
	{
		this.accessory.onEquip();
		this.Sound.play("sounds/combat/drink_0" + this.Math.rand(1, 3) + ".wav", this.Const.Sound.Volume.Inventory);
		skill.setItem(this);
		this.addSkill(skill);		
		{
			local r;
			r = this.Math.rand(0, 15);

			if (r == 0)
			{
				local effect = this.new("scripts/skills/effects/iron_will_effect");
			}

			r = this.Math.rand(0, 10);

			else if (r == 0)
			{
				_list.push("scripts/skills/effects/antidote_effect");
			}

			r = this.Math.rand(0, 10);

			else if (r == 0)
			{
				_list.push("scripts/skills/effects/bleeding_effect");
			}

			r = this.Math.rand(0, 15);

			else if (r == 0)
			{
				_list.push("scripts/skills/effects/cat_potion_effect");
			}

			r = this.Math.rand(0, 10);

			else if (r == 0)
			{
				_list.push("scripts/skills/effects/chilled_effect");
			}

			r = this.Math.rand(0, 10);

			else if (r == 0)
			{
				_list.push("scripts/skills/effects/dazed_effect");
			}

			r = this.Math.rand(0, 8);

			else if (r == 0)
			{
				_list.push("scripts/skills/effects/legend_beer_buzz_effect");
			}

			r = this.Math.rand(0, 30);

			else if (r == 0)
			{
				_list.push("scripts/skills/effects/legend_greenwood_sap_effect");
			}

			r = this.Math.rand(0, 8);

			else if (r == 0)
			{
				_list.push("scripts/skills/effects/legend_mead_warmth_effect");
			}

			r = this.Math.rand(0, 15);

			else if (r == 0)
			{
				_list.push("scripts/skills/effects/lionheart_potion_effect");
			}

			r = this.Math.rand(0, 8);

			else if (r == 0)
			{
				_list.push("scripts/skills/effects/legend_wine_tipsy_effect");
			}

			r = this.Math.rand(0, 15);

			else if (r == 0)
			{
				_list.push("scripts/skills/effects/cat_potion_effect");
			}

			r = this.Math.rand(0, 12);

			else if (r == 0)
			{
				_list.push("scripts/skills/effects/recovery_potion_effect");
			}

			r = this.Math.rand(0, 9);

			else if (r == 0)
			{
				_list.push("scripts/skills/effects/goblin_poison_effect");
			}

			r = this.Math.rand(0, 11);

			else if (r == 0)
			{
				_list.push("scripts/skills/effects/spider_poison_effect");
			}

			r = this.Math.rand(0, 30); //Hello modder, you are likely seeing this because you hate this part of this item, go ahead and set '30' to 99999 or somesuch, but it won't nullify the amount of satisfaction i'll get seeing the changes as a submod. With love, Luftwaffle x

			else if (r == 0)
			{
				_list.push("scripts/skills/effects/legend_redback_spider_poison_effect");
			}
		}
	}

	function onCombatFinished()
	{
		this.setConsumed(false);
	}

});

