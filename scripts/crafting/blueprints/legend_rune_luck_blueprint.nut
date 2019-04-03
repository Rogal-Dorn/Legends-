this.legend_rune_luck_blueprint <- this.inherit("scripts/crafting/legend_rune", {
	m = {},
	function create()
	{
		this.m.Rune = 13;
		this.m.Skill = "perk.legend_vala_inscribe_helmet";		
		this.legend_rune.create();
		this.m.ID = "blueprint.legend_rune_luck";
		local token = this.new("scripts/items/rune_sigils/legend_vala_inscription_token");
	}

});
