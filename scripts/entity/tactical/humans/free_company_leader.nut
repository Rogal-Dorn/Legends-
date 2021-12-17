this.free_company_leader <- this.inherit("scripts/entity/tactical/human", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.FreeCompanyLeader;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.FreeCompanyLeader.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/bounty_hunter_melee_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.FreeCompanyLeader);
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
		this.getSprite("socket").setBrush("bust_base_militia");
	}

	function onAppearanceChanged( _appearance, _setDirty = true )
	{
		this.actor.onAppearanceChanged(_appearance, false);
		this.setDirty(true);
	}

	function assignRandomEquipment()
	{
		local r = this.Math.rand(1, 6);
		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/bardiche"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/greataxe"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/greatsword"));
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/two_handed_flanged_mace"));
		}
		else if (r == 5)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/legend_military_goedandag"));
		}
        else
        {
            this.m.Items.equip(this.new("scripts/items/weapons/fighting_axe"));
        }

		if (this.getIdealRange() == 1)
		{
			r = this.Math.rand(1, 2);

			if (r == 1)
			{
				this.m.Items.addToBag(this.new("scripts/items/weapons/throwing_axe"));
			}
			else if (r == 2)
			{
				this.m.Items.addToBag(this.new("scripts/items/weapons/javelin"));
			}
		}

		local outfits = [
            [1, "mercenary_leader_outfit_uncommon_00"],
            [1, "mercenary_leader_outfit_00"]
		]
		foreach( item in this.Const.World.Common.pickOutfit(outfits) ) 
        {
            this.m.Items.equip(item)
        }
	}

});

