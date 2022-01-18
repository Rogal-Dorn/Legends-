this.perk_legend_specialist_cult_hood <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_specialist_cult_hood";
		this.m.Name = this.Const.Strings.PerkName.LegendSpecCultHood;
		this.m.Description = this.Const.Strings.PerkDescription.LegendSpecCultHood;
		this.m.Icon = "ui/perks/dedication_circle.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	} 

	function onAfterUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		local item = actor.getItems().getItemAtSlot(this.Const.ItemSlot.Head);
		local resolve = actor.getCurrentProperties().getBravery();
		local hasItem = false;

		if (item != null)
		{
			hasItem = item.isItemType(this.Const.Items.ItemType.Cultist)
			if (!hasItem && this.LegendsMod.Configs().LegendArmorsEnabled() && ::mods_isClass(item, "legend_helmet"))
			{
				foreach( upgrade in item.m.Upgrades )
				{
					if (upgrade.isItemType(this.Const.Items.ItemType.Cultist)){
						hasItem = true;
						break;
					}
				}
			}
		}
		if (hasItem){
			_properties.MeleeDefense += this.Math.floor(resolve * 0.15);
			_properties.RangedDefense += this.Math.floor(resolve * 0.15);
		}
	}

});

