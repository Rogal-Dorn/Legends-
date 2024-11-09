::mods_hookExactClass("entity/tactical/enemies/orc_berserker", function(o)
{
	o.onFactionChanged <- function ()
	{
		this.actor.onFactionChanged();
		//Doesn't use helmet layer, don't flip
		local flip = this.isAlliedWithPlayer();
		foreach (a in this.Const.CharacterSprites.Helmets)
		{
			if (!this.hasSprite(a))
			{
				continue;
			}
			this.getSprite(a).setHorizontalFlipping(flip);
		}
	}

	local onInit = o.onInit;
	o.onInit = function ()
	{
		onInit();
		foreach (a in this.Const.CharacterSprites.Helmets)
		{
			this.addSprite(a)
		}
		local v = 3;
		local v2 = -5;
		foreach (a in this.Const.CharacterSprites.Helmets)
		{
			if (!this.hasSprite(a))
			{
				continue;
			}
			this.setSpriteOffset(a, this.createVec(v2, v));
		}
		if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			b.MeleeSkill += 10;
			this.m.Skills.add(this.new("scripts/skills/perks/perk_colossus"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
		}
	}

	o.assignRandomEquipment = function ()
	{
		local r = this.Math.rand(1, 8);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/greenskins/orc_axe"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/greenskins/orc_cleaver"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/greenskins/orc_flail_2h"));
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/greenskins/orc_axe_2h"));
		}
		else if (r == 5)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/greenskins/legend_limb_lopper"));
		}
		else if (r == 6)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/greenskins/legend_man_mangler"));
		}
		else if (r == 7)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/greenskins/legend_bough"));
		}
		else if (r == 8)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/greenskins/legend_skullbreaker"));
		}

		local item = this.Const.World.Common.pickArmor([
			[1, "greenskins/orc_berserker_light_armor"],
			[1, "greenskins/orc_berserker_medium_armor"],
			[3, ""]
		]);
		this.m.Items.equip(item);


		local item = this.Const.World.Common.pickHelmet([
			[2, ""],
			[1, "greenskins/orc_berserker_helmet"]
		]);
		if (item != null)
		{
			this.m.Items.equip(item);
		}
	}
});
