this.mummy_curse_effect <- this.inherit("scripts/skills/skill", {
	m = {
	},
	function create()
	{
		this.m.ID = "effects.mummy_curse";
		this.m.Name = "Curse of the Mummy";
		this.m.Icon = "skills/icon_mummy_curse.png";
		this.m.IconMini = "mini_icon_mummy_curse";
		this.m.Overlay = "mummy_curse";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
		this.m.IsStacking = true;
	}

	function getDescription()
	{
		return "This character has been cursed by the death of a mummy, they will take extra damage for the rest of this battle";
	}

	function getTooltip()
	{
		return [
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
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Receives +[color=" + this.Const.UI.Color.NegativeValue + "]25%[/color] damage from any source"
			}
		];
	}

	function onUpdate( _properties )
	{
		_properties.DamageReceivedTotalMult *= 1.20;
		_properties.TargetAttractionMult *= 1.20;
	}

	function onCombatFinished()
	{
		this.removeSelf();
	}
	
	

});

