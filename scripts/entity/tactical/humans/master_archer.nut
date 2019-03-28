this.master_archer <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.MasterArcher;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.MasterArcher.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.SmartMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/bounty_hunter_ranged_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.MasterArcher);
		b.DamageDirectMult = 1.25;
		b.IsSpecializedInBows = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_militia");
		this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_bullseye"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fast_adaption"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_flow"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_head_hunter"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_pathfinder"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_nimble"));
		this.m.Skills.add(this.new("scripts/skills/actives/rotation"));
		this.m.Skills.add(this.new("scripts/skills/actives/footwork"));
		this.m.Skills.add(this.new("scripts/skills/actives/recover_skill"));
		if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_ballistics"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_close_combat_archer"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
			}

	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		if (!this.Tactical.State.isScenarioMode() && _killer != null && _killer.isPlayerControlled() && _skill != null && _skill.isRanged())
		{
			this.updateAchievement("Bullseye", 1, 1);
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

		if (this.Math.rand(1, 100) <= 66)
		{
			if (this.Math.rand(1, 100) <= 1)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/named/named_warbow"));
			}
			else
			{
				this.m.Items.equip(this.new("scripts/items/weapons/war_bow"));
			}

			this.m.Items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		}
		else
		{
			if (this.Math.rand(1, 100) <= 1)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/named/named_crossbow"));
			}
			else
			{
				this.m.Items.equip(this.new("scripts/items/weapons/heavy_crossbow"));
			}

			this.m.Items.equip(this.new("scripts/items/ammo/quiver_of_bolts"));
		}

		r = this.Math.rand(1, 3);

		if (r == 1)
		{
			this.m.Items.addToBag(this.new("scripts/items/weapons/dagger"));
		}
		else if (r == 2)
		{
			this.m.Items.addToBag(this.new("scripts/items/weapons/scramasax"));
		}
		else if (r == 3)
		{
			this.m.Items.addToBag(this.new("scripts/items/weapons/hatchet"));
		}

		r = this.Math.rand(1, 6);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/armor/thick_tunic"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/armor/padded_surcoat"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/armor/leather_lamellar"));
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/armor/basic_mail_shirt"));
		}
		else if (r == 5)
		{
			this.m.Items.equip(this.new("scripts/items/armor/ragged_surcoat"));
		}
		else if (r == 6)
		{
			this.m.Items.equip(this.new("scripts/items/armor/basic_mail_shirt"));
		}

		if (this.Math.rand(1, 100) <= 50)
		{
			local r = this.Math.rand(1, 2);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/hood"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/headscarf"));
			}
		}
	}

});
