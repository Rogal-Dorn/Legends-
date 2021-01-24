this.seasonal_fair_situation <- this.inherit("scripts/entity/world/settlements/situations/situation", {
	m = {},
	function create()
	{
		this.situation.create();
		this.m.ID = "situation.seasonal_fair";
		this.m.Name = "Seasonal Fair";
		this.m.Description = "Traders from far and wide gather here for the seasonal fair. Lots of people flock here from the surrounding countryside, and it\'s a great time to sell goods or rummage through plentiful offers.";
		this.m.Icon = "ui/settlement_status/settlement_effect_28.png";
		this.m.Rumors = [
			"What\'s going on around here you\'re asking? Well, there\'s a fair over in %settlement%. Merchants from far and wide gather to offer their wares.",
			"Me, I am more of the solitary type. Big fairs like the one over in %settlement% just don\'t appeal to me at all...."
		];
		this.m.IsStacking = false;
		this.m.ValidDays = 3;
	}

	function onAdded( _settlement )
	{
		_settlement.removeSituationByID("situation.ambushed_trade_routes");
		if(this.LegendsMod.Configs().LegendWorldEconomyEnabled())
		{
			_settlement.setResources(_settlement.getResources() + _settlement.getResources() * 0.1);
		}
		_settlement.resetShop();
	}

	function onUpdate( _modifiers )
	{
		_modifiers.PriceMult *= 1.25;
		_modifiers.RarityMult *= 1.25;
		_modifiers.FoodRarityMult *= 1.25;
		_modifiers.MedicalRarityMult *= 1.25;
		_modifiers.RecruitsMult *= 1.25;
	}

	function onUpdateDraftList( _draftList, _gender )
	{
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("peddler_background");
		_draftList.push("juggler_background");
		_draftList.push("juggler_background");
		_draftList.push("juggler_background");
		_draftList.push("minstrel_background");
		_draftList.push("minstrel_background");
		_draftList.push("minstrel_background");
		if (_gender)
		{
		_draftList.push("female_minstrel_background");
		_draftList.push("female_minstrel_background");
		_draftList.push("female_minstrel_background");
		}

		if(this.LegendsMod.Configs().LegendMagicEnabled())
		{
			local r;
			if  ( this.World.Assets.getOrigin().getID() == "scenario.legends_seer")
			{
			r = this.Math.rand(0, 5);
				if (r == 1)
				{
				_draftList.push("legend_entrancer_background");
				}
			}
			else if  ( this.World.Assets.getOrigin().getID() == "scenario.legends_sisterhood")
			{

				_draftList.push("legend_entrancer_background");

			}
			else
			{
			r = this.Math.rand(0, 9);
				if (r == 1)
				{
				_draftList.push("legend_entrancer_background");
				}
			}
		}
	}

});

