::mods_hookExactClass("events/events/dlc6/crisis/holywar_outro_north_event", function(o) {
	local create = o.create;
	o.create = function() {
		create();
		foreach (s in this.m.Screens) {
			if (s.ID == "A") {
				s.Text = "[img]gfx/ui/events/event_84.png[/img]{Faith placed in the old gods has been rewarded: the holy war is over, and the northerners stand victorious. Songs fill the air as crowds move as a mob, fists pumping, flags flying, becoming briefly uniform in a shared sense of piety. You stand by the wayside, your shoulders already wreathed in adornments, beads, necklaces, things of no material value, and yet they bear some weight which the wearer can only find by looking into the eyes of those who hand them out.\n\n Of course, certain dignities go unrealized in the celebration: the bodies of the defeated are put on display, thrashed in ways meant to satisfy the old gods that are watching, and holy totems of the Gilder are mocked, desecrated, and ultimately burned. And it is indeed certain that not a joyful soul will recognize you as a force in this cheerful culmination. You\'ve merely slipped right into the background once more, sellsword, crownling, interloper. But the %companyname% made a small fortune in the religious endeavors. Despite the smiles and laughs, you know that strife such as this is buried in the mind, not in the earth, and someday someone or something will come and resurrect it, and there the company will await another glorious payday. Or perhaps now would be a good time to put up the sword and enjoy your crowns?\n\n%OOC%Something burns down inside of you. Something that struggles to be free. Perhaps it is the success you have have had along the way, or the failings that you couldn\'t stop in time. Maybe there is more out there to see?%OOC_OFF%}";
			}
			if (s.ID == "B") {
				s.Text = "[img]gfx/ui/events/event_84.png[/img]{Uttering their name is to draw words from tongue to intemporal: the old gods. They are beyond time, and their vast number invoke awe over specificity. Endearing as this is to any listener familiar or not with the faith, it also brings greater weight to any defeat of those who follow these unbranded beings. The crusades are over, and the northerners have lost.\n\n You watch as the northerners try and explain it to one another how it came to pass. It was not a terrestrial defeat here, nor even a victory by the southerners - no, this was punishment. Northerners have grazed far from the holy lands, they have meadowed in the material world, priories and churches dot the realm, empty and hollow for far too long. Naturally, inquiries about the nature of this southern \'Gilder\' have also come, but they quickly pass. To even dwell on Him is to invite doubt, and right now doubt is as dangerous as any poison. Of course, the %companyname% stays at a distance. Sellswords that you are, you put faith in your sword and in the purse, and both got their dues in this war. The only philosophizing you\'ll be doing in the days to come is pondering just how soon the north and south will resume stating their differences. Perhaps now would be a good time to put up the sword and enjoy your crowns?\n\n%OOC%Something burns down inside of you. Something that struggles to be free. Perhaps it is the success you have have had along the way, or the failings that you couldn\'t stop in time. Maybe there is more out there to see?%OOC_OFF%}";
			}
		}
	}
})
