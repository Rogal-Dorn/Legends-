this.hunter_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
		Items = [],
		NumBros = 0,
		Points = 0,
		FoodAmount = 0,
		Craft = 0,
		Value = 0
	},
    function create()
    {
        this.camp_building.create();
        this.m.ID = this.Const.World.CampBuildings.Hunter;
        this.m.ModName = "Hunting";
        this.m.ModMod = 10.0;
        this.m.BaseCraft = 1.5;
        this.m.Slot = "hunt";
        this.m.Name = "Hunting";
        this.m.Description = "Send out a hunting party for food provisions"
		this.m.BannerImage = "ui/buttons/banner_hunt.png"
		this.m.CanEnter = false
		this.m.Sounds = [
			{
				File = "ambience/camp/hunter_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/hunter_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			}
		];
		this.m.SoundsAtNight = [
		{
				File = "ambience/camp/hunter_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/hunter_02.wav",
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
		desc += "Armies march on their stomachs...And apparently so do mercenary companies! "
		desc += "Keep the company's bellies full by sending your highly skilled killing machines to hunt the land for food. "
		desc += "Hunting parties can only be sent out while encamped. The more people assigned, the more food that can be hunted."
		desc += "\n\n"
		desc += "The Hunting tent can be upgraded by purchasing a crafting cart from a settlement merchant. An upgraded tent has a 10% increase in hunting efficiency. "
		desc += "Additionally, there's a chance that some of the spoils of the hunt, other than food, can also be salvaged and brought back to camp."
		return desc;
	}

	function getModifierToolip()
    {
		local mod = this.getModifiers();
		local ret = [
			{
				id = 5,
				type = "text",
				icon = "ui/buttons/asset_food_up.png",
				text = "Successful hunt will take approxiamtely [color=" + this.Const.UI.Color.PositiveValue + "]" + this.Math.floor(100.0 / mod.Craft) + "[/color] hours."
			}
		];
		local id = 6;
		foreach (bro in mod.Modifiers)
		{
			ret.push({
				id = id,
				type = "hint",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + (bro[0] / 100.0) * 100.0 + "%[/color] " + bro[1] + " (" + bro[2] + ")"
			})
			++id;
		}
		return ret;
	}

	function isHidden()
	{

		if (this.LegendsMod.Configs().LegendCampUnlockEnabled())
		{
			return false;
		}

		return !this.World.Flags.get("HasLegendCampHunting")
	}

	function getUpgraded()
	{
        return this.Stash.hasItem("tent.hunter_tent");
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
		this.m.Items = [];
		this.m.Points = 0;
		this.m.FoodAmount = 0;
		local mod = this.getModifiers();
        this.m.NumBros = mod.Assigned;
		this.m.Craft = mod.Craft;
    }

	function getChefLevel()
	{
		local roster = this.World.getPlayerRoster().getAll();
		local chefLevel = 0;
        foreach( bro in roster )
        {
            if (bro.getCampAssignment() != this.m.ID)
            {
                continue
            }


			if (bro.getSkills().hasSkill("perk.legend_meal_preperation"))
			{
               chefLevel += bro.getLevel()
            }

			return chefLevel;

        }

	}

	function getBrewerLevel()
	{
		local roster = this.World.getPlayerRoster().getAll();
		local brewerLevel = 0;
        foreach( bro in roster )
        {
            if (bro.getCampAssignment() != this.m.ID)
            {
                continue
            }

			if (bro.getSkills().hasSkill("perk.legend_alcohol_brewer"))
			{
               brewerLevel += bro.getLevel()
            }

			return brewerLevel;

        }

	}

	function getResults()
    {
		local res = []
		local id = 80;
		foreach (b in this.m.Items)
		{
			res.push({
		 		id = id,
		 		icon = "ui/items/" + b.getIcon(),
		 		text = "You gained " + b.getName()
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

	function getUpdateText()
	{
		if (this.m.NumBros == 0)
		{
			return null;
		}

		local text =  "Hunted ... " + this.m.FoodAmount + " food";
		if (this.Stash.getNumberOfEmptySlots() == 0)
		{
			return text + " (Inventory is full!)";
		}
		return text;
	}

	function update()
	{
		if (this.m.NumBros == 0)
		{
			return this.getUpdateText();
		}

		this.m.Points += this.m.Craft;
		if (this.Stash.getNumberOfEmptySlots() == 0)
		{
			return this.getUpdateText();
		}

		local r = this.Math.rand(1, 4);
		local item = null;
		local secondary = [];
		if (r == 1 || r == 2)
		{
			item = this.new("scripts/items/supplies/legend_fresh_meat_item");
			secondary = [
				"scripts/items/misc/adrenaline_gland_item",
				"scripts/items/misc/poison_gland_item",
				"scripts/items/misc/spider_silk_item",
				"scripts/items/misc/werewolf_pelt_item",
				"scripts/items/accessory/spider_poison_item",
				"scripts/items/supplies/strange_meat_item"

			];
		}
		else if (r == 3)
		{
			item = this.new("scripts/items/supplies/roots_and_berries_item");
			secondary = [
				"scripts/items/supplies/cured_venison_item"

			];
		}
		else if (r == 4)
		{
			item = this.new("scripts/items/supplies/legend_fresh_fruit_item");
				secondary = [
				"scripts/items/supplies/dried_fruits_item"

			];
		}

		local cheflevels = this.getChefLevel();
		local brewerlevels = this.getBrewerLevel();
		if (cheflevels >= 1 && cheflevels <= 15)
		{
			secondary.extend([
				"scripts/items/supplies/dried_fruits_item",
				"scripts/items/supplies/cured_venison_item",
				"scripts/items/supplies/legend_porridge_item",
				"scripts/items/supplies/legend_pudding_item",
				"scripts/items/supplies/ground_grains_item",
				"scripts/items/supplies/legend_pie_item",
				"scripts/items/supplies/dried_fish_item"
			]);
		}

		if (cheflevels > 15)
		{
			secondary.extend([
				"scripts/items/supplies/smoked_ham_item",
				"scripts/items/supplies/bread_item",
				"scripts/items/supplies/goat_cheese_item"
			]);
		}

		if ( brewerlevels >= 1 && brewerlevels <= 15 )
		{
			secondary.extend([
				"scripts/items/supplies/beer_item",
				"scripts/items/supplies/wine_item"
			]);
		}


		if ( brewerlevels > 15)
		{
			secondary.extend([
				"scripts/items/supplies/beer_item",
				"scripts/items/supplies/wine_item",
				"scripts/items/supplies/mead_item",
				"scripts/items/supplies/mead_item",
				"scripts/items/supplies/preserved_mead_item"
			]);
		}
		if (item.getValue() != null)
		{
			if (this.m.Points < item.getValue())
			{
				return this.getUpdateText();
			}
			this.m.Points -= item.getValue();
		}


		item.randomizeAmount();
		this.m.FoodAmount += item.getAmount();
		item.randomizeBestBefore();
		this.m.Items.push(item);
		this.Stash.add(item);

		if (secondary.len() == 0 || !this.getUpgraded())
		{
			return this.getUpdateText();
		}
		local secondarychance = this.Math.min(8, 100 - (cheflevels + brewerlevels));

		if (this.Math.rand(1, secondarychance) <= this.m.Camp.getCampTimeHours())
		{
			item = this.new(secondary[this.Math.rand(0, secondary.len()-1)]);
			this.m.Items.push(item);
			this.Stash.add(item);
		}

		//Roll twice
		if (this.Math.rand(1, secondarychance) <= this.m.Camp.getCampTimeHours())
		{
			item = this.new(secondary[this.Math.rand(0, secondary.len()-1)]);
			this.m.Items.push(item);
			this.Stash.add(item);
		}

		return this.getUpdateText();
	}

	function onClicked( _campScreen )
	{
        _campScreen.showHunterDialog();
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