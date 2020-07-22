this.legend_helmet_goblin_scarf <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.legend_helmet_goblin_scarf";
		this.m.Name = "Goblin Scarf";
		this.m.Description = "TODO Goblin Scarf";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variant = 188;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 200;
		this.m.Condition = 80;
		this.m.ConditionMax = 80;
		this.m.StaminaModifier = -4;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "";
		this.m.SpriteDamaged = ""//"bust_helmet_" + variant + "_damaged";
		this.m.SpriteCorpse = ""//"bust_helmet_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "legend_helmets/hood/legend_goblin_scarf.png"
	}

});

