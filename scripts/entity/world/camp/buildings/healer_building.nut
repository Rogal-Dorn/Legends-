this.healer_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
		BaseCraft = 1.0,
		MedsUsed = 0,
		InjuriesTreated = 0,
		Queue = [],
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
				File = "ambience/camp/camp_healer_treatment_bandage_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_healer_treatment_bandage_01.wav",
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
		for (local i = 0; i < this.m.Queue.len(); i = ++i)
		{
			if (this.m.Queue[i] == null)
			{
				continue
			}
			if (this.m.Queue[i].Injury == null)
			{
				continue
			}			
			q.push(this.m.Queue[i])
		}
		this.m.Queue = q
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

            local rm = (this.m.BaseCraft + this.m.BaseCraft * this.Const.LegendMod.getHealingModifier(bro.getBackground().getID()))
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

			if (r.Injury == null)
			{
				continue;
			}

			if (r.Injury.isTreated())
			{
				continue;
			}

			if (this.World.Assets.getMedicine() <= 0 )
			{
				continue
			}

            local needed = r.Injury.getCost() - r.Points;

            if (modifiers.Craft < needed)
            {
                needed = modifiers.Craft;
            }
			r.Points += needed;
            modifiers.Craft -= needed;
			this.World.Assets.addMedicine(-needed)

			if (r.Points >= r.Injury.getCost())
			{
				r.Injury.setTreated(true);
				r.Injury.getContainer().getActor().updateInjuryVisuals();
				this.m.InjuriesHealed.push(r.Injury);
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
				ID = b.Injury.getID(),
				Name = b.Injury.getName(),
				Description = b.Injury.getDescription(),
				ImagePath = b.Injury.getIcon(),
				Percentage = (b.Points / b.Injury.getCost()) * 100
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
						treatable = inj.isTreatable()
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
            
            points += r.Injury.getCost();
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
            
            points += r.Injury.getCost();
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

	function onAdd ( _entityID, _injuryID  )
	{
		local entity = this.Tactical.getEntityByID(_entityID);
		local injury = entity.getSkills().getSkillByID(_injuryID);
		injury.setTreatable(false);
		this.m.Queue.push(
			{
				BroID = _entityID,
				Points = 0.0,
				Injury = injury
			}
		)
		//this.Sound.play(this.m.InjurySounds[this.Math.rand(0, this.m.InjurySounds.len() - 1)], 1.0);
	}

	function onRemove ( _idx )
	{
		local q = [];
		for (local i = 0; i < this.m.Queue.len(); i = ++i)
		{
			if (i == _idx)
			{
				this.m.Queue[_idx].Injury.setTreatable(true);
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
		//this.Sound.play(this.m.InjurySounds[this.Math.rand(0, this.m.InjurySounds.len() - 1)], 1.0);
	}

	function onClicked( _campScreen )
	{
        _campScreen.showHealerDialog();
        this.camp_building.onClicked(_campScreen);
	}
        
	function onSerialize( _out )
	{
		this.onInit(); //clear out null queue items
		_out.writeU16(this.m.Queue.len());
		foreach( b in this.m.Queue )
		{
			_out.writeString(b.BroID);
			_out.writeString(b.Injury.getID());
			_out.writeF32(b.Points);
		}
	}

	function onDeserialize( _in )
	{
		this.m.Queue = [];
		local num = _in.readU16();
		for( local i = 0; i < num; i = ++i )
		{
			local broID = _in.readString();
			local injuryID = _in.readString();
			local points = _in.readF32();
			this.m.Queue.push({
				Blueprint = this.getBlueprint(_in.readString()),
				Points = _in.readF32(),
			})
		}
	}


});