::mods_hookBaseClass("contracts/contract", function(o) {
    o.buildText <- function(_text)
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local brother1 = this.Math.rand(0, brothers.len() - 1);
		local brother2 = this.Math.rand(0, brothers.len() - 1);

		if (brothers.len() >= 2)
		{
			while (brother1 == brother2)
			{
				brother2 = this.Math.rand(0, brothers.len() - 1);
			}
		}

		if (brothers.len() < 2) {
			brother1 = "unknown"
			brother2 = "unknown"
		} else {
			brother1 = brothers[brother1].getName();
			brother2 = brothers[brother2].getName();
		}

		local villages = this.World.EntityManager.getSettlements();
		local randomTown;

		do
		{
			randomTown = villages[this.Math.rand(0, villages.len() - 1)].getNameOnly();
		}
		while (randomTown == null || randomTown == this.m.Home.getNameOnly());

		local text;
		local vars = [
			[
				"SPEECH_ON",
				"\n\n[color=#bcad8c]\""
			],
			[
				"SPEECH_OFF",
				"\"[/color]\n\n"
			],
			[
				"companyname",
				this.World.Assets.getName()
			],
			[
				"randomname",
				this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]
			],
			[
				"randomnoble",
				this.Const.Strings.KnightNames[this.Math.rand(0, this.Const.Strings.KnightNames.len() - 1)]
			],
			[
				"randombrother",
				brother1
			],
			[
				"randombrother2",
				brother2
			],
			[
				"randomtown",
				randomTown
			],
			[
				"reward_completion",
				this.m.Payment.getOnCompletion()
			],
			[
				"reward_advance",
				this.m.Payment.getInAdvance()
			],
			[
				"reward_count",
				this.m.Payment.getPerCount()
			],
			[
				"employer",
				this.Tactical.getEntityByID(this.m.EmployerID).getName()
			],
			[
				"faction",
				this.World.FactionManager.getFaction(this.m.Faction).getName()
			],
			[
				"townname",
				this.m.Home.getName()
			],
			[
				"produce",
				this.m.Home.getProduceAsString()
			],
			[
				"origin",
				this.m.Origin.getName()
			],
			[
				"maxcount",
				this.m.Payment.MaxCount
			]
		];
		this.onPrepareVariables(vars);
		vars.push([
			"reward",
			this.m.Payment.getOnCompletion() + this.m.Payment.getInAdvance()
		]);
		return this.buildTextFromTemplate(_text, vars);
	}
});