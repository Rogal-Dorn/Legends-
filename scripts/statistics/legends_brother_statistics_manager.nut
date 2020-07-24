this.legends_brother_statistics_manager <- {
    m = {
        ActorInteractions = null
    },
    function create()
    {
       
        this.m.ActorInteractions <- array(27); //suposedly this is how u do 2d arrays in squirrel, code from https://forums.electricimp.com/t/2d-array/2788 
        foreach (subarr in this.m.ActorInteractions)
        {
            subarr = array(27);
        }
    }
    function onDeserialize( _in )
    {
        //lazy todo
    }
    function onSerialize( _out )
    {
        //lazy todo
    }
};