this.craftable_schrat_shield <- this.inherit("scripts/items/shields/shield", {
	m = {},
	function create()
	{
		this.shield.create();
		this.m.ID = "shield.craftable_schrat";
		this.m.Name = "Living Tree Shield";
		this.m.Description = "This shield carved out of the remains of a living tree is lighter and sturdier than those made of common wood. At a glance, it almost looks as if its grotesque face is still moving.";
		this.m.AddGenericSkill = true;
		this.m.ShowOnCharacter = true;
		this.m.Variant = 8;
		this.updateVariant();
		this.m.Value = 700;
		this.m.MeleeDefense = 20;
		this.m.RangedDefense = 17;
		this.m.StaminaModifier = -12;
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
	}

	function updateVariant()
	{
		this.m.Sprite = "shield_named_0" + this.m.Variant;
		this.m.SpriteDamaged = "shield_named_0" + this.m.Variant + "_damaged";
		this.m.ShieldDecal = "shield_named_0" + this.m.Variant + "_destroyed";
		this.m.IconLarge = "shields/inventory_named_shield_0" + this.m.Variant + ".png";
		this.m.Icon = "shields/icon_named_shield_0" + this.m.Variant + ".png";
	}

	function onEquip()
	{
		this.shield.onEquip();
		this.addSkill(this.new("scripts/skills/actives/shieldwall"));
		this.addSkill(this.new("scripts/skills/actives/knock_back"));
	}

});
