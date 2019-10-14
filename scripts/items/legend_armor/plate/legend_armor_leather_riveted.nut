this.legend_armor_leather_riveted <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate
		this.m.ID = "legend_armor.leather_riveted";
		this.m.Name = "Sellsword\'s Leather Armor";
		this.m.Description = "A long leather armor coat reinforced with metal plates.";
		this.m.ArmorDescription = "Includes a long leather coat reinforced with metal plates that offers good protection but is very fatiguing to wear.";
		this.m.Icon = "legend_armor/chain/icon_legend_leather_riveted.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/chain/icon_legend_leather_riveted.png";
		this.m.OverlayIconLarge = "legend_armor/chain/inventory_legend_leather_riveted.png";
		this.m.SpriteBack = "bust_legend_armor_leather_riveted";
		this.m.SpriteDamagedBack = "bust_legend_leather_riveted_damaged";
		this.m.SpriteCorpseBack = "bust_legend_leather_riveted_dead";
		this.m.Value = 4500;
		this.m.Condition = 260;
		this.m.ConditionMax = 260;
		this.m.StaminaModifier = -32;
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
        this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
	}

});

