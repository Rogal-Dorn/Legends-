::mods_hookExactClass("entity/tactical/enemies/vampire", function(o)
{
	o.m.IsLady <- false;

	local create = o.create;
	o.create = function ()
	{
		create();
		if(this.Math.rand(1, 100) <= 25)
		{
			this.m.IsLady = true;
		}
	}

	local onInit = o.onInit;
	o.onInit = function ()
	{
		onInit();
		if (this.Math.rand(1, 100) <= 75)
		{
			local idx = this.Math.rand(0, this.Const.Hair.Vampire.len());
			if (idx = this.Const.Hair.Vampire.len())
			{
				hair.setBrush("bust_vampire_lord_hair_01")
			}
			else
			{
				hair.setBrush("hair_" + hairColor + "_" + this.Const.Hair.Vampire[idx]);
			}
		}
		local v = -3;
		local v2 = 0;
		foreach (a in this.Const.CharacterSprites.Helmets)
		{
			this.addSprite(a);
			this.setSpriteOffset(a, this.createVec(v2, v));
		}
		this.addSprite("accessory");
		this.addSprite("accessory_special");

		if (this.m.IsLady) //hides the beard if it's a female
		{
			this.getSprite("body").setBrush("bust_vampire_lady_body_01");
			this.getSprite("head").setBrush("bust_vampire_lady_head_01");
			beard.Alpha = 0;
			beard_top.Alpha = 0;
		}
		this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_poison_immunity"));
		if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			b.MeleeSkill += 10;
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_composure"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_bloodbath"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_nimble"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
		}
	}

	local onDeath = o.onDeath;
	o.onDeath = function ( _killer, _skill, _tile, _fatalityType )
	{
		onDeath( _killer, _skill, _tile, _fatalityType );
		if (_killer == null || _killer.getFaction() == this.Const.Faction.Player || _killer.getFaction() == this.Const.Faction.PlayerAnimals)
		{
			local n = 1 + (!this.Tactical.State.isScenarioMode() && this.Math.rand(1, 100) <= this.World.Assets.getExtraLootChance() ? 1 : 0);

			for( local i = 0; i < n; i = ++i )
			{
				local r = this.Math.rand(1, 100);
				local loot;
				if (r <= 5)
				{
					loot = this.new("scripts/items/misc/legend_ancient_scroll_item");
					loot.drop(_tile);
				}
			}
		}
	}

	o.makeMiniboss <- function ()
	{
		if (!this.actor.makeMiniboss())
		{
			return false;
		}

		this.getSprite("miniboss").setBrush("bust_miniboss");
		if (this.Math.rand(1, 100) <= 66)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/named/named_khopesh"));
		}
		else
		{
			this.m.Items.equip(this.new("scripts/items/weapons/named/named_crypt_cleaver"));
		}
	}

	local onFactionChanged = o.onFactionChanged;
	o.onFactionChanged = function ()
	{
		onFactionChanged();
		foreach (a in this.Const.CharacterSprites.Helmets)
		{
			if (!this.hasSprite(a))
				continue;
			local flip = !this.isAlliedWithPlayer();
			this.getSprite(a).setHorizontalFlipping(flip);
		}
	}
});
