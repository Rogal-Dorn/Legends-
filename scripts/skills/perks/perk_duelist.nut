this.perk_duelist <- this.inherit("scripts/skills/skill", {
	m = {
		AllowedWeapons = [
			"_parrying_dagger",
			"_hand_crossbow",
			"buckler",
		],
	},
	function create()
	{
		this.m.ID = "perk.duelist";
		this.m.Name = this.Const.Strings.PerkName.Duelist;
		this.m.Description = this.Const.Strings.PerkDescription.Duelist;
		this.m.Icon = "skills/passive_03.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		local main = getContainer().getActor().getMainhandItem();

		if (main == null)
			return;

		local off = getContainer().getActor().getOffhandItem();

		if (getContainer().hasSkill("injury.missing_hand") || off == null && !main.isItemType(::Const.Items.ItemType.TwoHanded) || off != null && off.isItemType(::Const.Items.ItemType.Tool))
			_properties.DamageDirectAdd += 0.25;
		else if (off == null)
			return;

		foreach( valid in m.AllowedWeapons )
		{
			if (!::MSU.String.endsWith(off.getID(), valid))
				continue;

			_properties.DamageDirectAdd += 0.12;
			break;
		}
	}

});

