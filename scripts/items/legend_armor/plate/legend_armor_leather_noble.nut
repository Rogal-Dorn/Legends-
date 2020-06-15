this.legend_armor_leather_noble <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.leather_noble";
		this.m.Name = "Noble Leather Armor";
		this.m.Description = "A truly masterfully crafted set of leather armor. Very light and flexible to reduce encumberance while still offering good protection.";
		this.m.ArmorDescription = "Includes masterfully crafted leather armor.";
		this.m.Variants = [
			1,
			2,
			3,
			4,
			5,
			6
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 1500;
		this.m.Condition = 65;
		this.m.ConditionMax = 65;
		this.m.StaminaModifier = -6;
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
	}

	function updateVariant()
	{
		local variant = this.m.Variant < 10 ? "0" + this.m.Variant : this.m.Variant;
		this.m.SpriteBack = "bust_legend_leather_noble_" + variant;
		this.m.SpriteDamagedBack = "bust_legend_leather_noble_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_legend_leather_noble_" + variant + "_dead";
		this.m.Icon = "legend_armor/plate/legend_leather_noble_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_leather_noble_" + variant + ".png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_leather_noble_" + variant + ".png";
	}

});

