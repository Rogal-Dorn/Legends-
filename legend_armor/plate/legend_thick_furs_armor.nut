
this.legend_thick_furs_armor <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_thick_furs_armor";
		this.m.Name = "Thick Furs";
		this.m.Description = "Thick furs that are crudely dried and tied together to protect from both the cold and any incoming blows.";
		this.m.ArmorDescription = "Includes Thick furs that are crudely dried and tied together to protect from both the cold and any incoming blows.";
		this.m.Variants = [91];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 15;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = -1;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_body" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_body" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_body" + "_" + variant + "_dead";
		this.m.Icon = "legend_armor/plate/legend_thick_furs_armor" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_thick_furs_armor" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_thick_furs_armor" + "_" + variant + ".png";
	}
});
