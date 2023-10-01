this.basilisk_trophy_item <- this.inherit("scripts/items/accessory/accessory", {
	m = {
		IsSpent = false
	},
	function create()
	{
		this.accessory.create();
		this.m.ID = "accessory.basilisk_trophy";
		this.m.Name = "Basilisk Trophy Necklace";
		this.m.Description = "This necklace fashioned from trophies taken of various Nachzehrers declares the one wearing it a veteran of battle against feral beasts, and not easily daunted.";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.IconLarge = "";
		this.m.Icon = "accessory/basilisk_trophy.png";
		this.m.Sprite = "basilisk_trophy"; //pulled from XML file under entity -> details
		this.m.Value = 1125;
	}

	function getTooltip() //attachment gives poison immunity and extra durability and necklace gives a headhunter effect when taking hp damage
	{
		local result = [
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
		result.push({
			id = 66,
			type = "text",
			text = this.getValueString()
		});

		if (this.getIconLarge() != null)
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIconLarge(),
				isLarge = true
			});
		}
		else
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIcon()
			});
		}

		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/chance_to_hit_head.png",
			text = "After taking damage gain [color=" + this.Const.UI.Color.PositiveValue + "]+100%[/color] chance to hit the head on your next attack"
		});

		result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "[color=" + this.Const.UI.Color.NegativeValue + "]This effect will be wasted if you miss or pass your turn[/color]"
		});
		return result;
	}

	function getSellPriceMult()
	{
		return this.World.State.getCurrentTown().getBeastPartsPriceMult();
	}

	function getBuyPriceMult()
	{
		return this.World.State.getCurrentTown().getBeastPartsPriceMult();
	}

	function onUpdateProperties( _properties )
	{
		this.accessory.onUpdateProperties(_properties);
		this.m.IsHidden = this.m.Stacks == 0;

		if (this.m.Stacks != 0)
		{
			_properties.HitChance[this.Const.BodyPart.Head] = 100.0;
		}
	}

	function onTurnStart()
	{
		this.m.IsSpent = false;
	}

});

