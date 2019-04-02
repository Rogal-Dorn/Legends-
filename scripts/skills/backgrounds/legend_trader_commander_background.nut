this.legend_trader_commander_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_commander_trader";
		this.m.Name = "Trader";
		this.m.Icon = "ui/backgrounds/background_19.png";
		this.m.BackgroundDescription = "Traders are not used to hard physical labor or warfare, but they do excel at haggling for good prices.";
		this.m.GoodEnding = "A man of the sale, %name% the trader couldn\'t stay fighting for long. He eventually left the %companyname% to go out and start his own business. Recently, you got word that he was selling trinkets with the company\'s sigil on them. You specifically told him he can do whatever he wants except just this one thing, but apparently your warning merely fostered the idea in him. When you went to tell him to stop, he slammed a crown-bulging satchel on his rather ornate table, saying it was your \'cut.\' He sells those trinkets to this day.";
		this.m.BadEnding = "With hard times hitting the %companyname%, many brothers saw fit to return to their old lives. %name% the trader was no different. Last you heard he got the tar beaten out of him trying to sell stolen wares that \'fell off the wagon\' to the very merchant which they originally belonged.";
		this.m.HiringCost = 60000;
		this.m.DailyCost = 1;
		this.m.Excluded = [
			"trait.huge",
			"trait.fear_undead",
			"trait.hate_undead",
			"trait.hate_beasts",
			"trait.iron_jaw",
			"trait.clubfooted",
			"trait.brute",
			"trait.athletic",
			"trait.iron_lungs",
			"trait.strong",
			"trait.tough",
			"trait.cocky",
			"trait.dexterous",
			"trait.dumb",
			"trait.deathwish",
			"trait.bloodthirsty"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.TidyMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.Body = "bust_naked_body_02";
		this.m.Level = 2;
		this.m.IsUntalented = true;

		this.m.Modifiers.Stash = this.Const.LegendMod.ResourceModifiers.Stash[4];
		this.m.Modifiers.Barter = this.Const.LegendMod.ResourceModifiers.Barter[3];
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
			}
		];
	}

	function onBuildDescription()
	{
		return "{House to house, | Once a proud merchant, now | An annoyance to most, | In tough times, everyone has to scrape by somehow, hence why | Not a man of the trades, but instead of trade itself,} %name% is a mere trader. {He\'ll dance, he\'ll sing, he\'ll boast and he\'ll act a king, anything to make that sale. | Pushy and unrelenting, his tenacity is admirable. | He\'ll try to sell off a rusty bucket for a helm once worn by kings. This man will sell anything. | This man will make you crave things you never knew you wanted. No refunds, though. | He used to make a decent living selling {used carts | pots, pans and jars}, until fierce competition drove him out of business - by breaking his arm.} {Marketing himself is what this frail man does best, though few believe his pitch about having \'Great swordsmanship and resolute bravery\'. | He supposedly handed out \'coupons\' for his services, whatever those are. He\'s chippy, though, and any outfit these days could use a warm body no matter its real value. | If hired, he promises, you\'ll get a special discount on a virility enhancing potion. | The man lowers his voice and tells you he\'s got a great deal on rusted arrow tips, just for you. He looks disappointed at your lack of interest. | This man knows a man who knows a man who knows a man. All three strangers potentially better at fighting than him. | A shame a man can\'t fight with his words these days. %name% would be unstoppable.}";
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				0,
				0
			],
			Bravery = [
				0,
				0
			],
			Stamina = [
				30,
				30
			],
			MeleeSkill = [
				-10,
				-9
			],
			RangedSkill = [
				0,
				0
			],
			MeleeDefense = [
				2,
				7
			],
			RangedDefense = [
				2,
				7
			],
			Initiative = [
				30,
				30
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();
		actor.setTitle(this.Const.Strings.PeddlerTitles[this.Math.rand(0, this.Const.Strings.PeddlerTitles.len() - 1)]);
		this.m.Container.add(this.new("scripts/skills/traits/loyal_trait"));
		this.m.Container.add(this.new("scripts/skills/perks/perk_legend_roster_1"));
		this.m.Container.add(this.new("scripts/skills/perks/perk_legend_roster_2"));
		this.m.Container.add(this.new("scripts/skills/perks/perk_legend_roster_3"));
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
			items.equip(this.new("scripts/items/weapons/legend_tipstaff"));
			items.equip(this.new("scripts/items/armor/linen_tunic"));
			items.equip(this.new("scripts/items/helmets/feathered_hat"));
		local stash = this.World.Assets.getStash()
		stash.removeByID("supplies.ground_grains");
		stash.removeByID("supplies.ground_grains");
		stash.add(this.new("scripts/items/trade/cloth_rolls_item"));
		stash.add(this.new("scripts/items/misc/snake_oil_item"));
		stash.add(this.new("scripts/items/supplies/dried_fruits_item"));

	}

});
