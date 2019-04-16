this.legend_rune <- this.inherit("scripts/crafting/blueprint", {
	m = {
        Rune = 0,
        Skill = ""
    },
	function create()
	{
		this.blueprint.create();
		this.m.ID = "";
		local token = this.new("scripts/items/rune_sigils/legend_vala_inscription_token");
		token.setRuneVariant(this.m.Rune);
		token.updateRuneSigilToken();
		token.getRuneSigilTooltip = this.getRuneSigilTooltip;
		this.m.PreviewCraftable = token;
		this.m.Cost = 1200;
		this.m.Enchanter = true;
		// local ingredients = [
		// 	{
		// 		Script = "scripts/items/trade/uncut_gems_item",
		// 		Num = 1
		// 	}
		// ];
		// this.init(ingredients);
	}

	function getRuneSigilTooltip()
	{
		switch (this.m.Rune)
		{
			case 1:
				return "This item has the power of the rune sigil of Power:\n[color=" + this.Const.UI.Color.PositiveValue + "]+3% to +12%[/color] Damage inflicted.";
				break;

			case 2:
				return "This item has the power of the rune sigil of Accuracy:\n[color=" + this.Const.UI.Color.PositiveValue + "]+3% to +12%[/color] Melee and Ranged skill.";
				break;

			case 3:
				return "This item has the power of the rune sigil of Feeding:\n[color=" + this.Const.UI.Color.PositiveValue + "]+3% to +12%[/color] of inflicted health damage recovers fatigue.";
				break;

			case 11:
				return "This item has the power of the rune sigil of Clarity:\n[color=" + this.Const.UI.Color.PositiveValue + "]+0 to +2[/color] Vision.\n[color=" + this.Const.UI.Color.PositiveValue + "]+3% to +12%[/color] Experience gain.";
				break;

			case 12:
				return "This item has the power of the rune sigil of Bravery:\n[color=" + this.Const.UI.Color.PositiveValue + "]+3% to +12%[/color] Resolve.\n [color=" + this.Const.UI.Color.PositiveValue + "]+1 to +5[/color] Resolve at all morale checks.";
				break;

			case 13:
				return "This item has the power of the rune sigil of Luck:\n[color=" + this.Const.UI.Color.PositiveValue + "]+3% to +12%[/color] chance to have any attacker require two successful attack rolls in order to hit.";
				break;

			case 21:
				return "This item has the power of the rune sigil of Endurance:\n[color=" + this.Const.UI.Color.PositiveValue + "]+0 to +3[/color] Fatigue recovery per turn.\n[color=" + this.Const.UI.Color.PositiveValue + "]-3% to -12%[/color] Fatigue cost and effects multiplier.";
				break;

			case 22:
				return "This item has the power of the rune sigil of Safety:\n[color=" + this.Const.UI.Color.PositiveValue + "]+3% to +12%[/color] Hitpoints.\n [color=" + this.Const.UI.Color.PositiveValue + "]-3% to -12%[/color] Damage received.";
				break;

			case 23:
				return "This item has the power of the rune sigil of Resilience:\n[color=" + this.Const.UI.Color.PositiveValue + "]Immune[/color] to stuns, knockbacks and grabs.";
				break;

			case 31:
				return "This item has the power of the rune sigil of Defense:\n[color=" + this.Const.UI.Color.PositiveValue + "]+3% to +12%[/color] Melee and Ranged defense.";
				break;

			case 32:
				return "This item has the power of the rune sigil of Radiance:\n[color=" + this.Const.UI.Color.PositiveValue + "]-3% to -12%[/color] to all adjacent enemies\' Melee skill and Melee defense.";
				break;

			default:
				return "This item is inscribed with a rune sigil, even though it shouldn't have been: please report this bug.";
				break;
		}
	}

	function isCraftable()
	{
		local roster = this.World.getPlayerRoster().getAll();
        foreach( bro in roster )
        {
            if (bro.getSkills().hasSkill(this.m.Skill))
            {
                return true
            }
		}
		return false;
	}

	function onEnchant( _stash, _bonus )
	{
		local rune =  this.new("scripts/items/rune_sigils/legend_vala_inscription_token");
		rune.setRuneVariant(this.m.Rune);
		rune.setRuneBonus(_bonus);	
		rune.updateRuneSigilToken();
		_stash.add(rune);
	}

});
