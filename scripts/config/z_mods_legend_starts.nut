local gt = this.getroottable();

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
    Berserker = "legends_beserker",
    Witch = "legends_witch",
    Necro = "legends_necro",
    Noble = "legends_noble",
    Inventor = "legends_inventor"
}

gt.Const.LegendMod.Starts <- [
    {
        name = "Default",
        intro = "",
        description = "Default Battle Brothers Campaign",
        banner = gt.Const.LegendMod.StartTypes.Default
    },
    {
        name = "Beggar",
        intro = "[img]gfx/ui/events/event_24.png[/img]Six crowns. A whole day and all you have for it is a paltry six crowns. Barely enough for a loaf of bread in this dung heap of a town. It wasn't but a month ago that you could solicit twenty or more from the passersby. But now they barely acknowledge you exist. You sigh as you amble through the narrow streets, heading toward your alley for the night. Thoughts of uncertainty drift into your head. You've seen a lot in the square. There, your hand is on the pulse of the town. You can tell when things aren't right, you see it in the way they all walk. Have they been walking differently? Your thoughts are cut short by clamoring pouring out the mouth of your alley. It must be some street hounds squabbling over some rotten scrap. Before you turn the corner, you hear words, yelling. Why is someone here? You picked this alleyway precisely because it's so remote. The noble is dead, his coins glinting... ",
        description = "Weak and poor, you start with only the rags on your back",
        banner = gt.Const.LegendMod.StartTypes.Beggar
    },
    {
        name = "Crusader",
        intro = "[img]gfx/ui/events/event_24.png[/img]Crusader start intro text",
        description = "A season veteran of the crusades, you find youself well equipped and strong and looking for work",
        banner = gt.Const.LegendMod.StartTypes.Crusader
    },
    {
        name = "Rangers",
        intro = "[img]gfx/ui/events/event_24.png[/img]Hunter start intro text",
        description = "Quick and fleet of foot, three friends look for adventure",
        banner = gt.Const.LegendMod.StartTypes.Rangers
    },
    {
        name = "Healer",
        intro = "[img]gfx/ui/events/event_24.png[/img]Healer start intro text",
        description = "Healthy and caring",
        banner = gt.Const.LegendMod.StartTypes.Healer
    },
    {
        name = "Berserker",
        intro = "[img]gfx/ui/events/event_24.png[/img]Beserker start intro text",
        description = "Violent and tireless",
        banner = gt.Const.LegendMod.StartTypes.Berserker
    },
    {
        name = "Witch",
        intro = "[img]gfx/ui/events/event_24.png[/img]Witch start intro text",
        description = "Old and sleepy",
        banner = gt.Const.LegendMod.StartTypes.Witch
    },
    {
        name = "Necromancer",
        intro = "[img]gfx/ui/events/event_24.png[/img]Necro start intro text",
        description = "Shunned by your village, you look to make a living with your dark art",
        banner = gt.Const.LegendMod.StartTypes.Necro
    },
    {
        name = "Noble",
        description = "Rich and looking to make your family name known",
        intro = "[img]gfx/ui/events/event_24.png[/img]Noble start intro text",
        banner = gt.Const.LegendMod.StartTypes.Noble
    },
    {
        name = "Inventor",
        intro = "[img]gfx/ui/events/event_24.png[/img]Inventor start intro text",
        description = "Experimental acedemic",
        banner = gt.Const.LegendMod.StartTypes.Inventor
    }
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
