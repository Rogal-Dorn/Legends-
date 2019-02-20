local gt = this.getroottable();
gt.Const.Serialization <- {
	Version = 48
};

if (!("LegendMod" in gt.Const))
{
	gt.Const.LegendMod <- {};
}

gt.Const.LegendMod.StartTypes <- {
    Default = "default",
    Beggar = "legends_beggar",
    Crusader = "legends_crusader",
    Rangers = "legends_hunter",
    Healer = "legends_healer",
    Berserker = "legends_berserker",
    Witch = "legends_witch",
    Necro = "legends_necro",
    Noble = "legends_noble",
    Inventor = "legends_inventor"
	Hoggart = "legends_hoggart",
	Party = "legends_party"
}

gt.Const.LegendMod.Starts <- [
    // {
    //     name = "Default",
    //     intro = "",
    //     description = "Default Battle Brothers Campaign",
    //     banner = gt.Const.LegendMod.StartTypes.Default
    // },
	{
        name = "Party",
        description = "Easy. Very powerful skill combinations, but each slightly weaker than in their own starts. ",
        intro = "[img]gfx/ui/events/event_24.png[/img]its a party",
        banner = gt.Const.LegendMod.StartTypes.Party
    },
	{
       name = "Berserker",
       intro = "[img]gfx/ui/events/event_24.png[/img]So tired. You have been walking for weeks and haven't slept in... too long. You stop and rest a moment, and the thoughts return. The wooden hut you built together. The plot of yams she had planted. The evening you returned from a hunt. They had come. Burned it all. The stores, the hut, the woman, the child. Their screams echo in your blood, calling you to avenge them. You should have been there in time. Her tortured last moments fill your mind. What they did to her was...  too unspeakable. The disgust and loathing well up again. What kind of filth could rape and kill a mother in front of her child? Your heart pounds now, cold sweat, the froth forms at the edge of your mouth. What kind of monster could then do those things to an infant child?  Your mind snaps at the memory of their broken bodies. You scream with unbridled rage. Your muscles push you on again, running blindly into another day. You must find the killers, those swine will know vengeance",
       description = "Medium. AOE melee damage perks. moves fast in mountains and wildlands",
       banner = gt.Const.LegendMod.StartTypes.Berserker
    },
    {
        name = "Crusader",
        intro = "[img]gfx/ui/events/event_24.png[/img]The bishop had told you the world was dying due to the sins of man, that the end of days is upon us. The dark ones come and only the furious justice of peity can hold it back. Since then you have journeyed across the lands to find the root of the infection, to stem the tide of the plague. The more of the world you see, the worse it looks. The corruption is spreading, you've followed its tendrils back to its source, here in these lands you will find the cause. Your faith cannot falter, for you bear the torch into the yawning darkness. The day of reckoning approaches, you must finish your preparations",
        description = "Medium. Tanking and melee perks. Great gear and repair rates",
        banner = gt.Const.LegendMod.StartTypes.Crusader
    },
	{
        name = "Noble",
        description = "Hard. Leadership and support skills. More supplies and slower supply usage, faster marching speed on flat land",
        intro = "[img]gfx/ui/events/event_24.png[/img]You were born to be a leader, raised in the company of the greatest men of our day. Somehow though, inheriting power doesn't feel as satisfying as seizing it for yourself. No, if one is to be king, it must be earned through battle and through the blood of one's subjects. Now, off to find some subjects willing to die for their betters.",
        banner = gt.Const.LegendMod.StartTypes.Noble
    },
    {
        name = "Ranger",
        intro = "[img]gfx/ui/events/event_24.png[/img]The council sent us out three months ago, in all directions from the grove. They wouldn't tell us what we were looking for exactly, only that we would know the signs of destruction when we saw them. For weeks we have followed the tracks and watched the skies. The birds are migrating the wrong direction. The rabbits only run one way down their bramble paths. The animals abandon their ranges, as is they know what is coming.  So you pushed on in the other direction, past deserted fields and burned homesteads, past rivers, lakes and mountains.  As you passed the last rise you paus, this is the place. These valleys have no deer, smoke hangs in the air and clings to the hills, the light is harsh and the air is bitter. Whatever is coming, it is coming from here. ",
        description = "Hard. Great ranged stats, excelent damage perks. walks faster in forrests",
        banner = gt.Const.LegendMod.StartTypes.Rangers
    },
    // {
    //     name = "Healer",
    //     intro = "[img]gfx/ui/events/event_24.png[/img]The college of surgeons kicked you out for your radical views. All those years of studying the delicate arts of trepanning, leeching and balancing the humors, and no qualification to show for it.  The old masters didn't like having their views challenged, but you'll show everyone the power of soap and hot water.",
    //     description = "A healer of men, alone in the wilderness",
    //     banner = gt.Const.LegendMod.StartTypes.Healer
    // },
    {
        name = "Seer",
        intro = "[img]gfx/ui/events/event_24.png[/img]The omens were in the stew, those giblets were roiling in the bubbles the way only a bad omen can. You tried to tell the farmers that the spirits had demanded a sacrifice, if only to reduce how many mouths there were to feed, but in the end they all blamed you when the crops failed. Its not your fault the gods are angry, there are bigger things at play here than your admidetly poor rain dancing, some daft fool has gone and poked their nose it that old deep magic. The wheel has turned, the cycles are in motion, there will be a lot more trouble in the world before the stars bode well again. In the meantime you might need to keep moving, you might not have a whole village bringing you sweet meat, but you made it out with enough coppers to at least find some apprentices to chop the wood and make tea",
        description = "Harder. Focus on crowd control skills. Heals your party faster",
        banner = gt.Const.LegendMod.StartTypes.Witch
    },
    {
        name = "Warlock",
        intro = "[img]gfx/ui/events/event_24.png[/img]That last town was rough.. lets not talk about that place anymore. You stop and turn to the corpse beside you, your only companion. I told you to stop talking about that last town already, i know you miss your wife and family, but i told you there are much greater opportunities for you in the afterlife.  Your companion's head lolls slightly to the side as if rolling its eyes at you before finally the tattered neck flesh gives way, and sends the skull rolling off down the valley. Thats the problem with people these days, always giving up, no one seems to have the fortitude to handle whatever death throws at them. Time to hire some new assistants.  ",
        description = "Harder. Focus on debuffs and the dark arts. Party uses less meds",
        banner = gt.Const.LegendMod.StartTypes.Necro
    },
    // {
    //     name = "Inventor",
    //     intro = "[img]gfx/ui/events/event_24.png[/img]This is an experimental work in progress",
    //     description = "Experimental acedemic",
    //     banner = gt.Const.LegendMod.StartTypes.Inventor
    // },
  {
        name = "Beggar",
        description = "Hardest. No money, no skill. Very Hard",
        banner = gt.Const.LegendMod.StartTypes.Beggar
    },
	{
        name = "Hoggart",
        description = "Easy. The classic start, in the legends world.",
        intro = "[img]gfx/ui/events/event_24.png[/img]Here we go again..",
        banner = gt.Const.LegendMod.StartTypes.Hoggart
    },
]


gt.Const.LegendMod.LookupMap <- {};

for( local i = 0; i < this.Const.LegendMod.Starts.len(); i = ++i )
{
    local start = this.Const.LegendMod.Starts[i];
    gt.Const.LegendMod.LookupMap[start.banner] <- start;
}

gt.Const.LegendMod.GetIntro <- function ( _id )
{
	if (_id != null && _id in this.Const.LegendMod.LookupMap)
	{
		return this.Const.LegendMod.LookupMap[_id].intro;
	}

	return "";
};
