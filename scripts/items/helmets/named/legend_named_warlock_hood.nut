this.legend_named_warlock_hood <- this.inherit("scripts/items/helmets/named/named_helmet", {
	m = {},
	function create()
	{
		this.named_helmet.create();
		this.m.ID = "armor.head.legend_named_warlock_hood";
		this.m.Description = "A dark hood covering a helmet carved from the bones of the recently deceased. Imbued with the magics of both alps and hexen. Increases your Morale each time you get hit. Also grants +20 hitpoints, beware, you will lose 20 hitpoints when you remove it";
		this.m.Name = "Warlock hood"
		this.m.NameList = [
			"Dead Man\'s Head",
			"Necromancer\'s Headpiece",
			"Seance\'s Skull",
			"Warlock\'s Ward",
			"Sorceror\'s Hood",
			"Death Mask"
		];
		this.m.ShowOnCharacter = true;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.Variant = 508;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 5000;
		this.m.Condition = 180;
		this.m.ConditionMax = 180;
		this.m.StaminaModifier = 8;
		this.randomizeValues();
	}

	function getTooltip()
	{
		local result = this.named_helmet.getTooltip();
		result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Increases your morale each time you get hit. Also grants +20 hitpoints, beware, you will lose 20 hitpoints when you remove it"
		});
		return result;
	}

	function onEquip()
	{
		this.named_helmet.onEquip();
		local a = this.getContainer().getActor();

		if (a != null && !a.getSkills().hasSkill("perk.legend_taste_the_pain"))
		{
			_properties.Hitpoints += 20;
			a.getSkills().add(this.new("scripts/skills/perks/perk_legend_taste_the_pain"));
		}
	}

	function onUnequip()
	{
		local a = this.getContainer().getActor();
		if (a != null)
		{
			_properties.Hitpoints -= 20;
			a.getSkills().removeByID("perk.legend_taste_the_pain");
		}

		this.helmet.onUnequip();
	}

});

