this.perk_legend_ammo_bundles <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_ammo_bundles";
		this.m.Name = this.Const.Strings.PerkName.LegendAmmoBundles;
		this.m.Description = this.Const.Strings.PerkDescription.LegendAmmoBundles;
		this.m.Icon = "ui/perks/MaxAmmoT2.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{

		local economicDifficulty = this.World.Assets.getEconomicDifficulty(); 
		local stashSize = this.Const.LegendMod.MaxResources[economicDifficulty].Ammo
		stashSize += 20; 

	}
		function onRemoved()
	{
		local economicDifficulty = this.World.Assets.getEconomicDifficulty(); 
		local stashSize = this.Const.LegendMod.MaxResources[economicDifficulty].Ammo
		stashSize -= 20; 
	}


});
