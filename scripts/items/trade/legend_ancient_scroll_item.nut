this.legend_ancient_scroll_item <- this.inherit("scripts/items/trade/trading_good_item", {
	m = {},
	function create()
	{
		this.trading_good_item.create();
		this.m.ID = "misc.ancient_scroll";
		this.m.Name = "Ancient Scroll";
		this.m.Description = "A torn-up scroll with knowledge unseen for centuries. It can be translated by a character with the interpretation perk in the crafting tent. Highly valuable to some historians, although it is useless to many.";
		this.m.Icon = "trade/scroll.png";
		this.m.Value = 50;
	}

	function getBuyPrice()
	{
		if (this.m.IsSold)
		{
			return this.getSellPrice();
		}

		if (("State" in this.World) && this.World.State != null && this.World.State.getCurrentTown() != null)
		{
			return this.Math.max(this.getSellPrice(), this.Math.ceil(this.getValue() * this.getPriceMult() * this.World.State.getCurrentTown().getBuyPriceMult() * this.Const.World.Assets.BaseBuyPrice ));
		}

		return this.item.getBuyPrice();
	}

	function getSellPrice()
	{
		if (this.m.IsBought)
		{
			return this.getBuyPrice();
		}

		if (("State" in this.World) && this.World.State != null && this.World.State.getCurrentTown() != null)
		{
			return this.Math.floor(this.getValue() * this.World.State.getCurrentTown().getSellPriceMult() *  this.Const.World.Assets.BaseSellPrice);
		}

		return this.item.getSellPrice();
	}

	function onUse( _actor, _item = null )
	{
		local effect = _actor.getSkills().getSkillByID("effects.scroll");
		if (  effect != null && effect.m.Smart == true )
        {
            return false;
        }
		else
        {

			local r = this.Math.rand(1, 3);
			switch(r)
			{
				case 1:
					local pT = _actor.getBackground().getPerkTree();
					local r;
					local r2;
					do {
						r = this.Math.rand(0, pT.len()-1);
						r2 = this.Math.rand(0, pT[r].len()-1);
					} while ( _actor.getSkills().hasSkill( pT[r][r2].ID ) ) 	
					_actor.getSkills().add(this.new( pT[r][r2].Script ));
					break;

				case 2:
					if (_actor.getSkills().hasSkill("effects.trained"))
					{
						_actor.getSkills().removeByID("effects.trained"));
					}
					local effect = this.new("scripts/skills/effects_world/new_trained_effect");
					effect.m.Description = "Trained effect (: +50% exp for 3 battles"; //todo flavor text
					effect.m.Duration = 3;
					effect.m.XPGainMult = 1.5;
					//effect.m.Icon = "skills/experience_scroll_effect.png"; //todo icon
					_actor.getSkills().add(effect);
					break;
				case 3:
					local pT = _actor.getBackground().getPerkTree();
					local r = this.Math.rand(1, 100);
					local t;
					if (r <= 10)
					{
						t = gt.Const.Perks.MagicTrees;
					}
					else if (r <= 20)
					{
						t = gt.Const.Perks.EnemyTrees;
					}
					else if (r <= 30)
					{
						t = gt.Const.Perks.DefenseTrees;
					}
					else if (r <= 55)
					{
						t = gt.Const.Perks.ClassTrees;
					}
					else if (r <= 75)
					{
						t = gt.Const.Perks.TraitsTrees;
					}
					else if (r <= 100)
					{
						t = gt.Const.Perks.WeaponTrees;
					}
					local brk = false;
					while (!brk)
					{
						local f = t.getRandom([]);
						foreach(i, perkAdd in f)
						{
							brk = pT.addPerkBooleanFail( perkAdd, i + (i > 3 ? 1 : 0) );
						}
					}
					break;

			}
        }

		if (  effect != null )
        {
			effect.m.Smart = true;	
        }
		else {
			_actor.getSkills().add(this.new("scripts/skills/effects/legend_scroll_effect"));
		}

		this.Sound.play("sounds/scribble.wav", this.Const.Sound.Volume.Inventory);
		return true;
	}

});

