::mods_hookExactClass("factions/actions/send_refugees_action", function(o) 
{
	o.onExecute = function ( _faction )
	{
		local party = _faction.spawnEntity(this.m.Start.getTile(), "Refugees", false, this.Const.World.Spawn.Peasants, this.Math.rand(30, 60));
		party.getSprite("banner").Visible = false;
		party.getSprite("body").setBrush("figure_civilian_0" + this.Math.rand(1, 2));
		party.setDescription("Refugees fleeing the horrors of war - beaten down, tired and desperate.");
		party.setFootprintType(this.Const.World.FootprintsType.Refugees);
		party.getFlags().set("IsRandomlySpawned", true);
		party.getLoot().Money = this.Math.rand(0, 50);
		party.setOrigin(this.World.State.getCurrentTown());
		if(::Legends.Mod.ModSettings.getSetting("WorldEconomy").getValue())
		{
			local resources = this.Math.max(1, this.Math.round(0.01 * this.m.Start.getResources()));
			this.m.Start.setResources(this.m.Start.getResources() - resources);
			party.setResources(resources);
			local r = this.Math.rand(1,2);
			for( local j = 0; j < r; j = ++j )
			{
				local items = [
					[1, "supplies/bread_item"],
					[1, "supplies/roots_and_berries_item"],
					[1, "supplies/dried_fruits_item"],
					[1, "supplies/ground_grains_item"],
					[1, "supplies/dried_fish_item"],
					[1, "supplies/beer_item"],
					[1, "supplies/goat_cheese_item"],
					[1, "supplies/legend_fresh_fruit_item"],
					[1, "supplies/legend_fresh_meat_item"],
					[1, "supplies/legend_pie_item"],
					[1, "supplies/legend_porridge_item"],
					[1, "supplies/legend_pudding_item"],
					[1, "supplies/mead_item"],
					[0, "supplies/medicine_item"],
					[1, "supplies/pickled_mushrooms_item"],
					[1, "supplies/preserved_mead_item"],
					[1, "supplies/smoked_ham_item"],
					[1, "supplies/wine_item"]
				]

				local item = this.Const.World.Common.pickItem(items)
				party.addToInventory(item);
			}
		}

		local c = party.getController();
		c.getBehavior(this.Const.World.AI.Behavior.ID.Attack).setEnabled(false);

		local move = this.new("scripts/ai/world/orders/move_order");
		move.setDestination(this.m.Dest.getTile());
		move.setRoadsOnly(true);
		local unload = this.new("scripts/ai/world/orders/unload_order");
		local despawn = this.new("scripts/ai/world/orders/despawn_order");
		c.addOrder(move);
		c.addOrder(unload);
		c.addOrder(despawn);
	}
});