this.legend_read_omens_trance_skill <- this.inherit("scripts/skills/actives/legend_trance_abstract", {
	m = {},
	function create()
	{
		this.legend_trance_abstract.create();
		this.m.ID = "actives.legend_read_omens_trance";
		this.m.Name = "Read Omens (Trance)";
		this.m.Icon = "skills/omen_active.png"; //todo: change icons, better description, sound on use
		this.m.IconDisabled = "skills/omen_active_sw.png";
		this.m.Overlay = "omen_active";
		this.m.SoundOnUse = [
			"sounds/combat/hawk_01.wav",
			"sounds/combat/hawk_02.wav"
		];

		this.m.Description = "Toggle Read Omens On (+10% reroll on hit";
		this.m.ToggleOnDescription = this.m.Description;
		this.m.ToggleOffDescription = "Toggle Read Omens Off";
	}

	function removeAll()
	{
		foreach( bro in this.World.getPlayerRoster().getAll() )
		{
			bro.getSkills().removeByID("effects.legend_read_omens");
		}
	}


	function swapOn()
	{
		this.legend_trance_abstract.swapOn();
		foreach( bro in this.World.getPlayerRoster().getAll() )
		{
			bro.getSkills().add(this.new("scripts/skills/effects/legend_read_omens_effect"));
		}
	}

});
