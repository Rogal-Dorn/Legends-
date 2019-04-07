this.enchanter_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
		BaseCraft = 10.0,
        ItemsCrafted = [],
        Queue = [],
		PointsNeeded = 0,
		PointsCrafted = 0,
		NumBros = 0
	},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Enchanter;
        this.m.Slot = "enchant";
        this.m.Name = "Enchanter";
        this.m.Description = "Oooo.. Pretty glowing things..."
		this.m.BannerImage = "ui/buttons/banner_enchant.png"
		// this.m.UIImage = "ui/settlements/vala_day_empty";
		// this.m.UIImageNight = "ui/settlements/vala_night_empty";
		// this.m.UIImageFull = "ui/settlements/vala_day_full";
		// this.m.UIImageNightFull = "ui/settlements/vala_night_full";
		this.m.Sounds = [
			{
				File = "ambience/camp/camp_vala_chanting_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_chanting_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_singing_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_singing_04.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_singing_05.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_singing_06.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_singing_07.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_singing_08.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_singing_09.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_singing_10.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_stones_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_stones_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_stones_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_stones_04.wav",
				Volume = 1.0,
				Pitch = 1.0
			}
		];
		this.m.SoundsAtNight = [
				{
				File = "ambience/camp/camp_vala_chanting_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_chanting_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_singing_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_singing_04.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_singing_05.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_singing_06.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_singing_07.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_singing_08.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_singing_09.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_singing_10.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_stones_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_stones_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_stones_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_vala_stones_04.wav",
				Volume = 1.0,
				Pitch = 1.0
			}
		];
    }

    function init()
    {
		this.onInit();
		this.m.ItemsCrafted = [];
		this.m.PointsNeeded = 0;
		this.m.PointsCrafted = 0;
		local mod = this.getModifiers()
		this.m.NumBros = mod.Assigned;
        foreach (i, r in this.m.Queue)
        {
            if (r == null)
            {
                continue;
            }
            
            this.m.PointsNeeded += r.Blueprint.getCost() - r.Points;
        }		
    }

	function isHidden()
	{
		local roster = this.World.getPlayerRoster().getAll();
        foreach( bro in roster )
        {
            if (bro.getBackground().getModifiers().Enchanting > 0)
            {
                return false
            }
		}
		return true;		
	}

    function onInit()
    {
		local q = [];
		for (local i = 0; i < this.m.Queue.len(); i = ++i)
		{
			if (this.m.Queue[i] == null)
			{
				continue
			}
			if (this.m.Queue[i].Blueprint == null)
			{
				continue
			}
			q.push(this.m.Queue[i])
		}
		this.m.Queue = q
	}

    function getModifiers()
    {
        local ret = 
        {
            Craft = 0.0,
            Assigned = 0,
            Modifiers = []

        }
		local roster = this.World.getPlayerRoster().getAll();
        foreach( bro in roster )
        {
            if (bro.getCampAssignment() != this.m.ID)
            {
                continue
            }

            local rm = this.m.BaseCraft * bro.getBackground().getModifiers().Enchanting;
			if (bro.getSkills().hasSkill("perk.legend_vala_inscription_mastery"))
			{
				rm += 0.3 * rm;
			}
            ret.Craft += rm
            ++ret.Assigned
			ret.Modifiers.push([rm, bro.getName(), bro.getBackground().getNameOnly()]);	
        }
        return ret;
    }

	function getResults()
    {
		local res = []
		local id = 20;
		foreach (b in this.m.ItemsCrafted)
		{
			res.push({
		 		id = id,
		 		icon = "ui/items/" + b.getIcon(),
		 		text = "You craft an " + b.getName()
			})
			++id;
		}
        return res;
    }

	function getUpgraded()
	{
		return true;
	}

	function getLevel()
	{
		local pro = "dude";
		if (this.getUpgraded())
		{
			pro = "tent";
		}

		local sub = "empty";
		
		if (this.getAssignedBros() > 0) {
			sub =  "full";
		}
		return pro + "_" + sub;
	}
	
	function getUpdateText()
	{
		if (this.m.Queue.len() <= 0)
		{
			return null;
		}

		if (this.m.NumBros == 0)
		{
			return "No one assigned to enchant";
		}

		local percent = (this.m.PointsCrafted / this.m.PointsNeeded) * 100.0;
		if (percent >= 100)
		{
			return "Enchanted ... 100%";
		}
		
		return "Enchanted ... " + percent + "%";
	}

    function update ()
    {
        local modifiers = this.getModifiers();
        foreach (i, r in this.m.Queue)
        {
            if (r == null)
            {
                continue;
            }

			if (r.Blueprint == null)
			{
				continue;
			}

			if (!r.Blueprint.isCraftable())
			{
				continue;
			}

            local needed = r.Blueprint.getCost() - r.Points;

            if (modifiers.Craft < needed)
            {
                needed = modifiers.Craft;
            }
			r.Points += needed;
			this.m.PointsCrafted += needed
            modifiers.Craft -= needed;

			if (r.Points >= r.Blueprint.getCost())
			{
				r.Blueprint.enchant();
				this.m.ItemsCrafted.push(r.Blueprint)
				this.m.Queue[i] = null;
			}

            if (modifiers.Craft <= 0) 
            {
                break
            }
        }

		return this.getUpdateText();
    }

	function getQueue()
	{
		local ret = [];
		foreach( b in this.m.Queue )
		{
			if (b == null)
			{
				continue
			}
			local r = b.Blueprint.getUIData();
			r.Percentage <- (b.Points / (b.Blueprint.getCost() * 1.0)) * 100
			ret.push(r);
		}
		return ret;
	}

	function getResourceImage()
	{
		return "ui/buttons/icon_time.png";
	}

	function getResourceCount()
	{
		return this.getRequiredTime();
	}

    function getRequiredTime()
    {
        local points = 0;
		if (this.m.Queue == null)
        {
            return 0;
        }
        
        foreach (r in this.m.Queue)
        {
            if (r == null)
            {
                continue;
            }
            
            points += (r.Blueprint.getCost() - r.Points);
        }
        local modifiers = this.getModifiers();
		if (modifiers.Craft <= 0)
		{
			return 0
		}
        return this.Math.ceil(points / modifiers.Craft);
    }

    function getAssignedBros()
    {
        local mod = this.getModifiers();
        return mod.Assigned;
    }

	function onBroEnter ( _bro )
	{
		return _bro.getBackground().getModifiers().Enchanting > 0;
	}


	function onAdd ( _blueprintID )
	{
		local blueprint = this.World.Crafting.getBlueprint(_blueprintID);
		if (!blueprint.isCraftable())
		{
			return;
		}
		this.m.Queue.push({
			Points = 0.0,
			Blueprint = blueprint
		});
		if (blueprint.getSounds().len() != 0)
		{
			this.Sound.play(blueprint.getSounds()[this.Math.rand(0, blueprint.getSounds().len() - 1)], 1.0);
		}
	}

	function onRemove ( _idx )
	{
		local q = [];
		for (local i = 0; i < this.m.Queue.len(); i = ++i)
		{
			if (i == _idx)
			{
				continue
			}
			q.push(this.m.Queue[i])
		}
		this.m.Queue = q
	}

	function onSwap ( _source, _target)
	{
		local item = this.m.Queue[_source];
		this.m.Queue[_source] = this.m.Queue[_target];
		this.m.Queue[_target] = item;
		if (item.Blueprint.getSounds().len() != 0)
		{
			this.Sound.play(item.Blueprint.getSounds()[this.Math.rand(0, item.Blueprint.getSounds().len() - 1)], 1.0);
		}
	}

	function onClicked( _campScreen )
	{
        _campScreen.showEnchanterDialog();
        this.camp_building.onClicked(_campScreen);
	}
        
	function onSerialize( _out )
	{
		this.onInit(); //clear out null queue items
		_out.writeU16(this.m.Queue.len());
		foreach( b in this.m.Queue )
		{
			_out.writeString(b.Blueprint.getID());
			_out.writeF32(b.Points)
		}
	}

	function onDeserialize( _in )
	{
		local num = _in.readU16();
		for( local i = 0; i < num; i = ++i )
		{
			this.m.Queue.push({
				Blueprint =  this.World.Crafting.getBlueprint(_in.readString()),
				Points = _in.readF32(),
			})
		}
	}
    
});