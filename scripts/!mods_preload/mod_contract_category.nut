// Note: this script does not hook a "contract_category.nut" script. Rather it uses hooks to automate setting contract categories as a time-saving convenience.

local gt = this.getroottable();

// Contract Overhaul (adding Categories)
// At each corresponding Settlement Tier, a settlement can have the configured maximum number of open contracts under the corresponding Category (Economic, Location etc)
// Wildcard is a bonus category, where any contract can be given an open contract slot under Wildcard if its corresponding Category is full. This is for variety's sake
gt.Const.Contracts.CategoryLimits <- {
	Economy = [
		1, // Tier 1 limit
		1, // Tier 2 limit
		1  // Tier 3 limit
	],
	Battle = [
		1,
		1,
		1
	],
	Hunt = [
		1,
		1,
		1
	],
	Legendary = [
		1,
		1,
		1
	],
	Wildcard = [
		1,
		2,
		3
	]
};

// Note: if adding any new categories, you will also need to update the definition of m.ContractsByCategory in faction.nut

// Contract Overhaul (adding Categories)
// This will define which Category each contract is
// Each contract's m.Category will be defined as the value configured here
// Each contract action will call isReadyForContract() with the input as the value configured for the corresponding contract
gt.Const.Contracts.ContractCategoryMap <- {
	
	// Settlement Contracts
	deliver_item_contract = "Economy",
	deliver_money_contract = "Economy",
	escort_caravan_contract = "Economy",
	obtain_item_contract = "Economy",
	restore_location_contract = "Economy",
	return_item_contract = "Economy",

	defend_settlement_bandits_contract = "Battle",
	defend_settlement_greenskins_contract = "Battle",
	discover_location_contract = "Battle",
	drive_away_bandits_contract = "Battle",
	drive_away_barbarians_contract = "Battle",
	investigate_cemetery_contract = "Battle",

	hunting_alps_contract = "Hunt",
	hunting_hexen_contract = "Hunt",
	hunting_lindwurms_contract = "Hunt",
	hunting_schrats_contract = "Hunt",
	hunting_unholds_contract = "Hunt",
	hunting_webknechts_contract = "Hunt",
	roaming_beasts_contract = "Hunt",

	legend_bandit_army_contract = "Legendary",
	legend_barbarian_prisoner_contract = "Legendary",
	legend_hunting_coven_leader_contract = "Legendary",
	legend_hunting_demon_alps_contract = "Legendary",
	legend_hunting_greenwood_schrats_contract = "Legendary",
	legend_hunting_redback_webknechts_contract = "Legendary",
	legend_hunting_rock_unholds_contract = "Legendary",
	legend_hunting_skin_ghouls_contract = "Legendary",
	legend_hunting_stollwurms_contract = "Legendary",
	legend_hunting_white_direwolf_contract = "Legendary"

	// Noble Contracts (future development?)

	// City-State Contracts (future development?)

}

// Use hooks to programmatically set each contract's Category to the configured value in gt.Const.Contracts.ContractCategoryMap
// Note: The corresponding faction action scripts that spawn the contracts still need manual coding to input the relevant Category to the isReadyForContract() call
this.getroottable().Const.LegendMod.hookContractCategory <- function()
{

	foreach (key, value in gt.Const.Contracts.ContractCategoryMap)
	{
		local script = "contracts/contracts/" + key;
		local cat = gt.Const.Contracts.ContractCategoryMap[key];
		::mods_hookNewObject(script, function(o){
			o.m.Category = cat;
		});
	}

	delete this.Const.LegendMod.hookContractCategory;
}