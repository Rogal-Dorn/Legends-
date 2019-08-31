this.perk_legend_ubernimble <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_ubernimble";
		this.m.Name = this.Const.Strings.PerkName.LegendUberNimble;
		this.m.Icon = "ui/perks/ubernimble_circle.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		local fm = this.Math.floor(this.getChance() * 100);
		return fm >= 100;
	}

	function getDescription()
	{
		return "True berserkers shed even their clothes in the pursuit of unadaulterated primal slaughter. Gain nimble if you have no clothes or helm. Stacks with nimble";
	}

	function getTooltip()
	{
		local fm = this.Math.round(this.getChance() * 100);
		local tooltip = this.skill.getTooltip();

		if (fm < 100)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Only receive [color=" + this.Const.UI.Color.PositiveValue + "]" + fm + "%[/color] of any damage to hitpoints from attacks"
			});
		}
		else
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]This character\'s body and head armor are too heavy as to gain any benefit from being nimble[/color]"
			});
		}

		return tooltip;
	}

	function getChance()
	{		
		local fat = 1;
		fat = this.Math.min(0, fat);
		local ret = this.Math.minf(1.0, 1.0 - 0.5 + this.Math.pow(this.Math.abs(fat), 1.2) * 0.01);
		return ret;
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
	   local  bodyitem = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Body);
       local  headitem = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Head);
	   
	   if (bodyitem != null || headitem != null)
	   {
		   return
	   }

		if (_attacker != null && _attacker.getID() == this.getContainer().getActor().getID() || _skill == null || !_skill.isAttack() || !_skill.isUsingHitchance())
		{
			return;
		}

		local chance = this.getChance();
		_properties.DamageReceivedRegularMult *= chance;
	}

});
