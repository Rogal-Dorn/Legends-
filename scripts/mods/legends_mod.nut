this.legends_mod <- {
	m = {
        Configs = null
    },
	function create()
	{
        this.m.Configs = this.new("scripts/mods/legends_configs");
	}

    function Configs() {
        return this.m.Configs;
    }

    function onDevConsole(_command, _args)
    {
        switch(_command)
        {
        case "event":
            this.doDevConsoleEvent(_args);
            break;
        }
    }

    function doDevConsoleEvent(_args)
    {
        if (!this.World.Events.canFireEvent())
        {
            this.logInfo("Can not fire event " + _args +" at this time");
            return
        }

        this.World.Events.fire(_args);
    }

    //Backwards compatibility from < 71 versions
    function UpdateFromConst()
    {
        this.m.Configs.m.IsArmor = this.Const.LegendMod.Configs.LegendArmorsEnabled();
        this.m.Configs.m.IsMagic = this.Const.LegendMod.Configs.LegendMagicEnabled();
        this.m.Configs.m.IsGender = this.Const.LegendMod.Configs.LegendGenderEnabled();
        this.m.Configs.m.IsItemScaling = this.Const.LegendMod.Configs.LegendItemScalingEnabled();
        this.m.Configs.m.IsLocationScaling = this.Const.LegendMod.Configs.LegendLocationScalingEnabled();
        this.m.Configs.m.IsCampUnlock = this.Const.LegendMod.Configs.LegendCampUnlockEnabled();
        this.m.Configs.m.IsRecruitScaling = this.Const.LegendMod.Configs.LegendRecruitScalingEnabled();
        this.m.Configs.m.IsBleedKiller = this.Const.LegendMod.Configs.LegendBleedKillerEnabled();
        this.m.Configs.m.IsBlueprintsVisible = this.Const.LegendMod.Configs.LegendAllBlueprintsEnabled();
        this.m.Configs.m.IsRelationship = this.Const.LegendMod.Configs.RelationshipsEnabled();
        this.m.Configs.m.IsWorldEconomy = this.Const.LegendMod.Configs.LegendWorldEconomyEnabled();
    }

    function onSerialize(_out)
    {
        this.m.Configs.onSerialize(_out);
    }

    function onDeserialize(_in)
    {
        this.m.Configs.onDeserialize(_in);
    }


}