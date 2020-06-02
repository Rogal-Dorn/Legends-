this.legend_gambeson_wolf <- this.inherit("scripts/items/legend_armor/legend_armor", {
	m = {},
	function create()
	{
		this.legend_armor.create();
		this.m.ID = "legend.armor.body.gambeson_wolf.cloth";
		this.m.Name = "Wolf Gambeson";
		this.m.Description = "A sturdy and heavy padded tunic that offers decent protection.";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 300;
		this.m.Condition = 70;
		this.m.ConditionMax = 70;
		this.m.StaminaModifier = -9;
	}

	function updateVariant()
	{
		this.m.Sprite = "bust_legend_gambeson_wolf";
		this.m.SpriteDamaged = "bust_legend_gambeson_wolf_damaged";
		this.m.SpriteCorpse = "bust_legend_gambeson_wolf_dead";
		this.m.IconLarge = "legend_armor/cloth/inventory_legend_gambeson_wolf.png";
		this.m.Icon = "legend_armor/cloth/icon_legend_gambeson_wolf.png";
	}

});

