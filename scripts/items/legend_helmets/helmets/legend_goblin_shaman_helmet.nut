this.legend_goblin_shaman_helmet <- this.inherit("scripts/items/helmets/greenskins/goblin_shaman_helmet", {
	m = {},
	function create()
	{
		this.goblin_shaman_helmet.create();
		this.m.ID = "armor.head.legend_goblin_shaman_helmet";
		this.m.IsDroppedAsLoot = true;
	}

	function getLootLayers()
	{
		return [this.new("scripts/items/legend_helmets/vanity/legend_helmet_goblin_bones")];
	}

	// function onEquip() {
	// 	this.logInfo("shaman helmet on equip")
	// 	this.goblin_shaman_helmet.onEquip()
	// 	local actor = this.getContainer().getActor()
	// 	if (actor != null) {
	// 		this.logInfo("Changing sprite direction")
	// 		actor.getSprite("helmet").setHorizontalFlipping(true);
	// 		actor.getSprite("helmet_damage").setHorizontalFlipping(true);
	// 		actor.getSprite("helmet_vanity_lower").setHorizontalFlipping(true);
	// 		actor.getSprite("helmet_helm").setHorizontalFlipping(true);
	// 		actor.getSprite("helmet_top").setHorizontalFlipping(true);
	// 		actor.getSprite("helmet_vanity").setHorizontalFlipping(true);
	// 	}

	// }


});

