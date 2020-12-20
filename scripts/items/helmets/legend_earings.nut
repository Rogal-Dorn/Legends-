this.legend_earings <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.ID = "armor.head.legend_southern_veil";
		this.m.Name = "Earings";
		this.m.Description = "Earings made of delicate metal";
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedAsLoot = false;
		this.m.HideHair = false;
		this.m.HideBeard = false;
		this.m.ReplaceSprite = true;
		local variants = [
			1,
		];
		this.m.Variant = variants[this.Math.rand(0, variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 5;
		this.m.Condition = 3;
		this.m.ConditionMax = 3;
		this.m.StaminaModifier = 0;
		this.m.Vision = 0;
	}


	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "earings_0" + variant;
		this.m.SpriteDamaged = "earings_0" + variant + "_damaged";
		this.m.SpriteCorpse = "earings_0" + variant + "_dead";
		this.m.IconLarge = "armor/inventory_earings_0" + variant + ".png";
		// this.m.Icon = "armor/icon_earings_0" + variant + ".png";
	}

});

