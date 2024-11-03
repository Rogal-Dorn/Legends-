::mods_hookExactClass("entity/tactical/enemies/hexe", function(o) 
{
	local onDeath = o.onDeath;
	o.onDeath = function ( _killer, _skill, _tile, _fatalityType )
	{
		onDeath( _killer, _skill, _tile, _fatalityType );
		if (_killer == null || _killer.getFaction() == this.Const.Faction.Player || _killer.getFaction() == this.Const.Faction.PlayerAnimals)
		{
			local chance = 1;
			if (this.LegendsMod.Configs().LegendMagicEnabled())
			{
				chance = 10;
			}

			if (this.Math.rand(1, 100) <= chance)
			{
				local rune;
				local selected = this.Math.rand(11,13);
				switch(selected)
				{
					case 11:
						rune = this.new("scripts/items/legend_helmets/runes/legend_rune_clarity");
						break;

					case 12:
						rune = this.new("scripts/items/legend_helmets/runes/legend_rune_bravery");
						break;

					case 13:
						rune = this.new("scripts/items/legend_helmets/runes/legend_rune_luck");
						break;
				}
				rune.setRuneVariant(selected);
				rune.setRuneBonus(true);
				// rune.setRuneVariant(0);
				rune.drop(_tile);


				// @Enduriel did the following, but it doesn't have a declaration for the `selected` variable
				// Hence reverting back to mercury's implementation for now (above).

				// local options = this.new("scripts/mods/script_container");
				// options.extend([
				// 	"scripts/items/legend_helmets/runes/legend_rune_clarity",
				// 	"scripts/items/legend_helmets/runes/legend_rune_bravery",
				// 	"scripts/items/legend_helmets/runes/legend_rune_luck"
				// ]);
				// local rune = this.new(options.roll());
				// rune.setRuneVariant(selected);
				// rune.setRuneBonus(true);
				// // rune.setRuneVariant(0);
				// rune.drop(_tile);

			}
		}

		this.actor.onDeath(_killer, _skill, _tile, _fatalityType);
	}

	local onInit = o.onInit;
	o.onInit = function()
	{
		this.m.Skills.add(this.new("scripts/skills/actives/legend_wither_skill"));

		if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_inspiring_presence"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
			this.m.Skills.add(this.new("scripts/skills/actives/legend_magic_missile_skill"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_composure"));
			b.Initiative += 50;
			b.RangedSkill += 75;
			b.Stamina += 70;
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
		}
	}

	o.assignRandomEquipment = function ()
	{
		 if("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		 {
		 this.m.Items.equip(this.new("scripts/items/weapons/legend_staff_gnarled"));
		 }
	}
});