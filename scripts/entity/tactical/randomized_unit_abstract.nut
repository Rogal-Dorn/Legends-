this.randomized_unit_abstract <- this.inherit("scripts/entity/tactical/human", { 
	m = {
		Outfits = [],
		ClassPerkList = [],  // Virtually always empty?
		DefensePerkList = [],  // Doesn't affect base stats
		TraitsPerkList = [],
		GuaranteedPerks = [], // this will just be perks and not a tree? rarely do we want guaranteed perks,
		WeaponsAndTrees = [], // All weapons have an equal chance, the number is % to roll on the dagger tree. Can add more chances for weapons by just adding more entries for now
		LevelRange = [1, 1],
		EnemyLevel = 1, // our perk tree can buy up to the Level-1 row
		PerkPower = this.Const.PerkPurchasePower.Low
	},

	//TODO: 

	// EXP based on LevelRange -> tweak curve, for now it just exists
	// 		Currently entities will tend to have less exp than they did before

	// Link weapons to the respective trees so we don't have to have individual class trees in each array? (saves retyping it like 30 billion times)
	// 		Would be inside of a config file, probably the weapon name is a key and the respective tree/classtree are the two values
	// 		Could also check the weapon type + link weapon type to each tree similarly in a config file? uncertain how or if I want to deal with this

	// Add in chances for shields alongside the weapon tree?

	// Add in a way to see when hovering over a unit what kinds of perks it has? e.g. rolled Huge/Fit/Quick 

	function onInit() 
	{
		this.human.onInit();
		if (this.World.Assets.getCombatDifficulty() == this.Const.Difficulty.Legendary)
		{
			this.m.PerkPower -= 1;
		}
	}

	function create()
	{
		this.human.create();

		local defaultTableImBeingLazy = clone this.Const.RandomizedCharacterInfo["Default"];
		foreach(k, v in defaultTableImBeingLazy)
		{
			this.m[k] = v
		}

		if (this.m.Type in this.Const.RandomizedCharacterInfo) 
		{
			local randEntityTable = clone this.Const.RandomizedCharacterInfo[this.m.Type]
			foreach(k, v in randEntityTable)
			{
				this.m[k] = v
				this.logWarning("Adding in v: " + v)
				this.logWarning("For key: " + k)
				this.logWarning("In entity: " + this.m.Type)
			}
		}
		else {this.logWarning("Entity type didnt exist: " + this.m.Type)}
		

		this.m.EnemyLevel = this.Math.rand( this.m.LevelRange[0], this.m.LevelRange[1] )
		this.m.XP = this.m.EnemyLevel * 35;
	}

	function modifyAttributes( _attributes )
	{
		local b = this.m.BaseProperties;
		b.Hitpoints += this.Math.rand(_attributes.Hitpoints[0], _attributes.Hitpoints[1])
		b.Bravery += this.Math.rand(_attributes.Bravery[0], _attributes.Bravery[1])
		b.Stamina += this.Math.rand(_attributes.Stamina[0], _attributes.Stamina[1])
		b.MeleeSkill += this.Math.rand(_attributes.MeleeSkill[0], _attributes.MeleeSkill[1])
		b.RangedSkill += this.Math.rand(_attributes.RangedSkill[0], _attributes.RangedSkill[1])
		b.MeleeDefense += this.Math.rand(_attributes.MeleeDefense[0], _attributes.MeleeDefense[1])
		b.RangedDefense += this.Math.rand(_attributes.RangedDefense[0], _attributes.RangedDefense[1])
		b.Initiative += this.Math.rand(_attributes.Initiative[0], _attributes.Initiative[1])
	}


	function pickPerk( _purchaseLimit, _tree, _cap = 6)
	{
		if ( _cap > 6 ) { _cap = 6 } //idk i'm being lazy below this is fine to do trust me
		if ( _cap > _tree.len() ) { _cap = _tree.len() - 1 } 
		for (local i = 0; i <= _cap; i++)
		{
			local row = _tree[i]
			if ( row.len() != 0 && _purchaseLimit > 0) { //if empty we just cont
				local perkDefNum = row[0]
				local fullDef = clone this.Const.Perks.PerkDefObjects[perkDefNum]
				local toAdd = this.new(fullDef.Script)
				if (!this.m.Skills.hasSkill(toAdd.getID()))
				{
					this.m.Skills.add(toAdd)
					_purchaseLimit--
					this.m.PerkPower--
				}
			}
		}
	}

	function assignPerks()
	{
		// Do guaranteed perks first
		// I think these should not touch the purchased power, always guaranteed no matter what
		foreach (p in this.m.GuaranteedPerks)
		{
			local pAdd = this.new(p)
			if (!this.m.Skills.hasSkill(pAdd.getID()))
			{
				this.m.Skills.add(pAdd)
			}
		}


		// do *a* defense perk first
		// it'll end up picking like 1+ depending on base power, we the rest on traits
		local idx = this.Math.rand(0, this.m.DefensePerkList.len() - 1)
		this.logInfo("Going into our defense perk list with : " + this.m.PerkPower)
		pickPerk(this.m.PerkPower, this.m.DefensePerkList[idx].Tree, this.m.EnemyLevel - 1 )
		// do traits perks second
		// i'm willing to spend the entirity of perk power in one tree, otherwise we're gonna repeat and remove the perk tree until we exhaust all options
		while (this.m.PerkPower > 0 && this.m.TraitsPerkList.len() != 0)
		{
			this.logInfo("Going into our traits perk list with : " + this.m.PerkPower)
			local idx = this.Math.rand(0, this.m.TraitsPerkList.len() - 1)
			local selectedTree = this.m.TraitsPerkList.remove(idx)
			modifyAttributes(selectedTree.Attributes)
			pickPerk(this.m.PerkPower, selectedTree.Tree, this.m.EnemyLevel - 1 )
		}
	}

	function assignOutfit()
	{
		foreach( item in this.Const.World.Common.pickOutfit(this.m.Outfits) ) 
		{
			this.m.Items.equip(item);
		}
	}

	// Full default is always a knife, with a 100% chance to select the weapon perks
	function assignWeapon()
	{
		local idx = this.Math.rand(0, this.m.WeaponsAndTrees.len() - 1)
		local selection = this.m.WeaponsAndTrees[idx]
		// local test = selection[1].ID;
		this.m.Items.equip( this.new( selection[0] ) )
		local weapon = this.getMainhandItem();

		// IF we happen to pick the weapon perks
		local weaponPerkTree = this.Const.GetWeaponPerkTree(weapon)
		if (typeof weaponPerkTree == "array") 
		{
			weaponPerkTree = weaponPerkTree[this.Math.rand(0, weaponPerkTree.len() - 1)]
		}
		if (weaponPerkTree != null && selection.len() >= 2 && this.Math.rand(1, 100) <= selection[1])
		{
			pickPerk( this.m.PerkPower,  weaponPerkTree.Tree, this.m.EnemyLevel - 1)
			modifyAttributes( weaponPerkTree.Attributes )
		}

		
		local weaponClassTree = this.Const.GetWeaponClassTree(weapon)
		if (weaponClassTree != null && selection.len() >= 3 && this.Math.rand(1, 100) <= selection[2]) // > 2 means we have a chance to roll on the weapons applicable class tree perks
		{
			pickPerk( this.m.PerkPower,  weaponClassTree, this.m.EnemyLevel - 1)
			this.modifyAttributes(this.Const.RandomizedMalus)
		}
	
	}

	function assignRandomEquipment()
	{
		assignWeapon(); // This assigns weapon perks too
		assignOutfit(); // This does not assign things like nimble, opposite of assignWeapon
		assignPerks(); 
	}
});