this.legends_mod <- {
	m = {
        // BrotherStats = null 
    },
	function create()
	{
        // this.m.BrotherStats = this.new("scripts/statistics/legends_brother_statistics_manager");
	}

    // function getStatistics()
    // {
    //     return this.m.BrotherStats;
    // }

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


}