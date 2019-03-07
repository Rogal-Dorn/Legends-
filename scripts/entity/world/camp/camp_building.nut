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
        this.Bros = [];
    }

    function update ()
    {
    }

    function assignBro( _bro )
    {

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