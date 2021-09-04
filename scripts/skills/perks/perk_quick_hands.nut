this.perk_quick_hands <- this.inherit("scripts/skills/skill", {
	//THIS PERK IS MODIFIED BY MSU, CHECK msu_mod_skills.nut for up to date code (I have mirrored it here 2021/09/04)
	m = {
		IsSpent = false
	},
	function create()
	{
		this.m.ID = "perk.quick_hands";
		this.m.Name = this.Const.Strings.PerkName.QuickHands;
		this.m.Description = "Maybe use this instead? This character has quick hands and can still swap an item for free this turn.";
		this.m.Icon = "ui/perks/perk_39.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk | this.Const.SkillOrder.Any;
		this.m.ItemActionOrder = this.Const.ItemActionOrder.Any
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		return this.m.IsSpent;
	}

	function getItemActionCost( _item )
	{
		return this.m.IsSpent ? null : 0;
	}

	function onPayForItemAction( _skill, _items )
	{
		if (_skill == this)
		{
			this.m.IsSpent = true;
		}
	}

	function onTurnStart()
	{
		this.m.IsSpent = false;
	}
});
