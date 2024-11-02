::settlement_modifiers.StablesMult <- 1.0;
::settlement_modifiers.reset = function ()
{
	this.PriceMult = 1.0;
	this.BuyPriceMult = 1.0;
	this.SellPriceMult = 1.0;
	this.FoodPriceMult = 1.0;
	this.MedicalPriceMult = 1.0;
	this.BuildingPriceMult = 1.0;
	this.IncensePriceMult = 1.0;
	this.BeastPartsPriceMult = 1.0;
	this.RarityMult = 1.0;
	this.FoodRarityMult = 1.0;
	this.MedicalRarityMult = 1.0;
	this.MineralRarityMult = 1.0;
	this.BuildingRarityMult = 1.0;
	this.RecruitsMult = 1.25;
	this.StablesMult = 1.0;

	if (this.World.Assets.getEconomicDifficulty() == this.Const.Difficulty.Easy)
	{
		this.RecruitsMult = 2.0;
	}
	if (this.World.Assets.getEconomicDifficulty() == this.Const.Difficulty.Normal)
	{
		this.RecruitsMult = 1.5;
	}		
	if (this.World.Assets.getEconomicDifficulty() == this.Const.Difficulty.Hard)
	{
		this.RecruitsMult = 1.0;
	}
	if (this.World.Assets.getEconomicDifficulty() == this.Const.Difficulty.Legendary)
	{
		this.RecruitsMult = 0.5;
	}		

};