this.enclave_named_helms <- this.inherit("scripts/items/helmets/named/named_helmet", {
	m = {},
	function create()
	{
		this.named_helmet.create();
		this.m.ID = "armor.head.enclave_named_helms";
		this.m.Description = "If you're reading this, there's a problem.";
		this.m.NameList = [
		];
		this.m.ShowOnCharacter = true;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.Variant = 1;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 2000;
		this.m.Condition = 140;
		this.m.ConditionMax = 140;
		this.m.StaminaModifier = -8;
		this.randomizeValues();
	}

});

