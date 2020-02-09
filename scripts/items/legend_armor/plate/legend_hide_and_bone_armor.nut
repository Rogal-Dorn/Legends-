this.legend_hide_and_bone_armor <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_ armor.body.hide_and_bone_armor";
		this.m.Name = "Hide and Bone Armor";
		this.m.Description = "Hide and bone are common materials in the northern regions. This armor is using both for decent protection.";
		this.m.ArmorDescription = "Includes hide and bone armor that is decent protection.";
		local variant = 92;
		this.m.SpriteBack = "bust_body_" + variant;
		this.m.SpriteDamagedBack = "bust_body_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_body_" + variant + "_dead";
		this.m.Icon = "legend_armor/plate/legend_hide_and_bone_armor.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "legend_armor/plate/icon_legend_hide_and_bone_armor.png";
		this.m.OverlayIconLarge = "legend_armor/plate/inventory_legend_hide_and_bone_armor.png";
		this.m.ImpactSound = this.Const.Sound.ArmorBoneImpact;
		this.m.Value = 350;
		this.m.Condition = 80;
		this.m.ConditionMax = 80;
		this.m.StaminaModifier = -11;
	}

});

