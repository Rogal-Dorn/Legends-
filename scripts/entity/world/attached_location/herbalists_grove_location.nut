this.herbalists_grove_location <- this.inherit("scripts/entity/world/attached_location", {
	m = {},
	function create()
	{
		this.attached_location.create();
		this.m.Name = "Herbalist\'s Grove";
		this.m.ID = "attached_location.herbalists_grove";
		this.m.Description = "In this remote grove the knowing herbalist collects all kinds of medicinal plants and roots.";
		this.m.Sprite = "world_herbalists_grove_01";
		this.m.SpriteDestroyed = "world_herbalists_grove_01_ruins";
		this.m.IsConnected = false;
	}

	function onUpdateProduce( _list )
	{
		_list.push("supplies/medicine_item");
		_list.push("supplies/medicine_small_item");
	}

	function onUpdateDraftList( _list )
	{
		if (!this.isActive())
		{
			return;
		}

		_list.push("legend_nun_background");
		_list.push("monk_background");
		_list.push("legend_herbalist_background");
		_list.push("legend_herbalist_background");
		_list.push("legend_herbalist_background");

		if(this.Const.LegendMod.Configs.LegendMagicEnabled()
		{
			local r;
			if  ( this.World.Assets.getOrigin().getID() == "scenario.legends_seer")
			{	
			r = this.Math.rand(0, 5);
				if (r == 1)
				{
				_list.push("legend_druid_background");
				}
			}
			else if  ( this.World.Assets.getOrigin().getID() == "scenario.legends_druid")
			{
		
				_list.push("legend_druid_background");
			}
			else
			{
			r = this.Math.rand(0, 9);
				if (r == 1)
				{
				_list.push("legend_druid_background");
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
				S = "supplies/medicine_item"
			});
			_list.push({
				R = 0,
				P = 1.0,
				S = "supplies/medicine_small_item"
			});
			_list.push({
				R = 0,
				P = 1.0,
				S = "accessory/bandage_item"
			});
			_list.push({
				R = 80,
				P = 1.0,
				S = "tents/tent_heal"
			});
			_list.push({
				R = 90,
				P = 1.0,
				S = "tents/tent_gather"
			});
			_list.push({
				R = 95,
				P = 1.0,
				S = "tents/tent_enchant"
			});
			_list.push({
				R = 50,
				P = 1.0,
				S = "accessory/antidote_item"
			});
				_list.push({
				R = 20,
				P = 1.0,
				S = "weapons/legend_sickle"
			});
		}
		else if (_id == "building.specialized_trader")
		{
		}
		else if (_id == "building.weaponsmith")
		{
			_list.push({
				R = 0,
				P = 1.0,
				S = "weapons/named/legend_named_sickle"
			});
		}
		else if (_id == "building.armorsmith")
		{
		}
	}

});

