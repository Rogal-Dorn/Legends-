this.goblin_ruins_location <- this.inherit("scripts/entity/world/location", {
	m = {},
	function getDescription()
	{
		return "A once proud fortress now lying in ruins.";
	}

	function create()
	{
		this.location.create();
		this.m.TypeID = "location.goblin_ruins";
		this.m.LocationType = this.Const.World.LocationType.Lair;
		this.m.IsShowingDefenders = false;
		this.m.IsShowingBanner = false;
		this.setDefenderSpawnList(this.Const.World.Spawn.GoblinDefenders);
		this.m.Resources = 150;
	}

	function onSpawned()
	{
		this.m.Name = this.World.EntityManager.getUniqueLocationName(this.Const.World.LocationNames.Ruins);
		this.location.onSpawned();
	}

	function onDropLootForPlayer( _lootTable )
	{
		this.location.onDropLootForPlayer(_lootTable);
		this.dropArmorParts(this.Math.rand(5, 15), _lootTable);
		this.dropAmmo(this.Math.rand(20, 40), _lootTable);
		this.dropMedicine(this.Math.rand(0, 3), _lootTable);
		local treasure = [
			"trade/salt_item",
			"trade/amber_shards_item",
			"trade/furs_item",
			"loot/silverware_item",
			"loot/silver_bowl_item",
			"loot/silver_bowl_item",
			"loot/signet_ring_item",
			"loot/goblin_carved_ivory_iconographs_item",
			"loot/goblin_minted_coins_item",
			"loot/goblin_rank_insignia_item"
		];

		if (this.Const.DLC.Unhold)
		{
			treasure.extend(treasure);
			treasure.extend(treasure);
			treasure.extend(treasure);
			if (this.World.LegendsMod.Configs().LegendArmorsEnabled())
			{
				treasure.push("legend_armor/armor_upgrades/legend_metal_plating_upgrade");
				treasure.push("legend_armor/armor_upgrades/legend_metal_pauldrons_upgrade");
				treasure.push("legend_armor/armor_upgrades/legend_mail_patch_upgrade");
				treasure.push("legend_armor/armor_upgrades/legend_leather_shoulderguards_upgrade");
				treasure.push("legend_armor/armor_upgrades/legend_leather_neckguard_upgrade");
				treasure.push("legend_armor/armor_upgrades/legend_joint_cover_upgrade");
				treasure.push("legend_armor/armor_upgrades/legend_heraldic_plates_upgrade");
				treasure.push("legend_armor/armor_upgrades/legend_double_mail_upgrade");
			}
			else
			{
				treasure.push("armor_upgrades/metal_plating_upgrade");
				treasure.push("armor_upgrades/metal_pauldrons_upgrade");
				treasure.push("armor_upgrades/mail_patch_upgrade");
				treasure.push("armor_upgrades/leather_shoulderguards_upgrade");
				treasure.push("armor_upgrades/leather_neckguard_upgrade");
				treasure.push("armor_upgrades/joint_cover_upgrade");
				treasure.push("armor_upgrades/heraldic_plates_upgrade");
				treasure.push("armor_upgrades/double_mail_upgrade");
			}
		}

		this.dropFood(this.Math.rand(2, 4), [
			"strange_meat_item",
			"roots_and_berries_item",
			"pickled_mushrooms_item"
		], _lootTable);
		this.dropTreasure(this.Math.rand(1, 2), treasure, _lootTable);
	}

	function onInit()
	{
		this.location.onInit();
		local body = this.addSprite("body");
		body.setBrush("world_ruins_0" + this.Math.rand(1, 3));
	}

});

