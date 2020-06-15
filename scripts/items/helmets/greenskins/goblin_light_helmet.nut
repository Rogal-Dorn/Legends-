this.goblin_light_helmet <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		local variants = [
			1,
			1,
			3
		];
		this.m.Variant = variants[this.Math.rand(0, variants.len() - 1)];
		this.updateVariant();
		this.m.ID = "armor.head.goblin_light_helmet";
		this.m.Name = "Light Helmet";
		this.m.Description = "";
		this.m.ShowOnCharacter = true;
		this.m.IconLarge = "";
		this.m.Icon = "";
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -2;
	}

	function updateVariant()
	{
		this.m.Sprite = "bust_goblin_01_helmet_0" + this.m.Variant;
		this.m.SpriteDamaged = "bust_goblin_01_helmet_0" + this.m.Variant + "_damaged";
		this.m.SpriteCorpse = "bust_goblin_01_helmet_0" + this.m.Variant + "_dead";
	}

	function onUpdateProperties( _properties )
	{

		local staminaMult = 1.0;

		if (this.getContainer().getActor().getSkills().hasSkill("perk.brawny"))
		{
			staminaMult = 0.75;
		}
		_properties.Armor[this.Const.BodyPart.Head] += this.m.Condition;
		_properties.ArmorMax[this.Const.BodyPart.Head] += this.m.ConditionMax;
		_properties.Stamina += this.Math.ceil(this.m.StaminaModifier * staminaMult);
		_properties.Vision += this.m.Vision;
		_properties.IsAffectedByRain = false;
	}
});

