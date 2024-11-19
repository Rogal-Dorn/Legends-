::mods_hookExactClass("entity/tactical/enemies/unhold", function(o) 
{
	o.onFactionChanged = function ()
	{
		this.actor.onFactionChanged();
		local flip = this.isAlliedWithPlayer();
		this.getSprite("body").setHorizontalFlipping(flip);
		this.getSprite("injury").setHorizontalFlipping(flip);
		this.getSprite("armor").setHorizontalFlipping(flip);
		this.getSprite("head").setHorizontalFlipping(flip);
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
		local b = this.m.BaseProperties;
		if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 190)
		{
			b.DamageTotalMult += 0.2;
		}
		if(this.Math.rand(1, 100) < 5)
		{
			body.setBrush("bust_unhold_body_04");
		}
		else
		{
			body.setBrush("bust_unhold_body_02");
		}
		if(this.Math.rand(1, 100) < 3)
		{
			head.setBrush("bust_unhold_head_04");
		}
		else
		{
			head.setBrush("bust_unhold_head_02");
		}
		foreach (a in this.Const.CharacterSprites.Helmets)
		{
			this.addSprite(a)
		}
		this.addSprite("accessory");
		this.addSprite("accessory_special");
		if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.Hitpoints = 2 * b.Hitpoints;
			b.MeleeSkill += 10;
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_battleheart"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_last_stand"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
		}
	}

	o.assignRandomEquipment = function ()
	{
		local armor = [
			[1, "ancient/ancient_lich_attire"]
		];
		local item = this.Const.World.Common.pickArmor(armor);
		this.m.Items.equip(item);
		local helmet = [
			[1, "ancient/ancient_lich_headpiece"]
		];
		this.m.Items.equip(this.Const.World.Common.pickHelmet(helmet));
	}
});