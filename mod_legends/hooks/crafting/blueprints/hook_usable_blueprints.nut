local blueprints = [
	"acid_flask_blueprint",
	"antidote_blueprint",
	"cat_potion_blueprint",
	"daze_bomb_blueprint",
	"fire_bomb_blueprint",
	"happy_powder_blueprint",
	"iron_will_potion",
	"lionheart_potion_blueprint",
	"miracle_drug_blueprint",
	"night_vision_elixir_blueprint",
	"poisoned_oil_blueprint",
	"potion_of_knowledge_blueprint",
	"potion_of_oblivion_blueprint",
	"recovery_potion_blueprint",
	"reinforced_throwing_net_blueprint",
	"smoke_bomb_blueprint"
];

foreach (blueprint in blueprints)
{
	::mods_hookExactClass("crafting/blueprints/" + blueprint, function(o)
	{
		local create = o.create;
		o.create = function ()
		{
			create();
			this.m.Type = this.Const.Items.ItemType.Usable;
		}
	});
};

for (local i = 1; i =< 14; ++i)
{
	local path = "crafting/blueprints/snake_oil_";
	if (i < 10)
		path += "0";
	::mods_hookExactClass(path + format("%s_blueprint", i), function(o)
	{
		local create = o.create;
		o.create = function ()
		{
			create();
			this.m.Type = this.Const.Items.ItemType.Usable;
		}
	});
};