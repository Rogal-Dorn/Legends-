::mods_registerJS("mod_faster.js");

::mods_hookNewObjectOnce("states/world_state", function(o) {
  o.setHyperTime <- function(mult)
  {
    if (!this.m.MenuStack.hasBacksteps())
    {
      if (!this.World.Assets.isCamping() && this.m.EscortedEntity == null)
      {
        this.m.LastWorldSpeedMult = mult;
      }

      this.setPause(false);
    }
  }


  local keyHandler = o.helper_handleContextualKeyInput;
  o.helper_handleContextualKeyInput = function(key)
  {
    if(!keyHandler(key) && key.getState() == 0)
    {
      if(key.getKey() == 3 && !this.m.MenuStack.hasBacksteps())
        this.setHyperTime(this.Const.World.SpeedSettings.LightSpeedMult);
      else if(key.getKey() == 4 && !this.m.MenuStack.hasBacksteps())
        this.setHyperTime(this.Const.World.SpeedSettings.LudicrousSpeedMult);
    }
  }
});

::mods_hookBaseClass("ai/tactical/agent", function(o) {
  while(!("adjustCameraToTarget" in o)) o = o[o.SuperName]; // find the base class
  if(!("_mod_faster" in o))
  {
    o._mod_faster <- true; // only override the methods once per base instance
    local adjustCamera = o.adjustCameraToTarget, declareAction = o.declareAction, declareEvaluationDelay = o.declareEvaluationDelay;
    o.adjustCameraToTarget = function(tile, delay = 0) { adjustCamera(tile, delay * 0.5); }
    o.declareAction = function(delay = 0) { declareAction(delay * 0.5); }
    o.declareEvaluationDelay = function(extra = 0) { declareEvaluationDelay(extra * 0.5); }
  }
});

// help speed up kraken fights
::mods_hookBaseClass("entity/tactical/actor", function(o) {
  while(!("sinkIntoGround" in o)) o = o[o.SuperName]; // find the base class
  if(!("_mod_faster" in o))
  {
    o._mod_faster <- true; // only override the methods once per base instance
    local sinkIntoGround = o.sinkIntoGround, riseFromGround = o.riseFromGround;
    o.sinkIntoGround = function(delayFactor = 1) { sinkIntoGround(delayFactor * 0.5); }
    o.riseFromGround = function(delayFactor = 1) { riseFromGround(delayFactor * 0.5); }
  }
});

// HACK: the game seems to have some unsafe/fragile code related to kraken tentacles that only works when
// certain animations run for certain lengths, etc. in particular, when ensnaring the game pretends that
// a net is thrown and its delay cannot be reduced
::mods_hookNewObject("ai/tactical/behaviors/ai_attack_throw_net", function(o) {
  o.onExecute = function(_entity)
  {
    if (this.m.IsFirstExecuted)
    {
      this.getAgent().adjustCameraToTarget(this.m.TargetTile);
      this.m.IsFirstExecuted = false;
      return false;
    }

    if (this.m.TargetTile != null && this.m.TargetTile.IsOccupiedByActor)
    {
      if (this.Const.AI.VerboseMode)
      {
        this.logInfo("* " + _entity.getName() + ": Using " + this.m.Skill.getName() + " against " + this.m.TargetTile.getEntity().getName() + "!");
      }

      this.m.Skill.use(this.m.TargetTile);
      this.getAgent().declareEvaluationDelay(1600);

      if (_entity.isAlive() && (!_entity.isHiddenToPlayer() || this.m.TargetTile.IsVisibleForPlayer))
      {
        this.getAgent().declareAction();
      }

      this.m.TargetTile = null;
    }

    return true;
  }
});

// HACK: a similar problem exists for shooting quick-firing weapons like crossbows
::mods_hookNewObject("ai/tactical/behaviors/ai_attack_bow", function(o) {
  o.onExecute = function( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			if (this.m.TargetTile.getEntity().isPlayerControlled() && _entity.isHiddenToPlayer())
			{
				_entity.setDiscovered(true);
				_entity.getTile().addVisibilityForFaction(this.Const.Faction.Player);
			}

			this.getAgent().adjustCameraToTarget(this.m.TargetTile, this.m.SelectedSkill.getDelay());
			this.m.IsFirstExecuted = false;
			return false;
		}

		if (this.m.TargetTile != null && this.m.TargetTile.IsOccupiedByActor)
		{
			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + _entity.getName() + ": Using " + this.m.SelectedSkill.getName() + " against " + this.m.TargetTile.getEntity().getName() + "!");
			}

			this.m.SelectedSkill.use(this.m.TargetTile);

			if (_entity.isAlive() && (!_entity.isHiddenToPlayer() || this.m.TargetTile.IsVisibleForPlayer))
			{
				this.getAgent().declareAction(900);
				local delay = this.Math.maxf(800, this.m.SelectedSkill.getDelay() + 750 + 850);
				this.getAgent().declareEvaluationDelay(delay);
			}

			this.m.TargetTile = null;
			this.m.SelectedSkill = null;
		}

		return true;
	}
});


::mods_hookNewObject("ai/tactical/behaviors/ai_line_breaker", function(o) {
	o.onExecute = function( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToTarget(this.m.TargetTile);
			this.m.IsFirstExecuted = false;
			return false;
		}

		if (this.Const.AI.VerboseMode)
		{
			this.logInfo("* " + _entity.getName() + ": Using Line Breaker!");
		}

		this.m.Skill.use(this.m.TargetTile);

		if (!_entity.isHiddenToPlayer() || this.m.TargetTile.IsVisibleForPlayer)
		{
			this.getAgent().declareEvaluationDelay(800);
			this.getAgent().declareAction(900);
		}

		this.m.TargetTile = null;
		this.m.Skill = null;
		return true;
	}
});

::mods_hookNewObject("ai/tactical/behaviors/ai_defend_rotation ", function(o) {
	o.onExecute = function( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToTarget(this.m.TargetTile);
			this.m.IsFirstExecuted = false;
			return false;
		}

		if (this.Const.AI.VerboseMode)
		{
			this.logInfo("* " + _entity.getName() + ": Using Rotation!");
		}

		this.m.Skill.use(this.m.TargetTile);

		if (!_entity.isHiddenToPlayer() || this.m.TargetTile.IsVisibleForPlayer)
		{
			this.getAgent().declareEvaluationDelay(1000);
			this.getAgent().declareAction(900);
		}

		this.m.TargetTile = null;
		this.m.Skill = null;
		return true;
	}

});



::mods_hookNewObject("ai/tactical/behaviors/ai_attack_split", function(o) {
	o.onExecute = function ( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToTarget(this.m.TargetTile);
			this.m.IsFirstExecuted = false;
			return false;
		}

		if (this.m.TargetTile != null)
		{
			if (this.Const.AI.VerboseMode)
			{
				this.logInfo("* " + _entity.getName() + ": Using Split!");
			}

			this.m.Skill.use(this.m.TargetTile);

			if (_entity.isAlive())
			{
				local delay = this.Math.maxf(900, this.m.Skill.getDelay());
				this.getAgent().declareAction(delay);
				this.getAgent().declareEvaluationDelay(1000);
			}

			this.m.TargetTile = null;
		}

		return true;
	}
});

// HACK: reportedly there is a similar problem for Nachzehrers when they feast
::mods_hookNewObject("ai/tactical/behaviors/ai_gruesome_feast", function(o) {
o.useSkill = function(_entity)
	{
	if (this.Const.AI.VerboseMode)
	{
		this.logInfo("* " + _entity.getName() + ": Using Gruesome Feast!");
	}

	if (this.m.Skill.use(this.m.TargetTile))
	{
		if (!_entity.isHiddenToPlayer() || this.m.TargetTile.IsVisibleForPlayer)
		{
			this.getAgent().declareAction();
			this.getAgent().declareEvaluationDelay(1200);
		}
	}

	this.m.Skill = null;
	this.m.TargetTile = null;
	}
});

// HACK: a similar problem for golems (ifrits) merging. in this case since the behavior has only one skill,
// which players can't use, we can just adjust the skill's delay rather than overriding the behavior
::mods_hookNewObject("skills/actives/merge_golem_skill", function(o) { o.m.Delay *= 2; });


// HACK: ditto for the alp sleep attack
::mods_hookNewObject("skills/actives/sleep_skill", function(o) { o.m.Delay *= 2; });

// HACK: and for the unhold sweep attack (and the fling attack)
::mods_hookNewObject("skills/actives/fling_back_skill", function(o) { o.m.Delay *= 2; });
::mods_hookNewObject("skills/actives/sweep_skill", function(o) { o.m.Delay *= 2; });