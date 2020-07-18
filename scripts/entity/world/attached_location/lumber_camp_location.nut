this.lumber_camp_location <- this.inherit("scripts/entity/world/attached_location", {
	m = {},
	function create()
	{
		this.attached_location.create();
		this.m.Name = "Lumber Camp";
		this.m.ID = "attached_location.lumber_camp";
		this.m.Description = "This lumber camp is used as a base for lumberjacks on the search for the most precious and durable materials in the nearby woods.";
		this.m.Sprite = "world_lumber_camp_01";
		this.m.SpriteDestroyed = "world_lumber_camp_01_ruins";
	}

	function getSounds( _all = true )
	{
		local r = [];

		if (this.World.getTime().IsDaytime)
		{
			r = [
				{
					File = "ambience/settlement/lumberjack_00.wav",
					Volume = 1.1,
					Pitch = 1.0
				},
				{
					File = "ambience/settlement/lumberjack_01.wav",
					Volume = 1.1,
					Pitch = 1.0
				},
				{
					File = "ambience/settlement/lumberjack_02.wav",
					Volume = 1.1,
					Pitch = 1.0
				},
				{
					File = "ambience/settlement/lumberjack_03.wav",
					Volume = 1.1,
					Pitch = 1.0
				},
				{
					File = "ambience/settlement/settlement_saw_00.wav",
					Volume = 1.1,
					Pitch = 1.0
				},
				{
					File = "ambience/settlement/settlement_saw_01.wav",
					Volume = 1.1,
					Pitch = 1.0
				}
			];

			foreach( s in r )
			{
				s.Volume *= this.Const.Sound.Volume.Ambience / this.Const.Sound.Volume.AmbienceOutsideSettlement;
			}
		}

		return r;
	}

	function onUpdateProduce( _list )
	{
		_list.push("trade/quality_wood_item");
	}

	function onBuild()
	{
		local myTile = this.getTile();

		for( local i = 0; i != 6; i = ++i )
		{
			if (!myTile.hasNextTile(i))
			{
			}
			else
			{
				local nextTile = myTile.getNextTile(i);

				if (nextTile.Type == this.Const.World.TerrainType.LeaveForest)
				{
					nextTile.clear();
					nextTile.spawnDetail("world_detail_forest_leaves_cut_0" + this.Math.rand(1, 2), this.Const.World.ZLevel.Object, 0);
				}
				else if (nextTile.Type == this.Const.World.TerrainType.Forest)
				{
					nextTile.clear();
					nextTile.spawnDetail("world_detail_forest_cut_0" + this.Math.rand(1, 2), this.Const.World.ZLevel.Object, 0);
					nextTile.setBrush("world_forest_needle_02");
				}
			}
		}

		return true;
	}

	function onUpdateDraftList( _list )
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("lumberjack_background");
		_list.push("lumberjack_background");
		_list.push("lumberjack_background");
		_list.push("poacher_background");
		_list.push("wildman_background");
	}

	function onUpdateShopList( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 30,
				P = 1.0,
				S = "weapons/woodcutters_axe"
			});
			_list.push({
				R = 90,
				P = 1.0,
				S = "weapons/legend_staff_vala"
			});
			_list.push({
				R = 95,
				P = 1.0,
				S = "weapons/greenskins/goblin_staff"
			});
			_list.push({
				R = 85,
				P = 1.0,
				S = "weapons/legend_mystic_staff"
			});
			_list.push({
				R = 10,
				P = 1.0,
				S = "weapons/legend_wooden_pitchfork"
			});
			_list.push({
				R = 10,
				P = 1.0,
				S = "weapons/legend_wooden_spear"
			});
			_list.push({
				R = 70,
				P = 1.0,
				S = "weapons/legend_ranged_wooden_flail"
			});
			_list.push({
				R = 60,
				P = 1.0,
				S = "weapons/two_handed_wooden_hammer"
			});
			_list.push({
				R = 50,
				P = 1.0,
				S = "weapons/two_handed_wooden_flail"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/legend_staff"
			});
			_list.push({
				R = 95,
				P = 1.0,
				S = "weapons/legend_staff_gnarled"
			});
			_list.push({
				R = 30,
				P = 1.0,
				S = "weapons/woodcutters_axe"
			});
			_list.push({
				R = 30,
				P = 1.0,
				S = "weapons/hatchet"
			});
			_list.push({
				R = 30,
				P = 1.0,
				S = "weapons/hatchet"
			});
			_list.push({
				R = 15,
				P = 1.0,
				S = "weapons/legend_saw"
			});
			_list.push({
				R = 30,
				P = 1.0,
				S = "weapons/hand_axe"
			});
			_list.push({
				R = 30,
				P = 1.0,
				S = "weapons/legend_infantry_axe"
			});
			_list.push({
				R = 50,
				P = 1.0,
				S = "weapons/hooked_blade"
			});
			_list.push({
				R = 5,
				P = 1.0,
				S = "weapons/legend_wooden_stake"
			});
			_list.push({
				R = 1,
				P = 1.0,
				S = "weapons/wooden_stick"
			});
			_list.push({
				R = 0,
				P = 1.0,
				S = "trade/quality_wood_item"
			});
			_list.push({
				R = 80,
				P = 1.0,
				S = "trade/ancient_wood_item"
			});
		}
		else if (_id == "building.weaponsmith")
		{
			_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/woodcutters_axe"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/hatchet"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/hand_axe"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/hooked_blade"
			});
			_list.push({
				R = 50,
				P = 1.0,
				S = "weapons/throwing_axe"
			});
			_list.push({
				R = 50,
				P = 1.0,
				S = "weapons/legend_infantry_axe"
			});
		}
		else if (_id == "building.fletcher")
		{
			_list.push({
				R = 98,
				P = 1.0,
				S = "weapons/masterwork_bow"
			});
			_list.push({
				R = 85,
				P = 1.0,
				S = "ammo/huge_quiver_of_arrows"
			});
			_list.push({
				R = 85,
				P = 1.0,
				S = "ammo/huge_quiver_of_bolts"
			});

		}
		else if (_id == "building.specialized_trader")
		{
		}
	}

});

