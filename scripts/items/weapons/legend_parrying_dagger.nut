this.legend_parrying_dagger <- this.inherit("scripts/items/shields/shield", {
	m = {},
	function create()
	{
		this.shield.create();
		this.m.ID = "shield.legend_parrying_dagger";
		this.m.Name = "Parrying dagger";
		this.m.Description = "An offhand dagger for parrying an opponent, reducing their defenses by 10. Provides high defense vs a single opponents, but no defense while surrounded by more than one. ";
		this.m.AddGenericSkill = true;
		this.m.ShowOnCharacter = true;
		this.m.Variant = this.Math.rand(0, 9);
		this.updateVariant();
		this.m.Value = 500;
		this.m.MeleeDefense = 5;
		this.m.RangedDefense = 5;
		this.m.StaminaModifier = -2;
		this.m.Condition = 36;
		this.m.ConditionMax = 36;
	}

	function updateVariant()
	{
		this.m.Sprite = "icon_legend_parrying_dagger";
		this.m.SpriteDamaged = "icon_legend_parrying_dagger_damaged";
		this.m.ShieldDecal = "icon_legend_parrying_dagger_destroyed";
		this.m.IconLarge = "weapons/melee/legend_parrying_dagger_01.png";
		this.m.Icon = "weapons/melee/legend_parrying_dagger_01_70x70.png";
	}

	function onEquip()
	{
		this.shield.onEquip();
		this.addSkill(this.new("scripts/skills/actives/legend_en_garde"));
		this.addSkill(this.new("scripts/skills/actives/puncture"));
		this.addSkill(this.new("scripts/skills/effects/legend_parrying_dagger_effect"));
	}



});

