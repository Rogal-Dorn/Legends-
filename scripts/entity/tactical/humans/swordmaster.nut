this.swordmaster <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.Swordmaster;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.Swordmaster.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.SmartMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/bounty_hunter_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.Swordmaster);
		b.IsSpecializedInSwords = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_militia");
		this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fast_adaption"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_flow"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_nimble"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_dodge"));
		this.m.Skills.add(this.new("scripts/skills/actives/footwork"));
		this.m.Skills.add(this.new("scripts/skills/actives/recover_skill"));
	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		if (!this.Tactical.State.isScenarioMode() && _killer != null && _killer.isPlayerControlled() && _skill != null && !_skill.isRanged())
		{
			this.updateAchievement("ThereCanBeOnlyOne", 1, 1);
		}

		this.human.onDeath(_killer, _skill, _tile, _fatalityType);
	}

	function onAppearanceChanged( _appearance, _setDirty = true )
	{
		this.actor.onAppearanceChanged(_appearance, false);
		this.setDirty(true);
	}

	function assignRandomEquipment()
	{
		local r;

		if (this.Math.rand(1, 100) <= 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/named/named_sword"));
		}
		else
		{
			r = this.Math.rand(1, 2);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/noble_sword"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/arming_sword"));
			}
		}

		if (this.Const.DLC.Unhold)
		{
			r = this.Math.rand(1, 6);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/armor/mail_shirt"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/armor/basic_mail_shirt"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/armor/mail_hauberk"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/armor/footman_armor"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/armor/leather_scale_armor"));
			}
			else if (r == 6)
			{
				this.m.Items.equip(this.new("scripts/items/armor/light_scale_armor"));
			}
		}
		else
		{
			r = this.Math.rand(1, 3);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/armor/mail_shirt"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/armor/basic_mail_shirt"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/armor/mail_hauberk"));
			}
		}

		if (this.Math.rand(1, 100) <= 90)
		{
			local r = this.Math.rand(1, 5);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/nasal_helmet"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/nasal_helmet_with_mail"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/mail_coif"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/headscarf"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/feathered_hat"));
			}
		}
	}

});
