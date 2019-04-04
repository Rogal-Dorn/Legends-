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
		this.m.PreviewCraftable = token;
		this.m.Cost = 100;
		this.m.Enchanter = true;
		// local ingredients = [
		// 	{
		// 		Script = "scripts/items/trade/uncut_gems_item",
		// 		Num = 1
		// 	}
		// ];
		// this.init(ingredients);
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

	function onCraft( _stash )
	{
		local rune =  this.new("scripts/items/rune_sigils/legend_vala_inscription_token");
		rune.setRuneVariant(this.m.Rune);
		rune.setRuneMultiplier(this.Math.rand(0, 5));
		rune.updateRuneSigilToken();
		_stash.add(rune);
	}

});
