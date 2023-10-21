::Legends <- {
	ID = "mod_legends",
	Version = "18.2.0-pre-01",
	Name = "Legends Mod",
	BuildName = "Camps & Contracts"
};
::mods_registerMod(::Legends.ID, ::Legends.Version, ::Legends.Name);
::mods_queue(null, "mod_msu(>=1.2.6), vanilla(>=1.5.0-15), dlc_lindwurm, dlc_unhold, dlc_wildmen, dlc_desert, dlc_paladins", function()
{
	::Legends.Mod <- ::MSU.Class.Mod(::Legends.ID, ::Legends.Version, ::Legends.Name);

	::mods_registerJS("legends_assets.js");
	::LegendsMod <- this.new("scripts/mods/legends_mod")
	::Legends.Mod.Registry.addModSource(::MSU.System.Registry.ModSourceDomain.GitHub, "https://github.com/Battle-Brothers-Legends/Legends-Bugs");
    ::Legends.Mod.Registry.setUpdateSource(::MSU.System.Registry.ModSourceDomain.GitHub);

    ::Const.LegendMod.setupDebug(); // must be called before ::Const.LegendMod.addSettings();
	::Const.LegendMod.addSettings();
	::Const.LegendMod.hookMSU();
	::Const.LegendMod.addLegendItemTypes();
	::Const.LegendMod.addStaticFunctions();

	this.Const.LegendMod.hookActor();
	this.Const.LegendMod.hookAISkills();
	this.Const.LegendMod.hookAIAgent();
	this.Const.LegendMod.hookAISplitShield();
	this.Const.LegendMod.hookAlpRacial();
	this.Const.LegendMod.hookBehavior();
	this.Const.LegendMod.hookCharacterBackground();
	this.Const.LegendMod.hookCombatManager();
	this.Const.LegendMod.hookContract();
	this.Const.LegendMod.hookContractCategory();
	this.Const.LegendMod.hookFactionAction();
	this.Const.LegendMod.hookGhoul();
	this.Const.LegendMod.hookItemContainer();
	this.Const.LegendMod.hookStrategy();
	this.Const.LegendMod.hookTacticalEntityManager();
	this.Const.LegendMod.hookTacticalState();
	this.Const.LegendMod.hookWorldmapGenerator();

	::Const.LegendMod.registerUI();

	this.Const.LegendMod.loadBuyback();
	this.Const.LegendMod.loadTacticalTooltip();
	this.Const.Perks.updatePerkGroupTooltips();

	::Const.LegendMod.addTooltips();

	// Hanter TODO: change all references to LegendsWorldEconomyUpdateV1 to version check once the release is confirmed, and then delete this hook
	::mods_hookExactClass("states/world_state", function(o) {
		local onBeforeSerialize = o.onBeforeSerialize;
		o.onBeforeSerialize = function( _out )
		{
			onBeforeSerialize(_out);

	        _out.getMetaData().setInt("LegendsWorldEconomyUpdateV1", 1);
			::logWarning("onBeforeSerialize LegendsWorldEconomyUpdateV1 set");
		}

		local onBeforeDeserialize = o.onBeforeDeserialize;
		o.onBeforeDeserialize = function( _in )
		{
			::LegendsWorldEconomyUpdateV1 <- false;
			onBeforeDeserialize(_in);
			::logWarning("onBeforeDeserialize _in.getMetaData().getInt(LegendsWorldEconomyUpdateV1) = " + _in.getMetaData().getInt("LegendsWorldEconomyUpdateV1"));
	        if (_in.getMetaData().getInt("LegendsWorldEconomyUpdateV1") == 1)
	        {
	        	::LegendsWorldEconomyUpdateV1 = true;
	        }
	    }
	})
	
});
