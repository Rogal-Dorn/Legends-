this.legend_rock_unhold_racial <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "racial.legend_rock_unhold";
		this.m.Name = "Rock Unhold Passive";
		this.m.Description = "TODO";
		this.m.Icon = "skills/status_effect_79.png";
		this.m.SoundOnUse = [
			"sounds/enemies/unhold_regenerate_01.wav",
			"sounds/enemies/unhold_regenerate_02.wav",
			"sounds/enemies/unhold_regenerate_03.wav"
		];
		this.m.Type = this.Const.SkillType.Racial;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function onTurnStart()
	{
		local actor = this.getContainer().getActor();
		
		local missingBodyArmor = actor.getArmorMax(this.Const.BodyPart.Body) -  actor.getArmor(this.Const.BodyPart.Body);
		local addedBodyArmor = this.Math.min(missingBodyArmor, this.Math.floor(actor.getArmorMax(this.Const.BodyPart.Body) * 0.15));
		local missingHeadArmor = actor.getArmorMax(this.Const.BodyPart.Head) -  actor.getArmor(this.Const.BodyPart.Head);
		local addedHeadArmor = this.Math.min(missingHeadArmor, this.Math.floor(actor.getArmorMax(this.Const.BodyPart.Head) * 0.15));

		if (addedBodyArmor <= 0 && addedHeadArmor <= 0)
		{
			return;
		}

		if (actor.getSkills().hasSkill("effects.spider_poison_effect"))
		{
			return;
		}

		actor.setArmor(this.Const.BodyPart.Body, actor.getArmor(this.Const.BodyPart.Body) + addedBodyArmor);
		actor.setArmor(this.Const.BodyPart.Head, actor.getArmor(this.Const.BodyPart.Head) + addedHeadArmor);
		actor.setDirty(true);

		if (!actor.isHiddenToPlayer())
		{
			this.spawnIcon("status_effect_79", actor.getTile());

			if (this.m.SoundOnUse.len() != 0)
			{
				this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.25, actor.getPos());
			}

			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " regenerated " + addedBodyArmor + " points of body armor");
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(actor) + " regenerated " + addedHeadArmor + " points of head armor");
		}
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor().get();

		if ((!this.Tactical.State.isScenarioMode() && this.Time.getRound() <= 2 || this.Tactical.State.isScenarioMode() && this.Time.getRound() <= 3) && (this.isKindOf(actor, "unhold_armored") || this.isKindOf(actor, "unhold_frost_armored")))
		{
			_properties.InitiativeForTurnOrderAdditional += 40;
		}
	}

});

