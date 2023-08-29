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
		if (!this.m.IsNew) return;
		
		local item, itemtype, newTree;
		local actor = this.getContainer().getActor();
		this.m.IsNew = false;
		
		if (actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null) item = actor.getMainhandItem();
		else if (actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) != null) item = actor.getOffhandItem();

		if (item == null) return;
		
		if (item.isItemType(this.Const.Items.ItemType.Weapon)) newTree = this.getWeaponPerkTree(item);
		else if (item.isItemType(this.Const.Items.ItemType.Shield)) newTree = this.getShieldPerkTree(item); //Shield
		else newTree = this.getMiscPerkTree(item);

		if (newTree == null || actor.getBackground().hasPerkGroup(newTree)) this.addRandomPerkGroup();
		else actor.getBackground().addPerkGroup(newTree.Tree);
	}

	function getShieldPerkTree( _item )
	{
		return this.Const.Perks.ShieldTree;
	}

	function getMiscPerkTree(_item)
	{
		switch(_item.getID())
		{
			//Faith
			case "weapon.holy_water":
				return this.Const.Perks.FaithClassTree;

			//Juggler
			case "weapon.daze_bomb":
				return this.Const.Perks.JugglerClassTree;

			//Repair
			case "weapon.fire_bomb":
				return this.Const.Perks.RepairClassTree;

			//Healer
			case "weapon.acid_flask":
				return this.Const.Perks.HealerClassTree;
		}

		return null;
	}

	function getWeaponPerkTree( _item )
	{
		switch(true) {
			// check the special weapon types first then the generic weapon types

			//Shovel
				case _item.getID() == "weapon.legend_shovel" || _item.getID() == "weapon.legend_named_shovel":
					return this.Const.Perks.ShovelClassTree;

			//Sickle
				case _item.getID() == "weapon.sickle" || _item.getID() == "weapon.goblin_notched_blade" || _item.getID() == "weapon.legend_named_sickle":
					return this.Const.Perks.SickleClassTree;

			//Wood Axe
				case _item.getID() == "weapon.woodcutters_axe" || _item.getID() == "weapon.legend_saw":
					return this.Const.Perks.WoodaxeClassTree;

			//Blacksmith
				case _item.getID() == "weapon.legend_hammer" || _item.getID() == "weapon.legend_named_blacksmith_hammer":
					return this.Const.Perks.HammerClassTree;

			//Pickaxe
				case _item.getID() == "weapon.pickaxe":
					return this.Const.Perks.PickaxeClassTree;

			//Butcher
				case _item.getID() == "weapon.butchers_cleaver" || _item.getID() == "weapon.legend_named_butchers_cleaver":
					return this.Const.Perks.ButcherClassTree;

			//Ninetails
				case _item.getID() == "weapon.legend_cat_o_nine_tails":
					return this.Const.Perks.NinetailsClassTree;

			//Knife
				case _item.getID() == "weapon.knife" || _item.getID() == "weapon.legend_shiv":
					return this.Const.Perks.KnifeClassTree;

			//Scythe
				case _item.getID() == "weapon.legend_grisly_scythe" || _item.getID() == "weapon.legend_scythe" || _item.getID() == "weapon.warscythe" || _item.getID() == "weapon.named_warscythe":
					return this.Const.Perks.ScytheClassTree;

			//Pitchfork
				case _item.isItemType(this.Const.Items.ItemType.Pitchfork):
					return this.Const.Perks.PitchforkClassTree;

			//Musical
				case _item.isWeaponType(this.Const.Items.WeaponType.Musical):
					return this.Const.Perks.BardClassTree;

			//Shortbow
				case _item.isItemType(this.Const.Items.ItemType.Shortbow):
					return this.Const.Perks.ShortbowClassTree;

			//Net
				case _item.isItemType(this.Const.Items.ItemType.Net):
					return this.Const.Perks.BeastClassTree;

			//Militia
				case _item.getID() == "weapon.militia_spear" || _item.getID() == "weapon.legend_wooden_spear" || _item.getID() == "weapon.ancient_spear":
					return this.Const.Perks.MilitiaClassTree;

			//Goedendag 
				case _item.isWeaponType(this.Const.Items.WeaponType.Spear) && _item.isWeaponType(this.Const.Items.ItemType.Mace):
					switch (this.Math.rand(1,2))
					{
						case 1:
							return this.Const.Perks.SpearTree;
						case 2:
							return this.Const.Perks.MaceTree;
					}
					break;

			//Spear && SwordStaff
				case _item.isWeaponType(this.Const.Items.WeaponType.Spear):
				case _item.isWeaponType(this.Const.Items.WeaponType.Sword) && _item.isWeaponType(this.Const.Items.WeaponType.Staff):
					return this.Const.Perks.SpearTree;
			
			//Greatsword				
				case _item.isWeaponType(this.Const.Items.WeaponType.Sword) && _item.isItemType(this.Const.Items.ItemType.TwoHanded):
					return this.Const.Perks.GreatSwordTree;

			//Sword
				case _item.isWeaponType(this.Const.Items.WeaponType.Sword):
					return this.Const.Perks.SwordTree;

			//Mace
				case _item.isWeaponType(this.Const.Items.WeaponType.Mace):
					return this.Const.Perks.MaceTree;

			//Axe
				case _item.isWeaponType(this.Const.Items.WeaponType.Axe):
					return this.Const.Perks.AxeTree;

			//Flail
				case _item.isWeaponType(this.Const.Items.WeaponType.Flail):
					return this.Const.Perks.FlailTree;

			//Hammer
				case _item.isWeaponType(this.Const.Items.WeaponType.Hammer):
					return this.Const.Perks.HammerTree;	
					
			//Cleaver
				case _item.isWeaponType(this.Const.Items.WeaponType.Cleaver):
					return this.Const.Perks.CleaverTree;

			//Dagger
				case _item.isWeaponType(this.Const.Items.WeaponType.Dagger):
					return this.Const.Perks.DaggerTree;

			//Polearm
				case _item.isWeaponType(this.Const.Items.WeaponType.Polearm):
					return this.Const.Perks.PolearmTree;

			//Crossbow
				case _item.isWeaponType(this.Const.Items.WeaponType.Crossbow | this.Const.Items.WeaponType.Firearm):
					return this.Const.Perks.CrossbowTree;

			//Bow
				case _item.isWeaponType(this.Const.Items.WeaponType.Bow):
					return this.Const.Perks.BowTree;

			//Throwing
				case _item.isWeaponType(this.Const.Items.WeaponType.Throwing):
					return this.Const.Perks.ThrowingTree;

			//Sling
				case _item.isWeaponType(this.Const.Items.WeaponType.Sling):
					return this.Const.Perks.SlingTree;

			//Staff
				case _item.isWeaponType(this.Const.Items.WeaponType.Staff):
					return this.Const.Perks.StaffTree;
		}

		return null;
	}

	function addRandomPerkGroup()
	{
		local actor = this.getContainer().getActor();
		local allTrees = [
			this.Const.Perks.AgileTree,
			this.Const.Perks.IndestructibleTree,
			this.Const.Perks.MartyrTree,
			this.Const.Perks.ViciousTree,
			this.Const.Perks.DeviousTree,
			this.Const.Perks.InspirationalTree,
			this.Const.Perks.IntelligentTree,
			this.Const.Perks.CalmTree,
			this.Const.Perks.FastTree,
			this.Const.Perks.LargeTree,
			this.Const.Perks.OrganisedTree,
			this.Const.Perks.SturdyTree,
			this.Const.Perks.FitTree,
			this.Const.Perks.TrainedTree
		];

		// List to hold trees the actor does not have
		local availableTrees = [];

		foreach(tree in allTrees) {
			if(!actor.getBackground().hasPerkGroup(tree)) {
				availableTrees.append(tree);
			}
		}

		if(availableTrees.len() > 0) {
			local randomIndex = this.Math.rand(0, availableTrees.len()-1);
			local randomTree = availableTrees[randomIndex];
			actor.getBackground().addPerkGroup(randomTree.Tree);
		} else {
			actor.getBackground().addPerkGroup(this.Const.Perks.PhilosophyMagicTree.Tree);
		}
	}

});

