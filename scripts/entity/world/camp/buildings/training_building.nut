this.training_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
		Results = [],
		NumBros = 0,
		UnTrained = 0
	},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Training;
		this.m.ModName = "Training";
        this.m.Slot = "train";
        this.m.Name = "Training Grounds";
        this.m.Description = "Training"
		this.m.BannerImage = "ui/buttons/banner_train.png";
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

	function getTitle()
	{
		if (this.getUpgraded())
		{
			return this.m.Name + " *Upgraded*"
		} 
		return this.m.Name +  " *Not Upgraded*"
	}

	function getDescription()
	{
		local desc = "";
		desc += "Whether a seasoned veteran or a green recruit, there's always something new to learn. "
		desc += "Anyone assigned to train has a chance to get a 20% increase in xp on their next combat. "
		desc += "Time and having highly skilled teachers in the grounds increases the chances of successfully learning something new. "
		desc += "There's always a slight chance someone can be injured."
		desc += "\n\n"
		desc += "Training grounds can be upgraded by purchasing an upgrade set in local markets. Upgraded grounds reduce the "
		desc += "risk of accidents from a minimum of 5% to 1% and also give the chance of a permanant skill increase."
		return desc;
	}

	function getModifierToolip()
    {
		local mod = this.getModifiers();
		local ret = [{
            id = 6,
            type = "text",
            icon = "ui/buttons/asset_vision_up.png",
            text = "Total training modifier is [color=" + this.Const.UI.Color.PositiveValue + "]" + mod.Craft * 100.0 + "%[/color]."
		}]
		local id = 7
		foreach (bro in mod.Modifiers)
		{
            ++id
			ret.push({
				id = id,
				type = "hint",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + bro[0] * 100.0 + "%[/color] " + bro[1] + " (" + bro[2] + ")"
			})
		}
		return ret;
	}

	function isHidden()
	{
		
		if (this.Const.LegendMod.Configs.LegendCampUnlockEnabled())
		{
			return false;
		}
		
 		return !this.World.Tags.get("HasLegendCampTraining");
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
		this.m.UnTrained = 0;
		local roster = this.World.getPlayerRoster().getAll();
        foreach( bro in roster )
        {
            if (bro.getCampAssignment() != this.m.ID)
            {
                continue;
            }

			if (this.isTrained(bro))
			{
				continue;
			}

			++this.m.UnTrained;
		}		
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
            local mod = this.m.BaseCraft + this.m.BaseCraft * bro.getBackground().getModifiers().Training;
			
			if (bro.getSkills().hasSkill("perk.legend_back_to_basics"))
            {
			mod = mod * 1.1;
			}

            ++ret.Assigned
			ret.Modifiers.push([mod, bro.getName(), bro.getBackground().getNameOnly()]);			
        }

        ret.Modifiers.sort(this.sortModifiers);
        for (local i = 0; i < ret.Modifiers.len(); i = ++i)
        {
            ret.Modifiers[i][0] = ret.Modifiers[i][0] * this.Math.pow(i + 1, -0.5);
			if (this.getUpgraded()) 
			{  
				ret.Modifiers[i][0] *= 1.15;
			}
            ret.Craft += ret.Modifiers[i][0];
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

	function isTrained( bro )
	{
		return bro.getSkills().hasSkill("effects.trained");
	}

	function getTrained( bro )
	{
		local effect = this.new("scripts/skills/effects_world/new_trained_effect");
		effect.m.Duration = 1;
		effect.m.XPGainMult = 1.2;
		effect.m.Icon = "skills/status_effect_75.png";
		bro.getSkills().add(effect);

		local mod = this.getModifiers();
		local adjectives = [
			 bro.getName() + " learned a new move",
			 bro.getName() + " finally nails the fancy parry they have been been practicing",
			 bro.getName() + " invents an overly showy move",
			 bro.getName() + " finds a stance that feels more natural",
			 bro.getName() + " learns how to adjust the new armor so it fits better",
			 bro.getName() + " has perfected a new skill in practice",
			 bro.getName() + " had their ego bruised and wants an outlet for frustration",
			 bro.getName() + " left the training dummy as nothing more than a pile of splinters",
			 bro.getName() + " has practiced a skill so much it has become second nature",
			 bro.getName() + " feels more comfortable with their weapon",
			 bro.getName() + " sets a new personal best in training"
		];
		local text = "After practicing ";
		local M = [
			"Short Guard ",
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
		];
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
			];
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
				];
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

		return true;
	}

	function getBonus( bro )
	{
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
					bro.getBaseProperties().Hitpoints += 1;
					icon = "ui/icons/health.png";
					text = "Hitpoint";					
					break;
				case 1:
					bro.getBaseProperties().Bravery += 1;
					icon = "ui/icons/bravery.png";
					text = "Resolve";					
					break;
				case 2:
					bro.getBaseProperties().Stamina += 1;
					icon = "ui/icons/fatigue.png";
					text = "Fatigue";
					break;
				case 3:
					bro.getBaseProperties().Initiative += 1;
					icon = "ui/icons/initiative.png";
					text = "Initiative";
					break;
				case 4:
					bro.getBaseProperties().MeleeSkill += 1;
					icon = "ui/icons/melee_skill.png";
					text = "Melee Skill";
					break;
				case 5:
					bro.getBaseProperties().RangedSkill += 1;
					icon = "ui/icons/ranged_skill.png";
					text = "Ranged Skill";
					break;
				case 6:
					bro.getBaseProperties().MeleeDefense += 1;
					icon = "ui/icons/melee_defense.png";
					text = "Melee Defense";					
					break;
				case 7:
					bro.getBaseProperties().RangedDefense += 1;
					icon = "ui/icons/ranged_defense.png";
					text = "Ranged Defense";
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

		if (this.getUpgraded())
		{
			return "Training ... " + this.m.NumBros + " brothers";
		}

		return "Training ... " + this.m.UnTrained + " / " + this.m.NumBros + " brothers";
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

			//Positive
			local training = false
			if (!this.isTrained(bro))
			{
				training = true;
				local r = this.Math.min(95, 100 * this.Math.pow(this.m.Camp.getCampTimeHours() / 12.0, 0.6 + (0.1 * bro.getLevel())));
				if (this.Math.rand(1, 100) < r)
				{
					this.getTrained(bro);
				}
			}

			//Negative
			local min = 5;
			if (this.getUpgraded())
			{
				training = true;
				min = 1;
				local mod = this.getModifiers();
				local camphrs = this.m.Camp.getCampTimeHours();
				while(camphrs > 0)
				{
					local r = this.Math.rand(1, 100);
					if (r <= camphrs + mod.Craft * camphrs)
					{
						this.getBonus(bro);
						camphrs = camphrs - r;
					}
					else
					{
						break;
					}
				}				
				//if (this.Math.rand(1, 100) <= (this.m.Camp.getCampTimeHours() + mod.Craft * this.m.Camp.getCampTimeHours()))
				//{
				//	this.getBonus(bro);
				//}
			}

			//Only get injury if we were actually training
			if (!training)
			{
				return 
			}

			local r = this.Math.min(min, 4 * this.Math.pow(this.m.Camp.getCampTimeHours() , 0.5) - bro.getLevel());
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