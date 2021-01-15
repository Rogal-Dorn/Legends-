this.amber_collector_location <- this.inherit("scripts/entity/world/attached_location", {
	m = {},
	function create()
	{
		this.attached_location.create();
		this.m.Name = "Amber Collector";
		this.m.ID = "attached_location.amber_collector";
		this.m.Description = "The collectors living in these huts search for valuable amber shards along the shore.";
		this.m.Sprite = "world_amber_collector_01";
		this.m.SpriteDestroyed = "world_amber_collector_01_ruins";
		this.m.IsConnected = false;
	}

	function onUpdateProduce( _list )
	{
		_list.push("trade/amber_shards_item");
	}

	function onUpdateDraftList( _list, _gender)
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("peddler_background");
		_list.push("caravan_hand_background");
		_list.push("thief_background");
		_list.push("peddler_background");
		_list.push("caravan_hand_background");
		_list.push("thief_background");


		if(this.World.LegendsMod.Configs().LegendMagicEnabled())
		{
			local r;
			if  ( this.World.Assets.getOrigin().getID() == "scenario.legends_seer")
			{
			r = this.Math.rand(0, 50);
				if (r == 1)
				{
				_list.push("legend_spiritualist_background");
				}
			}
			else if  ( this.World.Assets.getOrigin().getID() == "scenario.legends_sisterhood")
			{
				r = this.Math.rand(0, 9);
				if (r == 1)
				{
				_list.push("legend_spiritualist_background");
				}
			}
			else
			{
			r = this.Math.rand(0, 90);
				if (r == 1)
				{
				_list.push("legend_spiritualist_background");
				}
			}
		}
	}

	function onUpdateShopList( _id, _list )
	{
		if (_id == "building.marketplace")
		{
			_list.push({
				R = 0,
				P = 1.0,
				S = "trade/amber_shards_item"
			});
			_list.push({
				R = 95,
				P = 1.0,
				S = "tents/tent_enchant"
			});
		}
		else if (_id == "building.specialized_trader")
		{
		}
	}

	function onInit()
	{
		this.attached_location.onInit();
		this.getSprite("body").Scale = 0.9;
	}

});

