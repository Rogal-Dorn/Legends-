this.legend_violent_decomposition_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.legend_violent_decomposition_skill";
		this.m.Name = "Violent Decomposition";
		this.m.Icon = "skills/violent_decomposition.png",
		this.m.IconDisabled = "skills/violent_decomposition_bw.png",
		this.m.Overlay = "violent_decomposition";
		this.m.SoundOnUse = [
		 	"sounds/combat/violent_decomposition.wav"
		];

		this.m.SoundOnHit = [
			"sounds/enemies/necromancer_01.wav",
			"sounds/enemies/necromancer_02.wav",
			"sounds/enemies/necromancer_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted + 105;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsVisibleTileNeeded = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 25;
		this.m.MinRange = 2;
		this.m.MaxRange = 6;
		this.m.MaxLevelDifference = 8;
	}

	function getDescription()
	{
		return "Corrupt the force sustaining one of your thralls, causing them to detonate destructively after the corruption has time to build. Affected dead explode at the end of their turn next round, dealing damage in a 1 tile radius. The less HP they have, the more damage the explosion inflicts. If they are killed before they explode, the effect no longer triggers."
	}

	function getTooltip()
	{
		return this.skill.getDefaultUtilityTooltip();
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local target = _targetTile.getEntity();

		if (!this.m.Container.getActor().isAlliedWith(target))
		{
			return false;
		}

		if (!target.getFlags().has("IsSummoned")){
			return false;
		}

		if (!target.isAlive())
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();
		target.getSkills().add(this.new("scripts/skills/effects/legend_violent_decomposition_effect"));
		this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " sets " + this.Const.UI.getColorizedEntityName(target) + "to violently explode next turn");
	}


});
