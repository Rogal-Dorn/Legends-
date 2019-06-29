this.legend_cannibal_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.legend_cannibal";
		this.m.Name = "Cannibal";
		this.m.Icon = "ui/backgrounds/legend_cannibal.png";
		this.m.BackgroundDescription = "Cannibals have a thing for human flesh.";
		this.m.GoodEnding = null;
		this.m.BadEnding = null;
		this.m.HiringCost = 60;
		this.m.DailyCost = 6;
		this.m.Excluded = [
			"trait.asthmatic",
			"trait.clumsy",
			"trait.cocky"
		];
		this.m.Titles = [
			"the Cannibal"
		];
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.IsOutlawBackground = true;
		this.m.Body = this.Const.Bodies.AllMale[this.Math.rand(0, this.Const.Bodies.AllMale.len() - 1)];
		this.m.Modifiers.Hunting = this.Const.LegendMod.ResourceModifiers.Hunting[1];
		this.m.PerkTreeDynamic = {
			Weapon = [			
				this.Const.Perks.CleaverTree,
				this.Const.Perks.SwordTree,
				this.Const.Perks.ThrowingTree
			],
			Defense = [
				this.Const.Perks.MediumArmorTree
			],
			Traits = [
				this.Const.Perks.ViciousTree,
				this.Const.Perks.DeviousTree
			],
			Enemy = [this.Const.Perks.CivilizationTree],
			Class = [
				this.Const.Perks.ButcherClassTree,
				this.Const.Perks.ChefClassTree
			]
		}
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
//		return "{%name% has a thing for human flesh.}";
		return "{An odd man, %name% looks at your men oddly, as if an animal eyeing its next meal. | While speaking to him, %name% politely offers you some jerky, which you rapidly decline. | %name% is avoided by everyone else in the town, and he licks his lips hungrily as you approach. | %name% is a known name in the world, for they say wherever he goes, children seem to go missing. | Some men are murderers, some are monsters, %name% is a terrifying mix of both. | As you speak to %name%, a passing monk makes the sign of evil and holds his cross tight. | %name% claims to have exquisite tastes, taste in what, however, he does not say. | %name% is perhaps one of the friendliest people you’ve ever met, yet you almost feel as if he is buttering you up. | You found %name% licking his fingers and pointedly not mentioning what meal was so delicious. | Many killers have excuses, but %name% can not bring up a single one when you realize what he is. | A sad creature, %name% seems perpetually hungry, yet refuses all of your food.} { %name% claims he simply wishes to serve man. | %name% assures you that your company will find no trouble from him. | %name% tells you one of the funniest jokes you’ve ever heard, but even you find the subject matter too disturbing to justify laughter. | He loudly laughs at the mention of Gods, claiming that no living God would allow something like him to walk this world. | You hear the clattering of bones from within one of his pouch, to which he tells you are for the memories. | His downright pleasant nature disturbs you, for there is nothing pleasant about what this man is. | The other brothers caution you about bringing him into the company, but he assures you that he will never harm his brothers. Unless ordered, at least. | You threaten to skewer him when he mentions how healthy you look, to which he quickly claims was just a passing compliment.} { Despite it all, %name% is good with a sword, and claims he rarely goes hungry. | A butcher like him will no doubt have little trouble carving the living. | %name% has doubtless had some experience butchering the living before. | Desperate times call for desperate measures, but how desperate are you to hire someone like this? | While some of his… skills… may be tempting, you know if you hire him you’ll never sleep soundly as long as he lives. | The fact that creatures such as this exist makes you want to wretch, but would many not say the same of you? | He eyes you queerly, as if he knows some secret joke that you never will. | When you are done speaking with him, he keeps talking. Quietly. To himself. You do not like what you hear.}";
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
				0,
				0
			],
			MeleeSkill = [
				0,
				0
			],
			RangedSkill = [
				0,
				0
			],
			MeleeDefense = [
				0,
				0
			],
			RangedDefense = [
				0,
				0
			],
			Initiative = [
				0,
				0
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();
		local actor = this.getContainer().getActor();
		actor.setTitle("the Cannibal");
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		items.equip(this.new("scripts/items/armor/tattered_sackcloth"));
		items.equip(this.new("scripts/items/weapons/butchers_cleaver"));
	}

});
