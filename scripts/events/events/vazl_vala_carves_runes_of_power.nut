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
			Text = "[img]gfx/ui/events/vazl_vala_carves_runes_of_power.png[/img]%vala% carves some runes onto %person%\'s %item%.",
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


				local NewItem;
				if (_event.m.ItemToRune.m.ID == "weapon.player_banner")
				{
					NewItem = this.new("scripts/items/weapons/runed/banner/vazl_runed_player_banner");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.lightbringer_sword")
				{
					NewItem = this.new("scripts/items/weapons/runed/legendary/vazl_runed_lightbringer_sword");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.obsidian_dagger")
				{
					NewItem = this.new("scripts/items/weapons/runed/legendary/vazl_runed_obsidian_dagger");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.lute")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_lute");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.goedendag")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_goedendag");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.knife")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_knife");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.dagger")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_dagger");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.rondel_dagger")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_rondel_dagger");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.shortsword")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_shortsword");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.falchion")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_falchion");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.arming_sword")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_arming_sword");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.noble_sword")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_noble_sword");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.fencing_sword")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_fencing_sword");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.warbrand")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_warbrand");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.longsword")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_longsword");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.greatsword")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_greatsword");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.wooden_stick")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_wooden_stick");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.bludgeon")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_bludgeon");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.morning_star")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_morning_star");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.winged_mace")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_winged_mace");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.two_handed_mace")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_two_handed_mace");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.two_handed_flanged_mace")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_two_handed_flanged_mace");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.militia_spear")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_militia_spear");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.boar_spear")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_boar_spear");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.fighting_spear")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_fighting_spear");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.spetum")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_spetum");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.hatchet")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_hatchet");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.hand_axe")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_hand_axe");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.fighting_axe")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_fighting_axe");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.woodcutters_axe")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_woodcutters_axe");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.greataxe")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_greataxe");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.longaxe")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_longaxe");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.wooden_flail")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_wooden_flail");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.reinforced_wooden_flail")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_reinforced_wooden_flail");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.flail")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_flail");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.three_headed_flail")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_three_headed_flail");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.two_handed_wooden_flail")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_two_handed_wooden_flail");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.two_handed_flail")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_two_handed_flail");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.butchers_cleaver")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_butchers_cleaver");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.scramasax")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_scramasax");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.military_cleaver")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_military_cleaver");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.pickaxe")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_pickaxe");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.military_pick")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_military_pick");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.warhammer")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_warhammer");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.two_handed_wooden_hammer")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_two_handed_wooden_hammer");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.two_handed_hammer")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_two_handed_hammer");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.polehammer")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_polehammer");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.pitchfork")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_pitchfork");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.pike")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_pike");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.hooked_blade")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_hooked_blade");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.billhook")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_billhook");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.javelin")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_javelin");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.throwing_axe")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_throwing_axe");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.wonky_bow")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_wonky_bow");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.short_bow")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_short_bow");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.hunting_bow")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_hunting_bow");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.war_bow")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_war_bow");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.masterwork_bow")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_masterwork_bow");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.light_crossbow")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_light_crossbow");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.crossbow")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_crossbow");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.heavy_crossbow")
				{
					NewItem = this.new("scripts/items/weapons/runed/regular/vazl_runed_heavy_crossbow");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.ancient_spear")
				{
					NewItem = this.new("scripts/items/weapons/runed/ancient/vazl_runed_ancient_spear");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.ancient_sword")
				{
					NewItem = this.new("scripts/items/weapons/runed/ancient/vazl_runed_ancient_sword");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.bladed_pike")
				{
					NewItem = this.new("scripts/items/weapons/runed/ancient/vazl_runed_bladed_pike");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.broken_ancient_sword")
				{
					NewItem = this.new("scripts/items/weapons/runed/ancient/vazl_runed_broken_ancient_sword");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.broken_bladed_pike")
				{
					NewItem = this.new("scripts/items/weapons/runed/ancient/vazl_runed_broken_bladed_pike");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.crypt_cleaver")
				{
					NewItem = this.new("scripts/items/weapons/runed/ancient/vazl_runed_crypt_cleaver");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.falx")
				{
					NewItem = this.new("scripts/items/weapons/runed/ancient/vazl_runed_falx");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.khopesh")
				{
					NewItem = this.new("scripts/items/weapons/runed/ancient/vazl_runed_khopesh");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.rhomphaia")
				{
					NewItem = this.new("scripts/items/weapons/runed/ancient/vazl_runed_rhomphaia");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.warscythe")
				{
					NewItem = this.new("scripts/items/weapons/runed/ancient/vazl_runed_warscythe");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.goblin_bow")
				{
					NewItem = this.new("scripts/items/weapons/runed/greenskins/vazl_runed_goblin_bow");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.goblin_crossbow")
				{
					NewItem = this.new("scripts/items/weapons/runed/greenskins/vazl_runed_goblin_crossbow");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.goblin_falchion")
				{
					NewItem = this.new("scripts/items/weapons/runed/greenskins/vazl_runed_goblin_falchion");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.goblin_heavy_bow")
				{
					NewItem = this.new("scripts/items/weapons/runed/greenskins/vazl_runed_goblin_heavy_bow");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.goblin_notched_blade")
				{
					NewItem = this.new("scripts/items/weapons/runed/greenskins/vazl_runed_goblin_notched_blade");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.goblin_pike")
				{
					NewItem = this.new("scripts/items/weapons/runed/greenskins/vazl_runed_goblin_pike");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.goblin_spear")
				{
					NewItem = this.new("scripts/items/weapons/runed/greenskins/vazl_runed_goblin_spear");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.goblin_spiked_balls")
				{
					NewItem = this.new("scripts/items/weapons/runed/greenskins/vazl_runed_goblin_spiked_balls");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.goblin_staff")
				{
					NewItem = this.new("scripts/items/weapons/runed/greenskins/vazl_runed_goblin_staff");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.orc_axe")
				{
					NewItem = this.new("scripts/items/weapons/runed/greenskins/vazl_runed_orc_axe");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.orc_axe_2h")
				{
					NewItem = this.new("scripts/items/weapons/runed/greenskins/vazl_runed_orc_axe_2h");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.orc_cleaver")
				{
					NewItem = this.new("scripts/items/weapons/runed/greenskins/vazl_runed_orc_cleaver");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.orc_flail_2h")
				{
					NewItem = this.new("scripts/items/weapons/runed/greenskins/vazl_runed_orc_flail_2h");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.orc_javelin")
				{
					NewItem = this.new("scripts/items/weapons/runed/greenskins/vazl_runed_orc_javelin");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.orc_metal_club")
				{
					NewItem = this.new("scripts/items/weapons/runed/greenskins/vazl_runed_orc_metal_club");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.orc_wooden_club")
				{
					NewItem = this.new("scripts/items/weapons/runed/greenskins/vazl_runed_orc_wooden_club");
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_axe")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_axe_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_axe_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_axe_3");
					}
					else if (_event.m.ItemToRune.m.Variant == "4")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_axe_4");
					}
					else if (_event.m.ItemToRune.m.Variant == "5")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_axe_5");
					}
					else if (_event.m.ItemToRune.m.Variant == "6")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_axe_6");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_axe_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_billhook")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_billhook_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_billhook_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_billhook_3");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_billhook_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_cleaver")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_cleaver_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_cleaver_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_cleaver_3");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_cleaver_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_crossbow")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_crossbow_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_crossbow_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_crossbow_3");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_crossbow_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_dagger")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_dagger_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_dagger_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_dagger_3");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_dagger_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_fencing_sword")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_fencing_sword_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_fencing_sword_2");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_fencing_sword_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_flail")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_flail_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_flail_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_flail_3");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_flail_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_greataxe")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_greataxe_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_greataxe_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_greataxe_3");
					}
					else if (_event.m.ItemToRune.m.Variant == "4")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_greataxe_4");
					}
					else if (_event.m.ItemToRune.m.Variant == "5")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_greataxe_5");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_greataxe_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_greatsword")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_greatsword_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_greatsword_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_greatsword_3");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_greatsword_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_javelin")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_javelin_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_javelin_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_javelin_3");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_javelin_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_longaxe")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_longaxe_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_longaxe_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_longaxe_3");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_longaxe_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_mace")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_mace_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_mace_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_mace_3");
					}
					else if (_event.m.ItemToRune.m.Variant == "4")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_mace_4");
					}
					else if (_event.m.ItemToRune.m.Variant == "5")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_mace_5");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_mace_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_orc_axe")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_orc_axe_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_orc_axe_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_orc_axe_3");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_orc_axe_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_orc_cleaver")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_orc_cleaver_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_orc_cleaver_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_orc_cleaver_3");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_orc_cleaver_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_pike")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_pike_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_pike_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_pike_3");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_pike_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_polehammer")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_polehammer_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_polehammer_2");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_polehammer_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_spear")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_spear_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_spear_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_spear_3");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_spear_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_spetum")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_spetum_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_spetum_2");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_spetum_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_sword")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_sword_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_sword_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_sword_3");
					}
					else if (_event.m.ItemToRune.m.Variant == "4")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_sword_4");
					}
					else if (_event.m.ItemToRune.m.Variant == "5")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_sword_5");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_sword_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_three_headed_flail")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_three_headed_flail_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_three_headed_flail_2");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_three_headed_flail_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_throwing_axe")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_throwing_axe_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_throwing_axe_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_throwing_axe_3");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_throwing_axe_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_two_handed_flail")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_two_handed_flail_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_two_handed_flail_2");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_two_handed_flail_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_two_handed_hammer")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_two_handed_hammer_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_two_handed_hammer_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_two_handed_hammer_3");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_two_handed_hammer_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_two_handed_mace")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_two_handed_mace_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_two_handed_mace_2");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_two_handed_mace_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_warbow")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_warbow_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_warbow_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_warbow_3");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_warbow_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_warbrand")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_warbrand_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_warbrand_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_warbrand_3");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_warbrand_1");
					}
				}
				else if (_event.m.ItemToRune.m.ID == "weapon.named_warhammer")
				{
					if (_event.m.ItemToRune.m.Variant == "1")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_warhammer_1");
					}
					else if (_event.m.ItemToRune.m.Variant == "2")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_warhammer_2");
					}
					else if (_event.m.ItemToRune.m.Variant == "3")
					{
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_warhammer_3");
					}
					else
					{
						this.logInfo("Vala carves runes of power  --  failed to find weapon variant match");
						NewItem = this.new("scripts/items/weapons/runed/named/vazl_runed_named_warhammer_1");
					}
				}
				else
				{
					this.logInfo("Vala carves runes of power  --  failed to find weapon ID match");
					return 0;
				}


				local damage_randomizer = this.Math.rand(110, 120) * 0.01;
				local durability_randomizer = this.Math.rand(10, 20);
				NewItem.m.RegularDamage = this.Math.round(_event.m.ItemToRune.m.RegularDamage * damage_randomizer);
				NewItem.m.RegularDamageMax = this.Math.round(_event.m.ItemToRune.m.RegularDamageMax * damage_randomizer);
				NewItem.m.Condition = this.Math.round(_event.m.ItemToRune.m.Condition + durability_randomizer);
				NewItem.m.ConditionMax = this.Math.round(_event.m.ItemToRune.m.ConditionMax + durability_randomizer);
				NewItem.m.Name = _event.m.ItemToRune.m.Name + "[color=" + this.Const.UI.Color.RuneColor + "] (Runed)[/color]";
				NewItem.m.ShieldDamage = _event.m.ItemToRune.m.ShieldDamage;
				NewItem.m.ArmorDamageMult = _event.m.ItemToRune.m.ArmorDamageMult;
				NewItem.m.DirectDamageAdd = _event.m.ItemToRune.m.DirectDamageAdd;
				NewItem.m.ChanceToHitHead = _event.m.ItemToRune.m.ChanceToHitHead;
				NewItem.m.AdditionalAccuracy = _event.m.ItemToRune.m.AdditionalAccuracy;
				NewItem.m.StaminaModifier = _event.m.ItemToRune.m.StaminaModifier;
				if (_event.m.ItemToRune.m.ID == "weapon.player_banner")
				{
					NewItem.setVariant(this.World.Assets.getBannerID());
				}


				this.List.push({
						id = 10,
						icon = "ui/items/" + _event.m.ItemToRune.getIcon(),
						text = _event.m.Person.getName() + " now has a " + NewItem.getName()
				});


				_event.m.Person.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).removeSelf();
				_event.m.Person.getItems().equip(NewItem);
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
		_vars.push([
			"item",
			this.m.ItemToRune.getName()
		]);
	}


	function onClear()
	{
		this.m.Vala = null;
		this.m.Person = null;
		this.m.ItemToRune = null;
	}
});
