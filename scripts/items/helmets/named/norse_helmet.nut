this.norse_helmet <- this.inherit("scripts/items/helmets/named/named_helmet", {
	m = {},
	function create()
	{
		this.named_helmet.create();
		this.m.ID = "armor.head.norse";
		this.m.Description = "A metal helmet of northern design with added facemask and protective ear covers.";
		this.m.NameList = [
			"Clan Helmet",
			"Highland Helm",
			"Norse Nasal Helmet",
			"Faceguard",
			"Padded Norse Helmet",
			"Owl Helmet"
		];
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedAsLoot = true;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.Variant = 52;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 3000;
		this.m.Condition = 180;
		this.m.ConditionMax = 180;
		this.m.StaminaModifier = -10;
		this.m.Vision = -2;
		this.randomizeValues();
	}

});

