this.legend_arena_collar_item <- this.inherit("scripts/items/accessory/accessory", {
	m = {},
	function create()
	{
		this.accessory.create();
		this.m.ID = "accessory.legend_arena_collar";
		this.m.Name = "Legend Arena Collar";
		this.m.Description = "A collar worn by combatants for the Legendary tournament location.";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.IsDroppedAsLoot = false;
		this.m.ShowOnCharacter = true;
		this.m.IconLarge = "";
		this.m.Icon = "accessory/gladiator_necklace.png";
		this.m.Sprite = "gladiator_necklace_01";
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

		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/bravery.png",
			text = "Disables specific skills than can be used to scale the arena walls when worn."
		});
		return result;
	}

	function onEquip()
	{
		this.accessory.onEquip();

		if (this.m.container.hasSkill("actives.legend_leap"))
		{
			this.getContainer().getActor().getSkills().removeByID("scripts/skills/actives/legend_leap");
		}

		else (this.m.container.hasSkill("actives.legend_climb"))
		{
			this.getContainer().getActor().getSkills().removeByID("scripts/skills/actives/legend_climb");
		}
		
		else (this.m.container.hasSkill("effects.legend_levitating"))
		{
			this.getContainer().getActor().getSkills().removeByID("scripts/skills/effects/legend_levitating_effect");
		}

		else
		{
			return
		}

	}

	function onUnequip()
	{
		this.accessory.onUnequip();

		if (this.m.container.hasSkill("perk_legend_leap"))
		{
			this.addSkill(this.new("scripts/skills/actives/legend_leap"));
		}

		else (this.m.container.hasSkill("perk.legend_climb"))
		{
			this.addSkill(this.new("scripts/skills/actives/legend_climb"));
		}
		
		else (this.m.container.hasSkill("mage_legend_magic_levitate"))
		{
			this.addSkill(this.new("scripts/skills/effects/legend_levitating_effect"));
		}

		else
		{
			return
		}

	}

	function getBuyPrice()
	{
		return 1000000;
	}

});

