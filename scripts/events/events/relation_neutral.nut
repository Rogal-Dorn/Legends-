this.relation_neutral <- this.inherit("scripts/events/event", {
	m = {
		Noble = null,
		Lowborn = null
	},
	function create()
	{
		this.m.ID = "event.relation_neutral";
		this.m.Title = "During camp...";
		this.m.Cooldown = 35.0 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/event_64.png[/img] You find two of your company deep in conversation, the two aren\'t close but don\'t seem to clash either. You\'re not sure where their idle chatter will lead. ",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Break it up, we don't have time for chit chat.",
					function getResult( _event )
					{
						return "B";
					}

				},
				{
					Text = "Let them talk, they need to sort this out",
					function getResult( _event )
					{
						local chance = this.Math.rand(1,2);
						if (chance = 1)
						{
						return "D";
						}
						else
						{
						return "C";
						}
					}

				},
				{
					Text = "Get everyone over here, we all need a distraction",
					function getResult( _event )
					{
						return "E";
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Merc1.getImagePath());
				this.Characters.push(_event.m.Merc2.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "B",
			Text = "[img]gfx/ui/events/event_06.png[/img] {You find some menial tasks to set them to, at opposite sides of camp.|You find an excuse to seperate the two of them before the conversation goes too far|You distract one of them with some light hearted prodding and lude comments, the two part ways|You feign hearing a sound in the distance, an excuse to send one of them off to check on it| You interupt the conversation to focus on the state of their gear, attention soon turns to repairing their equipment}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "They\'ll become brothers in battle soon enough.",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Merc1.getImagePath());
				this.Characters.push(_event.m.Merc2.getImagePath());
				local injury1 = _event.m.Merc1.addInjury(this.Const.Injury.Brawl);
				local injury2 = _event.m.Merc2.addInjury(this.Const.Injury.Brawl);
				this.List.push({
					id = 10,
					icon = injury1.getIcon(),
					text = _event.m.Merc1.getName() + " suffers " + injury1.getNameOnly()
				});
				this.List.push({
					id = 10,
					icon = injury2.getIcon(),
					text = _event.m.Merc2.getName() + " suffers " + injury2.getNameOnly()
				});
			}

		});
		this.m.Screens.push({
			ID = "C",
			Text = "[img]gfx/ui/events/event_64.png[/img] The two talk at length, eventually coming to {an agreement|a concordance|an alignment|a reflection|a ponderance|a harmony|a rapport|a deal|a pact|a bond|an understanding|a shared thought|an undertaking|a likeness|a similarity|a compatibility}  on {the nature of|the way of|the properties of|the details of|the components of|the parts of|the finer points of|the nessecary ingredients for|the facets of|the heart of|the essence of}  {wheat|socks|hair|rocks|clouds|stars|teeth|burps|music|poetry|farts|toes|shoes|pants|elbows|gems|gold|nobility|religion|war|peace|sleep|sex|children|porridge|pies|wood|cloth|string|the moon|the sun|death|hope|dreams|love|hope|belly button lint|ear wax|pimples|pocket fluff|art|the heavens|the gods|injury|regret|solitude|fate|storms|seas|mountains|forrests|rivers|cities|houses|fields|travel|settling down|having children|work|play|dance|flowers|moss|swamps|witches|orcs|undead|goblins|wolves|lindwurms|bears|drinking|smoke|fire|grass|dirt|coin|matters of the heart|devotion|tenderness|sentiment|weakness|strength|piety|fidelity|adulation|lust|friendship|respect|delight|speculation|investigation|meditation|judgement|deliberation|consideration|deduction|negligence|ignorance|disrespect|disdain|intellect|knowledge|perception|gas|wind|vapours|jokes|buffonery|tomfoolery|sport|combat|conflict|tactics|swordplay|archery|knighthood|chivalry|courtliness|politeness|courtesy|courage|fairness|valiance|gallantry|valor|ceremony|cultivation|elegance|civility|gardening|plowing|tilage|mining|poaching|weaving|darning|apprenticeship|assissination|barbarians|begging|bowyery|butchery|trade|fishing|grave robbing|woodchopping|prayer|prostitution|raiding|fleeing|serving|herding|tailoring|theiving|fornication|harlotry|hustling|adultery|corruption|exploitation|misdeed|perversion|crime|debasement|delinguency|desecration|injustice|sin|offense|abasement|ignominy|scorn|abuse|slander|backstabbing|mud slinging|flattery|copulation|carousal|lechery|gluttony|indulgence|temperance|revelry|seduction|licentiousness|lasciviousness|decadence|wantonness|lubricity|pruriency|amativeness|predilection|rapaciousness|eroticism|hunger|yearning|desire|famine|starvation|famishment|voracity|anararchy|liberty|excess|complacency|audacity|hostility|turmoil|revolution|transformation|reformation|metamorphosis|tumult|upheaval|pacification|pacifism|aggression|pugilism|jousting|martial prowess|fencing|wrestling|feuding|quarreling|squabbling|deuling|engagement|addairs of honor|single combat|hammering|axemanship|combat|prancing|footwork|fisticuffs|molestation|masturbation|insurrection|derangement|abduction|depredation|despoilment|plundering|forcible violation|pillaging|looting|marauding|ransacking|ravaging|appropriation|trespass|stealing|filching|pilfering|robbing|hijacking|mugging|pickpocketing|baking|milling|harvesting|threshing|brewing|embezzling|swindling|snitching|strong arming|absconding|running away|retreating|escaping|evading|running|walking|philosophy|indoctrination|reasoning|theorisation|belief|conviction|analysis|argument|hypothesising|interpreting|rationale|deduction|exposition|speaking|commentary|construction|discussion|enunciation|pronounciation|studying|writing|elocution|rhythm|tonality|emphasis|radicalisation|reformation|enlightenment|egalitarianism|autonomous governance|equal rights|communal governance|self ruling|populism|freedom|democracy|oligarchy|monarchy|dictatorship|militarism|sovereignity|government|subservience|tyrants|an uncaring universe|the way things fall apart|the way things fall down|the cycles of constelations|the movement of clouds|the migration of birds|the passage of time|the lifecycle of insects|bees|swallows|ducks|chickens|swans|pigeons|rats|dogs|cats|pigs|cows|sheep|horses|deer|foxes|boars|squirrels|otters|ghosts|banshees|trolls|giants|dragons|living trees|demons|alps|schratts|unholds|living rock|curses|hexes|sacrilege|swearing|oaths|profanity|blashpemy|obscenity|enchantment|conjuration|bewitchment|charms|sorcery|alchemy|incantation|divination|thaumaturgy|necromancy|wizardry|banditry|allurement|astrology|fascination|foreboding|prediction|theurgy|chanting|contracts|bargaining|selling|negotiation|bartering|haggling|compromise|business|budgeting|ownership|aristocracy|tolerance|majority rule|voting|heirarchy|autotheism|antinomianism|confession|mercy|righteousness|moral relativity|authority|resistance|secularity|the commons|communal ownership|oppression|goodness|the enraged|the pantsless|revolutionaries|coup|mental enslavement|private judgement|property|mutual aid|centralisation|possession|individualism|ego|the place of women|slavery|workers|peasants|gentry|insurrection|peaceful resistance|clergy|austerity|intercession|the soul|heresy|suspicion|accusation|teaching|folkmoot|petty kingdoms|Tynwald|the Althing|free spirits|Uppsala|lawspeakers|Landsgemeinde|Uthman|Gopala|Tuatha|Ibadites|guilds|city states|Signorie|Veche|Wiec|parliament|represenation|petitions|Witenagemot|the Witan|ealdormen|thegns|councillors|the law|honor among theives|charters|aristocracy|smithing|forging|iron|silver|gold|copper|tin|bronze|medicine|optics|engineering|the philosophers stone|goety|herbology|eternal youth|chrysopoeia|alcohol|elixirs|water|fire|meteors|weight|glass|the water of life|dyes|perfume|spices|angels|smoke|sulfur|mercury|zinc|assembly|movement|flying|sailing|trekking|voyages|seafaring|catapults|crossbows|swords|axes|polearms|daggers|daggering||knives|knife fighting|staves|billhooks|bardiches|bludgeoning|bludgeons|falchions|flails|goedendag|whether flails are real|greataxes|hatchets|javelins|arrows|quivers|sheaths|sheilds|chains|glaives|scythes|hoes|halberds|saws|shovels|sickles|voulges|cleavers|pickaxes|aprons|gambesons|robes|tunics|dresses|hauberks|sackcloth|helms|coifs|hats|caps|mail|hoods|scarves|gloves|greaves|beer|wine|mead|stew|bread|venison|fish|fruit|cheese|grains|cannibalism|pie|porridge|pudding|mushrooms|berries|roots|ham|furs|salt|cloth|amber|coins|jewelry|statues|bowls|cups|the fountain of youth|the golden goose|the fallen emporer|the dark gods|Davkul|torment|death|suffering|despair|ancient spires|ancient temples|the black monolith|rul\'gazhix|stone pillars|the unhold graveyard|witch huts|watermills|windmills|competition|chapels|castles|hovels|goblin camps|goblin cities|bandit camps|bandit hideouts|bandit ruins|barbarian camps|barbarian raids|goblin outposts|goblin settlements|noble camps|orc camps|orc caves|orc fortresses|orc hideouts|orc ruins|barbarian ruins|buried castles|crypts|graveyards|graves|lairs|necropolises|covens|amber collectors|beekeepers|furnaces|breweries|dye making|fishing boats|fishing huts|fletchers|fletchery|fletching|outposts|gathering|fathering|mothering|goats|harbors|guarding|guard duty|perimeters|lookout duty|latrines|piss|shit|tanning|leather|lumber|training|militia|groves|orchards|fruit picking|ore|smelting|peat|peat pits|pig pens|salt mines|watchtowers|copper veins|iron veins|trapping|trappers|wheat|barley|oats|winery|vinyards|wool|wool spinning|workshops|tinkering|tundra|steppe|snow|rain|storms|sleet|mist|fog|hail|floods|mining towns|coastal villages|lumber villages|mountain villages|mountain forts|tundra forts|coastal forts|swamp villages|swamp forts|abducted children|ambushed trade routes|ambushing|ambushes|archery contests|the south lands|seiges|beseiging|siege breaking|cultists|cultist processions|disappearing villagers|disbanded troops|drought|good harvests|bad harvests|greenskins|greenskin invasions|hunting season|holidays|local holidays|cave ins|mustering troops|feasting|preparing feasts|cleaning|mopping|scrubbing|washing|executions|executing|executioners|razing buildings|rebuilding|refugees|safe roads|unsafe roads|reading the road|reading the clouds|predicting the weather|the seasons|seaonal fairs|sickness|plague|illness|ailment|affliction|anguish|calamit|grief|hardship|misery|misfortune|difficulty|pain|sorrow|suffering|torment|woe|disease|terror|fear|angst|despair|horror|panic|suspicion|nightmares|dreams|fantasy|loss|hallucinations|tribulation|pleasure|certainty|reality|vision|hearing|touch|smell|taste|illusion|daydreaming|imagination|rainbows|castles in the sky|fools|apparitions|paradise|accidents|casualties|catastrophes|disaster|failure|injury|destitution|squandering|wrecking|perdition|damnation|exoneration|bliss|utopia|clover|joy|amusement|comfort|pride|satisfaction|festivity|ecstasy|healing|rallying|herbal rememdies|palliative care|massage|body building|catharsis|tumbling|conditioning|habituation|practice|armorsmiths|barbers|haircutting|cosmetics|kennels|dog handling|ports|stables|taverns|wenching|temples|taxidermy|weaponsmiths|training halls|leaders|marksmen|rabble|ambushers|wildlings|paint|snake oil|silk|bones|wagons|combat drills|gambling|wounds|juggling|melons|civil war|witch burning|witch hunting|brawling|oracles|paranoia|treasure|spiders|ambition}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "The company grows stronger",
					function getResult( _event )
					{
						local modifier1 = this.Math.rand(10, 20);
						_event.m.Merc1.changeActiveRelationship( _event.m.Merc2, modifier1 );
						local modifier2 = this.Math.rand(10, 20);
						 _event.m.Merc2.changeActiveRelationship( _event.m.Merc1, modifier2 );
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Merc1.getImagePath());
				this.Characters.push(_event.m.Merc2.getImagePath());
				_event.m.Bastard.improveMood(0.5, "Had a good conversation");

				if (_event.m.Merc1.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Merc1.getMoodState()],
						text = _event.m.Merc1.getName() + this.Const.MoodStateEvent[_event.m.Merc1.getMoodState()]
					});
				}
			}

		});
		this.m.Screens.push({
			ID = "D",
			Text = "[img]gfx/ui/events/event_64.png[/img]%merc1% {cruelly|savagely|viciously|brutishly|ferociously|fiercely|nastily|meanly|furiously|ardantly|avidly|passionately|fervently|zealously|vehemently|jokingly|humorously|absurdly|jovially|amusingly|facetiously|satirically} {makes fun of| insults| derides|mocks|pokes fun at|disdains|disparages|denigrates|refutes|contradicts|rebuts|denies|invalidates} %merc2%\'s {points|ideas|intuiton|concepts} {about|regarding|relating to|on the subject of|on the topic of|in regard to|as to|in relation to|dealing with|touching on} {wheat|socks|hair|rocks|clouds|stars|teeth|burps|music|poetry|farts|toes|shoes|pants|elbows|gems|gold|nobility|religion|war|peace|sleep|sex|children|porridge|pies|wood|cloth|string|the moon|the sun|death|hope|dreams|love|hope|belly button lint|ear wax|pimples|pocket fluff|art|the heavens|the gods|injury|regret|solitude|fate|storms|seas|mountains|forrests|rivers|cities|houses|fields|travel|settling down|having children|work|play|dance|flowers|moss|swamps|witches|orcs|undead|goblins|wolves|lindwurms|bears|drinking|smoke|fire|grass|dirt|coin|matters of the heart|devotion|tenderness|sentiment|weakness|strength|piety|fidelity|adulation|lust|friendship|respect|delight|speculation|investigation|meditation|judgement|deliberation|consideration|deduction|negligence|ignorance|disrespect|disdain|intellect|knowledge|perception|gas|wind|vapours|jokes|buffonery|tomfoolery|sport|combat|conflict|tactics|swordplay|archery|knighthood|chivalry|courtliness|politeness|courtesy|courage|fairness|valiance|gallantry|valor|ceremony|cultivation|elegance|civility|gardening|plowing|tilage|mining|poaching|weaving|darning|apprenticeship|assissination|barbarians|begging|bowyery|butchery|trade|fishing|grave robbing|woodchopping|prayer|prostitution|raiding|fleeing|serving|herding|tailoring|theiving|fornication|harlotry|hustling|adultery|corruption|exploitation|misdeed|perversion|crime|debasement|delinguency|desecration|injustice|sin|offense|abasement|ignominy|scorn|abuse|slander|backstabbing|mud slinging|flattery|copulation|carousal|lechery|gluttony|indulgence|temperance|revelry|seduction|licentiousness|lasciviousness|decadence|wantonness|lubricity|pruriency|amativeness|predilection|rapaciousness|eroticism|hunger|yearning|desire|famine|starvation|famishment|voracity|anararchy|liberty|excess|complacency|audacity|hostility|turmoil|revolution|transformation|reformation|metamorphosis|tumult|upheaval|pacification|pacifism|aggression|pugilism|jousting|martial prowess|fencing|wrestling|feuding|quarreling|squabbling|deuling|engagement|addairs of honor|single combat|hammering|axemanship|combat|prancing|footwork|fisticuffs|molestation|masturbation|insurrection|derangement|abduction|depredation|despoilment|plundering|forcible violation|pillaging|looting|marauding|ransacking|ravaging|appropriation|trespass|stealing|filching|pilfering|robbing|hijacking|mugging|pickpocketing|baking|milling|harvesting|threshing|brewing|embezzling|swindling|snitching|strong arming|absconding|running away|retreating|escaping|evading|running|walking|philosophy|indoctrination|reasoning|theorisation|belief|conviction|analysis|argument|hypothesising|interpreting|rationale|deduction|exposition|speaking|commentary|construction|discussion|enunciation|pronounciation|studying|writing|elocution|rhythm|tonality|emphasis|radicalisation|reformation|enlightenment|egalitarianism|autonomous governance|equal rights|communal governance|self ruling|populism|freedom|democracy|oligarchy|monarchy|dictatorship|militarism|sovereignity|government|subservience|tyrants|an uncaring universe|the way things fall apart|the way things fall down|the cycles of constelations|the movement of clouds|the migration of birds|the passage of time|the lifecycle of insects|bees|swallows|ducks|chickens|swans|pigeons|rats|dogs|cats|pigs|cows|sheep|horses|deer|foxes|boars|squirrels|otters|ghosts|banshees|trolls|giants|dragons|living trees|demons|alps|schratts|unholds|living rock|curses|hexes|sacrilege|swearing|oaths|profanity|blashpemy|obscenity|enchantment|conjuration|bewitchment|charms|sorcery|alchemy|incantation|divination|thaumaturgy|necromancy|wizardry|banditry|allurement|astrology|fascination|foreboding|prediction|theurgy|chanting|contracts|bargaining|selling|negotiation|bartering|haggling|compromise|business|budgeting|ownership|aristocracy|tolerance|majority rule|voting|heirarchy|autotheism|antinomianism|confession|mercy|righteousness|moral relativity|authority|resistance|secularity|the commons|communal ownership|oppression|goodness|the enraged|the pantsless|revolutionaries|coup|mental enslavement|private judgement|property|mutual aid|centralisation|possession|individualism|ego|the place of women|slavery|workers|peasants|gentry|insurrection|peaceful resistance|clergy|austerity|intercession|the soul|heresy|suspicion|accusation|teaching|folkmoot|petty kingdoms|Tynwald|the Althing|free spirits|Uppsala|lawspeakers|Landsgemeinde|Uthman|Gopala|Tuatha|Ibadites|guilds|city states|Signorie|Veche|Wiec|parliament|represenation|petitions|Witenagemot|the Witan|ealdormen|thegns|councillors|the law|honor among theives|charters|aristocracy|smithing|forging|iron|silver|gold|copper|tin|bronze|medicine|optics|engineering|the philosophers stone|goety|herbology|eternal youth|chrysopoeia|alcohol|elixirs|water|fire|meteors|weight|glass|the water of life|dyes|perfume|spices|angels|smoke|sulfur|mercury|zinc|assembly|movement|flying|sailing|trekking|voyages|seafaring|catapults|crossbows|swords|axes|polearms|daggers|daggering||knives|knife fighting|staves|billhooks|bardiches|bludgeoning|bludgeons|falchions|flails|goedendag|whether flails are real|greataxes|hatchets|javelins|arrows|quivers|sheaths|sheilds|chains|glaives|scythes|hoes|halberds|saws|shovels|sickles|voulges|cleavers|pickaxes|aprons|gambesons|robes|tunics|dresses|hauberks|sackcloth|helms|coifs|hats|caps|mail|hoods|scarves|gloves|greaves|beer|wine|mead|stew|bread|venison|fish|fruit|cheese|grains|cannibalism|pie|porridge|pudding|mushrooms|berries|roots|ham|furs|salt|cloth|amber|coins|jewelry|statues|bowls|cups|the fountain of youth|the golden goose|the fallen emporer|the dark gods|Davkul|torment|death|suffering|despair|ancient spires|ancient temples|the black monolith|rul\'gazhix|stone pillars|the unhold graveyard|witch huts|watermills|windmills|competition|chapels|castles|hovels|goblin camps|goblin cities|bandit camps|bandit hideouts|bandit ruins|barbarian camps|barbarian raids|goblin outposts|goblin settlements|noble camps|orc camps|orc caves|orc fortresses|orc hideouts|orc ruins|barbarian ruins|buried castles|crypts|graveyards|graves|lairs|necropolises|covens|amber collectors|beekeepers|furnaces|breweries|dye making|fishing boats|fishing huts|fletchers|fletchery|fletching|outposts|gathering|fathering|mothering|goats|harbors|guarding|guard duty|perimeters|lookout duty|latrines|piss|shit|tanning|leather|lumber|training|militia|groves|orchards|fruit picking|ore|smelting|peat|peat pits|pig pens|salt mines|watchtowers|copper veins|iron veins|trapping|trappers|wheat|barley|oats|winery|vinyards|wool|wool spinning|workshops|tinkering|tundra|steppe|snow|rain|storms|sleet|mist|fog|hail|floods|mining towns|coastal villages|lumber villages|mountain villages|mountain forts|tundra forts|coastal forts|swamp villages|swamp forts|abducted children|ambushed trade routes|ambushing|ambushes|archery contests|the south lands|seiges|beseiging|siege breaking|cultists|cultist processions|disappearing villagers|disbanded troops|drought|good harvests|bad harvests|greenskins|greenskin invasions|hunting season|holidays|local holidays|cave ins|mustering troops|feasting|preparing feasts|cleaning|mopping|scrubbing|washing|executions|executing|executioners|razing buildings|rebuilding|refugees|safe roads|unsafe roads|reading the road|reading the clouds|predicting the weather|the seasons|seaonal fairs|sickness|plague|illness|ailment|affliction|anguish|calamit|grief|hardship|misery|misfortune|difficulty|pain|sorrow|suffering|torment|woe|disease|terror|fear|angst|despair|horror|panic|suspicion|nightmares|dreams|fantasy|loss|hallucinations|tribulation|pleasure|certainty|reality|vision|hearing|touch|smell|taste|illusion|daydreaming|imagination|rainbows|castles in the sky|fools|apparitions|paradise|accidents|casualties|catastrophes|disaster|failure|injury|destitution|squandering|wrecking|perdition|damnation|exoneration|bliss|utopia|clover|joy|amusement|comfort|pride|satisfaction|festivity|ecstasy|healing|rallying|herbal rememdies|palliative care|massage|body building|catharsis|tumbling|conditioning|habituation|practice|armorsmiths|barbers|haircutting|cosmetics|kennels|dog handling|ports|stables|taverns|wenching|temples|taxidermy|weaponsmiths|training halls|leaders|marksmen|rabble|ambushers|wildlings|paint|snake oil|silk|bones|wagons|combat drills|gambling|wounds|juggling|melons|civil war|witch burning|witch hunting|brawling|oracles|paranoia|treasure|spiders|ambition}, and the two of them fall into arguing",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "What a pity",
					function getResult( _event )
					{
						local modifier1 = this.Math.rand(-10, -20);
						_event.m.Merc1.changeActiveRelationship( _event.m.Bastard, modifier1 );
						local modifier2 = this.Math.rand(-10, -20);
						 _event.m.Merc2.changeActiveRelationship( _event.m.Assassin, modifier2 );
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Merc1.getImagePath());
				this.Characters.push(_event.m.Merc2.getImagePath());
				_event.m.Merc2.worsenMood(0.5, "Had a bad conversation");

				if (_event.m.Merc2.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Merc2.getMoodState()],
						text = _event.m.Merc2.getName() + this.Const.MoodStateEvent[_event.m.Merc2.getMoodState()]
					});
				}
			}

		});
		this.m.Screens.push({
			ID = "E",
			Text = "[img]gfx/ui/events/event_64.png[/img]The {whole|entire} {group|company} {talk|converse|babble|engage in conversation|prattle on|jabber on|lecture each other|debate|deliberate|discuss|exchange views|consult} {at length|for a time|for an age|for ages|for a while|exhaustively|briefly|quickly|slowly|over a meal|around a fire|over drinks|while practicing|while sparring|while repairing gear|while sharpening their weapons|while cleaning the camp|while walking|while marching|along the road|while patrolling|while attending their duties|while avoiding their duties}, {eventually|finally|at last|ultimately|in the end} {coming to|arriving at|reaching|deciding on|landing on|resolving at|parting ways at|settling on} their {own|seperate|divergent|different|diverse|varied|assorted|differing|sundry|wide ranging|variegated|multifarious|motley|various} {opinions|viewpoints|ideals|ideas|judgements|thinking|views|angles|positions|standpoints|notions|verdicts|attitudes|stances|reflections|hypothesis|feelings|theories|convictions|contentions|outlooks|angles|tenets|sentiments|beliefs} {on|regarding|about|concerning|with respect to|with regard to|in regard to|respecting|around|round|over|all over|throughout|surrounding|as to|as for|in connection with} the {finer|nessecary|essential|crucial|indispensible|required|requisite|important|outstanding|underlying|core|ultimate|central|compelling|deciding|pivotal|vital|basic|decisive|critical|meaningful|significant|cardinal|key|mai} {nature|way|properties|details|components|parts|points|ingredients|facets|heart|essence|features|characteristics|attributes|specifics|factors|particulars|elements|aspects|facets|dimensions} of {wheat|socks|hair|rocks|clouds|stars|teeth|burps|music|poetry|farts|toes|shoes|pants|elbows|gems|gold|nobility|religion|war|peace|sleep|sex|children|porridge|pies|wood|cloth|string|the moon|the sun|death|hope|dreams|love|hope|belly button lint|ear wax|pimples|pocket fluff|art|the heavens|the gods|injury|regret|solitude|fate|storms|seas|mountains|forrests|rivers|cities|houses|fields|travel|settling down|having children|work|play|dance|flowers|moss|swamps|witches|orcs|undead|goblins|wolves|lindwurms|bears|drinking|smoke|fire|grass|dirt|coin|matters of the heart|devotion|tenderness|sentiment|weakness|strength|piety|fidelity|adulation|lust|friendship|respect|delight|speculation|investigation|meditation|judgement|deliberation|consideration|deduction|negligence|ignorance|disrespect|disdain|intellect|knowledge|perception|gas|wind|vapours|jokes|buffonery|tomfoolery|sport|combat|conflict|tactics|swordplay|archery|knighthood|chivalry|courtliness|politeness|courtesy|courage|fairness|valiance|gallantry|valor|ceremony|cultivation|elegance|civility|gardening|plowing|tilage|mining|poaching|weaving|darning|apprenticeship|assissination|barbarians|begging|bowyery|butchery|trade|fishing|grave robbing|woodchopping|prayer|prostitution|raiding|fleeing|serving|herding|tailoring|theiving|fornication|harlotry|hustling|adultery|corruption|exploitation|misdeed|perversion|crime|debasement|delinguency|desecration|injustice|sin|offense|abasement|ignominy|scorn|abuse|slander|backstabbing|mud slinging|flattery|copulation|carousal|lechery|gluttony|indulgence|temperance|revelry|seduction|licentiousness|lasciviousness|decadence|wantonness|lubricity|pruriency|amativeness|predilection|rapaciousness|eroticism|hunger|yearning|desire|famine|starvation|famishment|voracity|anararchy|liberty|excess|complacency|audacity|hostility|turmoil|revolution|transformation|reformation|metamorphosis|tumult|upheaval|pacification|pacifism|aggression|pugilism|jousting|martial prowess|fencing|wrestling|feuding|quarreling|squabbling|deuling|engagement|addairs of honor|single combat|hammering|axemanship|combat|prancing|footwork|fisticuffs|molestation|masturbation|insurrection|derangement|abduction|depredation|despoilment|plundering|forcible violation|pillaging|looting|marauding|ransacking|ravaging|appropriation|trespass|stealing|filching|pilfering|robbing|hijacking|mugging|pickpocketing|baking|milling|harvesting|threshing|brewing|embezzling|swindling|snitching|strong arming|absconding|running away|retreating|escaping|evading|running|walking|philosophy|indoctrination|reasoning|theorisation|belief|conviction|analysis|argument|hypothesising|interpreting|rationale|deduction|exposition|speaking|commentary|construction|discussion|enunciation|pronounciation|studying|writing|elocution|rhythm|tonality|emphasis|radicalisation|reformation|enlightenment|egalitarianism|autonomous governance|equal rights|communal governance|self ruling|populism|freedom|democracy|oligarchy|monarchy|dictatorship|militarism|sovereignity|government|subservience|tyrants|an uncaring universe|the way things fall apart|the way things fall down|the cycles of constelations|the movement of clouds|the migration of birds|the passage of time|the lifecycle of insects|bees|swallows|ducks|chickens|swans|pigeons|rats|dogs|cats|pigs|cows|sheep|horses|deer|foxes|boars|squirrels|otters|ghosts|banshees|trolls|giants|dragons|living trees|demons|alps|schratts|unholds|living rock|curses|hexes|sacrilege|swearing|oaths|profanity|blashpemy|obscenity|enchantment|conjuration|bewitchment|charms|sorcery|alchemy|incantation|divination|thaumaturgy|necromancy|wizardry|banditry|allurement|astrology|fascination|foreboding|prediction|theurgy|chanting|contracts|bargaining|selling|negotiation|bartering|haggling|compromise|business|budgeting|ownership|aristocracy|tolerance|majority rule|voting|heirarchy|autotheism|antinomianism|confession|mercy|righteousness|moral relativity|authority|resistance|secularity|the commons|communal ownership|oppression|goodness|the enraged|the pantsless|revolutionaries|coup|mental enslavement|private judgement|property|mutual aid|centralisation|possession|individualism|ego|the place of women|slavery|workers|peasants|gentry|insurrection|peaceful resistance|clergy|austerity|intercession|the soul|heresy|suspicion|accusation|teaching|folkmoot|petty kingdoms|Tynwald|the Althing|free spirits|Uppsala|lawspeakers|Landsgemeinde|Uthman|Gopala|Tuatha|Ibadites|guilds|city states|Signorie|Veche|Wiec|parliament|represenation|petitions|Witenagemot|the Witan|ealdormen|thegns|councillors|the law|honor among theives|charters|aristocracy|smithing|forging|iron|silver|gold|copper|tin|bronze|medicine|optics|engineering|the philosophers stone|goety|herbology|eternal youth|chrysopoeia|alcohol|elixirs|water|fire|meteors|weight|glass|the water of life|dyes|perfume|spices|angels|smoke|sulfur|mercury|zinc|assembly|movement|flying|sailing|trekking|voyages|seafaring|catapults|crossbows|swords|axes|polearms|daggers|daggering||knives|knife fighting|staves|billhooks|bardiches|bludgeoning|bludgeons|falchions|flails|goedendag|whether flails are real|greataxes|hatchets|javelins|arrows|quivers|sheaths|sheilds|chains|glaives|scythes|hoes|halberds|saws|shovels|sickles|voulges|cleavers|pickaxes|aprons|gambesons|robes|tunics|dresses|hauberks|sackcloth|helms|coifs|hats|caps|mail|hoods|scarves|gloves|greaves|beer|wine|mead|stew|bread|venison|fish|fruit|cheese|grains|cannibalism|pie|porridge|pudding|mushrooms|berries|roots|ham|furs|salt|cloth|amber|coins|jewelry|statues|bowls|cups|the fountain of youth|the golden goose|the fallen emporer|the dark gods|Davkul|torment|death|suffering|despair|ancient spires|ancient temples|the black monolith|rul\'gazhix|stone pillars|the unhold graveyard|witch huts|watermills|windmills|competition|chapels|castles|hovels|goblin camps|goblin cities|bandit camps|bandit hideouts|bandit ruins|barbarian camps|barbarian raids|goblin outposts|goblin settlements|noble camps|orc camps|orc caves|orc fortresses|orc hideouts|orc ruins|barbarian ruins|buried castles|crypts|graveyards|graves|lairs|necropolises|covens|amber collectors|beekeepers|furnaces|breweries|dye making|fishing boats|fishing huts|fletchers|fletchery|fletching|outposts|gathering|fathering|mothering|goats|harbors|guarding|guard duty|perimeters|lookout duty|latrines|piss|shit|tanning|leather|lumber|training|militia|groves|orchards|fruit picking|ore|smelting|peat|peat pits|pig pens|salt mines|watchtowers|copper veins|iron veins|trapping|trappers|wheat|barley|oats|winery|vinyards|wool|wool spinning|workshops|tinkering|tundra|steppe|snow|rain|storms|sleet|mist|fog|hail|floods|mining towns|coastal villages|lumber villages|mountain villages|mountain forts|tundra forts|coastal forts|swamp villages|swamp forts|abducted children|ambushed trade routes|ambushing|ambushes|archery contests|the south lands|seiges|beseiging|siege breaking|cultists|cultist processions|disappearing villagers|disbanded troops|drought|good harvests|bad harvests|greenskins|greenskin invasions|hunting season|holidays|local holidays|cave ins|mustering troops|feasting|preparing feasts|cleaning|mopping|scrubbing|washing|executions|executing|executioners|razing buildings|rebuilding|refugees|safe roads|unsafe roads|reading the road|reading the clouds|predicting the weather|the seasons|seaonal fairs|sickness|plague|illness|ailment|affliction|anguish|calamit|grief|hardship|misery|misfortune|difficulty|pain|sorrow|suffering|torment|woe|disease|terror|fear|angst|despair|horror|panic|suspicion|nightmares|dreams|fantasy|loss|hallucinations|tribulation|pleasure|certainty|reality|vision|hearing|touch|smell|taste|illusion|daydreaming|imagination|rainbows|castles in the sky|fools|apparitions|paradise|accidents|casualties|catastrophes|disaster|failure|injury|destitution|squandering|wrecking|perdition|damnation|exoneration|bliss|utopia|clover|joy|amusement|comfort|pride|satisfaction|festivity|ecstasy|healing|rallying|herbal rememdies|palliative care|massage|body building|catharsis|tumbling|conditioning|habituation|practice|armorsmiths|barbers|haircutting|cosmetics|kennels|dog handling|ports|stables|taverns|wenching|temples|taxidermy|weaponsmiths|training halls|leaders|marksmen|rabble|ambushers|wildlings|paint|snake oil|silk|bones|wagons|combat drills|gambling|wounds|juggling|melons|civil war|witch burning|witch hunting|brawling|oracles|paranoia|treasure|spiders|ambition|youth|aging}",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "This will build character",
					function getResult( _event )
					{
						local modifier1 = this.Math.rand(10, 20);
						_event.m.Merc1.changeActiveRelationship( _event.m.Merc2, modifier1 );
						local modifier2 = this.Math.rand(10, 20);
						 _event.m.Merc2.changeActiveRelationship( _event.m.Merc1, modifier2 );
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Merc1.getImagePath());
				this.Characters.push(_event.m.Merc2.getImagePath());
				_event.m.Bastard.improveMood(0.5, "Had a good conversation");

				if (_event.m.Merc1.getMoodState() < this.Const.MoodState.Neutral)
				{
					this.List.push({
						id = 10,
						icon = this.Const.MoodStateIcon[_event.m.Merc1.getMoodState()],
						text = _event.m.Merc1.getName() + this.Const.MoodStateEvent[_event.m.Merc1.getMoodState()]
					});
				}
			}

		});
	}

	function onUpdateScore()
	{
		local brothers = this.World.getPlayerRoster().getAll();

		if (brothers.len() < 2)
		{
			return;
		}

		local merc1_candidates = [];

		foreach( bro in brothers )
		{
			merc1_candidates.push(bro);
		}

		if (merc1_candidates.len() == 0)
		{
			return;
		}

		local merc2_candidates = [];

		foreach( candidate in merc1_candidates )
		{
			foreach( bro in brothers )
			{
				local relation = candidate.getActiveRelationshipWith(bro).RelationNum;
				 if(relation <10 && relation > -10)
					{
					merc2_candidates.push(bro);
					}
			}
		}

		if (merc2_candidates.len() == 0)
		{
			return;
		}

		this.m.Merc1 = merc1_candidates[this.Math.rand(0, merc1_candidates.len() - 1)];
		this.m.Merc2 = merc2_candidates[this.Math.rand(0, merc2_candidates.len() - 1)];
		this.m.Score = merc1_candidates.len() * 10;
	}

	function onPrepare()
	{
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"nobleman",
			this.m.Merc1.getName()
		]);
		_vars.push([
			"nobleman_short",
			this.m.Merc1.getNameOnly()
		]);
		_vars.push([
			"lowborn",
			this.m.Merc2.getName()
		]);
		_vars.push([
			"lowborn_short",
			this.m.Merc2.getNameOnly()
		]);
	}

	function onDetermineStartScreen()
	{
		return "A";
	}

	function onClear()
	{
		this.m.Merc1 = null;
		this.m.Merc2 = null;
	}

});

