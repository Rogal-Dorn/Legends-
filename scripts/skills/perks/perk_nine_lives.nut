this.perk_nine_lives <- this.inherit("scripts/skills/skill", {
	m = {
		IsSpent = false,
		LastFrameUsed = 0
	},
	function isSpent()
	{
		return this.m.IsSpent;
	}

	function setSpent( _f )
	{
		this.m.IsSpent = _f;
		this.m.LastFrameUsed = this.Time.getFrame();
	}

	function getLastFrameUsed()
	{
		return this.m.LastFrameUsed;
	}

	function create()
	{
		this.m.ID = "perk.nine_lives";
		this.m.Name = this.Const.Strings.PerkName.NineLives;
		this.m.Description = this.Const.Strings.PerkDescription.NineLives;
		this.m.Icon = "ui/perks/perk_07.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onCombatStarted()
	{
		this.m.IsSpent = false;
		this.m.LastFrameUsed = 0;
	}

	function onCombatFinished()
	{
		this.m.IsSpent = false;
		this.m.LastFrameUsed = 0;
		this.skill.onCombatFinished();
	}

});
