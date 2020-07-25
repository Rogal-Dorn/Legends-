
this.legend_helmet_patched_hood <- this.inherit("scripts/items/legend_helmets/legend_helmet", {
	m = {},
	function create()
	{
		this.legend_helmet.create();
		this.m.ID = "armor.head.legend_helmet_patched_hood";
		this.m.Name = "TODO legend_helmet_patched_hood";
		this.m.Description = "TODO legend_helmet_patched_hood";
        this.m.Variant = 1;
		this.m.Variants = [1];
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
		this.m.Sprite = "legendhelms_patched_hood" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_patched_hood" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_patched_hood" + "_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "legend_helmets/hood/inventory_patched_hood" + "_" + variant + ".png"
	}
});
