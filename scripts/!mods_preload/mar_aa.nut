local modID = "mod_mediumArmorRework";

::mods_registerMod(modID, 1.4, "Medium Armor Rework (MAR) 1.4.1");

::mods_queue(modID, "mod_legends,mod_MSU", function ()
{
	local gt = this.getroottable();

	gt.Const.Strings.PerkName.MARBalance <- "Balance";
	gt.Const.Strings.PerkDescription.MARBalance <- "Gain increased defense by balancing your armor\'s weight and mobility. Gain up to [color=" + this.Const.UI.Color.PositiveValue + "]+15[/color] Melee and [color=" + this.Const.UI.Color.PositiveValue + "]+5[/color] Ranged Defense. The bonus increases as you wear armor of heavier weight (penalty to Maximum Fatigue), but slowly drops when your Current Initiative is lower than twice your armor\'s weight. This drop is faster for heavier armors.\n[color=#0b0084]From the Medium Armor perk group[/color]";

	gt.Const.Strings.PerkName.MARPerfectFit <- "Perfect Fit";
	gt.Const.Strings.PerkDescription.MARPerfectFit <- "Leverage the superior fit of your armor to gain increased speed and endurance! Reduces the penalty to Initiative from head and body armor by [color=" + this.Const.UI.Color.NegativeValue + "]30%[/color] and lowers the Fatigue cost of skills by [color=" + this.Const.UI.Color.NegativeValue + "]15%[/color]. This bonus is reduced exponentially when the total penalty to Maxium Fatigue from your head and body armor is more than half of your Maximum Fatigue after gear.\n[color=#0b0084]From the Medium Armor perk group[/color]";

	gt.Const.Strings.PerkName.MARLithe <- "Lithe";
	gt.Const.Strings.PerkDescription.MARLithe <- "Specialize in Medium Armor! Damage to Armor and Hitpoints is reduced by [color=" + this.Const.UI.Color.PositiveValue + "]30%[/color] when the total penalty to Maximum Fatigue from head and body armor is between [color=" + this.Const.UI.Color.NegativeValue + "]-25[/color] and [color=" + this.Const.UI.Color.NegativeValue + "]-35[/color]. Outside this range, the bonus drops exponentially.\n\nAs your armor takes damage, the bonus drops slowly to half its maximum value at 0 armor remaining.\n[color=#0b0084]From the Medium Armor perk group[/color]";

	gt.Const.Strings.PerkName.MARInTheZone <- "In the Zone";
	gt.Const.Strings.PerkDescription.MARInTheZone <- "Use your armor\'s blend of protection and mobility to punish your foes\' mistakes! Gain a stacking buff that boosts your Melee Damage and Melee Defense by [color=" + this.Const.UI.Color.PositiveValue + "]1%[/color] up to a maximum of [color=" + this.Const.UI.Color.PositiveValue + "]25%[/color]. You gain [color=" + this.Const.UI.Color.PositiveValue + "]1%[/color] when you dodge a Melee attack and lose [color=" + this.Const.UI.Color.PositiveValue + "]2%[/color] when you get hit by any attack.\n\nIf your Initiative is higher than twice your armor\'s weight (penalty to Maximum Fatigue), you start the battle with pre-applied bonus equal to your armor\'s weight above 15.\n\nThese bonuses are halved while you are not engaged in melee.\n[color=#0b0084]From the Medium Armor perk group[/color]";
	gt.Const.Perks.PerkDefObjects.push({
		ID = "perk.mar_in_the_zone",
		Script = "scripts/skills/perks/perk_mar_in_the_zone",
		Name = this.Const.Strings.PerkName.MARInTheZone,
		Tooltip = this.Const.Strings.PerkDescription.MARInTheZone,
		Icon = "ui/perks/in_the_zone.png",
		IconDisabled = "ui/perks/in_the_zone_bw.png",
		Const = "MARInTheZone"
	});

	foreach (i, perk in gt.Const.Perks.PerkDefObjects)
	{
		if (perk.Const == "LegendLithe")
		{
			gt.Const.Perks.PerkDefObjects[i] = {
				ID = "perk.mar_lithe",
				Script = "scripts/skills/perks/perk_mar_lithe",
				Name = this.Const.Strings.PerkName.MARLithe,
				Tooltip = this.Const.Strings.PerkDescription.MARLithe,
				Icon = "ui/perks/lithe.png",
				IconDisabled = "ui/perks/lithe_bw.png",
				Const = "LegendLithe"
			}
			continue;
		}
		if (perk.Const == "LegendBalance")
		{
			gt.Const.Perks.PerkDefObjects[i] ={
				ID = "perk.mar_balance",
				Script = "scripts/skills/perks/perk_mar_balance",
				Name = this.Const.Strings.PerkName.MARBalance,
				Tooltip = this.Const.Strings.PerkDescription.MARBalance,
				Icon = "ui/perks/balance.png",
				IconDisabled = "ui/perks/balance_bw.png",
				Const = "LegendBalance"
			}
			continue;
		}
		if (perk.Const == "LegendMatchingSet")
		{
			gt.Const.Perks.PerkDefObjects[i] = {
				ID = "perk.mar_perfect_fit",
				Script = "scripts/skills/perks/perk_mar_perfect_fit",
				Name = this.Const.Strings.PerkName.MARPerfectFit,
				Tooltip = this.Const.Strings.PerkDescription.MARPerfectFit,
				Icon = "ui/perks/matching_set.png",
				IconDisabled = "ui/perks/matching_set_bw.png",
				Const = "LegendMatchingSet"
			}
			continue;
		}
	}

	gt.Const.Perks.PerkDefs.clear();

	foreach( i, v in gt.Const.Perks.PerkDefObjects )
	{
		gt.Const.Perks.PerkDefs[v.Const] <- i;
	}

	gt.Const.Perks.MediumArmorTree.Tree.clear();

	while (gt.Const.Perks.MediumArmorTree.Tree.len() < 7)
	{
		local emptyArray = [];
		gt.Const.Perks.MediumArmorTree.Tree.push(emptyArray);
	}
	gt.Const.Perks.MediumArmorTree.Tree[1] = [gt.Const.Perks.PerkDefs.LegendBalance];
	gt.Const.Perks.MediumArmorTree.Tree[2] = [gt.Const.Perks.PerkDefs.LegendMatchingSet];
	gt.Const.Perks.MediumArmorTree.Tree[4] = [gt.Const.Perks.PerkDefs.LegendLithe];
	gt.Const.Perks.MediumArmorTree.Tree[6] = [gt.Const.Perks.PerkDefs.MARInTheZone];
});
