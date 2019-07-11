this.legend_named_warlock_cloak <- this.inherit("scripts/items/armor/named/named_armor", {
	m = {},
	function create()
	{
		this.named_armor.create();
		this.m.ID = "armor.body.legend_named_warlock_cloak";
		this.m.Description = "A cloak made from the skin of dead men and dark magic. +10% melee skill and defense when at confident morale. Also grants +20 hitpoints";
		this.m.Name = "Warlock cloak"
		this.m.NameList = [
			"Dead Man\'s Skin",
			"Necromancer\'s Robe",
			"Seance\'s Skin",
			"Warlock\'s Cloak",
			"Deathcloak",
			"Sorceror\'s Hood"
		];
		this.m.Variant = 508;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ClothEquip;
		this.m.Value = 5000;
		this.m.Condition = 180;
		this.m.ConditionMax = 180;
		this.m.StaminaModifier = 8;
		this.randomizeValues();
	}

	
	function getTooltip()
	{
		local result = this.named_armor.getTooltip();
		result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Grants +10% Melee skill and defense when at confident morale. Also grants +20 hitpoints, beware, you will lose 20 hitpoints when you remove it"
		});
		return result;
	}

	function onEquip()
	{
		this.named_armor.onEquip();
		local a = this.getContainer().getActor();

		if (a != null && !a.getSkills().hasSkill("perk.legend_assured_conquest"))
		{
			_properties.Hitpoints += 20;
			a.getSkills().add(this.new("scripts/skills/perks/perk_legend_assured_conquest"));
		}
	}

	function onUnequip()
	{
		local a = this.getContainer().getActor();
		if (a != null)
		{
			_properties.Hitpoints -= 20;
			a.getSkills().removeByID("perk.legend_assured_conquest");
		}

		this.named_armor.onUnequip();
	}
});

