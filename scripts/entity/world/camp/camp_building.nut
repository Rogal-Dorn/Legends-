this.camp_building <- {
	m = {
        Camp = null,
        ID = ""
	},
    function create()
    {
    }

    function destroy()
    {
    }

    function init()
    {
    }

    function completed()
    {
    }

    function update ()
    {
    }

    function getResults()
    {
        return [];
    }


    function assignBro( _bro )
    {
        bro.setCampAssignment(this.m.ID);
    }

    function setCamp ( _camp )
    {
        this.m.Camp = this.WeakTableRef(_camp);
    }


    function onSerialize( _out )
	{
		_out.writeBool(false);
	}

	function onDeserialize( _in )
	{
		_in.readBool();
	}

}