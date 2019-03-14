this.camp_building <- {
	m = {
        Camp = null,
        ID = "",
        Slot = "",
        Name = "",
        Description = "",
		UIImage = null,
		UIImageNight = null,
		Tooltip = null,
		TooltipIcon = "",
		Sounds = [],
		SoundsAtNight = [],
        CanEnter = true,
        InCommanderTent = true
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

    function canEnter()
    {
        return this.m.CanEnter;
    }

    function getID()
    {
        return this.m.ID;
    }

    function getName()
    {
        return this.m.Name;
    }

    function getSlot()
    {
        return this.m.Slot;
    }

    function getResults()
    {
        return [];
    }

    function isHidden()
    {
        return false;
    }

	function getUIImage()
	{
		return this.World.getTime().IsDaytime ? this.m.UIImage : this.m.UIImageNight;
	}

	function getTooltipID()
	{
		return this.m.ID;
	}

    function getTooltip()
    {
        return [
            {
                id = 1,
                type = "title",
                text = this.m.Name
            },
            {
                id = 2,
                type = "description",
                text = this.m.Description
            }
        ];        
    }

	function getTooltipIcon()
	{
		return this.m.TooltipIcon;
	}

    function getNumberAssigned()
    {
        local count = 0;
        local roster = this.World.getPlayerRoster().getAll();
        foreach( b in roster )
        {
            if (b.getCampAssignment() != this.m.ID)
            {
                continue
            }
            ++count;
        }
        return count;
    }

    function inCommanderTent()
    {
        return this.m.InCommanderTent;
    }

	function pushUIMenuStack()
	{
		this.World.State.getMenuStack().push(function ()
		{
			this.World.State.getCampScreen().showMainDialog();
		}, function ()
		{
			return !this.World.State.getCampScreen().isAnimating();
		});
	}

    function assignBro( _bro )
    {
        bro.setCampAssignment(this.m.ID);
    }

    function setCamp ( _camp )
    {
        this.m.Camp = this.WeakTableRef(_camp);
    }

	function onClicked( _campScreen )
	{
        this.World.State.getMenuStack().push(function ()
		{
			this.World.State.getCampScreen().showMainDialog();
		}, function ()
		{
			return !this.World.State.getCampScreen().isAnimating();
		});
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