this.bandit_leader <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.BanditLeader;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.BanditLeader.XP;
		this.m.Name = this.generateName();
		this.m.IsGeneratingKillName = false;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.UntidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Raider;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/bandit_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function generateName()
	{
		local vars = [
			[
				"randomname",
				this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]
			],
			[
				"randomtown",
				this.Const.World.LocationNames.VillageWestern[this.Math.rand(0, this.Const.World.LocationNames.VillageWestern.len() - 1)]
			]
		];
		return this.buildTextFromTemplate(this.Const.Strings.BanditLeaderNames[this.Math.rand(0, this.Const.Strings.BanditLeaderNames.len() - 1)], vars);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.BanditLeader);
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
		this.getSprite("socket").setBrush("bust_base_bandits");
		local dirt = this.getSprite("dirt");
		dirt.Visible = true;
		dirt.Alpha = this.Math.rand(150, 255);
		this.getSprite("armor").Saturation = 0.85;
		this.getSprite("helmet").Saturation = 0.85;
		this.getSprite("helmet_damage").Saturation = 0.85;
		this.getSprite("shield_icon").Saturation = 0.85;
		this.getSprite("shield_icon").setBrightness(0.85);
		this.m.Skills.add(this.new("scripts/skills/perks/perk_captain"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_shield_expert"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_brawny"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_nine_lives"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_sundering_strikes"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
		this.m.Skills.add(this.new("scripts/skills/actives/rotation"));
		this.m.Skills.add(this.new("scripts/skills/actives/recover_skill"));
		if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
			{
			this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_legend_composure"));
			this.m.Skills.add(this.new("scripts/skills/perks/perk_inspiring_presence"));
			this.m.Skills.add(this.new("scripts/skills/traits/fearless_trait"));
			}

	}

	function onAppearanceChanged( _appearance, _setDirty = true )
	{
		this.actor.onAppearanceChanged(_appearance, false);
		this.getSprite("armor").setBrightness(0.9);
		this.getSprite("helmet").setBrightness(0.9);
		this.getSprite("helmet_damage").setBrightness(0.9);
		this.setDirty(true);
	}

	function assignRandomEquipment()
	{
		local r = this.Math.rand(1, 8);

		if (r == 1)
		{
			r = this.Math.rand(0, 3);

			if (r <= 1)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/greatsword"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/greataxe"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/warbrand"));
			}
		}
		else
		{
			if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/noble_sword"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/fighting_axe"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/warhammer"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/boar_spear"));
			}
			else if (r == 6)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/winged_mace"));
			}
			else if (r == 7)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/arming_sword"));
			}
			else if (r == 8)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/military_cleaver"));
			}

			if (this.Math.rand(1, 100) <= 75)
			{
				r = this.Math.rand(1, 2);

				if (r == 1)
				{
					this.m.Items.addToBag(this.new("scripts/items/weapons/throwing_axe"));
				}
				else if (r == 2)
				{
					this.m.Items.addToBag(this.new("scripts/items/weapons/javelin"));
				}
			}

			if (this.Math.rand(1, 100) <= 1)
			{
				r = this.Math.rand(1, 3);

				if (r <= 2)
				{
					this.m.Items.equip(this.new("scripts/items/shields/named/named_bandit_heater_shield"));
				}
				else
				{
					this.m.Items.equip(this.new("scripts/items/shields/named/named_bandit_kite_shield"));
				}
			}
			else
			{
				r = this.Math.rand(1, 3);

				if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/shields/wooden_shield"));
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/shields/heater_shield"));
				}
				else if (r == 3)
				{
					this.m.Items.equip(this.new("scripts/items/shields/kite_shield"));
				}
			}
		}

		if (this.Const.DLC.Unhold)
		{
			r = this.Math.rand(1, 9);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/armor/reinforced_mail_hauberk"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/armor/worn_mail_shirt"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/armor/patched_mail_shirt"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/armor/mail_shirt"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/armor/basic_mail_shirt"));
			}
			else if (r == 6)
			{
				this.m.Items.equip(this.new("scripts/items/armor/lamellar_harness"));
			}
			else if (r == 7)
			{
				this.m.Items.equip(this.new("scripts/items/armor/footman_armor"));
			}
			else if (r == 8)
			{
				this.m.Items.equip(this.new("scripts/items/armor/leather_scale_armor"));
			}
			else if (r == 9)
			{
				this.m.Items.equip(this.new("scripts/items/armor/light_scale_armor"));
			}
		}
		else
		{
			r = this.Math.rand(1, 6);

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/armor/reinforced_mail_hauberk"));
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/armor/worn_mail_shirt"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/armor/patched_mail_shirt"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/armor/mail_shirt"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/armor/basic_mail_shirt"));
			}
			else if (r == 6)
			{
				this.m.Items.equip(this.new("scripts/items/armor/lamellar_harness"));
			}
		}

		local r = this.Math.rand(1, 9);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/closed_mail_coif"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/padded_kettle_hat"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/kettle_hat_with_closed_mail"));
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/kettle_hat_with_mail"));
		}
		else if (r == 5)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/padded_flat_top_helmet"));
		}
		else if (r == 6)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/nasal_helmet_with_mail"));
		}
		else if (r == 7)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/flat_top_with_mail"));
		}
		else if (r == 8)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/padded_nasal_helmet"));
		}
		else if (r == 9)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/bascinet_with_mail"));
		}
	}

});
