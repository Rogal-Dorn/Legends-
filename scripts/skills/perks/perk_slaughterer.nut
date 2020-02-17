this.perk_slaughterer <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.slaughterer";
		this.m.Name = this.Const.Strings.PerkName.Slaughterer;
		this.m.Description = this.Const.Strings.PerkDescription.Slaughterer;
		this.m.Icon = "skills/slaughterer.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onUpdate( _properties )
	{
		local actor = this.getContainer().getActor();
		_properties.FatalityChanceMult = 100.0;
		actor.modifyFlatOnKillOtherActorModifier(-2); //in reality this is just entirely fucked up and someone else should rreally have a serious look at it. My original idea was just lowering the difficulty would make it better but when u lower difficulty which is what this will inevitably do, in mod_actor::o.onOtherActorKilled or whatever, it ends up way lower than it should once that functino triggers the resolve checks bc of other multiplicative effects(?)
		//I really think -2 or -1 is the best way to go, decimal numbers sorta fuck upunless u chnange the variable to a 0.0 instead of 0 in mod_actor also 
	}


});

