this.legend_parrying_dagger <- this.inherit("scripts/items/shields/shield", {
	m = {
		Variants = []
	},
	function create()
	{
		this.shield.create();
		this.m.ID = "shield.legend_parrying_dagger";
		this.m.Name = "Parrying dagger";
		this.m.Description = "An offhand dagger for actively parrying an opponent.\n\n When parried or if an opponent misses you, their defences will be lowered.\n\n The \'Split Shield\' skill only does 20% damage against this dagger";
		this.m.AddGenericSkill = true;
		this.m.ShowOnCharacter = true;
		this.m.Variants = [1]
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() -1)];
		this.m.ItemType = this.Const.Items.ItemType.Defensive | this.Const.Items.ItemType.Weapon;
		this.updateVariant();
		this.m.Value = 500;
		this.m.MeleeDefense = 5;
		this.m.RangedDefense = 0;
		this.m.StaminaModifier = -2;
		this.m.Condition = 36;
		this.m.ConditionMax = 36;
	}

	function updateVariant()
	{
		this.m.Sprite = "icon_legend_parrying_dagger_0" + this.m.Variant;
		this.m.SpriteDamaged = "icon_legend_parrying_dagger_0" + this.m.Variant + "_damaged";
		this.m.ShieldDecal = "icon_legend_parrying_dagger_0" + this.m.Variant + "_destroyed";
		this.m.IconLarge = "weapons/melee/legend_parrying_dagger_0" + this.m.Variant + ".png";
		this.m.Icon = "weapons/melee/legend_parrying_dagger_0" + this.m.Variant + "_70x70.png";
	}

	function onEquip()
	{
		this.shield.onEquip();
		this.addSkill(this.new("scripts/skills/actives/legend_en_garde"));
		this.addSkill(this.new("scripts/skills/actives/puncture_parry_dagger"));
		this.addSkill(this.new("scripts/skills/effects/legend_parrying_dagger_effect"));
		// Manually add the effect so that it will be ordered after perks in the skill container instead of before background
		// Even though this effect is being granted by equipping this weapon, we are adding it this way because of possible future plans to make legend_parrying_effect available not just by equipping this weapon.
		// Hence, making ordering it with the other effects/perks instead of the row above background (for item-granted effects) is for consistency
		local parrying = this.new("scripts/skills/effects/legend_parrying_effect");
		parrying.m.IsFromItem = true;
		this.getContainer().getActor().getSkills().add(parrying);
	}

	function onUnequip()
	{
		local skill = this.getContainer().getActor().getSkills().getSkillByID("effects.legend_parrying");
		if (skill != null && skill.m.IsFromItem)
		{
			this.getContainer().getActor().getSkills().removeByID("effects.legend_parrying");
		}
		this.shield.onUnequip();
	}

	function getAmmoMax()
	{
		return 0;
	}



});

