this.legend_war_catapult <- this.inherit("scripts/entity/tactical/actor", {
	m = {
		Item = null,
		Name = "Catapult"
	},
	function setItem( _i )
	{
		if (typeof _i == "instance")
		{
			this.m.Item = _i;
		}
		else
		{
			this.m.Item = this.WeakTableRef(_i);
		}
	}

	function setName( _n )
	{
		this.m.Name = _n;
	}

	function getName()
	{
		return this.m.Name;
	}

	function create()
	{
		this.m.Type = this.Const.EntityType.LegendCatapult;
		this.m.BloodType = this.Const.BloodType.Wood;
		this.m.XP = this.Const.Tactical.Actor.LegendCatapult.XP;
		this.actor.create();
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/legend_catapult_agent");
		this.m.AIAgent.setActor(this);
	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		if (_tile != null)
		{
			this.m.IsCorpseFlipped = flip;
			local decal;
			local appearance = this.getItems().getAppearance();
			local sprite_body = this.getSprite("body");
			decal = _tile.spawnDetail(sprite_body.getBrush().Name + "_dead", this.Const.Tactical.DetailFlag.Corpse, flip);
			decal.Color = sprite_body.Color;
			decal.Saturation = sprite_body.Saturation;
			decal.Scale = 0.9;
			decal.setBrightness(0.9);


			if (_fatalityType == this.Const.FatalityType.Disemboweled)
			{
				decal = _tile.spawnDetail("bust_unhold_guts", this.Const.Tactical.DetailFlag.Corpse, flip);
				decal.Scale = 0.9;
			}
			else if (_skill && _skill.getProjectileType() == this.Const.ProjectileType.Arrow)
			{
				decal = _tile.spawnDetail(sprite_body.getBrush().Name + "_dead_arrows", this.Const.Tactical.DetailFlag.Corpse, flip);
				decal.Scale = 0.9;
			}
			else if (_skill && _skill.getProjectileType() == this.Const.ProjectileType.Javelin)
			{
				decal = _tile.spawnDetail(sprite_body.getBrush().Name + "_dead_javelin", this.Const.Tactical.DetailFlag.Corpse, flip);
				decal.Scale = 0.9;
			}

			this.spawnTerrainDropdownEffect(_tile);
			local corpse = clone this.Const.Corpse;
			corpse.CorpseName = "A catapult";
			corpse.Tile = _tile;
			corpse.IsResurrectable = false;
			corpse.IsConsumable = false;
			corpse.Items = this.getItems();
			_tile.Properties.set("Corpse", corpse);
			this.Tactical.Entities.addCorpse(_tile);
		}

		if (_killer == null || _killer.getFaction() == this.Const.Faction.Player || _killer.getFaction() == this.Const.Faction.PlayerAnimals)
		{
			local n = 1 + (!this.Tactical.State.isScenarioMode() && this.Math.rand(1, 100) <= this.World.Assets.getExtraLootChance() ? 1 : 0);

			for( local i = 0; i < n; i = ++i )
			{
				local loot = this.new("scripts/items/misc/quality_wood_item");

				loot.drop(_tile);
			}

			if (this.Math.rand(1, 100) <= 33)
			{
				local loot = this.new("scripts/items/supplies/ammo_item");
				loot.drop(_tile);
			}
		}

		this.actor.onDeath(_killer, _skill, _tile, _fatalityType);
	}

	function onFactionChanged()
	{
		this.actor.onFactionChanged();
		local flip = this.isAlliedWithPlayer();
		this.getSprite("body").setHorizontalFlipping(flip);
		this.getSprite("armor").setHorizontalFlipping(flip);
		this.getSprite("head").setHorizontalFlipping(flip);
		this.getSprite("injury").setHorizontalFlipping(flip);

		if (!this.Tactical.State.isScenarioMode())
		{
			local f = this.World.FactionManager.getFaction(this.getFaction());

			if (f != null)
			{
				this.getSprite("socket").setBrush(f.getTacticalBase());
			}
		}
		else
		{
			this.getSprite("socket").setBrush(this.Const.FactionBase[this.getFaction()]);
		}
	}

	function onActorKilled( _actor, _tile, _skill )
	{
		this.actor.onActorKilled(_actor, _tile, _skill);

		if (this.getFaction() == this.Const.Faction.Player || this.getFaction() == this.Const.Faction.PlayerAnimals)
		{
			local XPgroup = _actor.getXPValue();
			local brothers = this.Tactical.Entities.getInstancesOfFaction(this.Const.Faction.Player);

			foreach( bro in brothers )
			{
				bro.addXP(this.Math.max(1, this.Math.floor(XPgroup / brothers.len())));
			}
		}
	}

	function onInit()
	{
		this.actor.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.LegendCatapult);
		b.TargetAttractionMult = 1.1;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_military");
		local body = this.addSprite("body");
		body.setBrush("legend_catapult");
		body.varySaturation(0.25);
		body.varyColor(0.2, 0.2, 0.2);
		b.IsSpecializedInBows = true;
		b.IsSpecializedInCrossbows = true;
		b.IsSpecializedInSlings = true;


		if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 40)
		{
			b.RangedDefense += 5;
		}

		this.m.Skills.add(this.new("scripts/skills/actives/legend_catapult_boulder_skill"));


		if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 20)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_bullseye"));
		}

		if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ballistics"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_close_combat_archer"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_lone_wolf"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
		}
	}

});

