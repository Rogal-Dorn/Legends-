this.hunter_building <- this.inherit("scripts/entity/world/camp/camp_building", {
	m = {
		Items = [],
		NumBros = 0,
		Points = 0,
		FoodAmount = 0,
		Craft = 0,
		Value = 0,
		rollCount = 0,
		Mode = 0,
		VerboseResults = {},
		HuntLevel = 0,
		CookLevel = 0,
		BrewLevel = 0,
		CurrentTarget = null,
		PreviousTarget = null,
		TargetStartTime = 0,
		AssignedBackgrounds = [],
	},
	function create()
	{
		this.camp_building.create();
		this.m.ID = this.Const.World.CampBuildings.Hunter;
		this.m.ModName = "Hunting";
		this.m.HasPopup = true;
		this.m.ModMod = 10.0;
		this.m.BaseCraft = 1.5;
		this.m.Slot = "hunt";
		this.m.Name = "Camp Kitchen";
		this.m.Description = "A kitchen tent with supplies for hunting, preparing and cooking food"
		this.m.BannerImage = "ui/buttons/banner_hunt.png"
		this.m.CanEnter = false
		this.m.Sounds = [
			{
				File = "ambience/camp/camp_hunter_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_hunter_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			}
		];
		this.m.SoundsAtNight = [
		{
				File = "ambience/camp/camp_hunter_01.wav",
				Volume = 1.0,
				Pitch = 1.0
			},
			{
				File = "ambience/camp/camp_hunter_02.wav",
				Volume = 1.0,
				Pitch = 1.0
			}
		];
	}

	function getMode()
	{
		return this.m.Mode;
	}

	function setMode( _m )
	{
		if (typeof _m == "string") this.m.Mode = this.Const.HuntingLoot.HunterCampMode[_m];
		else if (typeof _m = "integer") this.m.Mode = _m;
	}

	function queryConfigureSettings()
	{
		local ret = {};
		ret.Buttons <- array(this.Const.HuntingLoot.HunterCampMode.len(), "");
		ret.CurrentMode <- this.m.Mode;

		foreach (mode, index in this.Const.HuntingLoot.HunterCampMode) {
			ret.Buttons[index] = mode;
		}

		// foreach(i, name in ret.Buttons) {
		// 	::logInfo("mode for query: " + name + "   index: " + i);
		// }

		return ret;
	}

	function onPopupButtonClicked( _data )
	{
		if (_data.len() != 2) return;

		local self = this;
		local mode = _data[0];
		local func = _data[1];

		self[func](mode);
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
		desc += "Hunting parties can only be sent out while encamped. The more people assigned, the more food foraged or hunted. "
		desc += "Returns different food items depending on the current biome. Some items require the knowledge of specific backgrounds to be obtainable."
		desc += "\n\n"
		desc += "Assigning mercenaries with Expert Hunter backgrounds increases the Hunt Tier (based on each character's level), which allows the hunting party to hunt rarer or more dangerous prey.\n"
		desc += "Assigning mercenaries with the Meal Preparation perk gives a chance to yield improved versions of the obtained food items.\n"
		desc += "Assigning mercenaries with the Alcohol Brewing perk can yield wine and beer. "
		desc += "\n\n"
		desc += "Upgrading this tent grants the following effects:\n"
		desc += "- Increases foraging / hunting speed by 15%\n"
		desc += "- Increases the chance to obtain bonus loot, improved food items, and brewed items\n"
		desc += "- Assigning Expert Hunter backgrounds increases the Hunt Tier at a much greater rate\n"
		desc += "- Expert Hunters have a chance to obtain bonus loot from hunting, such as trophies or crafting ingredients\n"
		desc += "- Assigning cooking backgrounds slightly increases the chance to yield improved version of obtained food items even without the Meal Preparation perk\n"
		desc += "- Assigning cooking backgrounds slightly increases the chance to yield brewed items even without the Alcohol Brewing perk\n"
		desc += "- Brewers can also produce mead\n"
		desc += "- Advanced food can also be made using spices in the crafting tent"
		desc += "\n\n"
		desc += "Expert Hunter backgrounds: " + ::Const.LegendMod.Language.arrayToText(::Const.HuntingLoot.ExpertHunterBackgrounds.map(function(bg){return ::Const.HuntingLoot.RequiredBackgrounds[bg]}),"and",false) + "\n\n";
		desc += "Cooking backgrounds: Miller / Baker, Butcher / Fishmonger, Servant, Cannibal"
		
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
				text = "Successful hunt will take approximately [color=" + this.Const.UI.Color.PositiveValue + "]" + this.Math.floor(100.0 / mod.Craft) + "[/color] hours." //TODO: update this
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
		this.m.VerboseResults = {
			Food = {
				Items = {}
			}
			Cook = {
				Assigned = [],
				Items = {}
			},
			Hunt = {
				Assigned = [],
				Items = {}
			},
			Brew = {
				Assigned = [],
				Items = {}
			}
		};
		// We have 3 categories of "sub-skills" : Chef, Hunt, Brewer
		// For each category,
		// depending on the combined levels of all assigned characters,
		// different rewards are possible.
		// Parameter is true here because we want to update m.VerboseResults
		// with the names of all characters involved in each category
		this.m.HuntLevel = this.getHuntLevel(true);
		this.m.CookLevel = this.getCookLevel(true);
		this.m.BrewLevel = this.getBrewLevel(true);

		// Parameter is true so we only get assigned backgrounds that affect foraging/hunting requirements
		this.m.AssignedBackgrounds = this.getAssignedBackgrounds(true);
		this.m.CurrentTarget = null;
		this.m.PreviousTarget = null;
		this.m.TargetStartTime = 0;

		::logInfo("Cook Level: " + this.m.CookLevel);
		::logInfo("Brew Level: " + this.m.BrewLevel);
		::logInfo("Hunt Level: " + this.m.HuntLevel);
	}

	function getAssignedBackgrounds( _relevantOnly = false )
	{
		local ret = [];
		local roster = this.World.getPlayerRoster().getAll();
		foreach (c in roster)
		{
			if (c.getCampAssignment() != this.m.ID)
			{
				continue;
			}

			local bg = c.getBackground().getID();
			if ( _relevantOnly )
			{
				if ( ret.find(bg) == null && ::Const.HuntingLoot.AllRequiredBackgrounds.All.find(bg) != null )
				{
					ret.push(bg);
				}
			}
			else
			{
				if ( ret.find(bg) == null )
				{
					ret.push(bg);	
				}	
			}
		}
		return ret;
	}

	function getExpertHunters()
	{
		local ret = {}
		local roster = ::World.getPlayerRoster().getAll();
		foreach (c in roster)
		{
			if (c.getCampAssignment() != this.m.ID)
			{
				continue;
			}
			if (bro.getBackground().isBackgroundType(this.Const.BackgroundType.ExpertHunter) || c.getBackground().getID() in ::Const.HuntingLoot.ExpertHunterBackgrounds)
			{
				ret[c.getNameOnly()] = c.getBackground().getNameOnly();
			}
		}
		return ret;
	}

	// Levels of "Hunting" backgrounds; determines rewards from Hunt category
	// Hunting backgrounds are required to contribute levels, and their effectiveness is reduced without the hunting tent upgrade
	// Tier 1: Level 1-7
	// Tier 2: Level 8-14
	// Tier 3: Level 15+
	function getHuntLevel( _updateVerboseResults = false )
	{
		local roster = this.World.getPlayerRoster().getAll();
		local huntLevel = 0;
		foreach( bro in roster )
		{
			if (bro.getCampAssignment() != this.m.ID)
			{
				continue
			}

			if (bro.getBackground().isBackgroundType(this.Const.BackgroundType.ExpertHunter) || bro.getBackground().getID() in ::Const.HuntingLoot.ExpertHunterBackgrounds)
			{
				if (_updateVerboseResults) this.m.VerboseResults.Hunt.Assigned.push(bro.getNameOnly());

				if(this.getUpgraded())
				{
					huntLevel += this.Math.ceil(bro.getLevel());
				}
				else
				{
				   huntLevel += this.Math.ceil(bro.getLevel() * 0.1); // hunting rewards are limited without the tent upgrade
				}
			}
		}
		return huntLevel;
	}

	// Levels of "Chef" backgrounds and characters with the Meal Preparation perk; determines rewards from Cook category
	// When Upgraded, "Chef" backgrounds contribute a very small, soft-capped amount (effectively requiring them to be at least Level 10)
	// The Meal Preparation perk is the main way to increase this level
	function getCookLevel( _updateVerboseResults = false )
	{
		local roster = this.World.getPlayerRoster().getAll();
		local cookLevel = 0;
		foreach( bro in roster )
		{
			if (bro.getCampAssignment() != this.m.ID)
			{
				continue
			}

			local added = false;
			if (this.getUpgraded())
			{
				if (bro.getBackground().getID()=="background.miller" || bro.getBackground().getID()=="background.butcher" || bro.getBackground().getID()=="background.servant" || bro.getBackground().getID()=="background.cannibal")
				{
					cookLevel += ::Math.floor(bro.getLevel() * 0.1);
					if (_updateVerboseResults) 
					{
						this.m.VerboseResults.Cook.Assigned.push(bro.getNameOnly());
						added = true;
					}
				}
			}

			if (bro.getSkills().hasSkill("perk.legend_meal_preperation"))
			{
				cookLevel += bro.getLevel();
				if (_updateVerboseResults && !added)
				{
					this.m.VerboseResults.Cook.Assigned.push(bro.getNameOnly());
					added = true;
				}
			}
		}
		return cookLevel;
	}

	// Levels of "Brewer" backgrounds and characters with the Alcohol Brewing Perk; determines rewards from Brewing category
	// When Upgraded, "Chef" backgrounds contribute a very small, soft-capped amount (effectively requiring them to be at least Level 10)
	// The Alocohol Brewing perk is the main way to increase this level
	function getBrewLevel( _updateVerboseResults = false )
	{
		local roster = this.World.getPlayerRoster().getAll();
		local brewerLevel = 0;
		foreach( bro in roster )
		{
			if (bro.getCampAssignment() != this.m.ID)
			{
				continue
			}

			local added = false;
			if (this.getUpgraded())
			{
				if (bro.getBackground().getID()=="background.miller" || bro.getBackground().getID()=="background.butcher" || bro.getBackground().getID()=="background.servant" || bro.getBackground().getID()=="background.cannibal")
				{
					brewerLevel += ::Math.floor(bro.getLevel() * 0.1);
					if (_updateVerboseResults) 
					{
						this.m.VerboseResults.Brew.Assigned.push(bro.getNameOnly());
						added = true;
					}
				}
			}

			if (bro.getSkills().hasSkill("perk.legend_alcohol_brewing"))
			{
				brewerLevel += bro.getLevel();
				if (_updateVerboseResults && !added)
				{
					this.m.VerboseResults.Brew.Assigned.push(bro.getNameOnly());
					added = true;
				}
			}

		}
		return brewerLevel;
	}

	function getResults()
	{
		if (this.m.Items.len()<1)
		{
			return [];
		}

		local res = [];
		local categories = ["Food","Hunt","Cook","Brew"]

		// res.push({
		// 	id = 82,
		// 	text = "Camp Kitchen Report",
		// 	divider = "top",
		// 	bold = true,
		// });

		// Food
		res.push({
			id = 81,
			text = "Your hunting party brought back " + this.m.FoodAmount + " Food with the following:"
		});

		foreach (item in this.m.VerboseResults["Food"].Items)
		{
			res.push({
				id = 80,
				icon = item.Icon,
				text = item.Name + " x" + item.Count
			});
		}

		if (this.m.VerboseResults["Hunt"].Items.len() > 0)
		{
			res.push({
				id = 79,
				text = ::Const.LegendMod.Language.arrayToText(this.m.VerboseResults["Hunt"].Assigned, "and", "#6f91c9") + " had an exceptional hunt and brought back the following:"
			});

			foreach (item in this.m.VerboseResults["Hunt"].Items)
			{
				res.push({
					id = 78,
					icon = item.Icon,
					text = item.Name + " x" + item.Count
				});
			}
		}

		if (this.m.VerboseResults["Cook"].Items.len() > 0)
		{
			res.push({
				id = 77,
				text = ::Const.LegendMod.Language.arrayToText(this.m.VerboseResults["Cook"].Assigned, "and", "#6f91c9") + " prepared the following in the camp kitchen:"
			});

			foreach (item in this.m.VerboseResults["Cook"].Items)
			{
				res.push({
					id = 76,
					icon = item.Icon,
					text = item.Name + " x" + item.Count
				});
			}
		}

		if (this.m.VerboseResults["Brew"].Items.len() > 0)
		{
			res.push({
				id = 75,
				text = ::Const.LegendMod.Language.arrayToText(this.m.VerboseResults["Brew"].Assigned, "and", "#6f91c9") + " brewed the following:"
			});

			foreach (item in this.m.VerboseResults["Brew"].Items)
			{
				res.push({
					id = 74,
					icon = item.Icon,
					text = item.Name + " x" + item.Count
				});
			}
		}

		res.push({
			id = 73,
			divider = "bottom"
		});

		return res;
	}

	function getAssignedBros()
	{
		local mod = this.getModifiers();
		return mod.Assigned;
	}

	function getInfo()
	{
		local ret = [];
		local mod = this.getModifiers();
		local bgs = this.getAssignedBackgrounds(true);
		local huntLevel = this.getHuntLevel(false);

		ret.push("Hunting points per hour: " + mod.Craft);
		ret.push("Hunt Tier: " + ::Const.HuntingLoot.getHuntLevelTier(huntLevel));
		// TODO: show Expert Hunters, Cooks, and Brewers
		ret.push("Current biome: " + ::Const.World.TerrainLocation[::World.State.getPlayer().getTile().Type]);

		local targets = ::Const.HuntingLoot.getBiomeTargetDefs(::World.State.getPlayer().getTile().Type);

		local forageable = [];
		local huntable = [];

		foreach (target in targets)
		{
			local text = "- " + target.Name + " (around " + ::Math.floor(this.estimateHuntTime(target.Difficulty, mod.Craft)) + " hours)";
			if (target.Type == "Forage")
			{
				local failed = false;
				local requirements = [];

				// Forageable targets do not have a Hunt Tier requirement

				// Show required backgrounds if none of the currently assigned characters qualify
				if ("Backgrounds" in target && !::Const.HuntingLoot.hasQualifiedBackground(target.Backgrounds,bgs))
				{
					failed = true;
					local bgNames = [];
					foreach(b in target.Backgrounds)
					{
						bgNames.push(::Const.HuntingLoot.RequiredBackgrounds[b]);
					}
					requirements.push("<span style=\"color:" + ::Const.UI.Color.NegativeValue + "; padding-left: 1rem;\">- Requires " + ::Const.LegendMod.Language.arrayToText(bgNames,"or",false) + "</span>");
				}

				if (failed)
				{
					text = "<s>" + text + "</s>";
					forageable.push(text);
					forageable.extend(requirements);
					continue;
				}

				forageable.push(text);
			}
			else if (target.Type == "Hunt")
			{
				local failed = false;
				local requirements = [];
				
				// Show required Hunt Tier if the currently assigned characters are insufficient
				if (!::Const.HuntingLoot.hasSufficientHuntLevelForTier(target,huntLevel))
				{
					failed = true;
					requirements.push("<span style=\"color:" + ::Const.UI.Color.NegativeValue + "; padding-left: 1rem;\">- Requires Hunt Tier " + target.Tier + "</span>");
				}
				
				// Show required backgrounds if none of the currently assigned characters qualify
				if ("Backgrounds" in target && !::Const.HuntingLoot.hasQualifiedBackground(target.Backgrounds,bgs))
				{
					failed = true;
					local bgNames = [];
					foreach(b in target.Backgrounds)
					{
						bgNames.push(::Const.HuntingLoot.RequiredBackgrounds[b]);
					}
					requirements.push("<span style=\"color:" + ::Const.UI.Color.NegativeValue + "; padding-left: 1rem;\">- Requires " + ::Const.LegendMod.Language.arrayToText(bgNames,"or",false) + "</span>");
				}

				// Strikethrough the target if the hunting party does not qualify
				if (failed)
				{
					text = "<s>" + text + "</s>";
					huntable.push(text);
					huntable.extend(requirements);
					continue;
				}

				huntable.push(text);
			}
		}

		ret.push("<u>Forageable</u>");
		ret.extend(forageable);
		ret.push("<u>Huntable</u>");
		ret.extend(huntable);
		ret.push("<span style=\"border-bottom: 1px solid\"></span>");

		return ret;
	}

	function getUpdateText()
	{
		if (this.m.NumBros == 0)
		{
			return null;
		}

		local text =  ["Obtained ... " + this.m.FoodAmount + " food and gained " + this.m.Items.len() + " items"];
		if (this.Stash.getNumberOfEmptySlots() == 0)
		{
			return [text[0] + " (Inventory is full!)"];
		}

		local hours = ::Math.ceil((::Time.getVirtualTimeF() - this.m.TargetStartTime) / (this.World.getTime().SecondsPerDay / 24)) + 1;
		local plural = hours > 1 ? "s" : "";

		if (this.m.CurrentTarget)
		{
			if (this.m.CurrentTarget.Type == "Forage")
			{
				text.push("Foraging " + this.m.CurrentTarget.Text + " ... " + hours + " hour" + plural);
			}
			else
			{
				text.push("Hunting " + this.m.CurrentTarget.Text + " ... " + hours + " hour" + plural);
			}
		}
		else if (this.m.PreviousTarget)
		{
			if (this.m.PreviousTarget.Type == "Forage")
			{
				text.push("Foraged " + this.m.PreviousTarget.Text + "! ... " + hours + " hour" + plural);
			}
			else
			{
				text.push("Hunted " + this.m.PreviousTarget.Text + "! ... " + hours + " hour" + plural);
			}
		}
		return text;
	}

	function update()
	{
		if (this.m.NumBros == 0)
		{
			return this.getUpdateText();
		}

		// To get a sense of scale for these values, see https://docs.google.com/spreadsheets/d/1PaYY4woUIxKwOCHK_O6whWq60KYmDoAZaQqJp7AIeao/edit?usp=sharing
		this.m.Points += this.m.Craft;

		// Make sure we have Stash space to proceed
		local emptySlots = ::Stash.getNumberOfEmptySlots();
		if (emptySlots == 0) return this.getUpdateText();
		
		local item = null;

		// Get the current Biome we are camping on (to determine hunting results)
		local biome = ::World.State.getPlayer().getTile().Type;

		// Prepare the generator that will roll for each category of loot
		local lootGenerator = ::Const.HuntingLoot.getGenerator(biome, this.getUpgraded(), this.m.HuntLevel, this.m.CookLevel, this.m.BrewLevel, this.m.AssignedBackgrounds);
		
		// Generate Brewer loot
		item = lootGenerator.rollBrew();
		if(item)
		{
			item.randomizeAmount();
			if(::isKindOf(item,"legend_usable_food") || ::isKindOf(item,"food_item")) this.m.FoodAmount += item.getAmount();
			this.m.Items.push(item);
			::Stash.add(item);
			this.addItemToVerboseResults("Brew", item);
			if(--emptySlots==0) return this.getUpdateText();
		}

		// Generate target to be hunted or foraged
		// If we are already in the processing of hunting a particular target, attempt to successfully hunt / forage it
		local target = null;
		if(this.m.CurrentTarget)
		{
			target = this.m.CurrentTarget;
		}
		else
		{
			target = lootGenerator.rollTarget();
			this.m.TargetStartTime = ::Time.getVirtualTimeF();
		}

		// Attempt the hunt / forage
		if (this.rollSuccessfulHunt(target.Difficulty, this.m.Points))
		{
			// Successful hunt / forage; add the items
			local food = target.Food;
			food.randomizeAmount();
			food.randomizeBestBefore();
			this.m.FoodAmount += food.getAmount();
			this.m.Items.push(food);
			::Stash.add(food);
			this.addItemToVerboseResults("Food", food);
			this.m.CurrentTarget = null;
			this.m.Points = 0; // reset points for the next hunt
			if(--emptySlots==0) return this.getUpdateText();

			// Add the cooked food item if applicable
			if (target.Cook)
			{
				local cook = target.Cook;
				cook.randomizeAmount();
				this.m.FoodAmount += cook.getAmount();
				this.m.Items.push(cook);
				::Stash.add(cook);
				this.addItemToVerboseResults("Cook",cook);
				if(--emptySlots==0) return this.getUpdateText();
			}

			// Add the bonus loot item if applicable
			if(target.Loot)
			{
				local loot = target.Loot;
				this.m.Items.push(loot);
				::Stash.add(loot);
				this.addItemToVerboseResults("Hunt", loot);
				if(--emptySlots==0) return this.getUpdateText();
			}

			this.m.PreviousTarget = target;

			return this.getUpdateText();
		}
		else
		{
			// Unsuccessful hunt / forage; try again in the next tick
			this.m.CurrentTarget = target;
			return this.getUpdateText();
		}

		return this.getUpdateText();
	}

	function rollSuccessfulHunt( _difficulty, _points )
	{
		// The closer _points is to _difficulty, the higher the chance of success
		// The mathematically and empirically derived expected number of turns is 0.928 * sqrt(2 * difficulty / points)
		return ::Math.rand(1,100) < ::Math.ceil( 100.0 * _points / _difficulty );
	}

	function estimateHuntTime( _difficulty, _points )
	{
		return 0.928 * ::Math.pow(2 * _difficulty / _points, 0.5);
	}

	function addItemToVerboseResults( _category, _item )
	{
		local id = _item.getID();
		local itemName = _item.getName();
		local icon = false;
		if(_item.getIcon() != "")
		{
			icon = "ui/items/" + _item.getIcon();
		}

		if(!(id in this.m.VerboseResults[_category].Items))
		{
			this.m.VerboseResults[_category].Items[id] <- {
				Name = itemName,
				Count = 1,
				Icon = icon
			}
		}
		else
		{
			this.m.VerboseResults[_category].Items[id].Count++;
		}
	}

	// function generateAssignedNames( _namesArr )
	// {
	// 	local ret = "";
	// 	if (_namesArr.len() == 0) return ret;

	// 	// ret += ::Const.UI.getColorized(_namesArr[0],"#5d8ede");
	// 	ret += ::Const.UI.getColorized(_namesArr[0],"#6f91c9");

	// 	if (_namesArr.len() == 1) return ret;

	// 	for (local i = 1; i < _namesArr.len(); i++ )
	// 	{
	// 		local separator = (i == (_namesArr.len() - 1)) ? " and " : ", ";
	// 		ret += separator + ::Const.UI.getColorized(_namesArr[i],"#6f91c9");
	// 	}

	// 	return ret;
	// }

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
