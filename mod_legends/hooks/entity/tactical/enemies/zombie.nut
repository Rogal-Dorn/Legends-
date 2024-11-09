::mods_hookExactClass("entity/tactical/enemies/zombie", function(o)
{
	local onInit = o.onInit;
	o.onInit = function ()
	{
		onInit();
		b.SurroundedBonus = 5; // resetting from vanilla
		if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.Hitpoints = b.Hitpoints * 1.5;
		}
		this.addSprite("armor_layer_chain").setHorizontalFlipping(true);
		this.addSprite("armor_layer_plate").setHorizontalFlipping(true);
		this.addSprite("armor_layer_tabbard").setHorizontalFlipping(true);
		this.addSprite("armor_layer_cloak").setHorizontalFlipping(true);
		this.addSprite("armor_upgrade_back").setHorizontalFlipping(true);
		this.addSprite("armor_upgrade_front");
		head.setBrush(this.Const.Faces.AllHuman[this.Math.rand(0, this.Const.Faces.AllHuman.len() - 1)]);
		foreach (a in this.Const.CharacterSprites.Helmets)
		{
			this.addSprite(a).setHorizontalFlipping(true);
		}
		this.setHitpoints(this.getHitpointsMax() * this.Math.rand(45, 100) * 0.01);
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_poison_immunity"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));

		if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
		}
	}

	o.assignRandomEquipment = function ()
	{
		local r;

		if (this.Math.rand(1, 100) <= 50)
		{
			r = this.Math.rand(1, 12);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/knife"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/bludgeon"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_scythe"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/militia_spear"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/pitchfork"));
			}
			else if (r == 6)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/pickaxe"));
			}
			else if (r == 7)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/butchers_cleaver"));
			}
			else if (r == 8)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_hammer"));
			}
			else if (r == 9)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_shovel"));
			}
			else if (r == 10)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_tipstaff"));
			}
			else if (r == 11)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/legend_scythe"));
			}

		}


		local aList = [
			[1, "leather_tunic"],
			[1, "linen_tunic"],
			[1, "linen_tunic"],
			[1, "sackcloth"],
			[1, "tattered_sackcloth"],
			[1, "leather_wraps"],
			[1, "apron"],
			[1, "butcher_apron"],
			[1, "monk_robe"]
		];
		local armor = this.Const.World.Common.pickArmor(aList);

		if (this.Math.rand(1, 100) <= 50)
		{
			armor.setArmor(this.Math.round(armor.getArmorMax() / 2 - 1));
		}

		this.m.Items.equip(armor);

		if (this.Math.rand(1, 100) <= 33)
		{
			local item = this.Const.World.Common.pickHelmet([
				[1, "aketon_cap"],
				[1, "full_aketon_cap"],
				[1, "kettle_hat"],
				[1, "padded_kettle_hat"],
				[1, "full_leather_cap"]
			]);
			if (item != null)
			{
				if (this.Math.rand(1, 100) <= 50)
				{
					item.setArmor(item.getArmorMax() / 2 - 1);
				}
			}

			this.m.Items.equip(item);
		}
	}

	local onFactionChanged = o.onFactionChanged;
	o.onFactionChanged = function ()
	{
		onFactionChanged();
		this.getSprite("armor_layer_chain").setHorizontalFlipping(flip);
		this.getSprite("armor_layer_plate").setHorizontalFlipping(flip);
		this.getSprite("armor_layer_tabbard").setHorizontalFlipping(flip);
		this.getSprite("armor_layer_cloak").setHorizontalFlipping(flip);
		foreach (a in this.Const.CharacterSprites.Helmets)
		{
			if (!this.hasSprite(a))
			{
				continue;
			}
			this.getSprite(a).setHorizontalFlipping(flip);
		}
	}
});
