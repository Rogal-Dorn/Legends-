this.perk_legend_adaptive <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_adaptive";
		this.m.Name = this.Const.Strings.PerkName.LegendAdaptive;
		this.m.Description = this.Const.Strings.PerkDescription.LegendAdaptive;
		this.m.Icon = "ui/perks/adaptive_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.IsNew) return
		
		local item;
		local itemtype;
		local newTree;

		if (actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null)
		{		
		 item = this.getContainer().getActor().getMainhandItem();
		}	
		else if (actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) != null)
		{
		 item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
		}
	
		if (item != null)
		{
		itemtype = item.getItemType()
		}
		
		switch(itemtype)
		{
			  case null:
					newTree = this.Const.Perks.FistsClassTree.Tree;
			  case Weapon:
					switch(item) {
					//Mace
						case "weapon.mace":
						case "weapon.bludgeon":
						case "weapon.claw_club":
						case "weapon.two_handed_spiked_mace":
						case "weapon.legend_bough":
						case "weapon.orc_metal_club":
						case "weapon.orc_wooden_club":
						case "weapon.named_mace":
						case "weapon.named_polemace":
						case "weapon.named_two_handed_mace":
						case "weapon.named_two_handed_spiked_mace":
						case "weapon.heavy_southern_mace":
						case "weapon.light_southern_mace":
						case "weapon.nomad_mace":
						case "weapon.polemace":
						case "weapon.two_handed_flanged_mace":
						case "weapon.two_handed_mace":
						case "weapon.winged_mace":
						case "weapon.wooden_stick":
							newTree = this.Const.Perks.MaceTree.Tree;
							break;
					//Shovel
						case "weapon.legend_named_shovel":
						case "weapon.legend_shovel":
							newTree = this.Const.Perks.ShoveClassTree.Tree;
							break;
					//Spear
						case "weapon.spear":
						case "weapon.ancient_spear":
						case "weapon.boar_spear":
						case "weapon.fighting_spear":
						case "weapon.goblin_spear":
						case "weapon.legend_battle_glaive":
						case "weapon.legend_glaive":
						case "weapon.named_spear":
						case "weapon.named_spetum":
						case "weapon.firelance":
						case "weapon.spetum":
							newTree = this.Const.Perks.SpearTree.Tree;
							break;
					//Goedendag 
						case "weapon.goedendag":
						case "weapon.legend_military_goedendag":
							local r = this.Math.rand(1,2);
							switch (r){
								case "1":
									newTree = this.Const.Perks.SpearTree.Tree;
									break
								case "2":
									newTree = this.Const.Perks.MaceTree.Tree;
									break
								}
							break;
					//Swordstaff
						case "weapon.legend_mage_swordstaff":
						case "weapon.legend_named_swordstaff":
						case "weapon.named_royal_lance":
							newTree = this.Const.Perks.SpearTree.Tree;
							break;
					//Sword
						case "weapon.ancient_sword":
						case "weapon.broken_ancient_sword":
						case "weapon.legend_gladius":
						case "weapon.legend_kopis":
						case "weapon.rhomphaia":
						case "weapon.arming_sword":
						case "weapon.falchion":
						case "weapon.fencing_sword":
						case "weapon.goblin_falchion":
						case "weapon.goblin_notched_blade":
						case "weapon.lightbringer_sword":
						case "weapon.legend_crusader_sword":
						case "weapon.legend_estoc":
						case "weapon.legend_named_gladius":
						case "weapon.named_shamshir":
						case "weapon.named_sword":
						case "weapon.noble_sword":
						case "weapon.saif":
						case "weapon.shamshir":
						case "weapon.shortsword":
							newTree = this.Const.Perks.SwordTree.Tree;
							break;
					//Sickle
						case "weapon.legend_sickle":
						case "weapon.legend_named_sickle":
							newTree = this.Const.Perks.SickleClassTree.Tree;
							break;	
					//Greatsword				
						case "weapon.greatsword":
						case "weapon.legend_man_mangler":
						case "weapon.legend_skin_flayer":
						case "weapon.legend_longsword":
						case "weapon.legend_named_longsword":
						case "weapon.longsword":
						case "weapon.named_warbrand":
						case "weapon.warbrand":
							newTree = this.Const.Perks.GreatswordTree.Tree;
							break;
					//Axe
						case "weapon.legend_fan_axe":
						case "weapon.axehammer":
						case "weapon.crude_axe":
						case "weapon.heavy_rusty_axe":
						case "weapon.bardiche":
						case "weapon.fighting_axe":
						case "weapon.greataxe":
						case "weapon.legend_meat_hacker":
						case "weapon.orc_axe":
						case "weapon.hand_axe":
						case "weapon.hatchet":
						case "weapon.legend_infantry_axe":
						case "weapon.legend_named_infantry_axe":
						case "weapon.longaxe":
						case "weapon.named_axe":
						case "weapon.named_bardiche":
						case "weapon.named_greataxe":
						case "weapon.named_heavy_rusty_axe":
						case "weapon.named_longaxe":
						case "weapon.named_orc_axe":
						case "weapon.named_orc_axe_2h":
							newTree = this.Const.Perks.SickleTree.Tree;
							break;
					//Wood Axe
						case "weapon.woodcutters_axe":
							newTree = this.Const.Perks.WoodaxeClassTree.Tree;
							break;		
					//Flail
						case "weapon.flail":
						case "weapon.orc_flail_2h":
						case "weapon.legend_chain":
						case "weapon.legend_ranged_flail":
						case "weapon.legend_ranged_wooden_flail":
						case "weapon.legend_reinforced_flail":
						case "weapon.legend_named_flail":
						case "weapon.named_flail":
						case "weapon.named_orc_flail_2h":
						case "weapon.named_three_headed_flail":
						case "weapon.named_two_handed_flail":
						case "weapon.reinforced_wooden_flail":
						case "weapon.three_headed_flail":
						case "weapon.two_handed_flail":
						case "weapon.two_handed_wooden_flail":
							newTree = this.Const.Perks.FlailTree.Tree;
							break;		
					//Wood Axe
						case "weapon.skull_hammer":
						case "weapon.legend_skullbreaker":
						case "weapon.legend_skullsmasher":
						case "weapon.legend_hammer":
						case "weapon.military_pick":
						case "weapon.legend_named_warhammer":
						case "weapon.named_polehammer":
						case "weapon.named_skullhammer":
						case "weapon.named_two_handed_hammer":
						case "weapon.named_warhammer":
						case "weapon.polehammer":
						case "weapon.two_handed_hammer":
						case "weapon.two_handed_wooden_hammer":
						case "weapon.warhammer":
							newTree = this.Const.Perks.HammerTree.Tree;
							break;	
					//Blacksmith
						case "weapon.legend_hammer":
						case "weapon.legend_named_blacksmith_hammer":
							newTree = this.Const.Perks.HammerClassTree.Tree;
							break;		
					//Pickaxe
						case "weapon.legend_hammer":
						case "weapon.legend_named_blacksmith_hammer":
							newTree = this.Const.Perks.PickaxeClassTree.Tree;
							break;	
					//Butcher
						case "weapon.butchers_cleaver":
						case "weapon.legend_named_butchers_cleaver":
							newTree = this.Const.Perks.ButcherClassTree.Tree;
							break;	
					//Ninetails
						case "weapon.legend_cat_o_nine_tails":
							newTree = this.Const.Perks.NinetailsClassTree.Tree;
							break;								
					//Cleaver
						case "weapon.crypt_cleaver":
						case "weapon.falx":
						case "weapon.khopesh":
						case "weapon.legend_great_khopesh":
						case "weapon.legend_khopesh":
						case "weapon.antler_cleaver":
						case "weapon.blunt_cleaver":
						case "weapon.rusty_warblade":
						case "weapon.thorned_whip":
						case "weapon.battle_whip":
						case "weapon.legend_bone_carver":
						case "weapon.legend_limb_lopper":
						case "weapon.orc_cleaver":
						case "weapon.legend_grisly_scythe":
						case "weapon.legend_military_voulge":
						case "weapon.legend_saw":
						case "weapon.legend_voulge":
						case "weapon.military_cleaver":
						case "weapon.legend_named_voulge":
						case "weapon.named_battle_whip":
						case "weapon.named_cleaver":
						case "weapon.named_crypt_cleaver":
						case "weapon.named_khopesh":
						case "weapon.named_legend_great_khopesh":
						case "weapon.named_orc_cleaver":
						case "weapon.named_rusty_warblade":
						case "weapon.named_two_handed_scimitar":
						case "weapon.two_handed_saif":
						case "weapon.two_handed_scimitar":
						case "weapon.scramasax":
							newTree = this.Const.Perks.CleaverTree.Tree;
							break;	
					//Dagger
						case "weapon.dagger":
						case "weapon.obsidian_dagger":
						case "weapon.legend_katar":
						case "weapon.legend_redback_dagger":
						case "weapon.legend_wooden_stake":
						case "weapon.named_dagger":
						case "weapon.named_qatal_dagger":
						case "weapon.qatal_dagger":
						case "weapon.rondel_dagger":
							newTree = this.Const.Perks.DaggerTree.Tree;
							break;		
					//Knife
						case "weapon.knife":
						case "weapon.legend_shiv":
							newTree = this.Const.Perks.KnifeClassTree.Tree;
							break;		
					//Pitchfork
						case "weapon.legend_wooden_pitchfork":
						case "weapon.pitchfork":
						case "weapon.legend_hoe":
						case "weapon.warfork":
						case "weapon.legend_scythe":
						case "weapon.wooden_flail":
							newTree = this.Const.Perks.PitchforkClassTree.Tree;
							break;		
					//Polearm
						case "weapon.faction_banner":
						case "weapon.player_banner":
						case "weapon.bladed_pike":
						case "weapon.broken_bladed_pike":
						case "weapon.warscythe":
						case "weapon.billhook":
						case "weapon.goblin_pike":
						case "weapon.hooked_blade":
						case "weapon.legend_halberd":
						case "weapon.legend_named_halberd":
						case "weapon.named_billhook":
						case "weapon.named_bladed_pike":
						case "weapon.named_goblin_pike":
						case "weapon.named_pike":
						case "weapon.named_swordlance":
						case "weapon.named_warscythe":
						case "weapon.swordlance":
						case "weapon.pike":
							newTree = this.Const.Perks.PolearmTree.Tree;
							break;	
					//Musical
						case "weapon.legend_drum":
						case "weapon.drum_item":
						case "weapon.lute":
						case "weapon.named_lute":
							newTree = this.Const.Perks.BardClassTree.Tree;
							break;		
					//Crossbow
						case "weapon.crossbow":
						case "weapon.goblin_crossbow":
						case "weapon.legend_blowgun":
						case "weapon.heavy_crossbow":
						case "weapon.light_crossbow":
						case "weapon.named_crossbow":
							newTree = this.Const.Perks.CrossbowTree.Tree;
							break;	
					//Bow
						case "weapon.goblin_bow":
						case "weapon.goblin_heavy_bow":
						case "weapon.masterwork_bow":
						case "weapon.amed_goblin_heavy_bow":
						case "weapon.named_warbow":
						case "weapon.composite_bow":
						case "weapon.war_bow":
							newTree = this.Const.Perks.BowTree.Tree;
							break;	
					//Shortbow
						case "weapon.shortbow":
						case "weapon.wonky_bow":
							newTree = this.Const.Perks.ShortbowClassTree.Tree;
							break;	
					//Throwing
						case "weapon.heavy_javelin":
						case "weapon.heavy_throwing_axe":
						case "weapon.goblin_spiked_balls":
						case "weapon.orc_javelin":
						case "weapon.javelin":
						case "weapon.named_javelin":
						case "weapon.named_throwing_axe":
						case "weapon.throwing_axe":
						case "weapon.throwing_spear":
							newTree = this.Const.Perks.ThrowingTree.Tree;
							break;	
					//Sling
						case "weapon.legend_sling":
						case "weapon.legend_slingshot":
						case "weapon.legend_slingstaff":
						case "weapon.nomad_sling":
						case "weapon.staff_sling":
							newTree = this.Const.Perks.SlingTree.Tree;
							break;
					//Staff
						case "weapon.legend_mystic_staff":
						case "weapon.legend_staff":
						case "weapon.legend_staff_gnarled":
						case "weapon.legend_staff_vala":
						case "weapon.legend_tipstaff":
							newTree = this.Const.Perks.StaffTree.Tree;
							break;
						  }
					break;
			  case Shield:
					newTree = this.Const.Perks.ShieldTree.Tree;
			  case Tool:
				  switch(item) {
					//Net
						case "tool.throwing_net":
						case "tool.reinforced_throwing_net":
							newTree = this.Const.Perks.BeastClassTree.Tree;
							break;	
					//Faith
						case "weapon.holy_water":
							newTree = this.Const.Perks.FaithClassTree.Tree;
							break;	
					//Juggler
						case "weapon.daze_bomb":
							newTree = this.Const.Perks.JugglerClassTree.Tree;
							break;	
					//Repair
						case "weapon.fire_bomb":
							newTree = this.Const.Perks.RepairClassTree.Tree;
							break;	
					//Healer
						case "weapon.acid_flask":
							newTree = this.Const.Perks.HealerClassTree.Tree;
							break;	
					}	
			}
		if (!this.getBackground().hasPerkGroup(newTree))
		{
		this.getBackground().addPerkGroup(newTree);
		}
		else
		{
		this.addRandomPerkGroup()
		}	   
			   
	}

	function addRandomPerkGroup()
	{
	local r = this.Math.rand(1,14);
	local randomTree;
		switch(r) {
		case "1":
			randomTree = this.Const.Perks.AgileTree.Tree;
			break;	
		case "2":
			randomTree = this.Const.Perks.IndestructibleTree.Tree;
			break;	
		case "3":
			randomTree = this.Const.Perks.MartyrTree.Tree;
			break;		
		case "4":
			randomTree = this.Const.Perks.ViciousTree.Tree;
			break;
		case "5":
			randomTree = this.Const.Perks.DeviousTree.Tree;
			break;
		case "6":
			randomTree = this.Const.Perks.InspirationalTree.Tree;
			break;
		case "7":
			randomTree = this.Const.Perks.IntelligentTree.Tree;
			break;
		case "8":
			randomTree = this.Const.Perks.CalmTree.Tree;
			break;
		case "9":
			randomTree = this.Const.Perks.FastTree.Tree;
			break;
		case "10":
			randomTree = this.Const.Perks.LargeTree.Tree;
			break;
		case "11":
			randomTree = this.Const.Perks.OrganisedTree.Tree;
			break;
		case "12":
			randomTree = this.Const.Perks.SturdyTree.Tree;
			break;
		case "13":
			randomTree = this.Const.Perks.FitTree.Tree;
			break;
		case "14":
			randomTree = this.Const.Perks.TrainedTree.Tree;
			break;
		}
		if (!this.getBackground().hasPerkGroup(randomTree))
		{
		this.getBackground().addPerkGroup(randomTree);
		}
		else
		{
		this.getBackground().addPerkGroup(PhilosophyMagicTree.Tree);
		}
	}

});

