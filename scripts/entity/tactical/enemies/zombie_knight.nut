this.zombie_knight <- this.inherit("scripts/entity/tactical/enemies/zombie", {
	m = {},
	function create()
	{
		this.zombie.create();
		this.m.Type = this.Const.EntityType.ZombieKnight;
		this.m.BloodType = this.Const.BloodType.Dark;
		this.m.MoraleState = this.Const.MoraleState.Ignore;
		this.m.XP = this.Const.Tactical.Actor.ZombieKnight.XP;
		this.m.Name = this.Const.Strings.EntityName[this.m.Type];
		this.m.IsResurrectingOnFatality = true;
		this.m.ResurrectionValue = 5.0;
		this.m.ResurrectionChance = 90;
		this.m.ResurrectWithScript = "scripts/entity/tactical/enemies/zombie_knight";
	}

	function onDamageReceived( _attacker, _skill, _hitInfo )
	{
		if (this.m.IsHeadless)
		{
			_hitInfo.BodyPart = this.Const.BodyPart.Body;
		}

		return this.actor.onDamageReceived(_attacker, _skill, _hitInfo);
	}

	function onInit()
	{
		this.zombie.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.ZombieKnight);
		b.SurroundedBonus = 10;
		b.IsAffectedByNight = false;
		b.IsAffectedByInjuries = false;
		b.IsImmuneToBleeding = true;
		b.IsImmuneToPoison = true;

		if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 100)
		{
			b.MeleeSkill += 5;
			b.DamageTotalMult += 0.1;
		}

		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;

		 if (if ("Assets" in this.World && this.World.Assets != null && this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary))
			{
			this.m.Hitpoints = b.Hitpoints * 1.5;
			}
		this.m.CurrentProperties = clone b;
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		if (!this.Tactical.State.isScenarioMode() && _killer != null && _killer.isPlayerControlled())
		{
			this.updateAchievement("RestlessDead", 1, 1);
		}

		this.zombie.onDeath(_killer, _skill, _tile, _fatalityType);
	}

	function onResurrected( _info )
	{
		this.zombie.onResurrected(_info);

		if (!_info.IsHeadAttached)
		{
			this.m.IsHeadless = true;
			this.m.Name = "Headless " + this.Const.Strings.EntityName[this.m.Type];
			this.m.Items.unequip(this.m.Items.getItemAtSlot(this.Const.ItemSlot.Head));
			this.m.Sound[this.Const.Sound.ActorEvent.DamageReceived] = [];
			this.m.Sound[this.Const.Sound.ActorEvent.Death] = [];
			this.m.Sound[this.Const.Sound.ActorEvent.Resurrect] = [];
			this.m.Sound[this.Const.Sound.ActorEvent.Idle] = [];
			this.getSprite("head").setBrush("zombify_no_head");
			this.getSprite("head").Saturation = 1.0;
			this.getSprite("head").Color = this.createColor("#ffffff");
			this.getSprite("injury").Visible = false;
			this.getSprite("hair").resetBrush();
			this.getSprite("beard").resetBrush();
			this.getSprite("beard_top").resetBrush();
			this.getSprite("status_rage").resetBrush();
			this.getSprite("tattoo_head").resetBrush();
			this.getSprite("helmet").Visible = false;
			this.getSprite("helmet_damage").Visible = false;
			this.getSprite("body_blood").Visible = false;
			this.getSprite("dirt").Visible = false;
		}
	}

	function assignRandomEquipment()
	{
		local r;
		r = this.Math.rand(0, 8);

		if (r <= 1)
		{
			if (this.Const.DLC.Unhold)
			{
				r = this.Math.rand(1, 3);

				if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/longsword"));
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/greataxe"));
				}
				else if (r == 3)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/two_handed_flail"));
				}
			}
			else
			{
				r = this.Math.rand(1, 2);

				if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/longsword"));
				}
				else if (r == 2)
				{
					this.m.Items.equip(this.new("scripts/items/weapons/greataxe"));
				}
			}
		}
		else
		{
			if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/winged_mace"));
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/hand_axe"));
			}
			else if (r == 4)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/fighting_axe"));
			}
			else if (r == 5)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/morning_star"));
			}
			else if (r == 6)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/arming_sword"));
			}
			else if (r == 7)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/flail"));
			}
			else if (r == 8)
			{
				this.m.Items.equip(this.new("scripts/items/weapons/military_cleaver"));
			}

			if (this.isKindOf(this, "zombie_knight_bodyguard") && this.Math.rand(1, 100) <= 2)
			{
				if (this.Math.rand(1, 2) == 1)
				{
					this.m.Items.equip(this.new("scripts/items/shields/named/named_undead_heater_shield"));
				}
				else
				{
					this.m.Items.equip(this.new("scripts/items/shields/named/named_undead_kite_shield"));
				}
			}
			else if (this.Math.rand(1, 2) == 1)
			{
				this.m.Items.equip(this.new("scripts/items/shields/worn_heater_shield"));
			}
			else
			{
				this.m.Items.equip(this.new("scripts/items/shields/worn_kite_shield"));
			}
		}

		r = this.Math.rand(1, 3);
		local armor;

		if (r == 1)
		{
			armor = this.new("scripts/items/armor/decayed_coat_of_plates");
		}
		else if (r == 2)
		{
			armor = this.new("scripts/items/armor/decayed_coat_of_scales");
		}
		else if (r == 3)
		{
			armor = this.new("scripts/items/armor/decayed_reinforced_mail_hauberk");
		}

		if (this.Math.rand(1, 100) <= 33)
		{
			armor.setArmor(armor.getArmorMax() / 2 - 1);
		}

		this.m.Items.equip(armor);

		if (this.Math.rand(1, 100) <= 90)
		{
			r = this.Math.rand(1, 3);
			local helmet;

			if (r == 1)
			{
				if (this.Math.rand(1, 4) <= 3)
				{
					helmet = this.new("scripts/items/helmets/decayed_closed_flat_top_with_mail");
				}
				else
				{
					helmet = this.new("scripts/items/helmets/decayed_closed_flat_top_with_sack");
				}
			}
			else if (r == 2)
			{
				helmet = this.new("scripts/items/helmets/decayed_full_helm");
			}
			else if (r == 3)
			{
				helmet = this.new("scripts/items/helmets/decayed_great_helm");
			}

			if (this.Math.rand(1, 100) <= 33)
			{
				helmet.setArmor(helmet.getArmorMax() / 2 - 1);
			}

			this.m.Items.equip(helmet);
		}
	}

});
