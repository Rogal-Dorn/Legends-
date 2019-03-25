this.healer_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
		BaseCraft = 1.0,
		MedsUsed = 0,
		InjuriesTreated = 0,
		Queue = null,
		InjuriesHealed = [],
		InjurySounds = []
	},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Healer;
        this.m.Slot = "healer";
        this.m.Name = "Heal/Reserves";
        this.m.Description = "Place brothers in reserves in order to heal from wounds.";
		this.m.UIImage = "ui/settlements/med_day_empty";
		this.m.UIImageNight =  "ui/settlements/med_night_empty";
		this.m.UIImageFull = "ui/settlements/med_day_full";
		this.m.UIImageNightFull =  "ui/settlements/med_night_full";
		this.m.Sounds = [
			{
				File = "ambience/camp/healer_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/healer_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/healer_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			}
		];
		this.m.SoundsAtNight = [
			{
				File = "ambience/camp/healer_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/healer_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/healer_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			}
		];
		this.m.InjurySounds = [
			{
				File = "sounds/ambience/camp/camp_healer_treatment_bandage_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "sounds/ambience/camp/camp_healer_treatment_bandage_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
		]
    }

    function init()
    {
        this.m.MedsUsed = 0;
		this.m.InjuriesTreated = 0;
		this.m.InjuriesHealed = [];
    }

    function onInit()
    {
		local q = [];
		if (this.m.Queue == null)
		{
			local brothers = this.World.getPlayerRoster().getAll();
			foreach( b in brothers )
			{
				if (b.getCampAssignment() != this.m.ID)
				{
					continue
				}

				local allInjuries = b.getSkills().query(this.Const.SkillType.TemporaryInjury);
				foreach (i in allInjuries)
				{
					if (i.getQueue() == 0)
					{
						continue
					}
					q.push(i);
				}
			}
			q.sort(this.onSortQueue);
		}
		else
		{
			for (local i = 0; i < this.m.Queue.len(); i = ++i)
			{
				if (this.m.Queue[i] == null)
				{
					continue
				}

				if (this.m.Queue[i].getQueue() == 0)
				{
					continue
				}

				q.push(this.m.Queue[i])
			}
		}
		
		this.m.Queue = q
    }

	function onSortQueue( _a, _b )
	{
		if (_a.getQueue() < _b.getQueue())
		{
			return -1;
		}
		else if (_a.getQueue() > _b.getQueue())
		{
			return 1;
		}

		return 0;
	}

    function getResults()
    {
		local id = 30;
        local res = [{
			id = id,
			icon = "ui/buttons/asset_medicine_down.png",
			text = "You used [color=" + this.Const.UI.Color.NegativeEventValue + "]" + this.m.MedsUsed + "[/color] units of medicine and treated [color=" + this.Const.UI.Color.PositiveEventValue + "]" + this.m.InjuriesTreated + "[/color] injuries."
		}];
		foreach (b in this.m.InjuriesHealed)
		{
			res.push({
		 		id = id,
		 		icon = "" + b.getIcon(),
		 		text = b.getName()
			})
			++id;
		}
		return res;
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

            local rm = (this.m.BaseCraft + this.m.BaseCraft * this.Const.LegendMod.getInjuryModifier(bro.getBackground().getID()))
            ret.Craft += rm
            ++ret.Assigned
			ret.Modifiers.push([rm, bro.getName(), bro.getBackground().getNameOnly()]);	
        }
        return ret;
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

			if (r.isTreated())
			{
				continue;
			}

			if (!r.isTreatable())
			{
				continue;
			}

			if (r.getQueue() == 0)
			{
				continue;
			}

			if (this.World.Assets.getMedicine() <= 0 )
			{
				continue
			}

            local needed = r.getCost() - r.getPoints();

            if (modifiers.Craft < needed)
            {
                needed = modifiers.Craft;
            }
			r.setPoints(r.getPoints() + needed);
            modifiers.Craft -= needed;
			this.World.Assets.addMedicine(-needed)

			if (r.getPoints() >= r.getCost())
			{
				r.setTreated(true);
				r.setQueue(0);
				r.getContainer().getActor().updateInjuryVisuals();
				this.m.InjuriesHealed.push(r);
				this.m.Queue[i] = null;
			}

            if (modifiers.Craft <= 0) 
            {
                break
            }

        }
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
			
			local r = {
				ID = b.getID(),
				Name = b.getName(),
				Description = b.getDescription(),
				ImagePath = b.getIcon(),
				Percentage = b.getTreatedPercentage() * 100
			};			
			ret.push(r);
		}
		return ret;
	}

	function getRoster()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local roster = [];

		foreach( b in brothers )
		{
            if (b.getCampAssignment() != this.m.ID)
            {
                continue
            }

			local injuries = [];
			local allInjuries = b.getSkills().query(this.Const.SkillType.TemporaryInjury);

			for( local i = 0; i != allInjuries.len(); i = ++i )
			{
				local inj = allInjuries[i];
				if (!inj.isTreated())
				{
					injuries.push({
						id = inj.getID(),
						icon = inj.getIconColored(),
						name = inj.getNameOnly(),
						price = inj.getCost(),
						treatable = inj.isTreatable() && inj.getQueue() == 0,
						points = inj.getPoints()
					});
				}
			}

			local background = b.getBackground();
			local e = {
				ID = b.getID(),
				Name = b.getName(),
				ImagePath = b.getImagePath(),
				ImageOffsetX = b.getImageOffsetX(),
				ImageOffsetY = b.getImageOffsetY(),
				BackgroundImagePath = background.getIconColored(),
				BackgroundText = background.getDescription(),
				Injuries = injuries
			};
			roster.push(e);
		}
		return roster;
	}

    function getRequiredMeds()
    {
        local points = 0;
        foreach (i, r in this.m.Queue)
        {
            if (r == null)
            {
                continue;
            }
            
            points += r.getCost();
        }
		return points;
    }

    function getRequiredTime()
    {
        local points = 0;
        foreach (r in this.m.Queue)
        {
            if (r == null)
            {
                continue;
            }
            
            points += r.getCost();
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

	function onAdd( _entityID, _injuryID  )
	{
		local entity = this.Tactical.getEntityByID(_entityID);
		local injury = entity.getSkills().getSkillByID(_injuryID);
		this.m.Queue.push(injury)
		injury.setQueue(this.m.Queue.len());
		local sound = this.m.InjurySounds[this.Math.rand(0, this.m.InjurySounds.len() - 1)];
		this.Sound.play(sound.File, sound.Volume)
	}

	function onRemove( _idx )
	{
		local q = [];
		for (local i = 0; i < this.m.Queue.len(); i = ++i)
		{
			if (i == _idx)
			{
				this.m.Queue[_idx].setQueue(0);
				continue
			}
			q.push(this.m.Queue[i])
		}
		this.m.Queue = q
	}

	function onSwap( _source, _target)
	{
		local item = this.m.Queue[_source];
		item.setQueue(_target + 1);
		this.m.Queue[_target].setQueue(_source + 1);
		this.m.Queue[_source] = this.m.Queue[_target];
		this.m.Queue[_target] = item;
		local sound = this.m.InjurySounds[this.Math.rand(0, this.m.InjurySounds.len() - 1)];
		this.Sound.play(sound.File, sound.Volume)
	}

	function onBroLeave( _bro )
	{
		local allInjuries = _bro.getSkills().query(this.Const.SkillType.TemporaryInjury);
		foreach (i in allInjuries)
		{
			i.setQueue(0);
		}
	}

	function onClicked( _campScreen )
	{
        _campScreen.showHealerDialog();
        this.camp_building.onClicked(_campScreen);
	}
        
	function onSerialize( _out )
	{
	}

	function onDeserialize( _in )
	{
	}


});