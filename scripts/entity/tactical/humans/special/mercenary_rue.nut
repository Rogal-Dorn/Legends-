this.mercenary_rue <- this.inherit("scripts/entity/tactical/humans/special/mercenary_custom", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.Mercenary;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.Rue.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
        this.m.AIAgent = this.new("scripts/ai/tactical/agents/mercenary_rue_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.mercenary_custom.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.Rue);
		b.IsSpecializedInSwords = true;
		b.IsSpecializedInAxes = true;
		b.IsSpecializedInMaces = true;
		b.IsSpecializedInFlails = true;
		b.IsSpecializedInPolearms = true;
		b.IsSpecializedInThrowing = true;
		b.IsSpecializedInHammers = true;
		b.IsSpecializedInSpears = true;
		b.IsSpecializedInCleavers = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_militia");

		this.m.Skills.add(this.new("scripts/skills/actives/recover_skill"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_mind_over_body"));
        this.m.Skills.add(this.new("scripts/skills/perks/perk_nimble"));
	}

	function onAppearanceChanged( _appearance, _setDirty = true )
	{
		this.actor.onAppearanceChanged(_appearance, false);
		this.setDirty(true);
	}

	function assignRandomEquipment()
	{
		this.m.Items.equip(this.new("scripts/items/weapons/named/named_lute"));
        this.m.Items.equip(weapon);
        local armor = this.new("scripts/items/legend_armor/cloth/legend_gambeson_wolf");
        armor.m.ConditionMax = 150;
        armor.m.Condition = 150;
        armor.m.IsDroppedAsLoot = false;
        this.m.Items.equip(armor);
        local helm = this.new("scripts/items/helmets/named/jugglers_hat");
        helm.m.ConditionMax = 150;
        helm.m.Condition = 150;
        helm.m.IsDroppedAsLoot = false;
        helm.m.HideHair = false;
        this.m.Items.equip(helm);
	}

});

