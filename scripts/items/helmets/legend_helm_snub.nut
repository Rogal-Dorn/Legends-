this.legend_helm_snub <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.ID = "armor.head.legend_helm_point";
		this.m.Name = "Snub Helm";
		this.m.Description = "A closed metal helm with a snub nose. Provides more breathing than great helms";
		this.m.ShowOnCharacter = true;
		this.m.HideCharacterHead = true;
		this.m.HideCorpseHead = true;
		this.m.HideHair = true;
		this.m.HideBeard = true;
		this.m.IsDroppedAsLoot = true;
		local variants = [
			1
		];
		this.m.Variant = variants[this.Math.rand(0, variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.InventorySound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Value = 4500;
		this.m.Condition = 310;
		this.m.ConditionMax = 310;
		this.m.StaminaModifier = -20;
		this.m.Vision = -2;
	}

	function updateVariant()
	{
		this.m.Sprite = "bust_helmet_04_snub";
		this.m.SpriteDamaged = "bust_helmet_04_snub_damaged";
		this.m.SpriteCorpse = "bust_helmet_04_snub_dead";
		this.m.IconLarge = "helmets/inventory_helmet_04_snub.png";
		this.m.Icon = "helmets/inventory_helmet_04_snub.png";
	}

});

