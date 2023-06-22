this.blackmarket_building <- this.inherit("scripts/entity/world/settlements/buildings/building", {
	m = {
		Stash = null
	},
	function getStash()
	{
		return this.m.Stash;
	}

	function create()
	{
		this.building.create();
		this.m.ID = "building.blackmarket";
		this.m.Name = "Black Market";
		this.m.Description = "Psssst! Over \'ere!";
		this.m.UIImage = "ui/settlements/blackmarket_day";
		this.m.UIImageNight = "ui/settlements/blackmarket_night"; 
		this.m.Tooltip = "world-town-screen.main-dialog-module.Blackmarket";
		this.m.IsClosedAtDay = true;
		this.m.Stash = this.new("scripts/items/stash_container");
		this.m.Stash.setID("shop");
		this.m.Stash.setResizable(true);
		this.m.Sounds = []; 
		this.m.SoundsAtNight = [ //change these sounds at some point
			{
				File = "ambience/buildings/market_people_00.wav",
				Volume = 0.2,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/market_people_01.wav",
				Volume = 0.3,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/market_people_02.wav",
				Volume = 0.2,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/market_people_03.wav",
				Volume = 0.4,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/market_people_04.wav",
				Volume = 0.4,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/market_people_05.wav",
				Volume = 0.4,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/market_people_07.wav",
				Volume = 0.2,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/market_people_08.wav",
				Volume = 0.2,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/market_people_09.wav",
				Volume = 0.2,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/market_people_10.wav",
				Volume = 0.3,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/market_people_11.wav",
				Volume = 0.4,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/market_people_12.wav",
				Volume = 0.2,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/market_people_13.wav",
				Volume = 0.3,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/market_people_14.wav",
				Volume = 0.4,
				Pitch = 1.0
			},
			{
				File = "ambience/buildings/market_bottles_00.wav",
				Volume = 0.7,
				Pitch = 1.0
			}
		];
	}

	function onClicked( _townScreen )
	{
		_townScreen.getShopDialogModule().setShop(this);
		_townScreen.showShopDialog();
		this.pushUIMenuStack();
	}

	function onSettlementEntered()
	{
		foreach( item in this.m.Stash.getItems() )
		{
			if (item != null)
			{
				item.setSold(false);
			}
		}
	}

	function onUpdateShopList() //R = rarity (higher = more rare out of 1-99%) || P = price modifier (1.0 = normal price) || S = script of the item that will appear
	{
		local list = [
			{
				R = 70,
				P = 2.0,
				S = "misc/legend_skin_ghoul_skin_item"
			},
			{
				R = 90,
				P = 2.0,
				S = "misc/legend_demon_third_eye_item"
			},
			{
				R = 99,
				P = 15.0,
				S = "misc/legend_ancient_scroll_item"
			},
			{
				R = 50,
				P = 2.0,
				S = "misc/legend_banshee_essence_item"
			},
			{
				R = 90,
				P = 2.0,
				S = "misc/legend_demon_alp_skin_item"
			},
			{
				R = 30,
				P = 5.0,
				S = "misc/legend_mistletoe_item"
			},
			{
				R = 95,
				P = 3.0,
				S = "misc/legend_redback_poison_gland_item"
			},
			{
				R = 50,
				P = 2.0,
				S = "misc/legend_demon_hound_bones_item"
			},
			{
				R = 99,
				P = 2.0,
				S = "misc/legend_rock_unhold_bones_item"
			},
			{
				R = 99,
				P = 3.0,
				S = "misc/legend_rock_unhold_hide_item"
			},
				{
				R = 99,
				P = 5.0,
				S = "misc/legend_stollwurm_blood_item"
			},
			{
				R = 99,
				P = 4.0,
				S = "misc/legend_stollwurm_scales_item"
			},
			{
				R = 75,
				P = 4.0,
				S = "misc/legend_white_wolf_pelt_item"
			},
			{
				R = 40,
				P = 2.0,
				S = "misc/lindwurm_blood_item"
			},
			{
				R = 35,
				P = 3.0,
				S = "misc/lindwurm_bones_item"
			},
			{
				R = 25,
				P = 2.0,
				S = "misc/lindwurm_scales_item"
			},
			{
				R = 15,
				P = 3.0,
				S = "misc/miracle_drug_item"
			},
			{
				R = 20,
				P = 2.0,
				S = "misc/petrified_scream_item"
			},
			{
				R = 10,
				P = 2.0,
				S = "misc/poison_gland_item"
			},
			{
				R = 35,
				P = 2.0,
				S = "misc/poisoned_apple_item"
			},
			{
				R = 30,
				P = 1.0,
				S = "weapons/lute"
			},
			{
				R = 30,
				P = 2.0,
				S = "weapons/legend_drum"
			},
			{
				R = 45,
				P = 2.0,
				S = "weapons/legend_staff_vala"
			},
			{
				R = 70,
				P = 3.0,
				S = "weapons/legend_mystic_staff"
			},
			{
				R = 80,
				P = 2.0,
				S = "shields/ancient/legend_mummy_tower_shield"
			},
			{
				R = 25,
				P = 2.0,
				S = "accessory/legend_pack_small"
			},
			{
				R = 40,
				P = 2.0,
				S = "accessory/legend_pack_large"
			}

		];

		foreach( i in this.Const.Items.NamedMeleeWeapons )
		{
			if (this.Math.rand(1, 100) <= 50)
			{
				list.push({
					R = 40,
					P = 3.0,
					S = i
				});
			}
		}

		foreach( i in this.Const.Items.NamedRangedWeapons )
		{
			if (this.Math.rand(1, 100) <= 50)
			{
				list.push({
					R = 40,
					P = 3.0,
					S = i
				});
			}
		}

		this.m.Settlement.onUpdateShopList(this.m.ID, list);
		this.fillStash(list, this.m.Stash, 1.25, false);
	}

	function onSerialize( _out )
	{
		this.building.onSerialize(_out);
		this.m.Stash.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		this.building.onDeserialize(_in);
		this.m.Stash.onDeserialize(_in);
	}

});

