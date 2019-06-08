this.legend_redback_helmet <- this.inherit("scripts/items/helmets/named/named_helmet", {
	m = {},
	function create()
	{
		this.named_helmet.create();
		this.m.ID = "armor.head.legend_redback_helmet";
		this.m.Description = "A sturdy yet light helmet made from the carapace of a redback spider. Grants poison immunity and the ability to make webs";
		this.m.NameList = [
			"Redback carapace",
			"Helm of the spider",
			"Arachnid Crown",
			"Spider Queen Helm",
			"Redback Crown",
			"Poison Crown"
		];
		this.m.ShowOnCharacter = true;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.Variant = 512;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 10000;
		this.m.Condition = 200;
		this.m.ConditionMax = 200;
		this.m.StaminaModifier = -9;
		this.m.Vision = -1;
		this.randomizeValues();
	}
	function onUpdateProperties( _properties )
	{
		_properties.IsImmuneToPoison = true;
	}
	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/web_skill"));
	}
});

