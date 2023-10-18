this.randomized_unit_noble_abstract <- this.inherit("scripts/entity/tactical/randomized_unit_abstract", { 
	m = {},
	function onInit() 
	{
		this.randomized_unit_abstract.onInit();
        this.getSprite("socket").setBrush("bust_base_military");
	}

    function create()
	{
		this.randomized_unit_abstract.create();     
	}

	function assignRandomEquipment()
	{
        this.randomized_unit_abstract.assignRandomEquipment();

        local banner;
        if (!this.Tactical.State.isScenarioMode())
		{
			banner = this.World.FactionManager.getFaction(this.getFaction()).getBanner();
		}
		else
		{
			banner = this.getFaction();
		}

        this.m.Surcoat = banner;
		if (this.Math.rand(1, 100) <= 90)
		{
			this.getSprite("surcoat").setBrush("surcoat_" + (banner < 10 ? "0" + banner : banner));
		}

		local armor = this.m.Items.getItemAtSlot(this.Const.ItemSlot.Body);
		local tabard = armor.getUpgrade(this.Const.Items.ArmorUpgrades.Tabbard);
		if (tabard != null)
		{
			tabard.setVariant(banner);
		}

		local helmet = this.m.Items.getItemAtSlot(this.Const.ItemSlot.Head);
        if ("setPlainVariant" in helmet) 
        { 
            helmet.setPlainVariant(); 
        }

		this.m.Items.updateAppearance();
	}

    function setFemale()
    {
        this.setGender(1);
        this.m.Faces = this.Const.Faces.AllFemale;
		this.m.Hairs = this.Const.Hair.BarberFemale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Female;  
    }

    function setMale()
    {
		this.setGender(0);
        this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;  
    }

}); 