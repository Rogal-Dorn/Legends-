this.legends_mod <- {
	m = {},
	function create()
	{
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
}