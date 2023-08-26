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
		
		local item, itemtype, newTree;
		local actor = this.getContainer().getActor();
		
		if (actor.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null) item = this.getContainer().getActor().getMainhandItem();
		else if (actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand) != null) item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

		if (item == null) return;
		
		if (item.isItemType(this.Const.Items.ItemType.Weapon))
		{
			switch(true) {
				// check the special weapon first then the generic one

				//Shovel
					case item.isWeaponType(this.Const.Items.WeaponType.Shovel):
						newTree = this.Const.Perks.ShovelClassTree;
						break;

				//Sickle
					case item.isWeaponType(this.Const.Items.WeaponType.Sickle):
						newTree = this.Const.Perks.SickleClassTree;
						break;	

				//Wood Axe
					case item.isWeaponType(this.Const.Items.WeaponType.Woodaxe):
						newTree = this.Const.Perks.WoodaxeClassTree;
						break;

				//Blacksmith
					case item.isWeaponType(this.Const.Items.WeaponType.Blacksmith):
						newTree = this.Const.Perks.HammerClassTree;
						break;

				//Pickaxe
					case item.isWeaponType(this.Const.Items.WeaponType.Pickaxe):
						newTree = this.Const.Perks.PickaxeClassTree;
						break;

				//Butcher
					case item.isWeaponType(this.Const.Items.WeaponType.Butcher):
						newTree = this.Const.Perks.ButcherClassTree;
						break;

				//Ninetails
					case item.isWeaponType(this.Const.Items.WeaponType.Ninetails):
						newTree = this.Const.Perks.NinetailsClassTree;
						break;

				//Knife
					case item.isWeaponType(this.Const.Items.WeaponType.Knife):
						newTree = this.Const.Perks.KnifeClassTree;
						break;

				//Pitchfork
					case item.isWeaponType(this.Const.Items.WeaponType.Pitchfork):
						newTree = this.Const.Perks.PitchforkClassTree;
						break;

				//Musical
					case item.isWeaponType(this.Const.Items.WeaponType.Musical):
						newTree = this.Const.Perks.BardClassTree;
						break;

				//Shortbow
					case item.isWeaponType(this.Const.Items.WeaponType.Shortbow):
						newTree = this.Const.Perks.ShortbowClassTree;
						break;

				//Net
					case item.isItemType(this.Const.Items.ItemType.Net):
						newTree = this.Const.Perks.BeastClassTree;
						break;	

				//Mace
					case item.isWeaponType(this.Const.Items.WeaponType.Mace):
						newTree = this.Const.Perks.MaceTree;
						break;
				
				//Spear && SwordStaff
					case item.isWeaponType(this.Const.Items.WeaponType.Spear):
					case item.isWeaponType(this.Const.Items.WeaponType.Sword) && item.isItemType(this.Const.Items.ItemType.Staff):
						newTree = this.Const.Perks.SpearTree;
						break;

				//Goedendag 
					case item.isWeaponType(this.Const.Items.WeaponType.Spear) && item.isItemType(this.Const.Items.ItemType.Mace):
						switch (this.Math.rand(1,2)){
							case 1:
								newTree = this.Const.Perks.SpearTree;
								break
							case 2:
								newTree = this.Const.Perks.MaceTree;
								break
							}
						break;

				//Swordstaff
					
						newTree = this.Const.Perks.SpearTree;
						break;
				
				//Greatsword				
					case item.isWeaponType(this.Const.Items.WeaponType.Sword) && item.isItemType(this.Const.Items.ItemType.TwoHanded):
						newTree = this.Const.Perks.GreatSwordTree;
						break;

				//Sword
					case item.isWeaponType(this.Const.Items.WeaponType.Sword):
						newTree = this.Const.Perks.SwordTree;
						break;

				//Axe
					case item.isWeaponType(this.Const.Items.WeaponType.Axe):
						newTree = this.Const.Perks.AxeTree;
						break;
	
				//Flail
					case item.isWeaponType(this.Const.Items.WeaponType.Flail):
						newTree = this.Const.Perks.FlailTree;
						break;

				//Hammer
					case item.isWeaponType(this.Const.Items.WeaponType.Hammer):
						newTree = this.Const.Perks.HammerTree;
						break;		
						
				//Cleaver
					case item.isWeaponType(this.Const.Items.WeaponType.Cleaver):
						newTree = this.Const.Perks.CleaverTree;
						break;

				//Dagger
					case item.isWeaponType(this.Const.Items.WeaponType.Dagger):
						newTree = this.Const.Perks.DaggerTree;
						break;
	
				//Polearm
					case item.isWeaponType(this.Const.Items.WeaponType.Polearm):
						newTree = this.Const.Perks.PolearmTree;
						break;

				//Crossbow
					case item.isWeaponType(this.Const.Items.WeaponType.Crossbow):
						newTree = this.Const.Perks.CrossbowTree;
						break;	

				//Bow
					case item.isWeaponType(this.Const.Items.WeaponType.Bow):
						newTree = this.Const.Perks.BowTree;
						break;	

				//Throwing
					case item.isWeaponType(this.Const.Items.WeaponType.Throwing):
						newTree = this.Const.Perks.ThrowingTree;
						break;

				//Sling
					case item.isWeaponType(this.Const.Items.WeaponType.Sling):
						newTree = this.Const.Perks.SlingTree;
						break;

				//Staff
					case item.isWeaponType(this.Const.Items.WeaponType.Staff):
						newTree = this.Const.Perks.StaffTree;
						break;
			}
		}
		else if (item.isItemType(this.Const.Items.ItemType.Shield))
		{
			//Shield
			newTree = this.Const.Perks.ShieldTree;
		}
		else
		{
			switch(item.getID())
			{
				//Faith
				case "weapon.holy_water":
					newTree = this.Const.Perks.FaithClassTree;
					break;	
				//Juggler
					case "weapon.daze_bomb":
						newTree = this.Const.Perks.JugglerClassTree;
						break;	
				//Repair
					case "weapon.fire_bomb":
						newTree = this.Const.Perks.RepairClassTree;
						break;	
				//Healer
					case "weapon.acid_flask":
						newTree = this.Const.Perks.HealerClassTree;
						break;	
			}
		}	

		if (newTree != null && !actor.getBackground().hasPerkGroup(newTree)) 
		{
			actor.getBackground().addPerkGroup(newTree.Tree);
		}
		else
		{
			this.addRandomPerkGroup()
		}	   
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

