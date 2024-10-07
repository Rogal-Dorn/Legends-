::mods_hookExactClass("skills/actives/unleash_wolf", function(o)
{
	local create = o.create;
	o.create = function ()
	{
		create();
		this.m.Name = "Unleash Wolf";
		this.m.Description = "Unleash your wolf and send him charging into the enemy. Needs a free tile adjacent.";
		this.m.Order = this.Const.SkillOrder.Last + 5;
	}

	o.onUse = function ( _user, _targetTile )
	{
		local entity = this.Tactical.spawnEntity(this.m.Item.getScript(), _targetTile.Coords.X, _targetTile.Coords.Y);
		entity.setFaction(this.Const.Faction.PlayerAnimals);
		entity.setItem(this.m.Item);
		entity.setName(this.m.Item.getName());
		this.m.Item.setEntity(entity);

		if (this.getContainer().hasSkill("background.houndmaster"))
		{
			entity.setMoraleState(this.Const.MoraleState.Confident);
		}

		this.addAnimalSkills(entity);

		if (!this.World.getTime().IsDaytime)
		{
			entity.getSkills().add(this.new("scripts/skills/special/night_effect"));
		}

		this.m.IsHidden = true;
		return true;
	}
});
