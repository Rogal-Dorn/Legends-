::mods_hookExactClass("factions/actions/add_random_situation_action", function(o) 
{
	local onUpdate = o.onUpdate;
	o.onUpdate = function ( _faction )
	{
		if (this.m.Settlement.getSize() >= 3)
		{
			if (!this.m.Settlement.hasSituation("situation.ambushed_trade_routes"))
			{
				possible_situations.push("seasonal_fair_situation");
			}
		}

		if (this.isKindOf(this.m.Settlement, "legends_fishing_village"))
		{
			possible_situations.push("lost_at_sea_situation");
			possible_situations.push("full_nets_situation");
		}

		if (this.isKindOf(this.m.Settlement, "legends_snow_village"))
		{
			possible_situations.push("snow_storms_situation");
		}

		if (this.isKindOf(this.m.Settlement, "legends_mining_village"))
		{
			possible_situations.push("mine_cavein_situation");
			possible_situations.push("rich_veins_situation");
		}

		if (this.isKindOf(this.m.Settlement, "legends_lumber_village") || this.isKindOf(this.m.Settlement, "legends_forest_fort"))
		{
			possible_situations.push("hunting_season_situation");
		}

		onUpdate( _faction );
	}
});