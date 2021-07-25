this.bone_plating_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Sounds = null
	},
	function create()
	{
		this.m.ID = "effects.bone_plating";
		this.m.Name = "Bone Plating";
		this.m.Icon = "ui/perks/perk_37.png";
		this.m.IconMini = "perk_37_mini";
		this.m.Overlay = "perk_37";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
		this.m.Sounds = [
			"sounds/enemies/skeleton_hurt_01.wav",
			"sounds/enemies/skeleton_hurt_02.wav",
			"sounds/enemies/skeleton_hurt_03.wav",
			"sounds/enemies/skeleton_hurt_04.wav",
			"sounds/enemies/skeleton_hurt_06.wav"
		];
	}

	function getDescription()
	{
		return "Completely absorbs the first hit which doesn\'t ignore armor";
	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_hitInfo.BodyPart == this.Const.BodyPart.Body && _hitInfo.DamageDirect < 1.0)
		{
			_properties.DamageReceivedTotalMult = 0.0;
			this.Tactical.EventLog.logEx("Damage absorbed by Bone Plating");

			local actor = this.getContainer().getActor();
			local sound = this.m.Sounds[this.Math.rand(0, 4)];

			actor.playSound(sound, this.Const.Sound.Volume.Actor * actor.m.SoundVolume[this.Const.Sound.ActorEvent.DamageReceived] * actor.m.SoundVolumeOverall, actor.m.SoundPitch)

			this.removeSelf();
		}
	}
});