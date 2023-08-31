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
		this.m.Name = "Camp Kitchen";
		this.m.Description = "A kitchen tent with supplies for hunting, preparing and cooking food"
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
		desc += "Hunting parties can only be sent out while encamped. The more people assigned, the more food hunted. "
		desc += "Returns fresh meat and fruit which don't keep for long. Assigning hunting backgrounds increases the amount returned. "
		desc += "\n\n"
		desc += "Assigning mercenaries with cooking perks can provide cured meats, dried fruits and grains. "
		desc += "Assigning mercenaries with brewing perks can yield wine and beer. "
		desc += "\n\n"
		desc += "Upgrading this tent allows brewers to produce mead, while cooks produce porridge, pudding and pies. "
		desc += "Upgrading also provides a 10% increase in hunting speed and +50% to cooking and brewing efficiency. "
		desc += "Upgrading allows cooking backgrounds a small chance to help cook even without cooking perks. "
		desc += "Upgrading allows hunting backgrounds like wildfolk, ratcatchers, poachers and hunters to return furs and rarer animal parts. "
		desc += "\n\n"
		desc += "Advanced food can also be made using spices in the crafting tent"

	
		
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
				text = "Successful hunt will take approximately [color=" + this.Const.UI.Color.PositiveValue + "]" + this.Math.floor(100.0 / mod.Craft) + "[/color] hours."
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

		if (::Legends.Mod.ModSettings.getSetting("SkipCamp").getValue())
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

			local boolean = bro.getSkills().hasSkill("background.female_miller") || bro.getSkills().hasSkill("background.female_butcher") || bro.getSkills().hasSkill("background.butcher") || bro.getSkills().hasSkill("background.female_servant")  || bro.getSkills().hasSkill("background.cannibal");

			if (bro.getSkills().hasSkill("perk.legend_meal_preperation"))
			{
			   chefLevel += bro.getLevel()
			}
			else if (this.getUpgraded() && boolean)
			{
				chefLevel += this.Math.floor(bro.getLevel() * 0.5);
			}
			else if(!this.getUpgraded() && boolean){
				chefLevel += this.Math.floor(bro.getLevel() * 0.25);
			}


		}
		return chefLevel;

	}

	function getHuntLevel()
	{
		local roster = this.World.getPlayerRoster().getAll();
		local huntLevel = 0;
		foreach( bro in roster )
		{
			if (bro.getCampAssignment() != this.m.ID)
			{
				continue
			}
			local boolean = bro.getSkills().hasSkill("background.hunter") || bro.getSkills().hasSkill("background.poacher") || bro.getSkills().hasSkill("background.wildman") || bro.getSkills().hasSkill("background.wildwoman")  || bro.getSkills().hasSkill("background.ratcatcher");
			if(this.getUpgraded() && boolean){
				huntLevel += this.Math.ceil(bro.getLevel() * 1.5);
			}
			else
			{
			   huntLevel += this.Math.ceil(bro.getLevel() * 0.5);
			}

			::logInfo("Hunting level: " + huntLevel);

		}
		return huntLevel;
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

			local boolean = bro.getSkills().hasSkill("background.female_miller") || bro.getSkills().hasSkill("background.female_butcher") || bro.getSkills().hasSkill("background.butcher") || bro.getSkills().hasSkill("background.female_servant")  || bro.getSkills().hasSkill("background.cannibal");
			if (bro.getSkills().hasSkill("perk.legend_alcohol_brewing"))
			{
			   brewerLevel += bro.getLevel()
			}
			else if (this.getUpgraded() && boolean)
			{
			   brewerLevel += this.Math.floor(bro.getLevel() * 0.25);
			}
			else if (!this.getUpgraded() && boolean){
				brewerLevel += this.Math.floor(bro.getLevel() * 0.1);
			}


		}
		return brewerLevel;
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

		local text =  "Hunted ... " + this.m.FoodAmount + " food and gained " + this.m.Items.len() + " items";
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
		local emptySlots = this.Stash.getNumberOfEmptySlots();
		if (emptySlots == 0) return this.getUpdateText();
		local item = null;


		local terrainType = this.World.State.getPlayer().getTile().Type;

		local Biome = this.Const.Hunting_Categories.BiomeType[terrainType];


		if(this.getUpgraded()){
			this.Const.Hunting_Categories.addBiome(Biome, true);
		}else {
			this.Const.Hunting_Categories.addBiome(Biome, false)
		}

		local noLevel = this.Const.Hunting_Categories.Containers.noLevels;
		local tentLevel = this.Const.Hunting_Categories.Containers.chef;

		item = tentLevel.rand();
		this.m.Items.push(item);
		this.Stash.add(item);
		if(--emptySlots == 0) return this.getUpdateText();

		// local brewerlevels = this.getBrewerLevel();
		// local dropLoot = -300.0 / (brewerlevels + 20) + 15 > this.Math.rand(1, 100);
		// if (dropLoot) // At level 10 there is a 5% chance per hour, increases asymptotically to 15% per hour
		// {
		// 	local brewerLoot = this.new("scripts/mods/script_container");
		// 	brewerLoot.extend([
		// 		"scripts/items/supplies/beer_item",
		// 		"scripts/items/supplies/wine_item"
		// 	]);


		// 	if (this.getUpgraded())
		// 	{
		// 		brewerLoot.extend([
		// 			[3, "scripts/items/supplies/mead_item"],
		// 			[1, "scripts/items/supplies/preserved_mead_item"]
		// 		]);
		// 	}

		// 	item = this.new(brewerLoot.roll());
		// 	this.m.Items.push(item);
		// 	this.Stash.add(item);
		// 	if(--emptySlots == 0) return this.getUpdateText();
		// }

		// local cheflevels = this.getChefLevel();
		// dropLoot = -300.0 / (cheflevels + 20) + 15 > this.Math.rand(1, 100); // At level 10 there is a 5% chance per hour, increases asymptotically to 15% per hour
		// if (dropLoot)
		// {


		// 	item = this.new(chefLoot.roll());
		// 	this.m.Items.push(item);
		// 	this.Stash.add(item);
		// 	if(--emptySlots == 0) return this.getUpdateText();
		// }

		// local huntlevels = this.getHuntLevel();


		// dropLoot = -300.0 / (huntlevels + 20) + 15 > this.Math.rand(1, 100); // At level 10 there is a 5% chance per hour, increases asymptotically to 15% per hour

		// if (dropLoot)
		// {
		// 	::logInfo("Entered the dungeon!!!!!");
		// 	local huntLoot = this.new("scripts/mods/script_container")
		// 	huntLoot.extend([
		// 		"scripts/items/supplies/legend_fresh_meat_item",
		// 		"scripts/items/supplies/legend_fresh_fruit_item",
		// 		"scripts/items/supplies/strange_meat_item",
		// 	]);

		// 	if (this.getUpgraded())
		// 	{
		// 		huntLoot.extend([
		// 			[1, "scripts/misc/adrenaline_gland_item"],
		// 			[2, "scripts/items/misc/poison_gland_item"],
		// 			[3, "scripts/items/trade/legend_small_furs_item"]
		// 		]);
		// 	}

		// 	item = this.new(huntLoot.roll());
		// 	this.m.Items.push(item);
		// 	this.Stash.add(item);
		// 	if(--emptySlots == 0) return this.getUpdateText();
		// }
		



		// if (item.getValue() != null && this.m.Points < item.getValue())
		// {
		// 	return this.getUpdateText();
		// }

		// this.m.Points -= item.getValue();
		// item.randomizeAmount();
		// this.m.FoodAmount += item.getAmount();
		// item.randomizeBestBefore();
		// this.m.Items.push(item);
		// this.Stash.add(item);
		
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
