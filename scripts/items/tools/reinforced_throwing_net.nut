this.reinforced_throwing_net <- this.inherit("scripts/items/weapons/weapon", {
	m = {
		BaseAmmoMax = 1,
		BaseRangeMax = 3
	},
	function create()
	{
		this.weapon.create();
		this.m.ID = "tool.reinforced_throwing_net";
		this.m.Name = "Reinforced Throwing Net";
		this.m.Description = "A net used to throw over a target in order to hamper their ability to move and defend themself effectively. Reinforced with gossamer taken from a webknecht, it is even harder to break free from.";
		this.m.IconLarge = "tools/inventory_throwing_net_02.png";
		this.m.Icon = "tools/throwing_net_02_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Tool | this.Const.Items.ItemType.Defensive;
		this.m.AddGenericSkill = true;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_throwing_net_02";
		this.m.Value = 1200;
		this.m.Ammo = 1;
		this.m.AmmoMax = 1;
		this.m.AmmoCost = 9;
		this.m.RangeMax = 3;
		this.m.StaminaModifier = -2;
		this.m.IsDroppedAsLoot = true;
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
			id = 66,
			type = "text",
			text = this.getValueString()
		});
		result.push({
			id = 64,
			type = "text",
			text = "Worn in Offhand"
		});
		result.push({
			id = 7,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "Range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.RangeMax + "[/color] tiles"
		});

		if (this.m.StaminaModifier < 0)
		{
			result.push({
				id = 8,
				type = "text",
				icon = "ui/icons/fatigue.png",
				text = "Maximum Fatigue [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.StaminaModifier + "[/color]"
			});
		}
	
		if (this.m.AmmoMax > 0)
		{
			if (this.m.Ammo != 0)
			{
				result.push({
					id = 10,
					type = "text",
					icon = "ui/icons/ranged_skill.png",
					text = "Contains ammo for [color=" + this.Const.UI.Color.PositiveValue + "]" + this.m.Ammo + "[/color] use"
				});
			}
			else
			{
				result.push({
					id = 10,
					type = "text",
					icon = "ui/tooltips/warning.png",
					text = "[color=" + this.Const.UI.Color.NegativeValue + "]Is empty and useless[/color]"
				});
			}
		}
		result.push({
			id = 4,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Will root a target in place and reduce their defenses"
		});
		result.push({
			id = 4,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Chance to break free is reduced by [color=" + this.Const.UI.Color.NegativeValue + "]-15[/color]"
		});
		return result;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/cloth_01.wav", this.Const.Sound.Volume.Inventory);
	}

	function onUnEquip() 
	{
		this.m.AmmoMax = this.m.BaseAmmoMax;
		this.m.RangeMax = this.m.BaseRangeMax;
		this.weapon.onUnEquip();
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/throw_net"));

		this.m.AmmoMax = this.m.BaseAmmoMax;

		if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_net_casting"))
		{
			this.m.RangeMax = 4;
		}

		if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_mastery_nets"))
		{
			this.m.AmmoMax = 2;
		}

		if (this.getContainer().getActor().getSkills().hasSkill("perk.legend_net_repair"))
		{
			this.m.AmmoMax *= 2;
		}
	}

	function isAmountShown()
	{
		return true;
	}

	function getAmountString()
	{
		return this.m.Ammo + "/" + this.m.AmmoMax;
	}

	function setAmmo(_a )
	{
		this.m.Ammo = _a;

		if (this.m.Ammo > 0)
		{
			this.m.Name = "Reinforced Throwing Net";
			this.m.IconLarge = "tools/inventory_throwing_net_02.png";
			this.m.Icon = "tools/throwing_net_02_70x70.png";
			this.m.ShowArmamentIcon = true;
		}
		else
		{
			this.m.Name = "Reinforced Throwing Net (Used)";
			this.m.IconLarge = "weapons/ranged/javelins_01_bag.png";
			this.m.Icon = "weapons/ranged/javelins_01_bag_70x70.png";
			this.m.ShowArmamentIcon = false;
		}

		this.updateAppearance();
	}
});

