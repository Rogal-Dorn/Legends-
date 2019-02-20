this.vazl_vala_carves_runes_of_power <- this.inherit("scripts/events/event", {
	m = {
		Vala = null,
		Person = null,
		ItemToRune = null
	},
	function create()
	{
		this.m.ID = "event.vazl_vala_carves_runes_of_power";
		this.m.Title = "During camp...";
		this.m.Cooldown = 20 * this.World.getTime().SecondsPerDay;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/vazl_vala_carves_runes_of_power.png[/img]%vala% carves some runes onto %person%\'s %item%.",
			Image = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Fascinating.",
					function getResult( _event )
					{
						return 0;
					}
				}
			],
			function start( _event )
			{
				this.Characters.push(_event.m.Vala.getImagePath());
				_event.m.ItemToRune.setRuned();
				_event.m.ItemToRune.createRuneDamage();
				_event.m.Person.getItems().unequip(_event.m.ItemToRune);
				_event.m.Person.getItems().equip(_event.m.ItemToRune);
				this.List.push({
						id = 10,
						icon = "ui/items/" + _event.m.ItemToRune.getIcon(),
						text = _event.m.Person.getName() + " now has a " + _event.m.ItemToRune.getName()
				});
				_event.m.Vala.improveMood(2.0, "Carved runes of power onto " + _event.m.Person.getName() + "\'s weapon");
				_event.m.Person.improveMood(2.0, "Had runes of power carved onto their weapon, courtesy of " + _event.m.Vala.getName());
			}
		});
	}


	function onUpdateScore()
	{
		this.logInfo("Vala carves runes of power  --  onUpdateScore");
		local brothers = this.World.getPlayerRoster().getAll();
		local vala_candidates = [];
		local person_candidates = [];
		local item_candidates = [];


		if (this.World.getPlayerRoster().getSize() >= this.World.Assets.getBrothersMax())
		{
			return;
		}

		foreach (bro in brothers)
		{
			if (bro.getBackground().getID() != "background.vazl_vala")
			{
				continue;
			}
			vala_candidates.push(bro);
		}

		if (vala_candidates.len() < 1)
		{
			return;
		}

		this.m.Vala = vala_candidates[this.Math.rand(0, vala_candidates.len() - 1)];

		local IgnoredWeapons = [
			"weapon.throwing_spear"
		];


		foreach (bro in brothers)
		{
			if (bro.getID() == this.m.Vala.getID())
			{
				continue;
			} 
			
			if (bro.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) == null)
			{
				continue;
			}
			
			if (bro.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getName().find("(Runed)") != null)
			{
				continue;
			}
			
			if (IgnoredWeapons.find(bro.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getID()) != null)
			{
				continue;
			}

			person_candidates.push(bro);
			item_candidates.push(bro.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand));
		}

		if (person_candidates.len() < 1 || item_candidates.len() < 1)
		{
			return;
		}

		local personandweapon = this.Math.rand(0, person_candidates.len() - 1);
		this.m.Person = person_candidates[personandweapon];
		this.m.ItemToRune = item_candidates[personandweapon];
		this.m.Score = this.m.Vala.getLevel() / 4;
	}


	function onPrepare()
	{
	}


	function onPrepareVariables( _vars )
	{
		_vars.push([
			"vala",
			this.m.Vala.getName()
		]);
		_vars.push([
			"person",
			this.m.Person.getName()
		]);
		_vars.push([
			"item",
			this.m.ItemToRune.getName()
		]);
	}


	function onClear()
	{
		this.m.Vala = null;
		this.m.Person = null;
		this.m.ItemToRune = null;
	}
});
