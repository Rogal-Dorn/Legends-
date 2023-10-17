this.noble_sureshot <- this.inherit("scripts/entity/tactical/randomized_unit_abstract", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.NobleSureshot; 
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.NobleSureshot.XP;
		this.randomized_unit_abstract.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/military_ranged_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.randomized_unit_abstract.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.NobleSureshot);
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
		this.getSprite("socket").setBrush("bust_base_military");
	}

	function assignRandomEquipment()
	{
        this.randomized_unit_abstract.assignRandomEquipment();

		local banner = 3;

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
		if (armor.getUpgrade(this.Const.Items.ArmorUpgrades.Tabbard) != null)
		{
			armor.getUpgrade(this.Const.Items.ArmorUpgrades.Tabbard).setVariant(banner)
		}

		local helmet = this.m.Items.getItemAtSlot(this.Const.ItemSlot.Head);
        if ("setPlainVariant" in helmet) 
        { 
            helmet.setPlainVariant(); 
        }
	}

});

