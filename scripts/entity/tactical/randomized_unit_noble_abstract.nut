this.randomized_unit_noble_abstract <- this.inherit("scripts/entity/tactical/randomized_unit_abstract", { 
	m = {
        FacBanner = -1
	},

	function onInit() 
	{
		this.randomized_unit_abstract.onInit();
	}

    function create()
	{
		this.randomized_unit_abstract.create();

  		if (!this.Tactical.State.isScenarioMode())
		{
			this.m.FacBanner = this.World.FactionManager.getFaction(this.getFaction()).getBanner();
		}
		else
		{
			this.m.FacBanner = this.getFaction();
		}
	}

	function assignRandomEquipment()
	{
        this.randomized_unit_abstract.assignRandomEquipment();
        this.m.Surcoat = this.m.FacBanner;
        
		if (this.Math.rand(1, 100) <= 90)
		{
			this.getSprite("surcoat").setBrush("surcoat_" + (this.m.FacBanner < 10 ? "0" + this.m.FacBanner : this.m.FacBanner));
		}

		local armor = this.m.Items.getItemAtSlot(this.Const.ItemSlot.Body);
		local tabard = armor.getUpgrade(this.Const.Items.ArmorUpgrades.Tabbard);
		if (tabard != null)
		{
			tabard.setVariant(this.m.FacBanner);
		}

		local helmet = this.m.Items.getItemAtSlot(this.Const.ItemSlot.Head);
        if ("setPlainVariant" in helmet) 
        { 
            helmet.setPlainVariant(); 
        }

		this.m.Items.updateAppearance();
	}
}); 