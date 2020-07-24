this.peat_pit_location <- this.inherit("scripts/entity/world/attached_location", {
	m = {},
	function create()
	{
		this.attached_location.create();
		this.m.Name = "Peat Pit";
		this.m.ID = "attached_location.peat_pit";
		this.m.Description = "These peat pits produce a valuable fuel source once the peat has been dug up and dried.";
		this.m.Sprite = "world_peat_pit_01";
		this.m.SpriteDestroyed = "world_peat_pit_01_ruins";
		this.m.IsConnected = false;
	}

	function onUpdateProduce( _list )
	{
		_list.push("trade/peat_bricks_item");
	}

	function onUpdateDraftList( _list )
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("daytaler_background");
		_list.push("female_daytaler_background");
		_list.push("peddler_background");

		if(this.World.LegendsMod.Configs().LegendMagicEnabled())
		{
			local r;
			if  ( this.World.Assets.getOrigin().getID() == "scenario.legends_seer")
			{
			r = this.Math.rand(0, 25);
				if (r == 1)
				{
			     _list.push("legend_death_summoner_background");
				}
			}
			else
			{
			r = this.Math.rand(0, 49);
				if (r == 1)
				{
				  _list.push("legend_death_summoner_background");
				}
			}

			if  ( this.World.Assets.getOrigin().getID() == "scenario.legends_warlock")
			{
			 	_list.push("legend_death_summoner_background");
			}
		}
	}


	function onUpdateShopList( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 10,
				P = 1.0,
				S = "weapons/legend_hoe"
			});
			_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/legend_shovel"
			});

			_list.push({
				R = 0,
				P = 1.0,
				S = "trade/peat_bricks_item"
			});
		}

		if (_id == "building.specialized_trader")
		{
		}
	}

	function onInit()
	{
		this.attached_location.onInit();
		this.getSprite("body").Scale = 0.9;
	}

});

