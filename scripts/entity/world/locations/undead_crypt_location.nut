this.undead_crypt_location <- this.inherit("scripts/entity/world/location", {
	m = {},
	function getDescription()
	{
		return "A long forgotten crypt haunted by the ghosts of the past. The dead won\'t find sleep here.";
	}

	function create()
	{
		this.location.create();
		this.m.TypeID = "location.undead_crypt";
		this.m.LocationType = this.Const.World.LocationType.Lair;
		this.m.IsShowingDefenders = false;
		local r = this.Math.rand(1, 2);

		if (r == 1)
		{
			this.setDefenderSpawnList(this.Const.World.Spawn.ZombiesAndGhosts);
		}
		else if (r == 2)
		{
			this.setDefenderSpawnList(this.Const.World.Spawn.Necromancer);
		}

		this.m.Resources = 180;
	}

	function onSpawned()
	{
		this.m.Name = this.World.EntityManager.getUniqueLocationName(this.Const.World.LocationNames.Crypt);
		this.location.onSpawned();
	}

	function onDropLootForPlayer( _lootTable )
	{
		this.location.onDropLootForPlayer(_lootTable);
		local treasure = [
			"loot/silver_bowl_item",
			"loot/signet_ring_item",
			"loot/signet_ring_item",
			"loot/ancient_gold_coins_item",
			"loot/ornate_tome_item"
		];

		if (this.Const.DLC.Unhold)
		{
			treasure.extend(treasure);
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

		this.dropMoney(this.Math.rand(100, 400), _lootTable);
		this.dropTreasure(this.Math.rand(1, 2), treasure, _lootTable);
	}

	function onInit()
	{
		this.location.onInit();
		local body = this.addSprite("body");
		body.setBrush("world_crypt_01");
	}

});

