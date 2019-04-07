this.training_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
		Base = 0,
		Results = [],
		NumBros = 0
	},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Training;
        this.m.Slot = "train";
        this.m.Name = "Training Grounds";
        this.m.Description = "Training"
		this.m.BannerImage = "ui/buttons/banner_train.png"
		// this.m.UIImage = "ui/settlements/training_day_empty";
		// this.m.UIImageNight = "ui/settlements/training_night_empty";
		// this.m.UIImageFull = "ui/settlements/training_day_full";
		// this.m.UIImageNightFull = "ui/settlements/training_night_full";
		this.m.CanEnter = false
		this.m.Sounds = [
			{
				File = "ambience/camp/camp_training_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_training_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_training_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			}
		];
		this.m.SoundsAtNight = [
			{
				File = "ambience/camp/camp_training_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_training_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_training_03.wav",
				Volume = 1.0,
				Pitch = 1.0
			}
		];
    }

	
	function getUpgraded()
	{
        return this.Stash.hasItem("tent.training_tent");
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

    function init()
    {
		this.m.Results = [];
		this.m.NumBros = this.getAssignedBros();
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

            local rm = this.m.Base + this.m.Base * bro.getBackground().getModifiers().Training;
            ret.Craft += rm
            ++ret.Assigned
			ret.Modifiers.push([rm, bro.getName(), bro.getBackground().getNameOnly()]);	
        }
        return ret;
    }

	function getRandomBroName(broName, bros)
	{
		local names = [];
		foreach(b in bros)
		{
			if (b[1] == broName) {
				continue
			}
			names.push(b[1])
		}
		return names[this.Math.rand(0, names.len() -1)];
	}

	function getResults()
    {
		local res = []
		local id = 120;
		foreach (b in this.m.Results)
		{
			res.push({
		 		id = id,
		 		icon = b.Icon,
		 		text = b.Text
			})
			++id;
		}
        return res;
    }
	
	function getAssignedBros()
    {
        local mod = this.getModifiers();
        return mod.Assigned;
    }

	function getInjury( bro )
	{
		local injury = bro.addInjury(this.Const.Injury.CampTraining);
		this.m.Results.push({
			Icon = injury.getIcon(),
			Text = bro.getName() + " suffers " + injury.getNameOnly() + " while training."
		});
	}

	function getTrained( bro )
	{
		if (bro.getSkills().hasSkill("effects.trained")) 
		{
			return
		}
		local effect = this.new("scripts/skills/effects_world/new_trained_effect");
		effect.m.Duration = 1;
		effect.m.XPGainMult = 1.2;
		effect.m.Icon = "skills/status_effect_75.png";
		bro.getSkills().add(effect);

		local mod = this.getModifiers();
		local adjectives = [
			 bro.getName() + " learned a new move",
			 bro.getName() + " finally nails the fancy parry he\'s been practicing",
			 bro.getName() + " invents an overly showy move",
			 bro.getName() + " finds a stance that feels more natural"
			 bro.getName() + " learns how to adjust the new armor so it fits better",
			 bro.getName() + " has perfected a new skill in practice",
			 bro.getName() + " had his ego bruised and wants an outlet for his frustration",
			 bro.getName() + " left the training dummy as nothing more than a pile of splinters",
			 bro.getName() + " has practiced a skill so much it has become second nature",
			 bro.getName() + " feels more comfortable with their weapon",
			 bro.getName() + " sets a new personal best in training"
		];
		local text = "After practicing ";
		local M = [
			"Short Gaurd ",
			"Upper Snake Guard ",
			"Bastard Cross ",
			"The Middle Iron Door ",
			"thrusts ",
			"trips ", 
			"grapples ",
			"foot passing ",
			"striking ",
			"vambrace traps ",
			"a pommel bash ",
			"half sword ",
			"The Thumb Scissor ", 
			"jabs ",
			"hand to hand combat "
		]
		foreach (m in M)
		{
			local text1 = text + m;
			local T = 
			[
				"for hours, ",
				"all day, ",
				"for several hours, ",
				"until exhaustion, ",
				"as long as possible, "
			]
			foreach (t in T)
			{
				local text2 = text1 + t + bro.getName() + " ";
				local A = 
				[
					"feels ready for a fight",
					"needs a real opponent",
					"is prepared for battle",
					"is keen to try it out",
					"is ready for a scrap"
				]
				foreach (a in A)
				{
					local text3 = text2 + a;
					adjectives.push(text3);
				}

			}

		}
		if (bro.getLevel() < 3)
		{
			adjectives.push( bro.getName() + " figures out what end of the weapon to hold");
			adjectives.push( bro.getName() + " remembers that you can move your legs as well as your arms");
		}

		this.m.Results.push({
			Icon = effect.getIcon(),
			Text = adjectives[this.Math.rand(0, adjectives.len() - 1)] + " and gains a [color=" + this.Const.UI.Color.PositiveEventValue + "]20%[/color] xp increase for the next battle."
		})
	}

	function getBonus( bro )
	{
		if (!this.getUpgraded())
		{
			return 
		}
		
		local text = ""
		local icon = ""
		if (this.Math.rand(1, 100) <= 1)
		{
			bro.m.PerkPoints += 1;
			icon = "ui/icons/level.png"
			text = "Perk Point"
		}
		else 
		{
			local attr = this.Math.rand(0, this.Const.Attributes.COUNT);
			switch (attr)
			{
				case 0:
					bro.getBaseProperties().Hitpoints += 1
					icon = "ui/icons/health.png";
					text = "Hitpoint"					
					break;
				case 1:
					bro.getBaseProperties().Bravery += 1
					icon = "ui/icons/bravery.png";
					text = "Resolve"					
					break;
				case 2:
					bro.getBaseProperties().Fatigue += 1
					icon = "ui/icons/fatigue.png";
					text = "Fatigue"
					break;
				case 3:
					bro.getBaseProperties().Initiative += 1
					icon = "ui/icons/initiative.png";
					text = "Initiative"
					break;
				case 4:
					bro.getBaseProperties().MeleeSkill += 1
					icon = "ui/icons/melee_skill.png";
					text = "Melee Skill"
					break;
				case 5:
					bro.getBaseProperties().RangedSkill += 1
					icon = "ui/icons/ranged_skill.png";
					text = "Ranged Skill"
					break;
				case 6:
					bro.getBaseProperties().MeleeDefense += 1
					icon = "ui/icons/melee_defense.png";
					text = "Melee Defense"					
					break;
				case 7:
					bro.getBaseProperties().RangedDefense += 1
					icon = "ui/icons/ranged_defense.png";
					text = "Ranged Defense"
					break;
			}
			bro.getSkills().update();
		}
		this.m.Results.push({
			Icon = icon,
			Text = bro.getName() + " had a breakthrough training session and gains [color=" + this.Const.UI.Color.PositiveEventValue + "]1[/color] " + text
		});
	}

	function getUpdateText()
	{
		if (this.m.NumBros == 0)
		{
			return null;
		}
		
		return "Training ... " + this.m.NumBros + " brothers";
	}

    function completed()
    {
		local roster = this.World.getPlayerRoster().getAll();
        foreach( bro in roster )
        {
            if (bro.getCampAssignment() != this.m.ID)
            {
                continue
            }

			local r = this.Math.min(95, 100 * this.Math.pow(this.m.Camp.getCampTimeHours() / 10.0, 0.2 + (0.1 * bro.getLevel())));
			//Positive
			if (this.Math.rand(1, 100) < r)
			{
				this.getTrained(bro);

				//this can be upgrade system
				if (this.Math.rand(1, 100) <= this.m.Camp.getCampTimeHours())
				{
					this.getBonus(bro);
				}
			}

			//Negative
			local r = this.Math.min(5, 10 * this.Math.pow(this.m.Camp.getCampTimeHours() / 10.0, 0.2 + (0.1 * bro.getLevel())) - bro.getLevel());			
			if (this.Math.rand(1, 100) < r)
			{
				this.getInjury(bro);
			}
		}

    }
	
	function onClicked( _campScreen )
	{
        _campScreen.showTrainingDialog();
        this.camp_building.onClicked(_campScreen);
	}
        
	function onSerialize( _out )
	{
		this.camp_building.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.camp_building.onDeserialize(_in);
	}

});