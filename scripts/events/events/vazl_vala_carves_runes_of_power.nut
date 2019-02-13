this.vazl_vala_carves_runes_of_power <- this.inherit("scripts/events/event", {
	m = {
		Vala = null,
		Person = null,
		ItemToRune = null
	},
	function create()
	{
		this.m.ID = "event.vazl_vala_carves_runes_of_power";
		this.m.Title = "During camp...";
		this.m.Cooldown = 20 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/vazl_vala_carves_runes_of_power.png[/img]%vala% carves some runes onto %person%\'s weapon.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Fascinating.",
					function getResult( _event )
					{
						return 0;
					}
				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Vala.getImagePath());
				local randomizer = this.Math.rand(110, 120) * 0.01;
				_event.m.ItemToRune.m.RegularDamage = this.Math.round(_event.m.ItemToRune.m.RegularDamage * randomizer);
				_event.m.ItemToRune.m.RegularDamageMax = this.Math.round(_event.m.ItemToRune.m.RegularDamageMax * randomizer);
				local oldname = _event.m.ItemToRune.getName();
				_event.m.ItemToRune.m.Name = oldname + "[color=" + this.Const.UI.Color.RuneColor + "] (Runed)[/color]";

	
				local NewItem;
				if (_event.m.ItemToRune.m.ID == "weapon.player_banner")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_player_banner");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_dagger" || _event.m.ItemToRune.m.ID == "weapon.knife" || _event.m.ItemToRune.m.ID == "weapon.dagger" || _event.m.ItemToRune.m.ID == "weapon.rondel_dagger")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_dagger");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_sword" || _event.m.ItemToRune.m.ID == "weapon.shortsword" || _event.m.ItemToRune.m.ID == "weapon.falchion" || _event.m.ItemToRune.m.ID == "weapon.arming_sword" || _event.m.ItemToRune.m.ID == "weapon.noble_sword")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_sword");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_fencing_sword" || _event.m.ItemToRune.m.ID == "weapon.fencing_sword")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_fencing_sword");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_warbrand" || _event.m.ItemToRune.m.ID == "weapon.warbrand")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_warbrand");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_greatsword" || _event.m.ItemToRune.m.ID == "weapon.longsword" || _event.m.ItemToRune.m.ID == "weapon.greatsword")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_greatsword");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_mace" || _event.m.ItemToRune.m.ID == "weapon.wooden_stick" || _event.m.ItemToRune.m.ID == "weapon.bludgeon" || _event.m.ItemToRune.m.ID == "weapon.morning_star" || _event.m.ItemToRune.m.ID == "weapon.winged_mace")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_mace");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_two_handed_mace" || _event.m.ItemToRune.m.ID == "weapon.two_handed_mace" || _event.m.ItemToRune.m.ID == "weapon.two_handed_flanged_mace")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_two_handed_mace");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_spear" || _event.m.ItemToRune.m.ID == "weapon.militia_spear" || _event.m.ItemToRune.m.ID == "weapon.boar_spear" || _event.m.ItemToRune.m.ID == "weapon.fighting_spear")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_spear");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_spetum" || _event.m.ItemToRune.m.ID == "weapon.spetum")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_spetum");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_axe" || _event.m.ItemToRune.m.ID == "weapon.hatchet" || _event.m.ItemToRune.m.ID == "weapon.hand_axe" || _event.m.ItemToRune.m.ID == "weapon.fighting_axe")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_axe");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_greataxe" || _event.m.ItemToRune.m.ID == "weapon.woodcutters_axe" || _event.m.ItemToRune.m.ID == "weapon.greataxe")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_greataxe");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_longaxe" || _event.m.ItemToRune.m.ID == "weapon.longaxe")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_longaxe");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_flail" || _event.m.ItemToRune.m.ID == "weapon.wooden_flail" || _event.m.ItemToRune.m.ID == "weapon.reinforced_wooden_flail" || _event.m.ItemToRune.m.ID == "weapon.flail")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_flail");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_three_headed_flail" || _event.m.ItemToRune.m.ID == "weapon.three_headed_flail")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_three_headed_flail");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_two_handed_flail" || _event.m.ItemToRune.m.ID == "weapon.two_handed_wooden_flail" || _event.m.ItemToRune.m.ID == "weapon.two_handed_flail")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_two_handed_flail");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_cleaver" || _event.m.ItemToRune.m.ID == "weapon.butchers_cleaver" || _event.m.ItemToRune.m.ID == "weapon.scramasax" || _event.m.ItemToRune.m.ID == "weapon.military_cleaver")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_cleaver");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_warhammer" || _event.m.ItemToRune.m.ID == "weapon.pickaxe" || _event.m.ItemToRune.m.ID == "weapon.military_pick" || _event.m.ItemToRune.m.ID == "weapon.warhammer")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_warhammer");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_two_handed_hammer" || _event.m.ItemToRune.m.ID == "weapon.two_handed_wooden_hammer" || _event.m.ItemToRune.m.ID == "weapon.two_handed_hammer")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_two_handed_hammer");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_polehammer" || _event.m.ItemToRune.m.ID == "weapon.polehammer")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_polehammer");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_pike" || _event.m.ItemToRune.m.ID == "weapon.pitchfork" || _event.m.ItemToRune.m.ID == "weapon.pike")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_pike");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_billhook" || _event.m.ItemToRune.m.ID == "weapon.hooked_blade" || _event.m.ItemToRune.m.ID == "weapon.billhook")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_billhook");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_javelin" || _event.m.ItemToRune.m.ID == "weapon.javelin")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_javelin");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_throwing_axe" || _event.m.ItemToRune.m.ID == "weapon.throwing_axe")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_throwing_axe");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_warbow" || _event.m.ItemToRune.m.ID == "weapon.short_bow" || _event.m.ItemToRune.m.ID == "weapon.hunting_bow" || _event.m.ItemToRune.m.ID == "weapon.war_bow" || _event.m.ItemToRune.m.ID == "weapon.masterwork_bow")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_warbow");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_crossbow" || _event.m.ItemToRune.m.ID == "weapon.light_crossbow" || _event.m.ItemToRune.m.ID == "weapon.crossbow" || _event.m.ItemToRune.m.ID == "weapon.heavy_crossbow")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_crossbow");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.goedendag")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_goedendag");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.ancient_spear")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_ancient_spear");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.ancient_sword")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_ancient_sword");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.bladed_pike")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_bladed_pike");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.broken_ancient_sword")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_broken_ancient_sword");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.broken_bladed_pike")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_broken_bladed_pike");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.crypt_cleaver")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_cleaver");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.falx")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_falx");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.khopesh")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_khopesh");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.rhomphaia")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_rhomphaia");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.warscythe")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_warscythe");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.goblin_bow")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_goblin_bow");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.goblin_crossbow")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_goblin_crossbow");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.goblin_falchion")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_goblin_falchion");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.goblin_heavy_bow")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_goblin_heavy_bow");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.goblin_notched_blade")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_goblin_notched_blade");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.goblin_pike")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_goblin_pike");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.goblin_spear")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_goblin_spear");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.goblin_spiked_balls")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_goblin_spiked_balls");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.goblin_staff")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_goblin_staff");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_orc_axe" || _event.m.ItemToRune.m.ID == "weapon.orc_axe")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_orc_axe");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.orc_axe_2h")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_orc_axe_2h");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_orc_cleaver" || _event.m.ItemToRune.m.ID == "weapon.orc_cleaver")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_orc_cleaver");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.orc_flail_2h")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_orc_flail_2h");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.orc_javelin")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_orc_javelin");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.orc_metal_club")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_orc_metal_club");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.orc_wooden_club")
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_orc_wooden_club");
				}
				else
				{
					NewItem = this.new("scripts/items/weapons/runed/vazl_runed_dagger");
					this.logInfo("Vala carves runes of power  --  failed to find weapon ID match");
				}


				NewItem.m.ID = _event.m.ItemToRune.m.ID;
				NewItem.m.Name = _event.m.ItemToRune.m.Name;
				NewItem.m.Icon = _event.m.ItemToRune.m.Icon;
				NewItem.m.IconLarge = _event.m.ItemToRune.m.IconLarge;
				NewItem.m.Description = _event.m.ItemToRune.m.Description;
				NewItem.m.Categories = _event.m.ItemToRune.m.Categories;
				NewItem.m.Variant = _event.m.ItemToRune.m.Variant;
				NewItem.m.Condition = _event.m.ItemToRune.m.Condition;
				NewItem.m.ConditionMax = _event.m.ItemToRune.m.ConditionMax;
				NewItem.m.SlotType = _event.m.ItemToRune.m.SlotType;
				NewItem.m.BlockedSlotType = _event.m.ItemToRune.m.BlockedSlotType;
				NewItem.m.ItemType = _event.m.ItemToRune.m.ItemType;
				NewItem.m.ItemProperty = _event.m.ItemToRune.m.ItemProperty;
				NewItem.m.Value = _event.m.ItemToRune.m.Value;
				NewItem.m.IsGarbage = _event.m.ItemToRune.m.IsGarbage;
				NewItem.m.IsDroppedAsLoot = _event.m.ItemToRune.m.IsDroppedAsLoot;
				NewItem.m.IsDroppedWhenDamaged = _event.m.ItemToRune.m.IsDroppedWhenDamaged;
				NewItem.m.IsChangeableInBattle = _event.m.ItemToRune.m.IsChangeableInBattle;
				NewItem.m.IsIndestructible = _event.m.ItemToRune.m.IsIndestructible;
				NewItem.m.IsToBeRepaired = _event.m.ItemToRune.m.IsToBeRepaired;
				NewItem.m.IsConsumed = _event.m.ItemToRune.m.IsConsumed;
				NewItem.m.IsAllowedInBag = _event.m.ItemToRune.m.IsAllowedInBag;
				NewItem.m.IsUsable = _event.m.ItemToRune.m.IsUsable;
				NewItem.m.IsSold = _event.m.ItemToRune.m.IsSold;
				NewItem.m.IsBought = _event.m.ItemToRune.m.IsBought;
				NewItem.m.AddGenericSkill = _event.m.ItemToRune.m.AddGenericSkill;
				NewItem.m.ShowQuiver = _event.m.ItemToRune.m.ShowQuiver;
				NewItem.m.ShowArmamentIcon = _event.m.ItemToRune.m.ShowArmamentIcon;
				NewItem.m.ArmamentIcon = _event.m.ItemToRune.m.ArmamentIcon;
				NewItem.m.ArmamentIconBloody = _event.m.ItemToRune.m.ArmamentIconBloody;
				NewItem.m.BreakingSound = _event.m.ItemToRune.m.BreakingSound;
				NewItem.m.EquipSound = _event.m.ItemToRune.m.EquipSound;
				NewItem.m.RangeMin = _event.m.ItemToRune.m.RangeMin;
				NewItem.m.RangeMax = _event.m.ItemToRune.m.RangeMax;
				NewItem.m.RangeIdeal = _event.m.ItemToRune.m.RangeIdeal;
				NewItem.m.Ammo = _event.m.ItemToRune.m.Ammo;
				NewItem.m.AmmoMax = _event.m.ItemToRune.m.AmmoMax;
				NewItem.m.ShieldDamage = _event.m.ItemToRune.m.ShieldDamage;
				NewItem.m.RegularDamage = _event.m.ItemToRune.m.RegularDamage;
				NewItem.m.RegularDamageMax = _event.m.ItemToRune.m.RegularDamageMax;
				NewItem.m.ArmorDamageMult = _event.m.ItemToRune.m.ArmorDamageMult;
				NewItem.m.DirectDamageMult = _event.m.ItemToRune.m.DirectDamageMult;
				NewItem.m.DirectDamageAdd = _event.m.ItemToRune.m.DirectDamageAdd;
				NewItem.m.ChanceToHitHead = _event.m.ItemToRune.m.ChanceToHitHead;
				NewItem.m.AdditionalAccuracy = _event.m.ItemToRune.m.AdditionalAccuracy;
				NewItem.m.StaminaModifier = _event.m.ItemToRune.m.StaminaModifier;
				NewItem.m.IsDoubleGrippable = _event.m.ItemToRune.m.IsDoubleGrippable;
				NewItem.m.IsAgainstShields = _event.m.ItemToRune.m.IsAgainstShields;
				NewItem.m.IsAoE = _event.m.ItemToRune.m.IsAoE;
				NewItem.m.IsBloodied = _event.m.ItemToRune.m.IsBloodied;
				if (_event.m.ItemToRune.m.ID == "weapon.player_banner")
				{
					NewItem.setVariant(this.World.Assets.getBannerID());
				}


				_event.m.Person.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).removeSelf();
				_event.m.Person.getItems().equip(NewItem);


				this.List.push({
						id = 10,
						icon = "ui/items/" + _event.m.ItemToRune.getIcon(),
						text = _event.m.Person.getName() + " now has a " + _event.m.ItemToRune.getName()
				});
				_event.m.Vala.improveMood(2.0, "Carved runes of power onto " + _event.m.Person.getName() + "\'s weapon");
				_event.m.Person.improveMood(2.0, "Had runes of power carved onto their weapon, courtesy of " + _event.m.Vala.getName());
			}
		});
	}

	function onUpdateScore()
	{
		this.logInfo("Vala carves runes of power  --  onUpdateScore");
		local brothers = this.World.getPlayerRoster().getAll();
		local vala_candidates = [];
		local person_candidates = [];
		local item_candidates = [];


		if (this.World.getPlayerRoster().getSize() >= this.World.Assets.getBrothersMax())
		{
			return;
		}


		foreach (bro in brothers)
		{
			if (bro.getBackground().getID() == "background.vazl_vala")
			{
				vala_candidates.push(bro);
			}
		}
		if (vala_candidates.len() < 1)
		{
			return;
		}
		else
		{
			this.m.Vala = vala_candidates[this.Math.rand(0, vala_candidates.len() - 1)];
		}


		local IgnoredWeapons = [
			"weapon.lightbringer_sword",
			"weapon.obsidian_dagger",
			"weapon.lute",
			"weapon.wonky_bow",
			"weapon.throwing_spear"
		];


		foreach (bro in brothers)
		{
			if (bro.getID() != this.m.Vala.getID() && bro.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null && bro.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getName().find("(Runed)") == null && IgnoredWeapons.find(bro.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getID()) == null)
			{
				person_candidates.push(bro);
				item_candidates.push(bro.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand));
			}
		}
		if (person_candidates.len() < 1 || item_candidates.len() < 1)
		{
			return;
		}
		else
		{
			local personandweapon = this.Math.rand(0, person_candidates.len() - 1);
			this.m.Person = person_candidates[personandweapon];
			this.m.ItemToRune = item_candidates[personandweapon];
		}


		this.m.Score = this.m.Vala.getLevel() / 4;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"vala",
			this.m.Vala.getName()
		]);
		_vars.push([
			"person",
			this.m.Person.getName()
		]);
	}

	function onClear()
	{
		this.m.Vala = null;
		this.m.Person = null;
		this.m.ItemToRune = null;
	}
});
