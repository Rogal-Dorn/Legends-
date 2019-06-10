this.legend_stollwurm_helmet <- this.inherit("scripts/items/helmets/named/named_helmet", {
	m = {},
	function create()
	{
		this.named_helmet.create();
		this.m.ID = "armor.head.legend_stollwurm_helmet";
		this.m.Description = "A helmet made from the head of a stollwurm, grants immunity from being knocked or grabbed, immunity from morale penalties from being surrounded, and ensures you take no fatigue damage from being hit. Be warned, if you had these abilities before donning the helmet, then removing the helmet will strip those abilities.";
		this.m.NameList = [
			"Wurms visage",
			"Helm of the wurm",
			"Wurm Crown",
			"Wurm Helm",
			"Digging Crown",
			"Burrowers Crown"
		];
		this.m.ShowOnCharacter = true;
		this.m.HideHair = true;
		this.m.HideBeard = false;
		this.m.Variant = 515;
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 9000;
		this.m.Condition = 320;
		this.m.ConditionMax = 320;
		this.m.StaminaModifier = -16;
		this.m.Vision = -2;
		this.randomizeValues();
	}

	function onEquip()
	{
		this.helmet.onEquip();
		this.addSkill(this.new("scripts/skills/perks/perk_stalwart"));
		this.addSkill(this.new("scripts/skills/perks/perk_steadfast"));
		this.addSkill(this.new("scripts/skills/perks/perk_battleheart"));
	}
		function onUnequip()
	{
		this.helmet.onUnequip();
		this.removeSkill(this.new("scripts/skills/perks/perk_stalwart"));
		this.removeSkill(this.new("scripts/skills/perks/perk_steadfast"));
		this.removeSkill(this.new("scripts/skills/perks/perk_battleheart"));
	}
});

