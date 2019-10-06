this.legend_sackcloth_patched <- this.inherit("scripts/items/legend_armor/cloth/legend_sackcloth", {
	m = {},
	function create()
	{
		this.legend_sackcloth.create();
		this.m.ID = "legend.armor.body.patched_sackcloth";
		this.m.Name = "Leather Wraps";
		this.m.Description = "Various patches of rough leather sewn together.";
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.Variant = 3;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 40;
		this.m.Condition = 20;
		this.m.ConditionMax = 20;
		this.m.StaminaModifier = 0;
	}

});

