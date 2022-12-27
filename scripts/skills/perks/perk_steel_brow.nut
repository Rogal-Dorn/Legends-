this.perk_steel_brow <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.steel_brow";
		this.m.Name = this.Const.Strings.PerkName.SteelBrow;
		this.m.Description = this.Const.Strings.PerkDescription.SteelBrow;
		this.m.Icon = "ui/perks/perk_09.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

			//if (effect) -> remove and replace with diff. effect
	function onUpdate( _entity ) //Should be onupdate? Not all stuns will proc with ondamagedrecieved
	{
		local actor = this.getContainer().getActor();

		if ("effects.stunned")
		{
			_entity.getSkills().removeByID("effects.stunned");
			actor.getSprite("status_stunned").Visible = false;
			actor.getSprite("status_stunned").setBrush("bust_dazed");
			_entity.getSkills().add("effects.dazed");
			// actor.getSprite("status_effect_87").Visible = true;
			actor.setDirty(true);
		}
	}

});

