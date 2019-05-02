this.character_background <- this.inherit("scripts/skills/skill", {
	m = {
		HiringCost = 0,
		DailyCost = 0,
		DailyCostMult = 1.0,
		Excluded = [],
		ExcludedTalents = [],
		Faces = null,
		Hairs = null,
		HairColors = null,
		Beards = null,
		Body = null,
		Level = 1,
		BeardChance = 60,
		Titles = [],
		RawDescription = "",
		BackgroundDescription = "",
		GoodEnding = null,
		BadEnding = null,
		IsScenarioOnly = false,
		IsNew = true,
		IsUntalented = false,
		IsOffendedByViolence = false,
		IsCombatBackground = false,
		Name = "",
		IsNoble = false,
		IsLowborn = false,
		IsFemaleBackground = false,
		Modifiers = {
			Ammo = this.Const.LegendMod.ResourceModifiers.Ammo[0],
			ArmorParts = this.Const.LegendMod.ResourceModifiers.ArmorParts[0],
			Meds = this.Const.LegendMod.ResourceModifiers.Meds[0],
			Stash = this.Const.LegendMod.ResourceModifiers.Stash[0],
			Healing = this.Const.LegendMod.ResourceModifiers.Healing[0],
			Injury = this.Const.LegendMod.ResourceModifiers.Injury[0],
			Repair = this.Const.LegendMod.ResourceModifiers.Repair[0],
			Salvage = this.Const.LegendMod.ResourceModifiers.Salvage[0],
			Crafting = this.Const.LegendMod.ResourceModifiers.Crafting[0],
			Barter = this.Const.LegendMod.ResourceModifiers.Barter[0],
			ToolConsumption = this.Const.LegendMod.ResourceModifiers.ToolConsumption[0],
			MedConsumption = this.Const.LegendMod.ResourceModifiers.MedConsumption[0],
			Hunting = this.Const.LegendMod.ResourceModifiers.Hunting[0],
			Fletching = this.Const.LegendMod.ResourceModifiers.Fletching[0],
			Scout = this.Const.LegendMod.ResourceModifiers.Scout[0],
			Gathering = this.Const.LegendMod.ResourceModifiers.Gather[0],
			Training = this.Const.LegendMod.ResourceModifiers.Training[0],
			Enchanting = 0.0
			Terrain = [
				0.0, // ?
				0.0, //ocean
				0.0,//plains
				0.0, //swamp
				0.0, //hills
				0.0, //forest
				0.0, //forest
				0.0, //forest_leaves
				0.0, //autumn_forest
				0.0, //mountains
				0.0, // ?
				0.0, //farmland
				0.0, // snow
				0.0, // badlands
				0.0, //highlands
				0.0, //stepps
				0.0 //ocean
			]
		}
	},
	function isExcluded( _id )
	{
		return this.m.Excluded.find(_id) != null;
	}

	function isUntalented()
	{
		return this.m.IsUntalented;
	}

	function setScenarioOnly( _f )
	{
		this.m.IsScenarioOnly = _f;
	}

	function isOffendedByViolence()
	{
		return this.m.IsOffendedByViolence;
	}

	function isFemaleBackground()
	{
		return this.m.IsFemaleBackground;
	}

	function isCombatBackground()
	{
		return this.m.IsCombatBackground;
	}

	function isNoble()
	{
		return this.m.IsNoble;
	}

	function isLowborn()
	{
		return this.m.IsLowborn;
	}

	function getExcludedTalents()
	{
		return this.m.ExcludedTalents;
	}

	function getGoodEnding()
	{
		return this.m.GoodEnding;
	}

	function getBadEnding()
	{
		return this.m.BadEnding;
	}

	function getModifiers()
	{
		return this.m.Modifiers;
	}

	function create()
	{
		this.m.Type = this.Const.SkillType.Background | this.Const.SkillType.Trait;
		this.m.Order = this.Const.SkillOrder.Background;
		this.m.DailyCostMult = this.Math.rand(90, 110) * 0.01;
	}

	function isHidden()
	{
		return this.skill.isHidden() || this.m.IsScenarioOnly;
	}

	function getName()
	{
		return "Background: " + this.m.Name;
	}

	function getNameOnly()
	{
		return this.m.Name;
	}

	function getBackgroundDescription( _desc )
	{
		local text = ""
		if (_desc)
		{
			text = text + this.m.BackgroundDescription + "\n";
		}

		foreach (k, v in this.m.Modifiers)
		{
			if (k == "Terrain")
			{
				continue;
			}

			if (v == 0)
			{
				continue;
			}

			switch (k)
			{
				case "Ammo":
				case "Meds":
				case "Stash":
					text += k + " +" + v + "\n";
					break;
				case "ArmorParts":
					text += "Tools +" + v + "\n";
					break;
				default:
					v = v * 100;
					text += k + " +" + v + "%\n";
			}
		}

		text += "\n\nTerrain Movement Modifiers:"
		local terrains = this.m.Modifiers.Terrain;
		local val = 0.0
		val = terrains[2] * 100.0;
		if (val > 0) {
			text += "\nPlains +" + val +"%"
		}
		val = terrains[3] * 100.0;
		if (val > 0) {
			text += "\nSwamp +" + val +"%"
		}
		val = terrains[4] * 100.0;
		if (val > 0) {
			text += "\nHills +" + val +"%"
		}		
		val = terrains[5] * 100.0;
		if (val > 0) {
			text += "\nForests +" + val +"%"
		}
		val = terrains[9] * 100.0;
		if (val > 0) {
			text += "\nMountains +" + val +"%"
		}
		val = terrains[11] * 100.0;
		if (val > 0) {
			text += "\nFarmland +" + val +"%"
		}		
		val = terrains[12] * 100.0;
		if (val > 0) {
			text += "\nSnow +" + val +"%"
		}
		val = terrains[13] * 100.0;
		if (val > 0) {
			text += "\nBadlands +" + val +"%"
		}
		val = terrains[14] * 100.0;
		if (val > 0) {
			text += "\nHighlands +" + val +"%"
		}
		val = terrains[15] * 100.0;
		if (val > 0) {
			text += "\nStepps +" + val +"%"
		}		
		return text;
	}

	function getGenericTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getBackgroundDescription(true)
			}
		];
	}

	function buildDescription( _isFinal = false )
	{
		if (this.m.IsScenarioOnly)
		{
			return;
		}

		local villages = this.World.EntityManager.getSettlements();
		local brother = this.World.getPlayerRoster().getAll();
		brother = brother.len() != 0 ? brother[this.Math.rand(0, brother.len() - 1)].getName() : "";
		local vars = [
			[
				"townname",
				this.World.State.getCurrentTown() != null ? this.World.State.getCurrentTown().getNameOnly() : villages[this.Math.rand(0, villages.len() - 1)].getNameOnly()
			],
			[
				"randomtown",
				villages[this.Math.rand(0, villages.len() - 1)].getNameOnly()
			],
			[
				"randomcity",
				villages[0].getNameOnly()
			],
			[
				"randomname",
				this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]
			],
			[
				"randomnoble",
				this.Const.Strings.KnightNames[this.Math.rand(0, this.Const.Strings.KnightNames.len() - 1)]
			],
			[
				"randomnamefemale",
				this.Const.Strings.CharacterNamesFemale[this.Math.rand(0, this.Const.Strings.CharacterNamesFemale.len() - 1)]
			],
			[
				"companyname",
				this.World.Assets.getName()
			],
			[
				"randombrother",
				brother
			]
		];
		this.onPrepareVariables(vars);

		if (!_isFinal)
		{
			this.m.RawDescription = this.buildTextFromTemplate(this.onBuildDescription(), vars);
		}

		vars.push([
			"name",
			this.getContainer().getActor().getNameOnly()
		]);
		vars.push([
			"fullname",
			this.getContainer().getActor().getName()
		]);
		this.m.Description = this.buildTextFromTemplate(this.m.RawDescription, vars);
	}

	function onPrepareVariables( _vars )
	{
	}

	function buildAttributes(_tag = null)
	{
		local a = [];

		if (_tag == "zombie")
		{
			a = {
				Hitpoints = [
					65,
					75
				],
				Bravery = [
					30,
					40
				],
				Stamina = [
					90,
					100
				],
				MeleeSkill = [
					42,
					52
				],
				RangedSkill = [
					27,
					37
				],
				MeleeDefense = [
					0,
					0
				],
				RangedDefense = [
					0,
					0
				],
				Initiative = [
					85,
					95
				]
			};
		}
		else if (_tag == "skeleton")
		{
			a = {
				Hitpoints = [     // will start with a minimum of 15 health, set below
					1,
					1
				],
				Bravery = [
					30,
					40
				],
				Stamina = [
					90,
					100
				],
				MeleeSkill = [
					42,
					52
				],
				RangedSkill = [
					27,
					37
				],
				MeleeDefense = [
					0,
					5
				],
				RangedDefense = [
					0,
					5
				],
				Initiative = [
					90,
					100
				]
			};
		}
		else
		{
			a = {
				Hitpoints = [
					50,
					60
				],
				Bravery = [
					30,
					40
				],
				Stamina = [
					90,
					100
				],
				MeleeSkill = [
					47,
					57
				],
				RangedSkill = [
					32,
					42
				],
				MeleeDefense = [
					0,
					5
				],
				RangedDefense = [
					0,
					5
				],
				Initiative = [
					100,
					110
				]
			};
		}

		local c = this.onChangeAttributes();
		a.Hitpoints[0] += c.Hitpoints[0];
		a.Hitpoints[1] += c.Hitpoints[1];
		a.Bravery[0] += c.Bravery[0];
		a.Bravery[1] += c.Bravery[1];
		a.Stamina[0] += c.Stamina[0];
		a.Stamina[1] += c.Stamina[1];
		a.MeleeSkill[0] += c.MeleeSkill[0];
		a.MeleeSkill[1] += c.MeleeSkill[1];
		a.MeleeDefense[0] += c.MeleeDefense[0];
		a.MeleeDefense[1] += c.MeleeDefense[1];
		a.RangedSkill[0] += c.RangedSkill[0];
		a.RangedSkill[1] += c.RangedSkill[1];
		a.RangedDefense[0] += c.RangedDefense[0];
		a.RangedDefense[1] += c.RangedDefense[1];
		a.Initiative[0] += c.Initiative[0];
		a.Initiative[1] += c.Initiative[1];
		
		local b = this.getContainer().getActor().getBaseProperties();
		if (_tag == "zombie")
		{
			b.ActionPoints = 6;
		}
		else if (_tag == "skeleton")
		{
			b.ActionPoints = 9;
		}
		else
		{
			b.ActionPoints = 9;
		}

		b.Hitpoints = this.Math.max(15, this.Math.rand(a.Hitpoints[0], a.Hitpoints[1]));
		b.Bravery = this.Math.rand(a.Bravery[0], a.Bravery[1]);
		b.Stamina = this.Math.rand(a.Stamina[0], a.Stamina[1]);
		b.MeleeSkill = this.Math.rand(a.MeleeSkill[0], a.MeleeSkill[1]);
		b.RangedSkill = this.Math.rand(a.RangedSkill[0], a.RangedSkill[1]);
		b.MeleeDefense = this.Math.rand(a.MeleeDefense[0], a.MeleeDefense[1]);
		b.RangedDefense = this.Math.rand(a.RangedDefense[0], a.RangedDefense[1]);
		b.Initiative = this.Math.rand(a.Initiative[0], a.Initiative[1]);
		this.getContainer().getActor().m.CurrentProperties = clone b;
		this.getContainer().getActor().setHitpoints(b.Hitpoints);
	}

	function updateAppearance()
	{
	}

	function addEquipment()
	{
		this.onAddEquipment();
		this.adjustHiringCostBasedOnEquipment();
	}

	function onUpdate( _properties )
	{
		local level = this.getContainer().getActor().getLevel();
		local wage = this.Math.round(this.m.DailyCost * this.m.DailyCostMult);
		_properties.DailyWage += wage * this.Math.pow(1.1, this.Math.min(10, level - 1));

		if (level > 11)
		{
			local previous = wage * this.Math.pow(1.1, 10);
			_properties.DailyWage += previous * this.Math.pow(1.03, level - 1 - 10) - previous;
		}
	}

	function adjustHiringCostBasedOnEquipment()
	{
		local actor = this.getContainer().getActor();
		actor.m.HiringCost = this.Math.floor(this.m.HiringCost + 500 * this.Math.pow(this.m.Level - 1, 1.5));
		local items = actor.getItems().getAllItems();
		local cost = 0;

		foreach( i in items )
		{
			cost = cost + i.getValue();
		}

		cost = cost * 1.25;
		actor.m.HiringCost = actor.m.HiringCost + cost;
		actor.m.HiringCost *= 0.1;
		actor.m.HiringCost = this.Math.ceil(actor.m.HiringCost);
		actor.m.HiringCost *= 10;
	}

	function setAppearance(_tag = null)
	{
		if (this.m.HairColors == null)
		{
			return;
		}

		if (_tag == "zombie")
		{
			local actor = this.getContainer().getActor();
			local hairColor = this.Const.HairColors.Zombie[this.Math.rand(0, this.Const.HairColors.Zombie.len() - 1)];

			local body = actor.getSprite("body");
			body.setBrush(this.m.Body);
			body.Saturation = 0.5;
			body.varySaturation(0.2);
			body.Color = this.createColor("#c1ddaa");
			body.varyColor(0.05, 0.05, 0.05);
			actor.getSprite("injury_body").setBrush("zombify_body_01");

			local head = actor.getSprite("head");
			head.setBrush(this.m.Faces[this.Math.rand(0, this.m.Faces.len() - 1)]);
			head.Saturation = body.Saturation;
			head.Color = body.Color;

			local hair = actor.getSprite("hair");
			hair.setBrush("hair_" + hairColor + "_" + this.Const.Hair.Zombie[this.Math.rand(0, this.Const.Hair.Zombie.len() - 1)]);
			hair.varyColor(0.02, 0.02, 0.02);

			if (this.Math.rand(1, 100) <= this.m.BeardChance)
			{
				local beard = actor.getSprite("beard");
				beard.setBrush("beard_" + hairColor + "_" + this.Const.Beards.Zombie[this.Math.rand(0, this.Const.Beards.Zombie.len() - 1)]);
				beard.Color = hair.Color;

				if (this.doesBrushExist(beard.getBrush().Name + "_top"))
				{
					local sprite = actor.getSprite("beard_top");
					sprite.setBrush(beard.getBrush().Name + "_top");
					sprite.Color = actor.getSprite("hair").Color;
				}
			}
		}
		else if (_tag == "skeleton")
		{
			local actor = this.getContainer().getActor();
			local hairColor = this.Const.HairColors.Zombie[this.Math.rand(0, this.Const.HairColors.Zombie.len() - 1)];

			local body = actor.getSprite("body");
			body.setBrush("bust_skeleton_body_0" + this.Math.rand(1, 2));
			body.Saturation = 0.8;
			body.varySaturation(0.2);
			body.varyColor(0.025, 0.025, 0.025);
			actor.getSprite("injury_body").setBrush("bust_skeleton_body_injured");

			local head = actor.getSprite("head");
			head.setBrush("bust_skeleton_head");
			head.Color = body.Color;
			head.Saturation = body.Saturation;

			local hair = actor.getSprite("hair");
			hair.setBrush("hair_" + hairColor + "_" + this.Const.Hair.ZombieOnly[this.Math.rand(0, this.Const.Hair.ZombieOnly.len() - 1)]);
			hair.varyColor(0.02, 0.02, 0.02);

			if (this.Math.rand(1, 100) <= this.m.BeardChance)
			{
				local beard = actor.getSprite("beard");
				beard.setBrush("beard_" + hairColor + "_" + this.Const.Beards.ZombieOnly[this.Math.rand(0, this.Const.Beards.ZombieOnly.len() - 1)]);
				beard.Color = hair.Color;

				if (this.doesBrushExist(beard.getBrush().Name + "_top"))
				{
					local sprite = actor.getSprite("beard_top");
					sprite.setBrush(beard.getBrush().Name + "_top");
					sprite.Color = actor.getSprite("hair").Color;
				}
			}
		}
		else
		{
			local actor = this.getContainer().getActor();
			local hairColor = this.m.HairColors[this.Math.rand(0, this.m.HairColors.len() - 1)];

			if (this.m.Faces != null)
			{
				local sprite = actor.getSprite("head");
				sprite.setBrush(this.m.Faces[this.Math.rand(0, this.m.Faces.len() - 1)]);
				sprite.Color = this.createColor("#fbffff");
				sprite.varyColor(0.05, 0.05, 0.05);
				sprite.varySaturation(0.1);
				local body = actor.getSprite("body");
				body.Color = sprite.Color;
				body.Saturation = sprite.Saturation;
			}

			if (this.m.Hairs != null && this.Math.rand(0, this.m.Hairs.len()) != this.m.Hairs.len())
			{
				local sprite = actor.getSprite("hair");
				sprite.setBrush("hair_" + hairColor + "_" + this.m.Hairs[this.Math.rand(0, this.m.Hairs.len() - 1)]);

				if (hairColor != "grey")
				{
					sprite.varyColor(0.1, 0.1, 0.1);
				}
				else
				{
					sprite.varyBrightness(0.1);
				}
			}

			if (this.m.Beards != null && this.Math.rand(1, 100) <= this.m.BeardChance)
			{
				local beard = actor.getSprite("beard");
				beard.setBrush("beard_" + hairColor + "_" + this.m.Beards[this.Math.rand(0, this.m.Beards.len() - 1)]);
				beard.Color = actor.getSprite("hair").Color;

				if (this.doesBrushExist(beard.getBrush().Name + "_top"))
				{
					local sprite = actor.getSprite("beard_top");
					sprite.setBrush(beard.getBrush().Name + "_top");
					sprite.Color = actor.getSprite("hair").Color;
				}
			}

			if (this.m.Body != null)
			{
				actor.getSprite("body").setBrush(this.m.Body);
				actor.getSprite("injury_body").setBrush(this.m.Body + "_injured");
			}
		}

		this.onSetAppearance();
	}

	function onAddEquipment()
	{
	}

	function onSetAppearance()
	{
	}

	function onAdded()
	{
		this.m.DailyCost += 1;
		local actor = this.getContainer().getActor();
		actor.m.Background = this;

		if (this.m.IsNew && !(("State" in this.Tactical) && this.Tactical.State != null && this.Tactical.State.isScenarioMode()))
		{
			this.m.IsNew = false;

			if (actor.getTitle() == "" && this.m.Titles.len() != 0 && this.Math.rand(0, 3) == 3)
			{
				actor.setTitle(this.m.Titles[this.Math.rand(0, this.m.Titles.len() - 1)]);
			}

			if (this.m.Level != 1)
			{
				actor.m.PerkPoints = this.m.Level - 1;
				actor.m.LevelUps = this.m.Level - 1;
				actor.m.Level = this.m.Level;
				actor.m.XP = this.Const.LevelXP[this.m.Level - 1];
			}
		}
	}

	function onBuildDescription()
	{
		return "";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				0,
				0
			],
			Bravery = [
				0,
				0
			],
			Stamina = [
				0,
				0
			],
			MeleeSkill = [
				0,
				0
			],
			RangedSkill = [
				0,
				0
			],
			MeleeDefense = [
				0,
				0
			],
			RangedDefense = [
				0,
				0
			],
			Initiative = [
				0,
				0
			]
		};
		return c;
	}

	function onSerialize( _out )
	{
		this.skill.onSerialize(_out);
		_out.writeString(this.m.Description);
		_out.writeString(this.m.RawDescription);
		_out.writeU8(this.m.Level);
		_out.writeBool(this.m.IsNew);
		_out.writeF32(this.m.DailyCostMult);
	}

	function onDeserialize( _in )
	{
		this.skill.onDeserialize(_in);
		this.m.Description = _in.readString();
		this.m.RawDescription = _in.readString();
		this.m.Level = _in.readU8();
		this.m.IsNew = _in.readBool();

		if (_in.getMetaData().getVersion() >= 39)
		{
			this.m.DailyCostMult = _in.readF32();
		}
		else
		{
			this.m.DailyCostMult = 1.0;
		}
	}

});
