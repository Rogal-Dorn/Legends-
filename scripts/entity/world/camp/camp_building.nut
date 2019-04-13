this.camp_building <- {
	m = {
        Camp = null,
        ID = "",
        Slot = "",
        Name = "",
        Description = "",
		BannerImage = "",
		Level = 0,
		UIImage = null,
		UIImageNight = null,
		UIImageFull = null,
		UIImageNightFull = null,
		Tooltip = null,
		TooltipIcon = "",
		Sounds = [
			{
				File = "ambience/camp/camp_rest_campfire.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_general_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_general_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_general_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_general_04.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_general_05.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_general_06.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_general_07.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_general_08.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_general_09.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_laugh_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_laugh_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_laugh_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_gatherer_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_gatherer_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_gatherer_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_gatherer_04.wav",
				Volume = 1.0,
				Pitch = 1.0
			}
		],
		SoundsAtNight = [
			{
				File = "ambience/camp/camp_rest_campfire.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_general_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_general_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_general_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_general_04.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_general_05.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_general_06.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_general_07.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_general_08.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_general_09.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_laugh_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_laugh_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_laugh_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_snore_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_snore_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_rest_snore_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_gatherer_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_gatherer_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_gatherer_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_gatherer_04.wav",
				Volume = 1.0,
				Pitch = 1.0
			}
		
		],
        CanEnter = true,
        InCommanderTent = true,
		Camping = true,
		Escorting = false
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

	function Camping() 
	{
		return this.m.Camping;
	}

	function Escorting() 
	{
		return this.m.Escorting;
	}

	function getUpdateText()
	{
		return null;
	}

    function update ()
    {
		return this.getUpdateText();
    }

	function updateTick (_hours)
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

	function getLevel()
	{
		return "empty";
	}

	function getUIImage( _terrain )
	{
		local terrainlabel = _terrain;
		if (_terrain < 10)
		{
			terrainlabel = "0" + _terrain;
		}
		local day = this.World.getTime().IsDaytime ? "day" : "night";
		return "ui/settlements/" + terrainlabel + "_" + this.getSlot() + "_" + this.getLevel() + "_" + day; 
	}

	function getTooltipID()
	{
		return this.m.ID;
	}

	function getName()
	{
		return this.m.Name;
	}

	function getTitle()
	{
		return this.m.Name;
	}

    function getTooltip()
    {
		local res = [
            {
                id = 1,
                type = "title",
                text = this.getTitle()
            },
            {
                id = 2,
                type = "description",
                text = this.getDescription()
            }
        ];
		local mod = this.getModifierToolip()
		foreach (i in mod)
		{
			res.push(i);
		}
		return res;
    }

    function getModifierToolip()
    {
		return [];
	}

	function getDescription()
	{
		return this.m.Description;
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

	function getBanner()
	{
		return this.m.BannerImage;
	}

	function getResourceImage()
	{
		return "";
	}

	function getResourceCount()
	{
		return 0;
	}

    function inCommanderTent()
    {
        return this.m.InCommanderTent && !this.isHidden();
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
			this.World.State.getCampScreen().refresh();			
		}, function ()
		{
			return !this.World.State.getCampScreen().isAnimating();
		});
	}

	function onBroLeave ( _bro )
	{
	}

	function onBroEnter ( _bro )
	{
		return true
	}

	function onSerialize( _out )
	{
	}

	function onDeserialize( _in )
	{
	}

}