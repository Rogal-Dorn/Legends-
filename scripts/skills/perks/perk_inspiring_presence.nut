this.perk_inspiring_presence <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.inspiring_presence";
		this.m.Name = this.Const.Strings.PerkName.InspiringPresence;
		this.m.Description = this.Const.Strings.PerkDescription.InspiringPresence;
		this.m.Icon = "ui/perks/perk_28.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}


	function onCombatStarted()
	{
		this.logInfo("inspiring presence: on combat started!");
		this.skill.onCombatStarted();
		local allies = this.Tactical.Entities.getInstancesOfFaction(this.getContainer().getActor().getFaction());
		local ownID = this.getContainer().getActor().getID();

		foreach( ally in allies )
		{
			if (ally.getID() == ownID)
			{
				continue;
			}

			if (ally.getMoraleState() != this.Const.MoraleState.Ignore)
			{
				local resolve = ally.getCurrentProperties().getBravery();
				local waverchance = (250 - resolve) / 100
				local r = this.Math.rand(1, 100);
				if (r >= resolve / 3)
				{
				ally.setMoraleState(this.Const.MoraleState.Confident);
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(ally) + " is confident due to an inspiring speech");
				}
				if (r <= waverchance)
				{
				ally.setMoraleState(this.Const.MoraleState.Wavering);
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(ally) + " is wavering after being scared by a speech");
				}
				else
				{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(ally) + " was not paying attention to a speech");
				}

			}
		}
	}

});

