this.legend_cheer_on_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_cheer_on_skill";
		this.m.Name = "Cheer On";
		this.m.Description = "Give it your all! Put your support behind an ally, granting them another Action Point. Targets can only be inspired once per turn.";
		this.m.Icon = "skills/cheered_on_square.png";
		this.m.IconDisabled = "skills/cheered_on_square_bw.png";
		this.m.Overlay = "perk_28_active";
		this.m.SoundOnUse = [
			"sounds/combat/inspire_01.wav",
			"sounds/combat/inspire_02.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 3;
	}

	function getTooltip()
	{
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				text = this.getCostString()
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Grants the target 1 additional Action Point for their next turn."
			}
		];
		return ret;
	}

	function isUsable()
	{
		local mainhand = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		if (mainhand == null)
		{
			return false;
		}
		return (mainhand.getID() == "weapon.lute" || mainhand.getID() == "weapon.named_lute" || mainhand.getID() == "weapon.legend_drum") && this.skill.isUsable();
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		if (!this.m.Container.getActor().isAlliedWith(_targetTile.getEntity()))
		{
			return false;
		}

		if (_targetTile.getEntity().getSkills().hasSkill("effects.legend_cheered_on"))
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();
		target.getSkills().add(this.new("scripts/skills/effects/legend_cheered_on_effect"));
		return true;
	}

});

