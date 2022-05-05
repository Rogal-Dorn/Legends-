this.legend_oms_amphora_skill <- ::inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_oms_amphora_skill";
		this.m.Name = "Drink from Amphora";
		this.m.Description = "TODO LUFT";
		this.m.Icon = "skills/active_96.png"; //TODO LUFT
		this.m.IconDisabled = "skills/active_96_sw.png"; //TODO LUFT
		this.m.Overlay = "active_96"; //TODO LUFT
		this.m.SoundOnUse = [
			"sounds/combat/drink_01.wav",
			"sounds/combat/drink_02.wav",
			"sounds/combat/drink_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.Any;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = true;
		this.m.IsAttack = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.ActionPointCost = 3; //TODO LUFT
		this.m.FatigueCost = 5; //TODO LUFT
		this.m.MinRange = 0; //TODO LUFT
		this.m.MaxRange = 1; //TODO LUFT
	}

	function getTooltip()
	{
		local ret = this.skill.getDefaultUtilityTooltip();
		ret.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Does something...?"
		});
		return ret;
	}

	function isUsable()
	{
		local tile = this.getContainer().getActor().getTile();
		return this.skill.isUsable() && !this.getItem().isConsumed() && !tile.hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
	}

	function getCursorForTile( _tile )
	{
		if (_tile.ID == this.getContainer().getActor().getTile().ID) return this.Const.UI.Cursor.Drink;
		else return this.Const.UI.Cursor.Give;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile)) return false;
		local target = _targetTile.getEntity();
		if (!this.m.Container.getActor().isAlliedWith(target)) return false;
		return true;
	}

	function onUse( _user, _targetTile )
	{
		local user = _targetTile.getEntity();

		if (_user.getID() == user.getID())
		{
			if (!user.isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " drinks from Amphora");
			}
		}
		else
		{
			if (!_user.isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " lets " + this.Const.UI.getColorizedEntityName(user) + " drink from Amphora");
			}
		}

		local effects = ::MSU.Class.WeightedContainer([
			[1.0 / 15, "scripts/skills/effects/iron_will_effect"],
			[1.0 / 10, "scripts/skills/effects/antidote_effect"],
			[1.0 / 10, "scripts/skills/effects/bleeding_effect"],
			[1.0 / 15, "scripts/skills/effects/cat_potion_effect"],
			[1.0 / 10, "scripts/skills/effects/chilled_effect"],
			[1.0 / 10, "scripts/skills/effects/dazed_effect"],
			[1.0 / 8, "scripts/skills/effects/legend_beer_buzz_effect"],
			[1.0 / 30, "scripts/skills/effects/legend_greenwood_sap_effect"],
			[1.0 / 8, "scripts/skills/effects/legend_mead_warmth_effect"],
			[1.0 / 15, "scripts/skills/effects/lionheart_potion_effect"],
			[1.0 / 8, "scripts/skills/effects/legend_wine_tipsy_effect"],
			[1.0 / 15, "scripts/skills/effects/cat_potion_effect"],
			[1.0 / 12, "scripts/skills/effects/recovery_potion_effect"],
			[1.0 / 9, "scripts/skills/effects/goblin_poison_effect"],
			[1.0 / 11, "scripts/skills/effects/spider_poison_effect"],
			[1.0 / 30, "scripts/skills/effects/legend_redback_spider_poison_effect"]
		]);

		user.getSkills().add(::new(effects.roll()));
		this.getItem().setConsumed(true);
	}
});
